<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\Transaction;
    use Milestone\SS\Model\TransactionDetail;

    class transaction_details implements Table
    {
        public function getModel()
        {
            return TransactionDetail::class;
        }

        public function getImportAttributes()
        {
            return ['transaction','spt','price','tax','discount','total'];
        }

        public function getImportMappings()
        {
            return [
                'transaction' => 'getTransactionId',
                'spt' => 'getSPTId'
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            return [
                'transaction' => 'getTransactionReference',
                'spt' => 'getSPTReference'
            ];
        }

        public function getExportAttributes()
        {
            return ['transaction','spt','price','tax','discount','total'];
        }

        public function getTransactionReference($record){
            return Arr::get(Transaction::find($record['transaction']),'_ref');
        }
        public function getSPTReference($record){
            return Arr::get(StoreProductTransaction::find($record['spt']),'_ref');
        }

        public function getTransactionId($record){
            return Arr::get(Transaction::where('_ref',$record['transaction'])->first(),'id');
        }
        public function getSPTId($record){
            return Arr::get(StoreProductTransaction::where('_ref',$record['spt'])->first(),'id');
        }


        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('Transaction',function($Q){
                $Q->assignedCustomerTransactions()->orWhere('fncode','like','MT%');
            });
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('Transaction',function($Q){
                $Q->assignedCustomerTransactions()->orWhere('fncode','like','MT%');
            });
        }
    }