<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;

    class billdata implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\BillData::class;
        }

        public function getFillAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'DSRNO', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'BILLNO', 'BILLDATE', 'DUEDATE', 'AMT', 'SIGN', 'BILL_TYPE', 'TYPE', 'CANCEL'];
        }

        public function attributeToColumnMapArray()
        {
            return [];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $pks = Arr::only($data,['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'DSRNO']);
            $billdata = \Milestone\SS\Model\BillData::where($pks)->first();
            return $billdata ? $billdata->id : null;
        }
    }