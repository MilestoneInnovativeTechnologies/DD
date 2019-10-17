<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Event;
    use Milestone\SS\Model\PricelistProduct;
    use Milestone\SS\Model\Product;
    use Milestone\Interact\Table;

    class pricelist implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $cache = [
            'pl' => [],
            'pid' => [],
            'plp' => [],
            'data' => [],
        ];
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

        public function preImport($activity){
            $this->cache['pl'] = \Milestone\SS\Model\Pricelist::pluck('id','code')->toArray();
            $this->cache['pid'] = Product::pluck('id','code')->toArray();
            $this->cache['plp'] = PricelistProduct::all()->mapWithKeys(function($plp){ return [$this->PPString($plp->pricelist,$plp->product) => $plp->id]; })->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk){
                $created_at = $updated_at = now()->toDateTimeString();
                $detail = ['inserts' => [], 'updates' => []];
                foreach($activity['data'] as $data){
                    list('PRICE' => $price,'MINPRICE' => $price_min,'MAXPRICE' => $price_max,'DISCOUNT01PERC' => $discount1_quantity,'DISCOUNT02PERC' => $discount2_quantity) = $data;
                    $product = $this->getProductId($data); $pricelist = $this->getPriceList($data);
                    $pk = $this->getPrimaryIdFromImportRecord($data);
                    $record = compact('pricelist','product','price','price_min','price_max','discount1_quantity','discount2_quantity','updated_at');
                    if($pk) $detail['updates'][$pk] = $record;
                    else $detail['inserts'][] = array_merge($record,['created_at' => $created_at]);
                }
                $this->cache['data'] = $detail;
            }
        }
        private function PPString($PL,$PRD){
            return implode($this->PPStringDelimiter,[$PL,$PRD]);
        }
        public function isValidImportRecord($record){
            if($this->bulk) return false;
            return ($this->getPriceList($record) && $this->getProductId($record));
        }

        public function getPriceList($data){
            return Arr::get($this->cache['pl'],$data['CODE']);
        }

        public function getProductId($data){
            return Arr::get($this->cache['pid'],$data['ITEMCODE']);
        }

        public function getPrimaryIdFromImportRecord($data){
            return Arr::get($this->cache['plp'],$this->PPString($this->getPriceList($data),$this->getProductId($data)));
        }

        public function postImport(){
            if(!$this->bulk) return;
            if(!empty($this->cache['data']['inserts'])){
                PricelistProduct::insert($this->cache['data']['inserts']);
                Event::dispatch('eloquent.created: ' . PricelistProduct::class,PricelistProduct::latest()->first());
            }
            if(!empty($this->cache['data']['updates'])){
                foreach ($this->cache['data']['updates'] as $id => $update){
                    PricelistProduct::where(compact('id'))->update($update);
                }
                Event::dispatch('eloquent.updated: ' . PricelistProduct::class,PricelistProduct::find($id));
            }
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