<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;

    class pihdata implements Table
    {
        private $user_cache = null;

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
            list($fycode,$fncode,$docno) = Arr::only($data,['FYCODE','FNCODE','DOCNO']);
            $so = SalesOrder::where(compact('fycode','fncode','docno'))->first();
            return $so ? $so->id : null;
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