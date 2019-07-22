<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class accountdetails implements Table
    {
        private $account_group_id = null;

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
            $user = User::where('reference',$data['CODE'])->first();
            return $user ? $user->id : null;
        }

        public function preImport(){
            $group = Group::where('name','eplus_account')->first();
            $this->account_group_id = $group ? $group->id : null;
        }

        public function postImport($Content,$Result){
            $users = array_values($Result);
            Group::find($this->account_group_id)->Users()->attach($users);
        }

        public function getExportMappings()
        {
            return [
                'DISPLAYNAME' => 'name',
                'PHONE' => 'phone',
                'ADDRESS' => 'address',
                'getEmail' => 'email',
            ];
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }
    }