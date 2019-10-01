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

        public function getImportAttributes()
        {
            return ['name','email','password','login','login_password','reference'];
        }

        public function getImportMappings()
        {
            return [
                'reference' => 'CODE',
                'name' => 'getName',
                'email' => 'getEmail',
                'password' => 'getPassword',
                'login' => 'CODE',
                'login_password' => 'PASSWORD',
            ];
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

        public function getPrimaryIdFromImportRecord($data)
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