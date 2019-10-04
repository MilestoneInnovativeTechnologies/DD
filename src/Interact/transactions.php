<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Transaction;

    class transactions implements Table
    {
        public function getModel()
        {
            return Transaction::class;
        }

        public function getImportAttributes()
        {
            return ['user','store','docno','date','customer','fycode','fncode','payment_type','_ref'];
        }

        public function getImportMappings()
        {
            //
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(Transaction::where('_ref',$data['_ref'])->first(),'id',null);
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['user','store','docno','date','customer','fycode','fncode','payment_type','_ref','status'];
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerTransactions()->orWhere('fncode','like','MT%');
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerTransactions()->orWhere('fncode','like','MT%');
        }
    }