<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\Group;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\User;

    class analysismaster implements Table
    {
        private $sls = [];
        private $new_sls = ['name' => 'salesExecutive','title' => 'Sales Executive','reference' => 'SLS'];
        public function getModel()
        {
            return User::class;
        }

        public function getFillAttributes()
        {
            return ['name','email','reference','password'];
        }

        public function attributeToColumnMapArray()
        {
            return ['name' => 'NAME'];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'email' => 'getEmail',
                'reference' => 'getReference',
                'password' => 'getPassword'
            ];
        }

        public function getEmail($record){
            return implode('',[$this->getReference($record),'.','sls','@','temp.mail']);
        }
        public function getReference($record){
            return implode('',[$record['CATCODE'],$record['CODE']]);
        }
        public function getPassword($record){
            return Str::random(strlen($record['CODE']));
        }

        public function getPrimaryValueFromRowData($data)
        {
            $reference = $this->getReference($data);
            $user = User::where(compact('reference'))->first();
            return $user ? $user->id : null;
        }

        public function isRecordValid($record){
            return ($record['CATCODE'] === 'SE' && $record['ISGROUP'] === 'N');
        }

        public function isDone($record,$id){
            $this->sls[] = $id;
        }
        public function postActions(){
            if(empty($this->sls)) return;
            $group = Group::where('reference','SLS');
            if($group->exists()) return $group->first()->Users()->attach($this->sls);
            $group = new Group(); $group->unguard(); $group = $group->create($this->new_sls);
            return $group->Users()->attach($this->sls);
        }
    }