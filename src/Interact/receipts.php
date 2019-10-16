<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Receipt;

    class receipts implements Table
    {
        public function getModel()
        {
            return Receipt::class;
        }

        public function getImportAttributes()
        {
            return ['docno','store','fycode','fncode','mode','customer','date','user','amount','bank','cheque','cheque_date','source','_ref','status'];
        }

        public function getImportMappings()
        {
            //
        }

        public function getCreateSource($data){ return 'SS'; }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(Receipt::where('_ref',$data['_ref'])->first(),'id',null);
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['docno','store','fycode','fncode','mode','customer','date','user','amount','bank','cheque','cheque_date','_ref','source','status'];
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerReceipts();
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerReceipts();
        }
    }