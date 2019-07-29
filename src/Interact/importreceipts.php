<?php


    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Receipt;
    use Milestone\SS\Model\User;
    use Milestone\SS\Model\UserStoreArea;

    class importreceipts implements Table
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
            return ['BILLNO','DOCDATE','ACCCODE','AMOUNT','COCODE','BRCODE','FYCODE'];
        }

        public function getExportMappings()
        {
            return [
                'BILLNO' => 'docno',
                'DOCDATE' => 'date',
                'ACCCODE' => 'getAccountCode',
                'AMOUNT' => 'amount',
                'COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
                'FYCODE' => 'fycode'
            ];
        }

        public function getUserProp($data,$prop){
            $user_id = $data['user'];
            if(!array_key_exists($user_id,$this->cache['user'])){ $this->cache['user'][$user_id] = UserStoreArea::where('user',$user_id)->with(['Store'])->first(); }
            return Arr::get($this->cache['user'],"{$user_id}.{$prop}", Arr::get($this->cache['user'],"{$user_id}.User.{$prop}", Arr::get($this->cache['user'],"{$user_id}.Store.{$prop}",null)));
        }
        public function getAccountCode($data){
            if(!$data['customer']) return null;
            if(!$this->cache['customer']) $this->cache['customer'] = User::all()->pluck('reference','id')->toArray();
            return Arr::get($this->cache['customer'],$data['customer'],null);
        }
        public function getCOCode($data){ return $this->getUserProp($data,'cocode'); }
        public function getBRCode($data){ return $this->getUserProp($data,'brcode'); }
    }
