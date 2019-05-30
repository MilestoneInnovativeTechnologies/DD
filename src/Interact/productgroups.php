<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class productgroups implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Productgroup::class;
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
            return ['id','name','belongs','parent','tax1','tax2'];
        }
    }