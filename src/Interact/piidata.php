<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderItem;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\UserStoreArea;

    class piidata implements Table
    {
        public $user_cache = null;
        public $exists_cache = [];
        private $so_ref = [];
        private $header_key_implode_delimiter = '|';
        private $cache_key = 'piidata';
        private $cache = [
            'store' => [],
            'product' => [],
            'srno' => [],
        ];

        public function getModel()
        {
            return SalesOrderItem::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','store','fycode','fncode','rate','quantity','taxrule','tax','discount01','discount02','_ref'];
        }

        public function getImportMappings()
        {
            return [
                'so' => 'getSO',
                'product' => 'getProductID',
                'store' => 'getStoreID',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
                'rate' => 'UNITRATE',
                'quantity' => 'UNITQTY',
                'taxrule' => 'TAXRULE',
                'tax' => 'TAX',
                'discount01' => 'DISCOUNT01',
                'discount02' => 'DISCOUNT02',
                '_ref' => 'getRef'
            ];
        }

        public function getSO($record){
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode) = $record;
            $so = SalesOrder::where(compact('fycode','fncode','docno'))->first();
            $id = $so ? $so->id : null;
            if($id) $this->so_ref[implode('-',[$fycode,$fncode,$docno])] = $so->_ref;
            return $id;
        }
        public function getRef($record){
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode) = $record;
            return $this->so_ref[implode('-',[$fycode,$fncode,$docno])];
        }

        public function getProductID($record){ return Arr::get($this->cache['product'],$record['ITEMCODE']); }
        public function getStoreID($data){ return Arr::get($this->cache['store'],$data['STRCODE']); }

        public function getPrimaryIdFromImportRecord($data)
        {
            $so = $this->getSO($data); $product = $this->getProductID($data);
            return Arr::get(SalesOrderItem::where(compact('so','product'))->first(),'id');
        }

        public function preImport($activity){
            $this->cache['product'] = Product::whereIn('code',Arr::pluck($activity['data'],'ITEMCODE'))->pluck('id','code')->toArray();
            $this->cache['store'] = Store::pluck('id','code')->toArray();
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
            if(!array_key_exists($headerId,$this->exists_cache))
                $this->exists_cache[$headerId] = SalesOrder::where(['fycode' => $record['FYCODE'],'fncode' => $record['FNCODE'],'docno' => $record['DOCNO']])->exists();
            return $this->exists_cache[$headerId];
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
            return ['COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
                'FYCODE' => 'getFYCode',
                'FNCODE' => 'getFNCode',
                'DOCNO' => 'getDocNo',
                'SRNO' => 'getSRNo',
                'SLNO' => 'getSLNo',
                'CANCEL' => 'getCancelStatus',
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
                'DISCOUNT01' => 'discount01',
                'DISCOUNT02' => 'discount02',
                'SIGN' => 'getSign',
                'TAXRULE' => 'taxrule',
                'TAX' => 'tax'];
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','SRNO','SLNO','CANCEL','DOCDATE','CO','BR','STRCATCODE','STRCODE','ITEMCODE','UNITCODE','PARTCODE','UNITQTY','UNITRATE','DISCOUNT01','DISCOUNT02','SIGN','TAXRULE','TAX'];
        }

        public function preExportGet($query){ return $query->with(['Product','SalesOrder','Store']); }
        public function preExportUpdate($query){ return $this->preExportGet($query); }
        public function getSOProp($data,$prop){ return Arr::get($data['sales_order'],$prop); }
        public function getProdProp($data,$prop){ return Arr::get($data['product'],$prop,null); }
        public function getStoreProp($data,$prop){ return Arr::get($data['store'],$prop,null); }

        public function getCOCode($data){ return $this->getStoreProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getStoreProp($data,'brcode'); }
        public function getFYCode($data){ return $this->getSOProp($data,'fycode'); }
        public function getFNCode($data){ return $this->getSOProp($data,'fncode'); }
        public function getDocNo($data){ return $this->getSOProp($data,'docno'); }
        public function getSRNo($data){
            $so = $data['so']; if(!array_key_exists($so,$this->cache['srno'])) $this->cache['srno'][$so] = 0;
            return ++$this->cache['srno'][$so];
        }
        public function getSLNo($data){
            $so = $data['so']; if(!array_key_exists($so,$this->cache['srno'])) $this->cache['srno'][$so] = 1;
            return $this->cache['srno'][$so];
        }
        public function getCancelStatus($data){ return 'No'; }
        public function getDocDate($data){ return $this->getSOProp($data,'date'); }
        public function getStrCatCode($data){ return 'INV'; }
        public function getStrCode($data){ return $this->getStoreProp($data,'code'); }
        public function getItemCode($data){ return $this->getProdProp($data,'code'); }
        public function getUnitCode($data){ return $this->getProdProp($data,'uom'); }
        public function getPartCode($data){ return $this->getProdProp($data,'partcode'); }
        public function getSign($data){ return '-1'; }
    }
