<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Pricelist;
    use Milestone\Interact\Table;

    class pricelistheader implements Table
    {
        public function getModel()
        {
            return Pricelist::class;
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
            $pricelist = Pricelist::where('code',$data['CODE'])->first();
            return $pricelist ? $pricelist->id : null;
        }


    }