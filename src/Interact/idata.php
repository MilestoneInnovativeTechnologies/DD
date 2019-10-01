<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\StockTransfer;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\TransactionDetail;
    use Milestone\SS\Model\User;

    class idata implements Table
    {
        private $cache_key = 'idata';
        private $header_key_implode_delimiter = '|';
        private $cache = [
            'user' => null,
            'transaction' => [],
            'store' => null,
            'product' => [],
            'soi' => [],
            'exists' => [],
        ];

        public function preImport($activity){
            $this->cache['user'] = User::whereNotNull('reference')->pluck('id','reference')->toArray();
            $this->cache['store'] = Store::pluck('id','code')->toArray();
            $this->cache['product'] = Product::pluck('id','code')->toArray();

            if($activity['mode'] === 'create') {
                $cachedRecords = Cache::pull($this->cache_key,[]);
                if(!empty($cachedRecords)) $activity['data'] = array_merge($cachedRecords,$activity['data']);
            }
            return $activity;
        }

        public function getModel(){
            return TransactionDetail::class;
        }
        public function getPrimaryIdFromImportRecord($data){
            $transaction = $this->getTransactionProp($data,'id'); $product = $this->getProductCode($data);
            return Arr::get(TransactionDetail::where(compact('transaction','product'))->first(),'id');
        }
        public function getImportAttributes(){
            return ['transaction','store','product','direction','quantity','rate','taxrule','tax','discount01','discount02','soi'];
        }
        public function getImportMappings(){
            return [
                'transaction' => 'getTransactionID',
                'store' => 'getStoreCode',
                'product' => 'getProductCode',
                'direction' => 'getDirection',
                'quantity' => 'UNITQTY',
                'rate' => 'UNITRATE',
                'taxrule' => 'TAXRULE',
                'tax' => 'TAX',
                'discount01' => 'DISCOUNT01',
                'discount02' => 'DISCOUNT02',
                'soi' => 'getSOI'
            ];
        }
        private function getTransaction($data){
            $cacheKey = implode('-',Arr::only($data,['FNCODE','FYCODE','DOCNO']));
            if(array_key_exists($cacheKey,$this->cache['transaction'])) return $this->cache['transaction'][$cacheKey];
            $transaction = Transaction::where(['docno' => $data['DOCNO'],'fycode' => $data['FYCODE'],'fncode' => $data['FNCODE']])->first();
            return $this->cache['transaction'][$cacheKey] = $transaction ? $transaction->toArray() : [];
        }
        private function getTransactionProp($data,$prop){
            $transaction = $this->getTransaction($data); if(!$transaction || empty($transaction)) return null;
            return Arr::get($transaction,$prop);
        }
        public function getTransactionID($data){ return $this->getTransactionProp($data,'id'); }
        public function getStoreCode($data){ return Arr::get($this->cache['store'],$data['STRCODE']); }
        public function getProductCode($data){ return Arr::get($this->cache['product'],$data['ITEMCODE']); }
        public function getDirection($data){ return $data['SIGN'] == "1" ? "In" : "Out"; }
        public function getSOI($data){
            if(substr($data['REFFNCODE'],0,2) !== 'SO') return null;
            $SOIs = $this->getSOIs($data['REFFYCODE'],$data['REFFNCODE'],$data['REFDOCNO']);
            $PCode = $this->getProductCode($data); if(!array_key_exists($PCode,$SOIs)) return null;
            return Arr::get($SOIs,$PCode . '.' . 'id');
        }


        private function getSOIs($fycode,$fncode,$docno){
            $cacheKey = implode('-',[$fycode,$fncode,$docno]);
            if(array_key_exists($cacheKey,$this->cache['soi'])) return $this->cache['soi'][$cacheKey];
            $SO = SalesOrder::where(compact('fycode','fncode','docno'))->with('Items')->first();
            return $this->cache['soi'][$cacheKey] = $SO ? $SO->Items->mapWithKeys(function($item){
                return [$item->product => $item->toArray()];
            })->toArray() : [];
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
        public function getTransactionProp2($data,$prop){
            $TR = Transaction::with('Details')->find(Arr::get(TransactionDetail::where('spt',$data['id'])->get(),'0.transaction'));
            $TD = Arr::get($TR,'Details');
            if(!array_key_exists($TR->id,$this->cache['detail'])) $this->cache['detail'][$TR->id] = $TD->toArray();
            if(!array_key_exists($TR->id,$this->cache['transaction'])) $this->cache['transaction'][$TR->id] = $TR->toArray();
            return Arr::get($this->cache['transaction'],"{$TR->id}.{$prop}",null);
        }
        public function getProdProp($data, $prop){
            $product_id = $data['product']['id'];
            if(!array_key_exists($product_id,$this->cache['product'])) { $PRD = Product::find($product_id); $this->cache['product'][$product_id] = $PRD ? $PRD->toArray() : []; }
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
//        public function getTaxRule($data){ return $this->getProdProp($data,'group01.tax.code'); }
        public function getTaxRule($data){ return $this->getTDProp($data,'taxrule'); }
        public function getTaxValue($data){ return $this->getTDProp($data,'tax'); }
        public function getRefCOCode($data){ return ($this->getRefProp($data,'fncode')) ? $this->getCOCode($data) : null; }
        public function getRefBRCode($data){ return ($this->getRefProp($data,'fncode')) ? $this->getBRCode($data) : null; }
        public function getRefFYCode($data){ return $this->getRefProp($data,'fycode'); }
        public function getRefFNCode($data){ return $this->getRefProp($data,'fncode'); }
        public function getRefDocNo($data){ return $this->getRefProp($data,'date'); }
    }
