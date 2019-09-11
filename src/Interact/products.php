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
            return ['id','name','uom','narration','taxcode01','taxfactor01','subtaxfactor01','taxcode02','taxfactor02','subtaxfactor02'];
        }
    }
