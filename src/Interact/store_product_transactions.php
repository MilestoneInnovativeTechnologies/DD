<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\UserStoreArea;

    class store_product_transactions implements Table
    {
        public function getModel()
        {
            return StoreProductTransaction::class;
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
            return ['id' => 'getProperReference'];
        }

        public function getExportAttributes()
        {
            return ['id','store','product','direction','quantity','user','nature','date','type','_ref'];
        }

        public function getProperReference($record){
            return $record['_ref'] ?: implode('',['U',$record['user'],'T',intval(microtime(true)*10000)]);
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereIn('store',UserStoreArea::assigned()->pluck('store')->all());
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereIn('store',UserStoreArea::assigned()->pluck('store')->all());
        }
    }