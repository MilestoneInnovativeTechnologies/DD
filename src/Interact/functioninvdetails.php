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

        public function getFillAttributes()
        {
            return ['code','tax','taxselection','taxunique','taxrule','ratewithtax','discount01','discount02','discount02base','discount03','discountmode','discount'];
        }

        public function attributeToColumnMapArray()
        {
            return array_combine(Arr::except($this->getFillAttributes(),['4']),array_map('strtoupper',Arr::except($this->getFillAttributes(),['4'])));
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'taxrule' => 'getTaxID'
            ];
        }

        public function getTaxID($record){
            $tax = Tax::where('code',$record['CODE'])->first();
            return $tax ? $tax->id : null;
        }

        public function getPrimaryValueFromRowData($data)
        {
            $function = Functiondetail::where('code',$data['CODE'])->first();
            return $function ? $function->id : null;
        }

        public function preActions(){
            $this->functions_cache = Functiondetail::pluck('id','code')->toArray();
        }

        public function isRecordValid($record){
            if(in_array($this->mode,['create','insert'])){
                if(array_key_exists($record['CODE'],$this->functions_cache)){
                    $this->update_cache[$this->functions_cache[$record['CODE']]] = array_map(function($key)use($record){ return $record[$key]; },$this->attributeToColumnMapArray());
                    foreach ($this->attributeToColumnMethodMapArray() as $key => $function)
                        $this->update_cache[$this->functions_cache[$record['CODE']]][$key] = call_user_func([$this,$function],$record);
                    return false;
                }
            } return true;
        }

        public function postActions(){
            if(is_array($this->update_cache) && !empty($this->update_cache))
                foreach($this->update_cache as $id => $update_array)
                    Functiondetail::find($id)->update($update_array);
        }
    }