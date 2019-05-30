<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class stores implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Store::class;
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
            return ['id','name'];
        }
    }