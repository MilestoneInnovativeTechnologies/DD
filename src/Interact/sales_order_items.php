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
            return ['so','product','store','fycode','fncode','rate','quantity','taxrule','tax','discount01','discount02','_ref'];
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
            return ['so' => 'SOReference'];
        }

        public function getExportAttributes()
        {
            return ['so','product','store','fycode','fncode','rate','quantity','taxrule','tax','discount01','discount01','_ref'];
        }

        public function SOReference($record){
            return Arr::get(SalesOrder::find($record['so']),'_ref',null);
        }

        public function getSOId($record){
            return Arr::get(SalesOrder::where('_ref',$record['so'])->first(),'id',null);
        }

        public function preExportGet($query){
            $query = $query->whereHas('SalesOrder',function ($Q){ $Q->where('progress','!=','Completed'); });
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){ $Q->assignedAreaCustomer(); });
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->whereHas('SalesOrder',function ($Q){ $Q->assignedAreaCustomer(); });
        }
    }