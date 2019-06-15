<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;

    class area_users implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\AreaUser::class;
        }

        public function getImportAttributes()
        {
            return [];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
        }

        public function getExportMappings()
        {
            return [];
        }

        public function getExportAttributes()
        {
            return ['id','area','user'];
        }

        public function preExportGet($query){
            if(!request()->_user) return $query;
            Auth::loginUsingId(request()->_user);
            return $query->assigned();
        }
        public function preExportUpdate($query){
            if(!request()->_user) return $query;
            Auth::loginUsingId(request()->_user);
            return $query->assigned();
        }
    }