<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;
    use Milestone\SS\Model\WBin;
    use Milestone\SS\Model\Store;

    class companydetails implements Table
    {
        public function getModel()
        {
            return WBin::class;
        }

        public function getImportAttributes()
        {
            return ['bin'];
        }

        public function getImportMappings()
        {
            return ['bin' => 'addCurrency'];
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
            return [];
        }

        public function addCurrency($record){
            return (integer) Store::where('cocode',$record['CODE'])->update(['currency' => $record['CURRENCYCODE']]);
        }
    }
