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

        public function getImportAttributes()
        {
            return ['code','name','type','status'];
        }

        public function getImportMappings()
        {
            return [
                'code' => 'CODE',
                'name' => 'NAME',
                'type' => 'TYPE',
                'status' => 'STATUS',
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $area = Area::where('code',$data['CODE'])->first();
            return $area ? $area->id : null;
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