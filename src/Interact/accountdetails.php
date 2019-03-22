<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class accountdetails implements Table
    {
        private $account_group = ['name' => 'eplus_account','description' => 'ePlus user accounts comes under this group','title' => 'ePlus Accounts'];
        private $account_group_id = null;

        public function getModel()
        {
            return User::class;
        }

        public function getFillAttributes()
        {
            return ['name','email','password','reference'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'reference' => 'CODE',
                'name' => 'DISPLAYNAME',
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'email' => 'getEmail',
                'password' => 'getPassword',
            ];
        }

        public function getEmail($data){
            return $data['EMAIL'] ?: implode("@",[$data['CODE'],'temp.mail']);
        }
        public function getPassword($data){
            return Str::random(strlen($data['CODE']));
        }

        public function getPrimaryValueFromRowData($data)
        {
            $user = User::where('reference',$data['CODE'])->first();
            return $user ? $user->id : null;
        }

        public function preActions(){
            if(!Group::where('name',$this->account_group['name'])->first()){
                $group = new Group();
                $group->unguard();
                $group->create($this->account_group);
            }
            $group = Group::where('name',$this->account_group['name'])->first();
            $this->account_group_id = $group ? $group->id : null;
        }

        public function postActions($Content,$Result){
            $users = array_values($Result);
            Group::find($this->account_group_id)->Users()->attach($users);
        }
    }