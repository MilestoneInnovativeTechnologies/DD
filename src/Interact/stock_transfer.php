<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class stock_transfer implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\StockTransfer::class;
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
            return ['id','out','in','verified_by','verified_at'];
        }
    }