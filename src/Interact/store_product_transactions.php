<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class store_product_transactions implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\StoreProductTransaction::class;
        }

        public function getImportAttributes()
        {
            return ['store','product','direction','quantity','user','nature','date','type','_ref'];
        }

        public function getImportMappings()
        {
            return ['_ref' => 'getProperReference'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            return ['store','product','direction','quantity','user','nature','date','type','_ref'];
        }

        public function getProperReference($record){
            return $record['_ref'] ?: implode('',['U',$record['user'],'T',intval(microtime(true)*10000)]);
        }
    }