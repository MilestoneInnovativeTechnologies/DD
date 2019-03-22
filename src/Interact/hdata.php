<?php

    namespace Milestone\SS\Interact;

    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\StockTransfer;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;

    class hdata implements Table
    {
        private $fn_in = 'MT1';
        private $fn_out = 'MT2';
        private $in_cache = [];

        public function getModel()
        {
            return Transaction::class;
        }

        public function getFillAttributes()
        {
            return ['user','fycode','fncode','docno','date','customer','status'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE'
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'user' => 'getUserID',
                'customer' => 'getCustomerID',
                'status' => 'getStatus'
            ];
        }

        public function getUserID($data){
            $user = User::where('reference',$data['CREATED_USER'])->first();
            return $user ? $user->id : null;
        }

        public function getCustomerID($data){
            $user = User::where('reference',$data['ACCCODE'])->first();
            return $user ? $user->id : null;
        }

        public function getStatus($data){
            return $data['CANCEL_USER'] ? 'Inactive' : 'Active';
        }

        public function getPrimaryValueFromRowData($data)
        {
            return $this->getTransactionID($data['DOCNO'],$data['FNCODE'],$data['FYCODE']);
        }

        public function isDone($record,$id){
            if($record['FNCODE'] == $this->fn_out){
                $stock_transfer = new StockTransfer;
                $stock_transfer->create(['out' => $id]);
            } elseif($record['FNCODE'] == $this->fn_in){
                $docno = $record['REFNO']; $fycode = $record['FYCODE'];
                $this->in_cache[$fycode][$docno] = $id;
            }
        }

        private function getTransactionID($docno,$fncode,$fycode){
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            return $transaction ? $transaction->id : null;
        }

        public function postActions(){
            $cache = $this->in_cache;
            if(!empty($cache)){
                $fncode = $this->fn_out;
                foreach($cache as $fycode => $doc_in){
                    if(!empty($doc_in)){
                        $doc_out = Transaction::where(compact('fncode','fycode'))->whereIn('docno',array_keys($doc_in))->pluck('id','docno')->toArray();
                        StockTransfer::whereIn('out',array_values($doc_out))->get()->each(function($stock_transfer)use($doc_out,$doc_in){
                            $docno = array_search($stock_transfer->out,$doc_out);
                            if($docno !== false) {
                                $stock_transfer->in = $doc_in[$docno];
                                $stock_transfer->save();
                            }
                        });
                    }
                }
            }
            return;
        }

    }