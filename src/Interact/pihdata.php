<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\UserStoreArea;

    class pihdata implements Table
    {
        private $user_cache = null;
        private $customer_cache = [];

        public function getModel()
        {
            return SalesOrder::class;
        }

        public function getImportAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','payment_type','status','_ref'];
        }

        public function getImportMappings()
        {
            return [
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
                'payment_type' => 'PAYMENTMODE',
                'user' => 'getUserID',
                'customer' => 'getCustomerID',
                'status' => 'getStatus',
                '_ref' => 'getReference'
            ];
        }

        public function preImport(){
            $users = User::all();
            $this->user_cache = $users->pluck('id','reference')->toArray();
        }

        public function getUserID($record){
            return Arr::get($this->user_cache,$record['CREATED_USER']);
        }
        public function getCustomerID($record){
            return Arr::get($this->user_cache,$record['ACCCODE']);
        }
        public function getStatus($record){
            return $record['CANCEL'] === 'No' ? 'Active' : 'Inactive';
        }
        public function getReference($record){
            return implode('',['U',$this->getUserID($record),'T',intval(microtime(true)*10000)]);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            list('DOCNO' => $docno,'FYCODE' => $fycode, 'FNCODE' => $fncode) = $data;
            return Arr::get(SalesOrder::where(compact('fycode','fncode','docno'))->first(),'id',null);
        }

        public function getExportMappings()
        {
            return ['COCODE' => 'getCOCode',
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
                'REFDATE' => 'date'];
        }
        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','DOCDATE','CO','BR','ACCCODE','PAYMENTMODE','ANALYSISCATCODE','ANALYSISCODE','STRSRCCAT','REFDATE'];
        }

        public function getUserProp($data,$prop){
            if(!array_key_exists($data['user'],(array) $this->user_cache)) $this->user_cache[$data['user']] = UserStoreArea::where('user',$data['user'])->with(['Store','User'])->first();
            return Arr::get($this->user_cache[$data['user']],$prop, Arr::get($this->user_cache[$data['user']],"User.{$prop}", Arr::get($this->user_cache[$data['user']],"Store.{$prop}",null)));
        }

        public function getCOCode($data){ return $this->getUserProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getUserProp($data,'brcode'); }
        public function getACCCode($data){
            if(!$this->customer_cache) $this->customer_cache = User::all()->pluck('reference','id')->toArray();
            return Arr::get($this->customer_cache,$data['customer']);
        }
        public function getAnalysisCatCode(){ return 'SE'; }
        public function getAnalysisCode($data){ return str_ireplace($this->getAnalysisCatCode(),'',$this->getUserProp($data,'reference')); }
        public function getStrSrcCode(){ return 'INV'; }
    }