<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Receipt;

    class chequedetails implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\ChequeDetail::class;
        }

        public function getImportAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'VERSION', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'BANKCODE', 'PDCCODE', 'CHQNO', 'CHQDATE', 'SUBMITTEDDATE', 'PROCESSEDDATE', 'AMT', 'SIGN', 'CHQ_STATUS', 'CANCEL', 'SETTLEMENT', 'RESUBMITIONDATE', 'REFCOCODE', 'REFBRCODE', 'REFFNCODE', 'REFFYCODE', 'REFDOCNO'];
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
            $priData = Arr::only($data,$pks);
            $cheque = \Milestone\SS\Model\ChequeDetail::where($priData)->first();
            return $cheque ? $cheque->id : null;
        }

        public function recordImported($record){
            list('DOCNO' => $docno, 'FYCODE' => $fycode, 'FNCODE' => $fncode, 'CHQNO' => $cheque, 'CHQDATE' => $cheque_date) = $record;
            $pri = compact('docno','fycode','fncode'); $data = compact('cheque','cheque_date');
            Receipt::where($pri)->update($data);
        }
    }