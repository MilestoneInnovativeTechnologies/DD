<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\ProductTransactionNature;
    use Milestone\SS\Model\ProductTransactionType;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderSale;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;

    class idata implements Table
    {
        private $cache = [
            'nature' => [],
            'type' => [],
            '_ref_spt' => null,
            'product' => [],
            'store' => [],
            'user' => [],
            'so' => [],
            'sos' => [],
            'transaction' => [],
            'so_progress' => []
        ];

        public function preImport(){
            $this->cache['nature'] = ProductTransactionNature::pluck('id','name')->toArray();
            $this->cache['type'] = ProductTransactionType::pluck('id','name')->toArray();
        }

        public function getModel()
        {
            return StoreProductTransaction::class;
        }

        public function getImportAttributes()
        {
            return ['_ref','store','product','direction','quantity','user','nature','date','type','status'];
        }

        public function getImportMappings()
        {
            return [
                '_ref' => 'getReference',
                'quantity' => 'QTY',
                'date' => 'DOCDATE',
                'store' => 'getStoreID',
                'product' => 'getProductID',
                'direction' => 'getDirection',
                'user' => 'getUserID',
                'nature' => 'getNature',
                'type' => 'getType',
                'status' => 'getStatus'
            ];
        }

        public function getReference($data){
            $ref = implode('',['U',$this->getUserID($data),'T',intval(microtime(true)*10000)]);
            $this->cache['_ref_spt'] = $ref; return $ref;
        }
        public function getStoreID($data){
            $cacheKey = implode('-',Arr::only($data,['STRCATCODE','STRCODE']));
            if(array_key_exists($cacheKey,$this->cache['store'])) return $this->cache['store'][$cacheKey];
            $store = Store::where(['catcode' => $data['STRCATCODE'],'code' => $data['STRCODE']])->first();
            return $this->cache['store'][$cacheKey] = $store ? $store->id : null;
        }

        public function getProductID($data){
            $cacheKey = $data['ITEMCODE'];
            if(array_key_exists($cacheKey,$this->cache['product'])) return $this->cache['product'][$cacheKey];
            $product = Product::where(['code' => $cacheKey])->first();
            return $this->cache['product'][$cacheKey] = $product ? $product->id : null;
        }

        public function getDirection($data){
            return $data['SIGN'] == "1" ? "In" : "Out";
        }

        public function getUserID($data){
            $cacheKey = $data['CREATED_USER'];
            if(array_key_exists($cacheKey,$this->cache['user'])) return $this->cache['user'][$cacheKey];
            $user = User::where(['reference' => $cacheKey])->first();
            return $this->cache['user'][$cacheKey] = $user ? $user->id : null;
        }

        public function getNature($data){
            return Arr::get($this->cache,'nature.Fresh',null);
        }

        public function getType($data){
            $key = 'type.' . (($data['SIGN'] == "1")
                    ? (($data['FNCODE'] == "MT1") ? 'Load' : ((substr($data['FNCODE'],0,3) === "PUR") ? 'Purchase' : ((substr($data['FNCODE'],0,2) === "SR") ? 'Return' : 'Other')))
                    : (($data['FNCODE'] == "MT2") ? 'Unload' : 'Sale'));
            return Arr::get($this->cache,$key,null);
        }

        public function getStatus($data){
            return $data['CANCEL_USER'] ? 'Inactive' : 'Active';
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            list('DOCNO' => $docno,'FYCODE' => $fycode,'FNCODE' => $fncode,'ITEMCODE' => $product_code, 'QTY' => $quantity) = $data;
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            $product_model = Product::where('code',$product_code)->first();
            if($transaction && $product_model){
                $product = $product_model->id;
                $spt = $transaction->Products()->where(compact('product','quantity'))->first();
                if($spt) return $spt->id;
            }
            return null;
        }

        public function recordImported($record,$id){
            list('DOCNO' => $docno,'FYCODE' => $fycode,'FNCODE' => $fncode,
                'QTY' => $quantity, 'RATE' => $rate, 'TAX' => $tax,
                'DISCOUNT01' => $discount1, 'DISCOUNT02' => $discount2, 'DISCOUNT03' => $discount3,
                ) = $record;
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            $_ref_spt = $this->cache['_ref_spt'];
            if($transaction){
                $amount = $quantity * $rate; $discount = $discount1+$discount2+$discount3; $total = $amount+$tax-$discount; $_ref_trans = $transaction->_ref;
                $transaction->Products()->attach([$id => compact('amount','tax','discount','total','_ref_trans','_ref_spt')]);
            }
            $this->checkAndAddSalesOrderEntry($record);
        }

        public function checkAndAddSalesOrderEntry($record){
            if(!$record['REFFNCODE'] || substr($record['REFFNCODE'],0,2) !== 'SO') return;
            $SO = $this->getSO($record); if(!$SO) return; $TR = $this->getTransaction($record); if(!$TR) return;
            $SOS = $this->getSalesOrderSales($SO,$TR,$this->getProductID($record));
            $SOS->increment('sale_quantity',$record['QTY']); $this->cache['so_progress'][] = $SO->id;
        }
        public function getSO($data){
            $cacheKey = implode('-',Arr::only($data,['REFFNCODE','REFFYCODE','REFDOCNO']));
            if(array_key_exists($cacheKey,$this->cache['so'])) return $this->cache['so'][$cacheKey];
            $so = SalesOrder::where(['docno' => $data['REFDOCNO'],'fycode' => $data['REFFYCODE'],'fncode' => $data['REFFNCODE']])->with('Items')->first();
            return $this->cache['so'][$cacheKey] = $so ?: null;
        }
        public function getTransaction($data){
            $cacheKey = implode('-',Arr::only($data,['FNCODE','FYCODE','DOCNO']));
            if(array_key_exists($cacheKey,$this->cache['transaction'])) return $this->cache['transaction'][$cacheKey];
            $transaction = Transaction::where(['docno' => $data['DOCNO'],'fycode' => $data['FYCODE'],'fncode' => $data['FNCODE']])->first();
            return $this->cache['transaction'][$cacheKey] = $transaction ?: null;
        }
        public function getSalesOrderSales($SO,$TR,$PR){
            $cacheKey = implode('-',[$SO->id,$TR->id,$PR]);
            if(array_key_exists($cacheKey,$this->cache['sos'])) return $this->cache['sos'][$cacheKey];
            $SOS = SalesOrderSale::where(['so' => $SO->id,'transaction' => $TR->id,'product' => $PR])->first();
            return $this->cache['sos'][$cacheKey] = $SOS ?: $this->getCreateSalesOrderSales($SO,$TR,$PR);
        }
        public function getCreateSalesOrderSales($SO,$TR,$PR){
            $quantity = Arr::get($SO->Items->firstWhere('product',$PR),'quantity',0);
            return SalesOrderSale::create(['so' => $SO->id, 'transaction' => $TR->id, 'product' => $PR, 'quantity' => $quantity, 'sale_quantity' => 0]);
        }

        public function postImport($iData,$result){
            $this->updateSOProgress();
        }

        public function updateSOProgress(){
            $sop = array_unique($this->cache['so_progress']); if(empty($sop)) return;
            $SO = SalesOrder::with('Items')->find($sop);
            $SOS = SalesOrderSale::whereIn('so',$sop)->get();
            $SS = [];
            $SO->each(function($so)use($SOS,&$SS){
                $SS[$so->id] = [];
                $sopq = $so->Items->pluck('quantity','product')->toArray();
                $sos = $SOS->where('so',$so->id);
                foreach($sopq as $product => $quantity){
                    $sold = $sos->where('product',$product)->sum('sale_quantity');
                    $SS[$so->id][$product] = floatval($sold) >= floatval($quantity);
                }
            }); $SP = [];
            foreach ($SS as $soId => $PrQty){
                $SP[$soId] = in_array(false,$PrQty,true) ? 'Partial' : 'Completed';
            }
            foreach ($SP as $id => $progress){
                SalesOrder::find($id)->update(compact('progress'));
            }
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

    }