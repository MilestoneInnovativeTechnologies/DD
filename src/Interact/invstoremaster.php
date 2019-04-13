<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Store;
    use Milestone\Interact\Table;

    class invstoremaster implements Table
    {
        public function getModel()
        {
            return Store::class;
        }

        public function getImportAttributes()
        {
            return ['catcode','code','name','type','status'];
        }

        public function getImportMappings()
        {
            return [
                'catcode' => 'CATCODE',
                'code' => 'CODE',
                'name' => 'NAME',
                'type' => 'TYPE',
                'status' => 'STATUS'
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $catcode = $data['CATCODE']; $code = $data['CODE'];
            $store = Store::where(compact('catcode','code'))->first();
            return $store ? $store->id : null;
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