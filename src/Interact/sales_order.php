<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;

    class sales_order implements Table
    {
        public function getModel()
        {
            return SalesOrder::class;
        }

        public function getImportAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','payment_type','progress','_ref'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $SO = SalesOrder::where(['_ref' => $data['_ref'],'user' => $data['user']])->first();
            return $SO ? $SO->id : null;
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','payment_type','progress','_ref'];
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedAreaCustomer();
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedAreaCustomer();
        }
    }