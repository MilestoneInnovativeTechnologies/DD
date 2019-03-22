<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class userprofile implements Table
    {
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
            return ['reference' => 'CODE'];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [
                'name' => 'getName',
                'email' => 'getEmail',
                'password' => 'getPassword',
            ];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $user = User::where(['reference' => $data['CODE']])->first();
            return $user ? $user->id : null;
        }

        public function getName($data){
            return implode(" ",Arr::only($data,['FIRSTNAME','INITIALS','LASTNAME']));
        }
        public function getEmail($data){
            $email = $data['EMAIL'];
            return $email ?: implode("@",[$data['CODE'],'temp.mail']);
        }
        public function getPassword($data){
            return Str::random(strlen($data['CODE']));
        }
    }