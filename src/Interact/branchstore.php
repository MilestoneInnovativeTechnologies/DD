<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\WBin;
    use Milestone\Interact\Table;

    class branchstore implements Table
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
            $catcode = $data['STRCATCODE']; $code = $data['STRCODE'];
            $store = Store::where(compact('catcode','code'))->first();
            if($store) { $store->cocode = $data['COCODE']; $store->brcode = $data['BRCODE']; $store->save(); }
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