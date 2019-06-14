<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Transaction;
    use Milestone\SS\Model\User;

    class transactions implements Table
    {
        public function getModel()
        {
            return Transaction::class;
        }

        public function getImportAttributes()
        {
            return ['user','docno','date','customer','fycode','fncode','_ref'];
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
            return ['id' => 'recordReference'];
        }

        public function getExportAttributes()
        {
            return ['id','user','docno','date','customer','fycode','fncode'];
        }

        public function recordReference($record){
            return $record['_ref'];
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