<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class sales_order implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\SalesOrder::class;
        }

        public function getImportAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','progress'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $docno = \Milestone\SS\Model\SalesOrder::where(['docno' => $data['docno']])->first();
            return $docno ? $docno->id : null;
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','progress'];
        }
    }