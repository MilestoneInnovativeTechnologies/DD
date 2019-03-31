<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class chequedetails implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\ChequeDetail::class;
        }

        public function getFillAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'VERSION', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'BANKCODE', 'PDCCODE', 'CHQNO', 'CHQDATE', 'SUBMITTEDDATE', 'PROCESSEDDATE', 'AMT', 'SIGN', 'CHQ_STATUS', 'CANCEL', 'SETTLEMENT', 'RESUBMITIONDATE', 'REFCOCODE', 'REFBRCODE', 'REFFNCODE', 'REFFYCODE', `REFDOCNO`];
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
            $pks = ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'VERSION'];
            $cheque = \Milestone\SS\Model\ChequeDetail::where($pks)->first();
            return $cheque ? $cheque->id : null;
        }
    }