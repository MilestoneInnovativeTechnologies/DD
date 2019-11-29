<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Functiondetail;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\UserStoreArea;

    class pihdata implements Table
    {
        private $cache = [
            'store' => [],
            'dstre' => null,
            'cstmr' => null,
            'fndac' => null,
            'user' => null,
        ];

        public function getModel()
        {
            return SalesOrder::class;
        }

        public function getImportAttributes()
        {
            return ['docno','date','user','customer','store','fycode','fncode','payment_type','status','_ref'];
        }

        public function getImportMappings()
        {
            return [
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'store' => 'getStoreID',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
                'payment_type' => 'PAYMENTMODE',
                'user' => 'getUserID',
                'customer' => 'getCustomerID',
                'status' => 'getStatus',
                '_ref' => 'getReference'
            ];
        }

        public function preImport($activity){
            $this->cache['user'] = User::whereIn('reference',Arr::pluck($activity['data'],'ACCCODE'))->pluck('id','reference')->toArray();
            $this->cache['store'] = Store::pluck('id','code')->toArray();
            $this->cache['dstre'] = Store::first()->id;
        }
        public function getUserID($data){
            if(!$this->cache['user']) return null;
            if($data['ANALYSISCATCODE'] && $data['ANALYSISCODE']) return Arr::get($this->cache['user'],implode('',[$data['ANALYSISCATCODE'],$data['ANALYSISCODE']]));
            if($data['CREATED_USER'] && array_key_exists($data['CREATED_USER'],$this->cache['user'])) return $this->cache['user'][$data['CREATED_USER']];
            return null;
        }
        public function getCustomerID($record){ return Arr::has($this->cache['user'],$record['ACCCODE']) ? Arr::get($this->cache['user'],$record['ACCCODE']) : null; }
        public function getStoreID($data){ return ($data['STRSRC']) ? Arr::get($this->cache['store'],$data['STRSRC']) : $this->cache['dstre']; }
        public function getStatus($record){ return $record['CANCEL'] === 'No' ? 'Active' : 'Inactive'; }
        public function getReference($record){ return implode('',['U',$this->getUserID($record),'T',intval(microtime(true)*10000)]); }

        public function getPrimaryIdFromImportRecord($data)
        {
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode) = $data;
            return Arr::get(SalesOrder::where(compact('fycode','fncode','docno'))->first(),'id',null);
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
                'STRSRCCAT' => 'getStrSrcCode',
                'REFDATE' => 'date',
                'CURRENCY' => 'getCurrency'
            ];
        }
        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','DOCDATE','CO','BR','ACCCODE','PAYMENTMODE','ANALYSISCATCODE','ANALYSISCODE','STRSRCCAT','REFDATE','CURRENCY'];
        }

        public function preExportGet($query){
            $queryResult = $query->get();
            $refs = array_merge($queryResult->pluck('customer')->unique()->toArray(),$queryResult->pluck('user')->unique()->toArray());
            $this->cache['cstmr'] = User::find($refs)->pluck('reference','id')->toArray();
            return $query->with(['Store']);
        }
        public function preExportUpdate($query){ return $this->preExportGet($query); }

        public function getStoreProp($data,$prop){
            return Arr::get($data['store'],$prop);
        }

        public function getCOCode($data){ return $this->getStoreProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getStoreProp($data,'brcode'); }
        public function getACCCode($data){
            return ($data['customer']) ? Arr::get($this->cache['cstmr'],$data['customer']) : $this->getFNDefaultAccount($data['fncode']);
        }
        public function getAnalysisCatCode($data){ return ($data['user']) ? 'SE' : null; }
        public function getAnalysisCode($data){ return ($data['user']) ? str_replace($this->getAnalysisCatCode($data),'',Arr::get($this->cache['cstmr'],$data['user'])) : null; }
        public function getStrSrcCode(){ return 'INV'; }
        public function getCurrency($data){ return $this->getStoreProp($data,'currency'); }
        public function getFNDefaultAccount($fncode){
            if(!$this->cache['fndac']) $this->cache['fndac'] = DB::table('functiondetails')->pluck('default_account','code')->toArray();
            return Arr::get($this->cache['fndac'],$fncode);
        }
    }
