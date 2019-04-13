<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderItem;

    class piidata implements Table
    {
        public $product_cache = null;

        public function getModel()
        {
            return SalesOrderItem::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','rate','quantity'];
        }

        public function getImportMappings()
        {
            return [
                'rate' => 'RATE',
                'quantity' => 'QTY',
                'so' => 'getSO',
                'product' => 'getProductID'
            ];
        }

        public function getSO($record){
            list($fycode,$fncode,$docno) = array_values(Arr::only($record,['FYCODE','FNCODE','DOCNO']));
            $so = SalesOrder::where(compact('fycode','fncode','docno'))->first();
            return $so ? $so->id : null;
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

        public function preImport(){
            $this->product_cache = Product::pluck('id','code')->toArray();
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