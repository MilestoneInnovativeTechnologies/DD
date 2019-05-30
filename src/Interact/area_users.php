<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class area_users implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\AreaUser::class;
        }

        public function getImportAttributes()
        {
            return [];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            return [];
        }

        public function getExportAttributes()
        {
            return ['id','area','user'];
        }
    }