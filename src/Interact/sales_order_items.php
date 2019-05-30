<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;

    class sales_order_items implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\SalesOrderItem::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','rate','quantity'];
        }

        public function getImportMappings()
        {
            return ['so' => 'getSOFromDocNo'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $docno = \Milestone\SS\Model\SalesOrder::where(['docno' => $data['docno']])->first();
            return $docno ? $docno->id : null;
        }

        public function getExportMappings()
        {
            ['so' => 'getDocNoFromSO'];
        }

        public function getExportAttributes()
        {
            return ['so','product','rate','quantity'];
        }

        public function getDocNoFromSO($record){
            return Arr::get(SalesOrder::find($record['so']),'docno');
        }

        public function getSOFromDocNo($record){
            return Arr::get(SalesOrder::where('docno',$record['so'])->first(),'id');
        }
    }