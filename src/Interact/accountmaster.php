<?php

    namespace Milestone\SS\Interact;


    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Event;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\GroupUser;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\User;

    class accountmaster implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $account_group_id = null;
        private $cache = [
            'users' => [],
            'details' => [],
            'pending' => [],
        ];

        public function getModel()
        {
            return User::class;
        }

        public function getImportAttributes()
        {
            return ['name','email','password','reference'];
        }

        public function getImportMappings()
        {
            return [
                'name' => 'NAME',
                'email' => 'getEmail',
                'password' => 'getPassword',
                'reference' => 'CODE',
            ];
        }

        public function getEmail($data){ return implode("@",[$data['CODE'],'temp.mail']); }
        public function getPassword($data){ return ' '; }

        public function getPrimaryIdFromImportRecord($data){
            return Arr::get($this->cache['pending'],$data['NAME'],Arr::get($this->cache['users'],$data['CODE'],null));
        }

        public function preImport($activity){
            $this->account_group_id = Arr::get(Group::where('name','eplus_account')->first(),'id');
            $this->cache['users'] = User::pluck('id','reference')->toArray();
            $this->cache['pending'] = User::whereNull('reference')->pluck('id','name')->toArray();
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
            list('CODE' => $reference,'NAME' => $name) = $data;
            $email = $this->getEmail($data); $password = $this->getPassword($data);
            $record = compact('name','email','password','reference','updated_at');
            if($created_at) $record['created_at'] = $created_at;
            return $record;
        }

        public function isValidImportRecord($record){
            return !$this->bulk;
        }

        public function postImport($Content,$Result){
            if($this->bulk){
                if(!empty($this->cache['details']['inserts'])){
                    User::insert($this->cache['details']['inserts']);
                    Event::dispatch('eloquent.created: ' . User::class,User::latest()->first());
                    $insertedUsers = User::where('created_at',$this->cache['details']['inserts'][0]['created_at'])->pluck('id')->toArray();
                    GroupUser::whereIn('user',$insertedUsers)->delete();
                    Group::find($this->account_group_id)->Users()->attach($insertedUsers);
                }
                if(!empty($this->cache['details']['updates'])){
                    foreach ($this->cache['details']['updates'] as $id => $record){
                        User::find($id)->update($record);
                    }
                    Event::dispatch('eloquent.updated: ' . User::class,User::find($id));
                    $updatedUsers = array_keys($this->cache['details']['updates']);
                    GroupUser::whereIn('user',$updatedUsers)->delete();
                    Group::find($this->account_group_id)->Users()->attach($updatedUsers);
                }
            } else {
                $users = array_values($Result);
                GroupUser::whereIn('user',$users)->delete();
                Group::find($this->account_group_id)->Users()->attach($users);
            }
        }

        public function getExportMappings(){ return []; }
        public function getExportAttributes(){ }
    }