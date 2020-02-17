<?php


    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\SS\Model\Receipt;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\User;
    use Milestone\SS\Model\UserStoreArea;

    class importtransactions implements Table
    {
        private $cache = [
            'customer' => null,
            'user' => [],
        ];
        public function getModel()
        {
            return Receipt::class;
        }

        public function getImportAttributes()
        {
            return [];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return null;
        }

        public function getExportAttributes()
        {
            return ['COCODE','BRCODE','FYCODE','FNCODE','DOCNO','DOCDATE','REFNO','REFDATE','ACCCODE1','ACCCODE2','AMOUNT','SHFDOCNO'];
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
                'REFNO' => 'cheque',
                'REFDATE' => 'cheque_date',
                'ACCCODE1' => 'getAccount1Code',
                'ACCCODE2' => 'getAccount2Code',
                'AMOUNT' => 'amount',
                'SHFDOCNO' => 'shift_docno',
            ];
        }

        public function preExportGet($query){ return $query->where('source','SS'); }
        public function preExportUpdate($query){ return $this->preExportGet($query); }

        public function isValidExportGet($data){ return ($data->customer && $data->user); }
        public function isValidExportUpdate($data){ return $this->isValidExportGet($data); }

        public function getUserProp($data,$prop){
            $user_id = $data['user'];
            if(!array_key_exists($user_id,$this->cache['user'])){ $this->cache['user'][$user_id] = UserStoreArea::where('user',$user_id)->with(['Store'])->first(); }
            return Arr::get($this->cache['user'],"{$user_id}.{$prop}", Arr::get($this->cache['user'],"{$user_id}.User.{$prop}", Arr::get($this->cache['user'],"{$user_id}.Store.{$prop}",null)));
        }
        public function getAccount1Code($data){
            if(!$data['customer']) return null;
            if(!$this->cache['customer']) $this->cache['customer'] = User::all()->pluck('reference','id')->toArray();
            return Arr::get($this->cache['customer'],$data['customer'],null);
        }
        public function getAccount2Code($data){
            return null;
        }
        public function getCOCode($data){ return $this->getUserProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getUserProp($data,'brcode'); }
    }
