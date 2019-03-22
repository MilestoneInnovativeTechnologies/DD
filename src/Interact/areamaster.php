<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Area;
    use Milestone\Interact\Table;

    class areamaster implements Table
    {
        public function getModel()
        {
            return Area::class;
        }

        public function getFillAttributes()
        {
            return ['code','name','type','status'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'code' => 'CODE',
                'name' => 'NAME',
                'type' => 'TYPE',
                'status' => 'STATUS',
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $area = Area::where('code',$data['CODE'])->first();
            return $area ? $area->id : null;
        }

    }