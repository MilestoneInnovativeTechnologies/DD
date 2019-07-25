<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\AreaUser;
    use Milestone\SS\Model\Receipt;
    use Milestone\SS\Model\StockTransfer;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;

    class hdata implements Table
    {
        private $fn_in = 'MT1';
        private $fn_out = 'MT2';
        private $cr = 'CR';
        private $br = 'BR';
        private $in_cache = [];

        private $cache = [
            'store' => [],
            'users' => [],
            'areas' => [],
            'stfrs' => [],
        ];

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
            $status = $this->getStatus($record); $_ref = $this->getReference($record);
            $data_pri = compact('docno','fycode','fncode'); $data = compact('user','mode','date','amount','status','_ref');
            Receipt::updateOrCreate($data_pri,$data);
        }

        public function getExportMappings()
        {
            return [
                'COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
                'FYCODE' => 'fycode',
                'FNCODE' => 'fncode',
                'DOCNO' => 'docno',
                'DOCDATE' => 'date',
                'CO' => 'getCOCode',
                'BR' => 'getBRCode',
                'ACCCODE' => 'getACCCode',
                'PAYMENTMODE' => 'payment_type',
                'ANALYSISCATCODE' => 'getAnalysisCatCode',
                'ANALYSISCODE' => 'getAnalysisCode',
                'AREA' => 'getAreaCode',
                'STRSRCCAT' => 'getSrcStoreCat',
                'STRSRC' => 'getSrcStore',
                'STRDSTCAT' => 'getDstStoreCat',
                'STRDST' => 'getDstStore',
                'REFNO' => 'getRefNo',
                'REFDATE' => 'getRefDate',
                'SIGN' => 'getSign',
            ];
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','DOCDATE','CO','BR','ACCCODE','PAYMENTMODE','ANALYSISCATCODE','ANALYSISCODE','AREA','STRSRCCAT','STRSRC','STRDSTCAT','STRDST','REFNO','REFDATE','SIGN'];
        }

        public function preExportGet($query){ return $query->with(['Details','Products']); }
        public function preExportUpdate($query){ return $query->with(['Details','Products']); }

        public function cacheStore(){ $this->cache['store'] = Store::all()->mapWithKeys(function($item){ return [$item->id => ['CO' => $item->cocode,'BR' => $item->brcode, 'CODE' => $item->code]]; })->toArray(); }
        public function cacheUsers(){ $this->cache['users'] = User::all()->keyBy(function($item){ return $item->id; })->toArray(); }
        public function cacheAreas(){ $this->cache['areas'] = AreaUser::with('Area')->get()->mapWithKeys(function($item){ return [$item->user => $item->Area->code]; })->toArray(); }

        public function getStoreId($data){
            return Arr::get($data,'Products.0.store') ?: Arr::get(Store::first(),'id');
        }
        public function getCOCode($data){
            $store_id = $this->getStoreId($data);
            if(empty($this->cache['store'])) $this->cacheStore();
            return Arr::get($this->cache['store'],"{$store_id}.CO");
        }
        public function getBRCode($data){
            $store_id = $this->getStoreId($data);
            if(empty($this->cache['store'])) $this->cacheStore();
            return Arr::get($this->cache['store'],"{$store_id}.BR");
        }
        public function getACCCode($data){
            $customer_id = Arr::get($data,'customer'); if(!$customer_id) return null;
            if(empty($this->cache['users'])) $this->cacheUsers();
            return Arr::get($this->cache['users'],"{$customer_id}.reference");
        }
        public function getAnalysisCatCode($data){
            $fncode = $data['fncode'];
            return (in_array(substr($fncode,0,2),['SR','SL'])) ? 'SE' : null;
        }
        public function getAnalysisCode($data){
            if(!$this->getAnalysisCatCode($data)) return null;
            $user_id = Arr::get($data,'user'); if(!$user_id) return null;
            if(empty($this->cache['users'])) $this->cacheUsers();
            $reference = Arr::get($this->cache['users'],"{$user_id}.reference");
            return str_ireplace($this->getAnalysisCatCode($data),'',$reference);
        }
        public function getAreaCode($data){
            $customer_id = Arr::get($data,'customer'); if(!$customer_id) return null;
            if(empty($this->cache['areas'])) $this->cacheAreas();
            return Arr::get($this->cache['areas'],$customer_id);
        }
        public function getSrcStoreCat($data){
            $fncode = $data['fncode'];
            return ($fncode === $this->fn_out || in_array(substr($fncode,0,2),['SL'])) ? 'INV' : null;
        }
        public function getDstStoreCat($data){
            $fncode = $data['fncode'];
            return ($fncode === $this->fn_in || in_array(substr($fncode,0,2),['SR'])) ? 'INV' : null;
        }
        public function getSrcStore($data){
            if(!$this->getSrcStoreCat($data)) return null; $store_id = $this->getStoreId($data);
            if(empty($this->cache['store'])) $this->cacheStore();
            return Arr::get($this->cache['store'],"{$store_id}.CODE");
        }
        public function getDstStore($data){
            if(!$this->getDstStoreCat($data)) return null; $store_id = $this->getStoreId($data);
            if(empty($this->cache['store'])) $this->cacheStore();
            return Arr::get($this->cache['store'],"{$store_id}.CODE");
        }
        public function getRefNo($data){
            $fncode = $data['fncode'];
            if(in_array(substr($fncode,0,2),['SL'])) return $data['docno'];
            if($fncode === $this->fn_in){
                if(!array_key_exists($data['id'],$this->cache['stfrs'])) $this->cache['stfrs'][$data['id']] = StockTransfer::where('in',$data['id'])->with('OUT')->first();
                return Arr::get($this->cache['stfrs'][$data['id']],"OUT.docno",null);
            }
            return null;
        }
        public function getRefDate($data){
            $fncode = $data['fncode'];
            if($fncode === $this->fn_in){
                if(!array_key_exists($data['id'],$this->cache['stfrs'])) $this->cache['stfrs'][$data['id']] = StockTransfer::where('in',$data['id'])->with('OUT')->first();
                return Arr::get($this->cache['stfrs'][$data['id']],"OUT.date",null);
            }
            return $data['date'];
        }
        public function getSign($data){
            $fncode = $data['fncode'];
            return ($fncode === $this->fn_in || in_array(substr($fncode,0,2),['SR'])) ? -1 : 1;
        }

    }