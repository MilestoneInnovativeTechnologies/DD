<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Taxrule;
    use Milestone\Interact\Table;

    class taxruledetails implements Table
    {
        public function getModel()
        {
            return Taxrule::class;
        }

        public function getFillAttributes()
        {
            return ['taxcode','code','name','percentage'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'taxcode' => 'TAXCODE',
                'code' => 'CODE',
                'name' => 'NAME',
                'percentage' => 'PERCENTAGE'
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $taxrule = Taxrule::where(['taxcode' => $data['TAXCODE'],'code' => $data['CODE']])->first();
            return $taxrule ? $taxrule->id : null;
        }
    }