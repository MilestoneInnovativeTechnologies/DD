<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;
    use Milestone\SS\Model\Tax;

    class taxruleheader implements Table
    {
        public function getModel()
        {
            return Tax::class;
        }

        public function getFillAttributes()
        {
            return ['code','name','status'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'code' => 'CODE',
                'name' => 'NAME',
                'status' => 'STATUS'
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $tax = Tax::where('code',$data['CODE'])->first();
            return $tax ? $tax->id : null;
        }
    }