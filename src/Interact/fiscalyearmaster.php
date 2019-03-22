<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class fiscalyearmaster implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Fiscalyearmaster::class;
        }

        public function getFillAttributes()
        {
            return ['code','cocode','name','start_date','end_date','status'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'code' => 'CODE',
                'cocode' => 'COCODE',
                'name' => 'NAME',
                'start_date' => 'START_DATE',
                'end_date' => 'END_DATE',
                'status' => 'STATUS'
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $fiscal = \Milestone\SS\Model\Fiscalyearmaster::where(['code' => $data['CODE'],'cocode' => $data['COCODE']])->first();
            return $fiscal ? $fiscal->id : null;
        }
    }