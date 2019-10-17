<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Event;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\GroupUser;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class accountdetails implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $account_group_id = null;
        private $user = ['pending' => null, 'reference' => null, 'export' => null];
        private $cache = [
            'details' => [],
            'users' => [],
        ];

        public function getModel()
        {
            return User::class;
        }

        public function getImportAttributes()
        {
            return ['name','email','phone','address'];
        }

        public function getImportMappings()
        {
            return [
                'name' => 'DISPLAYNAME',
                'email' => 'getEmail',
                'phone' => 'PHONE',
                'address' => 'ADDRESS',
            ];
        }

        public function getEmail($data){
            return ($data['EMAIL'] && mb_strpos($data['EMAIL'],'@') > 0) ? $data['EMAIL'] : implode("@",[$data['CODE'],'temp.mail']);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->cache['users'],$data['CODE'],null);
        }

        public function preImport($activity){
            $this->account_group_id = Arr::get(Group::where('name','eplus_account')->first(),'id');
            $this->cache['users'] = User::pluck('id','reference')->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk){
                $created_at = $updated_at = now()->toDateTimeString(); $data = ['updates' => [],'inserts' => []];
                foreach($activity['data'] as $record){
                    $PK = $this->getPrimaryIdFromImportRecord($record);
                    if($PK) $data['updates'][$PK] = $this->getDBRecord($record,$updated_at);
                    else $data['inserts'][] = $this->getDBRecord($record,$updated_at,$created_at);
                }
                $this->cache['details'] = $data;
            }
        }

        private function getDBRecord($data,$updated_at,$created_at = null){
            list('DISPLAYNAME' => $name,'PHONE' => $phone,'ADDRESS' => $address) = $data;
            $email = $this->getEmail($data);
            $record = compact('name','email','phone','address','updated_at');
            if($created_at) $record['created_at'] = $created_at;
            return $record;
        }

        public function isValidImportRecord($record){
            return !$this->bulk && $this->getPrimaryIdFromImportRecord($record);
        }

        public function postImport(){
            if($this->bulk){
//                if(!empty($this->cache['details']['inserts'])){
//                    User::insert($this->cache['details']['inserts']);
//                    Event::dispatch('eloquent.created: ' . User::class,User::latest()->first());
//                    $insertedUsers = User::where('created_at',$this->cache['details']['inserts'][0]['created_at'])->pluck('id')->toArray();
//                    GroupUser::whereIn('user',$insertedUsers)->delete();
//                    Group::find($this->account_group_id)->Users()->attach($insertedUsers);
//                }
                if(!empty($this->cache['details']['updates'])){
                    foreach ($this->cache['details']['updates'] as $id => $record){
                        User::find($id)->update($record);
                    }
                    Event::dispatch('eloquent.updated: ' . User::class,User::find($id));
                    $updatedUsers = array_keys($this->cache['details']['updates']);
                    GroupUser::whereIn('user',$updatedUsers)->delete();
                    Group::find($this->account_group_id)->Users()->attach($updatedUsers);
                }
            }
        }

        public function getExportMappings(){}
        public function getExportAttributes(){}
    }