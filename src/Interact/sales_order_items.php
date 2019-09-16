<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
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
            return ['so','product','rate','quantity','taxrule','tax','discount','total','_ref'];
        }

        public function getImportMappings()
        {
            return ['so' => 'getSOId'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            Arr::get(SalesOrderItem::where(['so' => $this->getSOId($data),'product' => $data['product'],'rate' => $data['rate']])->first(),'id',null);
        }

        public function getExportMappings()
        {
            return ['so' => 'recordReference'];
        }

        public function getExportAttributes()
        {
            return ['so','product','rate','quantity','taxrule','tax','discount','total','_ref'];
        }

        public function recordReference($record){
            return $record['_ref'];
        }

        public function getSOId($record){
            $ref = $this->recordReference($record);
            return Arr::get(SalesOrder::where('_ref',$ref)->first(),'id',null);
        }

        public function preExportGet($query){
            $query = $query->whereHas('SalesOrder',function ($Q){ $Q->where('progress','!=','Completed'); });
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){ $Q->assignedAreaCustomer(); });
        }
        public function preExportUpdate($query){
            $query = $query->whereHas('SalesOrder',function ($Q){ $Q->where('progress','!=','Completed'); });
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){ $Q->assignedAreaCustomer(); });
        }
    }