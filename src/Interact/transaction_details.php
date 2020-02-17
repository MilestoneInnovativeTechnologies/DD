<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Transaction;
    use Milestone\SS\Model\TransactionDetail;

    class transaction_details implements Table
    {
        private $cache = [
            'trans' => []
        ];

        public function getModel()
        {
            return TransactionDetail::class;
        }

        public function getImportAttributes()
        {
            return ['transaction','store','product','direction','quantity','rate','taxrule','tax','discount01','discount02','soi','shift_docno'];
        }

        public function getImportMappings()
        {
            return [
                'transaction' => 'getTransactionId',
                'soi' => 'getSOIId',
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(TransactionDetail::where(['transaction' => $this->getTransactionId($data),'store' => $data['store'],'product' => $data['product']])->first(),'id');
        }

        public function getExportMappings()
        {
            return [
                'transaction' => 'getTransactionReference',
            ];
        }

        public function getExportAttributes()
        {
            return ['transaction','store','product','direction','quantity','rate','taxrule','tax','discount01','discount02','soi'];
        }

        public function getTransactionReference($record){
            return Arr::get($this->cache['trans'],$record['transaction']['id']);
        }

        public function getTransactionId($record){
            return Arr::get(Transaction::where('_ref',$record['transaction'])->first(),'id');
        }
        public function getSPTId($record){
            return Arr::get(StoreProductTransaction::where('_ref',$record['spt'])->first(),'id');
        }


        public function preExportGet($query){
            if (request()->_user) {
                Auth::loginUsingId(request()->_user);
                $query = $query->whereHas('Transaction',function($Q){
                    $Q->assignedCustomerTransactions()->orWhere('fncode','like','MT%');
                });
            }
            $this->cacheTransReferences($query);
            return $query;
        }
        public function preExportUpdate($query){ return $this->preExportGet($query); }
        private function cacheTransReferences($query){
            $this->cache['trans'] = $query->with(['Transaction'])->get()->mapWithKeys(function($trans){ return [$trans->Transaction->id => $trans->Transaction->_ref]; })->toArray();
        }
    }