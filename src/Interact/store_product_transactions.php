<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
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
            //
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(StoreProductTransaction::where('_ref',$data['_ref'])->first(),'id',null);
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['_ref','store','product','direction','quantity','user','nature','date','type'];
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