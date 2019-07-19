<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;
    use Milestone\SS\Model\Importsale;

    class importsales implements Table
    {
        public function getModel()
        {
            return Importsale::class;
        }

        public function getImportAttributes()
        {
            return ['BILLNO','DOCDATE','ACCCODE','ITEMCODE','UNITCODE','PARTCODE','QTY','RATE','DISCOUNT'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return null;
        }

        public function getExportMappings()
        {
            return ['BILLNO','DOCDATE','ACCCODE','ITEMCODE','UNITCODE','PARTCODE','QTY','RATE','DISCOUNT'];
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

    }