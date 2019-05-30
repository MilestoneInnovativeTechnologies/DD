<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\Transaction;

    class transaction_details implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\TransactionDetail::class;
        }

        public function getImportAttributes()
        {
            return ['transaction,spt,price,tax,discount,total'];
        }

        public function getImportMappings()
        {
            return [
                'transaction' => 'getTransIdFromTransRef',
                'spt' => 'getRrfFromSPT'
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            return [
                'transaction' => 'getTransRefFromTransId',
                'spt' => 'getSPTRefFromSPTId'
            ];
        }

        public function getExportAttributes()
        {
            return ['transaction,spt,price,tax,discount,total'];
        }

        public function getTransIdFromTransRef($record){
            return Arr::get(Transaction::where('_ref',$record['transaction'])->first(),'id');
        }
        public function getSPTIdFromSPTRef($record){
            return Arr::get(StoreProductTransaction::where('_ref',$record['spt'])->first(),'id');
        }

        public function getTransRefFromTransId($record){
            return Arr::get(Transaction::find($record['transaction']),'_ref');
        }
        public function getSPTRefFromSPTId($record){
            return Arr::get(StoreProductTransaction::find($record['spt']),'_ref');
        }
    }