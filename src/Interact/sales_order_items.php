<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderItem;

    class sales_order_items implements Table
    {
        public function getModel()
        {
            return SalesOrderItem::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','rate','quantity','_ref'];
        }

        public function getImportMappings()
        {
            return ['so' => 'getSOId'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $SO = SalesOrder::where('_ref',$data['_ref'])->first();
            return $SO ? $SO->id : null;
        }

        public function getExportMappings()
        {
            return ['so' => 'recordReference'];
        }

        public function getExportAttributes()
        {
            return ['so','product','rate','quantity','_ref'];
        }

        public function recordReference($record){
            return $record['_ref'];
        }

        public function getSOId($record){
            return $this->getPrimaryIdFromImportRecord($record);
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){
                $Q->assignedAreaCustomer();
            });
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){
                $Q->assignedAreaCustomer();
            });
        }
    }