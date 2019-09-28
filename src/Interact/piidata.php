<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderItem;
    use Milestone\SS\Model\UserStoreArea;

    class piidata implements Table
    {
        public $product_cache = null;
        public $user_cache = null;
        public $exists_cache = [];
        private $so_ref = [];
        private $header_key_implode_delimiter = '|';
        private $cache_key = 'piidata';

        public function getModel()
        {
            return SalesOrderItem::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','rate','quantity','taxrule','tax','discount','total','_ref'];
        }

        public function getImportMappings()
        {
            return [
                'rate' => 'RATE',
                'quantity' => 'QTY',
                'taxrule' => 'TAXRULE',
                'tax' => 'TAX',
                'discount' => 'getDiscount',
                'total' => 'getTotal',
                'so' => 'getSO',
                'product' => 'getProductID',
                '_ref' => 'getRef'
            ];
        }

        public function getDiscount($record){
            return 0;
        }
        public function getTotal($record){
            return (floatval($record['QTY']) * floatval($record['RATE'])) + floatval($record['TAX']) - $this->getDiscount($record);
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

        public function getProductID($record){
            return Arr::get($this->product_cache,$record['ITEMCODE']);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $so = $this->getSO($data); $product = $data['ITEMCODE'];
            $soi = SalesOrderItem::where(compact('so','product'))->first();
            return $soi ? $soi->id : null;
        }

        public function preImport($activity){
            $this->product_cache = Product::pluck('id','code')->toArray();
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
                'UNITQTY' => 'getQuantity',
                'UNITRATE' => 'getRate',
                'SIGN' => 'getSign',
                'TAXRULE' => 'getTaxRule',
                'TAX' => 'getTax'];
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','SRNO','SLNO','CANCEL','DOCDATE','CO','BR','STRCATCODE','STRCODE','ITEMCODE','UNITCODE','PARTCODE','UNITQTY','UNITRATE','SIGN','TAXRULE','TAX'];
        }

        public function preExportGet($query){ return $query->with(['Product','SalesOrder.Items']); }
        public function preExportUpdate($query){ return $query->with(['Product','SalesOrder.Items']); }

        public function getUserProp($data,$prop){
            $user_id = $data['sales_order']['user'];
            if(!array_key_exists($user_id,(array) $this->user_cache)) $this->user_cache[$user_id] = UserStoreArea::where('user',$user_id)->with(['Store','User'])->first();
            return Arr::get($this->user_cache[$user_id],$prop, Arr::get($this->user_cache[$user_id],"User.{$prop}", Arr::get($this->user_cache[$user_id],"Store.{$prop}",null)));
        }
        public function getSOProp($data,$prop){ return Arr::get($data['sales_order'],$prop); }
        public function getProdProp($data,$prop){ return Arr::get($data['product'],$prop,null); }

        public function getCOCode($data){ return $this->getUserProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getUserProp($data,'brcode'); }
        public function getFYCode($data){ return $this->getSOProp($data,'fycode'); }
        public function getFNCode($data){ return $this->getSOProp($data,'fncode'); }
        public function getDocNo($data){ return $this->getSOProp($data,'docno'); }
        public function getSRNo($data){
            $id = $data['id'];
            return collect($data['sales_order']['items'])->search(function($item)use($id){ return $item['id'] == $id; })+1;
        }
        public function getSLNo($data){ return $this->getSRNo($data); }
        public function getCancelStatus($data){ return 'No'; }
        public function getDocDate($data){ return $this->getSOProp($data,'date'); }
        public function getStrCatCode($data){ return 'INV'; }
        public function getStrCode($data){ return $this->getUserProp($data,'code'); }
        public function getItemCode($data){ return $this->getProdProp($data,'code'); }
        public function getUnitCode($data){ return $this->getProdProp($data,'uom'); }
        public function getPartCode($data){ return $this->getProdProp($data,'partcode'); }
        public function getQuantity($data){ return $data['quantity']; }
        public function getRate($data){ return $data['rate']; }
        public function getSign($data){ return '-1'; }
        public function getTaxRule($data){ return $data['taxrule']; }
        public function getTax($data){ return $data['tax']; }
    }
