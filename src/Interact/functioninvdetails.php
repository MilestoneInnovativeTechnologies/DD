<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Functiondetail;
    use Milestone\SS\Model\Tax;

    class functioninvdetails implements Table
    {

        public $functions_cache = null;
        public $update_cache = [];
        private $cache = [
            'pl' => [],
            'upd' => [],
            'fun' => [],
        ];

        public function getModel()
        {
            return Functiondetail::class;
        }

        public function getImportAttributes()
        {
            return ['code','pricelist','tax','taxselection','taxunique','ratewithtax','discount01','discount02','discount02base','discount03','discountmode','discount','list'];
        }

        public function getImportMappings()
        {
            return array_merge(array_combine($this->getImportAttributes(),array_map('strtoupper',$this->getImportAttributes())),['list' => 'ITEMLISTCATEGORY']);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->cache['fun'],$data['CODE']);
        }

        public function preImport(){
            $this->cache['fun'] = Functiondetail::pluck('id','code')->toArray();
            $this->cache['pl'] = \Milestone\SS\Model\Pricelist::pluck('id','code')->toArray();
        }

        public function isValidImportRecord($record){
            if(array_key_exists($record['CODE'],$this->cache['fun'])){
                $this->cache['upd'][$this->cache['fun'][$record['CODE']]] = array_map(function($key)use($record){ return $this->getKeyValue($key,$record); },$this->getImportMappings());
            }
            return false;
        }

        private function getKeyValue($key,$record){
            if(method_exists($this,$key)) return call_user_func([$this,$key],$record);
            if(array_key_exists($key,$record)) return $record[$key];
            return null;
        }

        private function PRICELIST($record){
            return $record['PRICELIST'] ? Arr::get($this->cache['pl'],$record['PRICELIST']) : null;
        }

        public function postImport(){
            if(is_array($this->cache['upd']) && !empty($this->cache['upd']))
                foreach($this->cache['upd'] as $id => $update_array)
                    Functiondetail::find($id)->update($update_array);
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
