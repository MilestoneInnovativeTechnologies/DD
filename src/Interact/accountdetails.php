<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Event;
    use Illuminate\Support\Facades\Hash;
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
            'details' => []
        ];

        public function getModel()
        {
            return User::class;
        }

        public function getImportAttributes()
        {
            return ['name','email','phone','address','password','reference'];
        }

        public function getImportMappings()
        {
            return [
                'reference' => 'CODE',
                'name' => 'DISPLAYNAME',
                'phone' => 'PHONE',
                'address' => 'ADDRESS',
                'email' => 'getEmail',
                'password' => 'getPassword',
            ];
        }

        public function getEmail($data){
            return $data['EMAIL'] ?: implode("@",[$data['CODE'],'temp.mail']);
        }
        public function getPassword($data){
            return '123456';
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->user['pending'],$data['DISPLAYNAME'],Arr::get($this->user['reference'],$data['CODE'],null));
        }

        public function preImport($activity){
            $this->account_group_id = Arr::get(Group::where('name','eplus_account')->first(),'id');
            $users = User::all();
            $this->user['pending'] = User::whereNull('reference')->pluck('id','name')->toArray();
            $this->user['reference'] = $users->pluck('id','reference')->toArray();
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
            list('CODE' => $reference,'DISPLAYNAME' => $name,'PHONE' => $phone,'ADDRESS' => $address) = $data;
            $record = array_merge([],compact('reference','name','phone','address','updated_at'),['email' => $data['EMAIL'] ?: implode("@",[$data['CODE'],'temp.mail']),'password' => ' ']);
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

        public function preExportGet(){
            $user = \Milestone\SS\Model\User::withoutGlobalScopes(['ExceptAppframeUsers'])->with(['Area.StoreAndUser.Store'])->get();
            $this->user['export'] = $user->mapWithKeys(function($user){
                return [$user->id => Arr::get($user,'Area.0.StoreAndUser.0.Store')];
            })->toArray();
        }
        public function preExportUpdate(){
            $this->preExportGet();
        }

        public function getExportMappings()
        {
            return [
                'DISPLAYNAME' => 'name',
                'PHONE' => 'phone',
                'ADDRESS' => 'address',
                'EMAIL' => 'email',
                'COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
            ];
        }

        public function getExportAttributes()
        {
            return ['DISPLAYNAME','PHONE','ADDRESS','EMAIL','COCODE','BRCODE'];
        }

        public function getCOCode($data){ return Arr::get($this->user['export'],$data['id'] . '.cocode'); }
        public function getBRCode($data){ return Arr::get($this->user['export'],$data['id'] . '.brcode'); }
    }