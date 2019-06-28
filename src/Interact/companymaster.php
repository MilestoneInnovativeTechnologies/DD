<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\WBin;
    use Milestone\Interact\Table;

    class companymaster implements Table
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
            return ['bin' => 'doBin'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return 1;
        }

        public function doBin($data){
            $code = $data['CODE']; $abr = $data['ABR'];
            Store::where('cocode',$code)->each(function($store)use($abr){
                $store->co_abr = $abr; $store->save();
            });
            return 1;
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