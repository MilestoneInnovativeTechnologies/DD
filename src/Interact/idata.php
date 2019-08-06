<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\ProductTransactionNature;
    use Milestone\SS\Model\ProductTransactionType;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderSale;
    use Milestone\SS\Model\StockTransfer;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\TransactionDetail;

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
            'so_progress' => [],
            'detail' => [],
            'ref' => [],
            'exists' => [],
        ];
        private $cache_key = 'idata';
        private $header_key_implode_delimiter = '|';

        public function preImport($activity){
            $this->cache['nature'] = ProductTransactionNature::pluck('id','name')->toArray();
            $this->cache['type'] = ProductTransactionType::pluck('id','name')->toArray();
            $this->cache['user'] = \Milestone\SS\Model\User::pluck('id','reference')->toArray();
            if($activity['mode'] === 'create') {
                $cachedRecords = Cache::pull($this->cache_key,[]);
                if(!empty($cachedRecords)) $activity['data'] = array_merge($cachedRecords,$activity['data']);
            }
            return $activity;
        }
        public function isValidImportRecord($record){
            $exists = $this->isHeaderExists($record);
            if(!$exists) $this->doCacheRecord($record);
            return $exists;
        }
        private function isHeaderExists($record){
            $headerId = $this->getHeaderId($record);
            if(!array_key_exists($headerId,$this->cache['exists']))
                $this->cache['exists'][$headerId] = Transaction::where(['fycode' => $record['FYCODE'],'fncode' => $record['FNCODE'],'docno' => $record['DOCNO']])->exists();
            return $this->cache['exists'][$headerId];
        }
        private function getHeaderId($record){
            return implode($this->header_key_implode_delimiter,$this->headerKeys($record));
        }
        private function headerKeys($record){
            return array_values(Arr::only($record,['COCODE','BRCODE','FYCODE','FNCODE','DOCNO']));
        }
        private function doCacheRecord($record){
            $cacheKey = $this->cache_key;
            $cache = Cache::get($cacheKey,[]); array_push($cache,$record);
            Cache::put($cacheKey,$cache);
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
            $transaction = $this->getTransaction($data); if(!$transaction) return null;
            if($transaction->user) return $transaction->user;
            return Arr::get($this->cache['user'],$data['CREATED_USER']);
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
            return [
                'COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
                'FYCODE' => 'getFYCode',
                'FNCODE' => 'getFNCode',
                'DOCNO' => 'getDocNo',
                'SRNO' => 'getSRNo',
                'SLNO' => 'getSLNo',
                'TYPE' => 'getTransType',
                'CANCEL' => 'getTransCancel',
                'DOCDATE' => 'getDocDate',
                'CO' => 'getCOCode',
                'BR' => 'getBRCode',
                'STRCATCODE' => 'getStrCatCode',
                'STRCODE' => 'getStrCode',
                'ITEMCODE' => 'getItemCode',
                'UNITCODE' => 'getUnitCode',
                'PARTCODE' => 'getPartCode',
                'UNITQTY' => 'quantity',
                'UNITRATE' => 'getUnitRate',
                'SIGN' => 'getSign',
                'TAXRULE' => 'getTaxRule',
                'TAX' => 'getTaxValue',
                'REFCOCODE' => 'getRefCOCode',
                'REFBRCODE' => 'getRefBRCode',
                'REFFYCODE' => 'getRefFYCode',
                'REFFNCODE' => 'getRefFNCode',
                'REFDOCNO' => 'getRefDocNo'
            ];
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','SRNO','SLNO','TYPE','CANCEL','DOCDATE','CO','BR','STRCATCODE','STRCODE','ITEMCODE','UNITCODE','PARTCODE','UNITQTY','UNITRATE','SIGN','TAXRULE','TAX','REFCOCODE','REFBRCODE','REFFYCODE','REFFNCODE','REFDOCNO'];
        }

        public function preExportGet($query){ return $query->with(['Product']); }

        public function getStoreProp($data, $prop){
            $store_id = $data['store'];
            if(!array_key_exists($store_id,$this->cache['store'])) $this->cache['store'][$store_id] = Store::find($store_id)->toArray();
            return Arr::get($this->cache['store'],"{$store_id}.{$prop}",null);
        }
        public function getTransactionProp($data,$prop){
            $TR = Transaction::with('Details')->find(Arr::get(TransactionDetail::where('spt',$data['id'])->get(),'0.transaction'));
            $TD = Arr::get($TR,'Details');
            if(!array_key_exists($TR->id,$this->cache['detail'])) $this->cache['detail'][$TR->id] = $TD->toArray();
            if(!array_key_exists($TR->id,$this->cache['transaction'])) $this->cache['transaction'][$TR->id] = $TR->toArray();
            return Arr::get($this->cache['transaction'],"{$TR->id}.{$prop}",null);
        }
        public function getProdProp($data, $prop){
            $product_id = $data['product']['id'];
            if(!array_key_exists($product_id,$this->cache['product'])) $this->cache['product'][$product_id] = Product::with('Group01.Tax')->find($product_id)->toArray();
            return Arr::get($this->cache['product'][$product_id],"{$prop}",null);
        }
        public function getTDProp($data, $prop){
            $id = $this->getTransactionProp($data,'id'); $spt = $data['id'];
            $idx = collect($this->cache['detail'][$id])->search(function ($item)use($spt){ return $item['spt'] == $spt; });
            return Arr::get($this->cache['detail'],"{$id}.{$idx}.{$prop}",null);
        }
        public function getRefProp($data, $prop){
            $fncode = $this->getTransactionProp($data,'fncode'); if($fncode !== 'MT1') return null;
            $id = $this->getTransactionProp($data,'id'); $out = StockTransfer::where('in',$id)->first()->out;
            if(!array_key_exists($out,$this->cache['transaction'])) $this->cache['transaction'][$out] = Transaction::find($out)->toArray();
            return Arr::get($this->cache['transaction'][$out],$prop,null);
        }

        public function getCOCode($data){ return $this->getStoreProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getStoreProp($data,'brcode'); }
        public function getFYCode($data){ return $this->getTransactionProp($data,'fycode'); }
        public function getFNCode($data){ return $this->getTransactionProp($data,'fncode'); }
        public function getDocNo($data){ return $this->getTransactionProp($data,'docno'); }
        public function getSRNo($data){
            $id = $this->getTransactionProp($data,'id'); $spt = $data['id'];
            return collect($this->cache['detail'][$id])->search(function ($item)use($spt){ return $item['spt'] == $spt; })+1;
        }
        public function getSLNo($data){ return $this->getSRNo($data); }
        public function getTransType($data){ return 'Normal'; }
        public function getTransCancel($data){ return ($data['status'] === 'Active') ? 'No' : 'Yes'; }
        public function getDocDate($data){ return $this->getTransactionProp($data,'date'); }
        public function getStrCatCode($data){ return $this->getStoreProp($data,'catcode'); }
        public function getStrCode($data){ return $this->getStoreProp($data,'code'); }
        public function getItemCode($data){ return $this->getProdProp($data,'code'); }
        public function getUnitCode($data){ return $this->getProdProp($data,'uom'); }
        public function getPartCode($data){ return $this->getProdProp($data,'partcode'); }
        public function getUnitRate($data){ return $this->getTDProp($data,'amount'); }
        public function getSign($data){ return ($data['direction'] === 'Out') ? (-1) : 1; }
        public function getTaxRule($data){ return $this->getProdProp($data,'group01.tax.code'); }
        public function getTaxValue($data){ return $this->getTDProp($data,'tax'); }
        public function getRefCOCode($data){ return ($this->getRefProp($data,'fncode')) ? $this->getCOCode($data) : null; }
        public function getRefBRCode($data){ return ($this->getRefProp($data,'fncode')) ? $this->getBRCode($data) : null; }
        public function getRefFYCode($data){ return $this->getRefProp($data,'fycode'); }
        public function getRefFNCode($data){ return $this->getRefProp($data,'fncode'); }
        public function getRefDocNo($data){ return $this->getRefProp($data,'date'); }
    }