<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Support\Facades\Event;
    use Milestone\SS\Model\Product;
    use Milestone\Interact\Table;

    class itemunit implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $cache = [
            'products' => null,
            'uom' => null,
            'barcode' => null,
        ];

        public function getModel()
        {
            return Product::class;
        }

        public function getImportAttributes()
        {
            return ['barcode','uom'];
        }

        public function getImportMappings()
        {
            return ['barcode' => 'BARCODE','uom' => 'UNITCODE'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->cache['products'],$data['ITEMCODE']);
        }

        public function preImport($activity){
            $this->cache['products'] = Product::pluck('id','code')->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk){
                $data = $activity['data'];
                $this->cache['uom'] = collect($data)->groupBy->UNITCODE->map(function($items){ return array_map(function($code){ return Arr::get($this->cache['products'],$code,null); },Arr::pluck($items,'ITEMCODE')); })->toArray();
                $this->cache['barcode'] = collect($data)->mapWithKeys(function($record){ return [$this->getPrimaryIdFromImportRecord($record) => $record['BARCODE']]; })->toArray();
            }
        }

        public function isValidImportRecord($data){
            if($this->bulk) return false;
            return !!$this->getPrimaryIdFromImportRecord($data);
        }

        public function postImport(){
            if($this->bulk){
                $updated_at = now()->toDateTimeString();
                if(!empty($this->cache['uom'])){
                    foreach($this->cache['uom'] as $uom => $ids)
                        if($uom && trim($uom !== "") && count($ids) > 0)
                            DB::table('products')->whereIn('id',$ids)->update(compact('uom','updated_at'));
                }
                if(!empty($this->cache['barcode'])){
                    $statement = [];
                    foreach($this->cache['barcode'] as $id => $barcode) if($id && $barcode) $statement[] = "UPDATE products SET `barcode` = '".$barcode."' WHERE `id` = '".$id."';";
                    if(!empty($statement)){
                        DB::unprepared(join('',$statement));
                        DB::table('products')->whereIn('id',array_keys($this->cache['barcode']))->update(['updated_at' => $updated_at]);
                    }
                }
                $first = Product::where('updated_at',$updated_at)->first();
                if($first) Event::dispatch('eloquent.updated: ' . Product::class,$first);
            }
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