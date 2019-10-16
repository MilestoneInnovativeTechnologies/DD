<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
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

        private $cache = [
            'store' => null,
            'users' => null,
            'rcpts' => [],
            'stout' => [],
            'stkin' => [],
            'areas' => [],
            'stfrs' => [],
            'dstre' => null,
            'fndac' => null,
            'cstmr' => null,
        ];

        public function getModel()
        {
            return Transaction::class;
        }

        public function getImportAttributes(){
            return ['_ref','docno','date','fycode','fncode','store','user','customer','payment_type','status'];
        }

        public function getImportMappings()
        {
            return [
                '_ref' => 'getReference',
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
                'store' => 'getStoreID',
                'user' => 'getExecutiveID',
                'customer' => 'getCustomerID',
                'payment_type' => 'PAYMENTMODE',
                'status' => 'getStatus'
            ];
        }

        public function preImport(){
            $this->cache['store'] = Store::pluck('id','code')->toArray();
            $this->cache['users'] = User::whereNotNull('reference')->pluck('id','reference')->toArray();
            $this->cache['dstre'] = Store::first()->id;
        }

        public function getExecutiveID($data){ return Arr::get($this->cache['users'],$data['ANALYSISCATCODE'].$data['ANALYSISCODE'],Arr::get($this->cache['users'],$data['CREATED_USER'])); }
        public function getReference($data){ return implode('',['U',$this->getExecutiveID($data),'T',intval(microtime(true)*10000)]); }
        public function getStoreID($data){ return ($data['STRSRC']) ? Arr::get($this->cache['store'],$data['STRSRC']) : $this->cache['dstre']; }
        public function getCustomerID($data){ return Arr::has($this->cache['users'],$data['ACCCODE']) ? Arr::get($this->cache['users'],$data['ACCCODE']) : null; }
        public function getStatus($data){ return $data['CANCEL_USER'] ? 'Inactive' : 'Active'; }


        public function isValidImportRecord($record){
            $fncode = $record['FNCODE'];
            if(in_array(substr($fncode,0,2),[$this->cr,$this->br])) $this->storeReceipt($record);
            return (in_array(substr($fncode,0,2),['SL','SR']) || in_array($fncode,[$this->fn_out,$this->fn_in]));
        }

        private function storeReceipt($record){
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode, 'DOCDATE' => $date, 'AMT' => $amount) = $record;
            $user = $this->getExecutiveID($record); $mode = substr($fncode,0,2) == 'CR' ? 'Cash' : 'Cheque';
            $status = $this->getStatus($record); $_ref = $this->getReference($record); $store = $this->getStoreID($record);
            $primary = compact('docno','store','fycode','fncode'); $data = compact('user','mode','date','amount','status','_ref');
            $this->cache['rcpts'][] = compact('primary','data');
        }

        public function recordImported($record,$id){
            $fncode = $record['FNCODE'];
            if($fncode == $this->fn_out) $this->cache['stout'][] = $id;
            elseif($fncode == $this->fn_in) $this->cache['stkin'][$record['FYCODE']][$record['REFNO']] = $id;
        }

        public function postImport(){
            $this->AddReceipts($this->cache['rcpts']);
            $this->AddStockIn($this->cache['stkin']);
            $this->AddStockOut($this->cache['stout']);
        }


        public function AddReceipts($receipts){
            if(empty($receipts) || count($receipts) === 0) return;
            foreach ($receipts as $receipt){
                Receipt::updateOrCreate($receipt['primary'],$receipt['data']);
            }
        }
        public function AddStockIn($StkIns){
            if(empty($StkIns) || count($StkIns) === 0) return; $fncode = $this->fn_out;
            foreach($StkIns as $fycode => $doc_in){
                if(!empty($doc_in)){
                    $doc_out = Transaction::where(compact('fncode','fycode'))->whereIn('docno',array_keys($doc_in))->pluck('id','docno')->toArray();
                    $out_doc = array_flip($doc_out);
                    StockTransfer::whereNull('in')->whereIn('out',array_values($doc_out))->get()->each(function($stock_transfer) use($doc_in,$out_doc) {
                        $inID = Arr::get($doc_in,Arr::get($out_doc,$stock_transfer->out));
                        if($inID) { $stock_transfer->in = $inID; $stock_transfer->save(); }
                    });
                }
            }
        }
        public function AddStockOut($StkOuts){
            if(empty($StkOuts) || count($StkOuts) === 0) return; $created_at = $updated_at = now()->toDateTimeString(); $insData = [];
            foreach ($StkOuts as $out) $insData[] = compact('out','created_at','updated_at');
            StockTransfer::insert($insData);
        }

        public function getPrimaryIdFromImportRecord($data){ return $this->getTransactionID($data['DOCNO'],$data['FNCODE'],$data['FYCODE']); }

        private function getTransactionID($docno,$fncode,$fycode){ return Arr::get(Transaction::where(compact('docno','fncode','fycode'))->first(),'id'); }



        public function preExportGet($query){
//            $this->cache['cstmr'] = User::find($query->pluck('customer')->unique()->toArray())->pluck('reference','id')->toArray();
            $queryResult = $query->get();
            $refs = array_merge($queryResult->pluck('customer')->unique()->toArray(),$queryResult->pluck('user')->unique()->toArray());
            $this->cache['cstmr'] = User::find($refs)->pluck('reference','id')->toArray();
            return $query->with(['Store']);
        }
        public function preExportUpdate($query){ return $this->preExportGet($query); }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','DOCDATE','CO','BR','ACCCODE','PAYMENTMODE','ANALYSISCATCODE','ANALYSISCODE','AREA','STRSRCCAT','STRSRC','STRDSTCAT','STRDST','REFNO','REFDATE','SIGN','CURRENCY','DOCCURRENCY'];
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
                'CURRENCY' => 'getCurrency',
                'DOCCURRENCY' => 'getCurrency'
            ];
        }

        public function cacheStore(){ $this->cache['store'] = Store::all()->mapWithKeys(function($item){ return [$item->id => $item->toArray()]; })->toArray(); }
        public function cacheUsers(){ $this->cache['users'] = User::whereNotNull('reference')->pluck('reference','id')->toArray(); }
        public function cacheAreas(){ $this->cache['areas'] = AreaUser::with('Area')->get()->mapWithKeys(function($item){ return [$item->user => $item->Area->code]; })->toArray(); }

        public function getStoreProp($data,$prop){
            return Arr::get($data['store'],$prop);
//            if($this->cache['store'] === null) $this->cacheStore();
//            $store_id = Arr::get($data,'store');
            return Arr::get($this->cache['store'],"{$store_id}.{$prop}");
        }

        public function getCOCode($data){ return $this->getStoreProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getStoreProp($data,'brcode'); }
        public function getACCCode($data){
            if(!$this->cache['cstmr']) $this->cache['cstmr'] = User::all()->pluck('reference','id')->toArray();
            return ($data['customer']) ? Arr::get($this->cache['cstmr'],$data['customer']) : $this->getFNDefaultAccount($data['fncode']);
        }
        public function getAnalysisCatCode($data){
            $fncode = $data['fncode'];
            return (in_array(substr($fncode,0,2),['SR','SL']) && $data['user']) ? 'SE' : null;
        }
        public function getAnalysisCode($data){
            if(!$this->getAnalysisCatCode($data)) return null;
            if(!$this->cache['cstmr']) $this->cache['cstmr'] = User::all()->pluck('reference','id')->toArray();
            return str_ireplace($this->getAnalysisCatCode($data),'',Arr::get($this->cache['cstmr'],$data['user'],$data['user']));
        }
        public function getAreaCode($data){
            $customer_id = Arr::get($data,'customer'); if(!$customer_id) return null;
            if($this->cache['areas'] === null) $this->cacheAreas();
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
        public function getSrcStore($data){ return $this->getStoreProp($data,'code'); }
        public function getDstStore($data){
            if(!$this->getDstStoreCat($data)) return null;
            return $this->getStoreProp($data,'code');
        }
        public function getRefNo($data){
            $fncode = $data['fncode']; if(in_array(substr($fncode,0,2),['SL'])) return $data['docno'];
            if($fncode === $this->fn_in){
                if(!array_key_exists($data['id'],$this->cache['stfrs'])) $this->cache['stfrs'][$data['id']] = StockTransfer::with('OUT')->where('in',$data['id'])->first();
                return Arr::get($this->cache['stfrs'][$data['id']],"OUT.docno",null);
            }
            return null;
        }
        public function getRefDate($data){
            $fncode = $data['fncode'];
            if($fncode === $this->fn_in){
                if(!array_key_exists($data['id'],$this->cache['stfrs'])) $this->cache['stfrs'][$data['id']] = StockTransfer::with('OUT')->where('in',$data['id'])->first();
                return Arr::get($this->cache['stfrs'][$data['id']],"OUT.date",null);
            }
            return $data['date'];
        }
        public function getSign($data){
            $fncode = $data['fncode'];
            return ($fncode === $this->fn_in || in_array(substr($fncode,0,2),['SR'])) ? -1 : 1;
        }
        public function getCurrency($data){ return $this->getStoreProp($data,'currency'); }
        public function getFNDefaultAccount($fncode){
            if(substr($fncode,0,2) === 'MT') return null;
            if(!$this->cache['fndac']) $this->cache['fndac'] = DB::table('functiondetails')->pluck('default_account','code')->toArray();
            return Arr::get($this->cache['fndac'],$fncode);
        }

    }
