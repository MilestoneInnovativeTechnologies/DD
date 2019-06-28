<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class products implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Product::class;
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
            return ['id','name','uom','narration','group1','group2','group3','group4'];
        }
    }