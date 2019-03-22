<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\SS\Model\PricelistProduct;
    use Milestone\SS\Model\Product;
    use Milestone\Interact\Table;

    class pricelist implements Table
    {
        private $price_list_cache = [];
        public function getModel()
        {
            return PricelistProduct::class;
        }

        public function getFillAttributes()
        {
            return ['pricelist','product','price','price_min','price_max','discount1_quantity','discount2_quantity'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'price' => 'PRICE',
                'price_min' => 'MINPRICE',
                'price_max' => 'MAXPRICE',
                'discount1_quantity' => 'DISCOUNT01PERC',
                'discount2_quantity' => 'DISCOUNT02PERC'
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'pricelist' => 'getPriceList',
                'product' => 'getProductId',
            ];
        }

        public function getPriceList($data){
            if(!Arr::has($this->price_list_cache,$data['CODE'])){
                $pricelist = \Milestone\SS\Model\Pricelist::where('code',$data['CODE'])->first();
                $this->price_list_cache[$data['CODE']] = ($pricelist) ? $pricelist->id : null;
            }
            return Arr::get($this->price_list_cache,$data['CODE']);
        }

        public function getProductId($data){
            $product = Product::where('code',$data['ITEMCODE'])->first();
            if(!$product) return null;
            $product->uom = $data['UNITCODE']; $product->partcode = $data['PARTCODE']; $product->save();
            return $product->id;
        }

        public function getPrimaryValueFromRowData($data)
        {
            $pricelist = $data['CODE']; $product = $data['ITEMCODE'];
            $pricelist_product = PricelistProduct::where(compact('pricelist','product'))->first();
            return $pricelist_product ? $pricelist_product->id : null;
        }

    }