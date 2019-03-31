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

        public function getFillAttributes()
        {
            return ['docno','date','user','customer','fycode','fncode','status'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'docno' => 'DOCNO',
                'date' => 'DOCDATE',
                'fycode' => 'FYCODE',
                'fncode' => 'FNCODE',
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

        public function preActions(){
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

        public function getPrimaryValueFromRowData($data)
        {
            list($fycode,$fncode,$docno) = Arr::only($data,['FYCODE','FNCODE','DOCNO']);
            $so = SalesOrder::where(compact('fycode','fncode','docno'))->first();
            return $so ? $so->id : null;
        }
    }