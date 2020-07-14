<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\UserSetting;

    class user_settings implements Table
    {
        private $cache = [
            'us' => [],
        ];

        public function getModel()
        {
            return UserSetting::class;
        }

        public function getImportAttributes()
        {
            return ['user','setting','value','status'];
        }

        public function getImportMappings()
        {
            return ['status' => 'getStringActive'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get($this->cache['us'],self::USM($data),null);
        }

        public function preImport($activity){
            $this->cache['us'] = UserSetting::all()->mapWithKeys(function($US){ return [self::USM($US) => $US->id]; })->toArray();
        }

        private static function USM($us){ return $us['user'] . '-' . $us['setting']; }

        public function getStringActive(){ return 'Active'; }

        public function getExportMappings()
        {
            return [];
        }

        public function getExportAttributes()
        {
            return ['id','user','setting','value','status'];
        }

        public function preExportGet($query){
            return (request()->_user) ? $query->where('user',request()->_user) : $query;
        }
        public function preExportUpdate($query){
            return (request()->_user) ? $query->where('user',request()->_user) : $query;
        }
    }
