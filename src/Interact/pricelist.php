<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\SS\Model\PricelistProduct;
    use Milestone\SS\Model\Product;
    use Milestone\Interact\Table;

    class pricelist implements Table
    {
        private $price_list_cache = [];
        private $products_cache = [];
        private $price_list_records = [];
        private $PPStringDelimiter = '|';


        public function getModel()
        {
            return PricelistProduct::class;
        }

        public function getImportAttributes()
        {
            return ['pricelist','product','price','price_min','price_max','discount1_quantity','discount2_quantity'];
        }

        public function getImportMappings()
        {
            return [
                'price' => 'PRICE',
                'price_min' => 'MINPRICE',
                'price_max' => 'MAXPRICE',
                'discount1_quantity' => 'DISCOUNT01PERC',
                'discount2_quantity' => 'DISCOUNT02PERC',
                'pricelist' => 'getPriceList',
                'product' => 'getProductId',
            ];
        }

        public function preImport(){
            $this->price_list_records = PricelistProduct::all()->map(function($item){ return $this->PPString($item->pricelist,$item->product); })->toArray();
            $this->price_list_cache = \Milestone\SS\Model\Pricelist::all()->keyBy('code')->toArray();
            $this->products_cache = Product::all()->keyBy('code');
        }
        private function PPString($PL,$PRD){
            return implode($this->PPStringDelimiter,[$PL,$PRD]);
        }
        public function isValidImportRecord($record){
            return !in_array($this->PPString($this->getPriceList($record),$this->getProductId($record)),$this->price_list_records);
        }

        public function getPriceList($data){
            return Arr::get($this->price_list_cache,"{$data['CODE']}.id",null);
        }

        public function getProductId($data){
            $product = Arr::get($this->products_cache,$data['ITEMCODE'],null);
            if($product && (!$product->uom || !$product->partcode)) {
                $product->uom = $data['UNITCODE'];
                $product->partcode = $data['PARTCODE'];
                $product->save();
            }
            return $product ? $product->id : null;
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $pricelist = $data['CODE']; $product = $data['ITEMCODE'];
            $pricelist_product = PricelistProduct::where(compact('pricelist','product'))->first();
            return $pricelist_product ? $pricelist_product->id : null;
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            return ['id','pricelist','product','price'];
        }
    }