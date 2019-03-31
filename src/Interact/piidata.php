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

        public function getFillAttributes()
        {
            return ['so','product','rate','quantity'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'rate' => 'RATE',
                'quantity' => 'QTY',
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
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

        public function getPrimaryValueFromRowData($data)
        {
            $so = $this->getSO($data); $product = $data['ITEMCODE'];
            $soi = SalesOrderItem::where(compact('so','product'))->first();
            return $soi ? $soi->id : null;
        }

        public function preActions(){
            $this->product_cache = Product::pluck('id','code')->toArray();
        }
    }