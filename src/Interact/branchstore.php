<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\SS\Model\Store;
    use Milestone\Interact\Table;

    class branchstore implements Table
    {
        private $cache = [
            'store' => [],
        ];

        public function getModel()
        {
            return Store::class;
        }

        public function getImportAttributes()
        {
            return ['cocode','brcode'];
        }

        public function getImportMappings()
        {
            return ['cocode' => 'COCODE','brcode' => 'BRCODE',];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->cache['store'],$data['STRCATCODE'] . '-' . $data['STRCODE'],null);
        }

        public function preImport(){
            $this->cache['store'] = Store::all()->mapWithKeys(function($store){ return [$store->catcode . '-' . $store->code => $store->id]; })->toArray();
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