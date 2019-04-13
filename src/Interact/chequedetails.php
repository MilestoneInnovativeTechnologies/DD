<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class chequedetails implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\ChequeDetail::class;
        }

        public function getImportAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'VERSION', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'BANKCODE', 'PDCCODE', 'CHQNO', 'CHQDATE', 'SUBMITTEDDATE', 'PROCESSEDDATE', 'AMT', 'SIGN', 'CHQ_STATUS', 'CANCEL', 'SETTLEMENT', 'RESUBMITIONDATE', 'REFCOCODE', 'REFBRCODE', 'REFFNCODE', 'REFFYCODE', `REFDOCNO`];
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $pks = ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'VERSION'];
            $cheque = \Milestone\SS\Model\ChequeDetail::where($pks)->first();
            return $cheque ? $cheque->id : null;
        }
    }