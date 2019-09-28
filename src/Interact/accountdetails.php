<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class accountdetails implements Table
    {
        private $account_group_id = null;
        private $user = ['pending' => null, 'reference' => null, 'export' => null];

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

        public function preImport(){
            $group = Group::where('name','eplus_account')->first();
            $this->account_group_id = $group ? $group->id : null;
            $users = User::all();
            $this->user['pending'] = $users->where('reference','=',null)->mapWithKeys(function($user){
                return [$user->name => $user->id];
            })->toArray();
            $this->user['reference'] = $users->pluck('id','reference')->toArray();
        }

        public function postImport($Content,$Result){
            $users = array_values($Result);
            Group::find($this->account_group_id)->Users()->attach($users);
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