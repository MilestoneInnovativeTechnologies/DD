<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\DB;
    use Milestone\Interact\Table;

    class users implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\User::class;
        }

        public function getImportAttributes()
        {
            return ['id','name','phone','email','address','password'];
        }

        public function getImportMappings()
        {
            return ['password' => 'getPassword'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            return [
                'code' => 'reference',
            ];
        }

        public function getExportAttributes()
        {
            return ['id','name','code','phone','address','outstanding','overdue'];
        }

        public function getPassword(){ return '123456'; }
    }
