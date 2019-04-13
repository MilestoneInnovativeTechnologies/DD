<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Pricelist;
    use Milestone\Interact\Table;

    class pricelistheader implements Table
    {
        public function getModel()
        {
            return Pricelist::class;
        }

        public function getImportAttributes()
        {
            return ['code','name','status'];
        }

        public function getImportMappings()
        {
            return [
                'code' => 'CODE',
                'name' => 'NAME',
                'status' => 'STATUS'
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $pricelist = Pricelist::where('code',$data['CODE'])->first();
            return $pricelist ? $pricelist->id : null;
        }


        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }
    }