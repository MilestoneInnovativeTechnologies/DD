<?php

    namespace Milestone\SS\Interact;

    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\Receipt;
    use Milestone\SS\Model\StockTransfer;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;

    class hdata implements Table
    {
        private $fn_in = 'MT1';
        private $fn_out = 'MT2';
        private $cr = 'CR';
        private $br = 'BR';
        private $in_cache = [];

        public function getModel()
        {
            return Transaction::class;
        }

        public function getImportAttributes()
        {
            return ['_ref','user','fycode','fncode','docno','date','customer','payment_type','status'];
        }

        public function getImportMappings()
        {
            return [
                '_ref' => 'getReference',
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
                'user' => 'getUserID',
                'customer' => 'getCustomerID',
                'payment_type' => 'PAYMENTMODE',
                'status' => 'getStatus'
            ];
        }

        public function getReference($data){
            return implode('',['U',$this->getUserID($data),'T',intval(microtime(true)*10000)]);
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

        public function getPrimaryIdFromImportRecord($data)
        {
            return $this->getTransactionID($data['DOCNO'],$data['FNCODE'],$data['FYCODE']);
        }

        public function recordImported($record,$id){
            $fncode = $record['FNCODE'];
            if($fncode == $this->fn_out){
                $stock_transfer = new StockTransfer;
                $stock_transfer->create(['out' => $id]);
            } elseif($fncode == $this->fn_in){
                $docno = $record['REFNO']; $fycode = $record['FYCODE'];
                $this->in_cache[$fycode][$docno] = $id;
            } elseif (in_array(substr($fncode,0,2),[$this->cr,$this->br])){
                $this->addReceipt($record);
            }
        }

        private function getTransactionID($docno,$fncode,$fycode){
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            return $transaction ? $transaction->id : null;
        }

        public function postImport(){
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

        private function addReceipt($record){
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode, 'DOCDATE' => $date, 'AMT' => $amount) = $record;
            $user = $this->getUserID($record); $mode = substr($fncode,0,2) == 'CR' ? 'Cash' : 'Cheque';
            $customer = $this->getCustomerID($record); $status = $this->getStatus($record);
            $_ref = $this->getReference($record);
            $data_pri = compact('docno','fycode','fncode'); $data = compact('user','mode','customer','date','amount','status','_ref');
            Receipt::updateOrCreate($data_pri,$data);
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

    }