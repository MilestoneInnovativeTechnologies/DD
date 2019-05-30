<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class areas implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Area::class;
        }

        public function getImportAttributes()
        {
            return ['code','name'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $area = \Milestone\SS\Model\Area::where(['code' => $data['CODE']])->first();
            return $area ? $area->id : null;
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            return ['id','name'];
        }
    }