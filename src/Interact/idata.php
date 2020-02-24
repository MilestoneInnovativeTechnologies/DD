<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderItem;
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
            'srno' => [],
            'outtrans' => [],
        ];

        public function preImport($activity){
            $this->cache['user'] = User::whereNotNull('reference')->pluck('id','reference')->toArray();
            $this->cache['store'] = Store::pluck('id','code')->toArray();
            $this->cache['product'] = Product::pluck('id','code')->toArray();

            if($activity['mode'] === 'create') {
                $cachedRecords = Cache::pull($this->getCacheKey(),[]);
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
                'store' => 'getStoreID',
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
        public function getStoreID($data){ return Arr::get($this->cache['store'],$data['STRCODE']); }
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
            $cacheKey = $this->getCacheKey();
            $cache = Cache::get($cacheKey,[]); array_push($cache,$record);
            Cache::put($cacheKey,$cache);
        }

        private function getCacheKey(){
            return implode('.',[$this->cache_key,Request()->getHost()]);
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
                'UNITRATE' => 'rate',
                'SIGN' => 'getSign',
                'TAXRULE' => 'taxrule',
                'TAX' => 'tax',
                'REFCOCODE' => 'getRefCOCode',
                'REFBRCODE' => 'getRefBRCode',
                'REFFYCODE' => 'getRefFYCode',
                'REFFNCODE' => 'getRefFNCode',
                'REFDOCNO' => 'getRefDocNo',
                'SHFDOCNO' => 'shift_docno'
            ];
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','SRNO','SLNO','TYPE','CANCEL','DOCDATE','CO','BR','STRCATCODE','STRCODE','ITEMCODE','UNITCODE','PARTCODE','UNITQTY','UNITRATE','SIGN','TAXRULE','TAX','REFCOCODE','REFBRCODE','REFFYCODE','REFFNCODE','REFDOCNO','SHFDOCNO'];
        }

        public function preExportGet($query){
            $this->cache['soi'] = SalesOrderItem::with(['SalesOrder','Product','Store'])->find($query->get()->pluck('soi')->unique()->filter()->toArray())->keyBy->id->toArray();
            return $query->with(['Product','Transaction','Store']);
        }
        public function preExportUpdate($query){
            return $this->preExportGet($query);
        }

        public function getStoreProp($data, $prop){
            return Arr::get($data['store'],$prop);
        }
        public function getExpTransactionProp($data,$prop){
            return Arr::get($data['transaction'],$prop);
        }
        public function getProdProp($data, $prop){
            return Arr::get($data['product'],$prop);
        }
        public function getTDProp($data, $prop){
            $id = $this->getTransactionProp($data,'id'); $spt = $data['id'];
            $idx = collect($this->cache['detail'][$id])->search(function ($item)use($spt){ return $item['spt'] == $spt; });
            return Arr::get($this->cache['detail'],"{$id}.{$idx}.{$prop}",null);
        }
        public function getRefProp($data, $prop){
            return $data['soi'] ? Arr::get($this->cache['soi'][$data['soi']],$prop)
                : ($this->getFNCode($data) === 'MT1'
                    ? $this->getStockOutTransProp($data,$prop)
                    : null);
        }
        public function getStockOutTransProp($data,$prop){
            $inTranID = $this->getExpTransactionProp($data,'id');
            if(!array_key_exists($inTranID,$this->cache['outtrans'])){
                $STF = StockTransfer::where('in',$inTranID)->first(); if(!$STF) $this->cache['outtrans'][$inTranID] = null;
                else {
                    $TRN = Transaction::with('Store')->find($STF->out);
                    if(!$TRN) $this->cache['outtrans'][$inTranID] = null;
                    else $this->cache['outtrans'][$inTranID] = $TRN->toArray();
                }
//                $this->cache['outtrans'][$inTranID] = Transaction::with('Store')->find($STF->out)->toArray();
            }
            return Arr::get($this->cache['outtrans'][$inTranID],str_replace('sales_order.','',$prop));
        }

        public function getCOCode($data){ return $this->getStoreProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getStoreProp($data,'brcode'); }
        public function getFYCode($data){ return $this->getExpTransactionProp($data,'fycode'); }
        public function getFNCode($data){ return $this->getExpTransactionProp($data,'fncode'); }
        public function getDocNo($data){ return $this->getExpTransactionProp($data,'docno'); }
        public function getSRNo($data){
            $trans = $data['transaction']['id']; if(!array_key_exists($trans,$this->cache['srno'])) $this->cache['srno'][$trans] = 0;
            return ++$this->cache['srno'][$trans];
        }
        public function getSLNo($data){
            $trans = $data['transaction']['id']; if(!array_key_exists($trans,$this->cache['srno'])) $this->cache['srno'][$trans] = 1;
            return $this->cache['srno'][$trans];
        }
        public function getTransType($data){ return 'Normal'; }
        public function getTransCancel($data){ return 'No'; }
        public function getDocDate($data){ return $this->getExpTransactionProp($data,'date'); }
        public function getStrCatCode($data){ return $this->getStoreProp($data,'catcode'); }
        public function getStrCode($data){ return $this->getStoreProp($data,'code'); }
        public function getItemCode($data){ return $this->getProdProp($data,'code'); }
        public function getUnitCode($data){ return $this->getProdProp($data,'uom'); }
        public function getPartCode($data){ return $this->getProdProp($data,'partcode'); }
        public function getSign($data){ return ($data['direction'] === 'Out') ? (-1) : 1; }
        public function getRefCOCode($data){ return $this->getRefProp($data,'store.cocode'); }
        public function getRefBRCode($data){ return $this->getRefProp($data,'store.brcode'); }
        public function getRefFYCode($data){ return $this->getRefProp($data,'fycode'); }
        public function getRefFNCode($data){ return $this->getRefProp($data,'fncode'); }
        public function getRefDocNo($data){ return $this->getRefProp($data,'sales_order.docno'); }
    }
