<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Functiondetail;
    use Milestone\SS\Model\Tax;

    class functioninvdetails implements Table
    {

        public $functions_cache = null;
        public $mode = null;
        public $update_cache = [];

        public function getModel()
        {
            return Functiondetail::class;
        }

        public function getImportAttributes()
        {
            return ['code','tax','taxselection','taxunique','ratewithtax','discount01','discount02','discount02base','discount03','discountmode','discount'];
        }

        public function getImportMappings()
        {
            return array_map('strtoupper',$this->getImportAttributes());
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $function = Functiondetail::where('code',$data['CODE'])->first();
            return $function ? $function->id : null;
        }

        public function preImport(){
            $this->functions_cache = Functiondetail::pluck('id','code')->toArray();
        }

        public function isValidImportRecord($record){
            if(in_array($this->mode,['create','insert'])){
                if(array_key_exists($record['CODE'],$this->functions_cache)){
                    $this->update_cache[$this->functions_cache[$record['CODE']]] = array_map(function($key)use($record){ return $this->getKeyValue($key,$record); },$this->getImportMappings());
                    return false;
                }
            } return true;
        }

        private function getKeyValue($key,$record){
            if(method_exists($this,$key)) return call_user_func([$this,$key],$record);
            if(array_key_exists($key,$record)) return $record[$key];
            return null;
        }

        public function postImport(){
            if(is_array($this->update_cache) && !empty($this->update_cache))
                foreach($this->update_cache as $id => $update_array)
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