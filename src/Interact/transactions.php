<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class transactions implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Transaction::class;
        }

        public function getImportAttributes()
        {
            return ['user','docno','date','customer','fycode','fncode','_ref'];
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
            return ['user','docno','date','customer','fycode','fncode','_ref'];
        }

        public function getProperReference($record){
            return $record['_ref'] ?: implode('',['U',$record['user'],'T',intval(microtime(true)*10000)]);
        }
    }