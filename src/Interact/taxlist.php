<?php


    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Support\Facades\Event;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Product;

    class taxlist implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $cache = [
            'product' => null,
            'factors' => [],
            'items' => [],
        ];

        public function preImport($activity){
            $this->cache['product'] = Product::pluck('id','code')->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk){
                $data = $activity['data'];
                $ary1 = collect($data)->mapWithKeys(function($record){ return [$record['TAXCODE01'] => ['taxcode' => $record['TAXCODE01'],'taxfactor' => $record['TAXFACTOR01'],'subtaxfactor' => $record['SUBTAXFACTOR01']]]; });
                $ary2 = collect($data)->mapWithKeys(function($record){ return [$record['TAXCODE02'] => ['taxcode' => $record['TAXCODE01'],'taxfactor' => $record['TAXFACTOR02'],'subtaxfactor' => $record['SUBTAXFACTOR02']]]; });
                $this->cache['factors'] = array_merge($ary1->toArray(),$ary2->toArray());
                $this->cache['data']['01'] = collect($data)->groupBy->TAXCODE01->map(function($items){ return array_map(function($code){ return Arr::get($this->cache['product'],$code,null); },Arr::pluck($items,'CODE')); })->toArray();
                $this->cache['data']['02'] = collect($data)->groupBy->TAXCODE02->map(function($items){ return array_map(function($code){ return Arr::get($this->cache['product'],$code,null); },Arr::pluck($items,'CODE')); })->toArray();
            }
        }

        public function getModel()
        {
            return Product::class;
        }

        public function getImportAttributes()
        {
            return ['taxcode01','taxfactor01','subtaxfactor01','taxcode02','taxfactor02','subtaxfactor02'];
        }

        public function getImportMappings()
        {
            return [
                'taxcode01' => 'TAXCODE01',
                'taxfactor01' => 'TAXFACTOR01',
                'subtaxfactor01' => 'SUBTAXFACTOR01',
                'taxcode02' => 'TAXCODE02',
                'taxfactor02' => 'TAXFACTOR02',
                'subtaxfactor02' => 'SUBTAXFACTOR02',
            ];
        }

        public function isValidImportRecord($record)
        {
            if($this->bulk) return false;
            return ($record['CODE'] && $this->getProductId($record));
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return $this->getProductId($data);
        }

        public function postImport(){
            if($this->bulk){
                $updated_at = now()->toDateTimeString();
                foreach($this->cache['data'] as $num => $facItems){
                    foreach ($facItems as $factor => $items){
                        if($factor && trim($factor) !== "" && count($items) > 0){
                            $facContent = $this->cache['factors'][$factor];
                            $update = array_merge($this->modKeys($facContent,$num),compact('updated_at'));
                            DB::table('products')->whereIn('id',$items)->update($update);
                        }
                    }
                }
                if($first = Product::where('updated_at',$updated_at)->first()) Event::dispatch('eloquent.updated: ' . Product::class,$first);
//                Event::dispatch('eloquent.updated: ' . Product::class,Product::where('updated_at',$updated_at)->first());
            }
        }

        public function modKeys($array,$num){
            $modArray = [];
            foreach ($array as $key => $val) $modArray[$key . $num] = $val;
            return $modArray;
        }

        public function getExportAttributes()
        {
            return [];
        }

        public function getExportMappings()
        {
            return [];
        }

        public function getProductId($data){
            return Arr::get($this->cache['product'],$data['CODE'],null);
        }
    }
