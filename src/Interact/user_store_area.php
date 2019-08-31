<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\UserStoreArea;

    class user_store_area implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\UserStoreArea::class;
        }

        public function getImportAttributes()
        {
            return ['user','store','area'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            list($user,$store,$area) = array_values(Arr::only($data,['user','store','area']));
            return Arr::get(UserStoreArea::where(compact('user','store','area')),'id',null);
        }

        public function getExportMappings()
        {
            return [];
        }

        public function getExportAttributes()
        {
            return ['id','user','store','area'];
        }

        public function preExportGet($query){
            return (request()->_user) ? $query->where('user',request()->_user) : $query;
        }
        public function preExportUpdate($query){
            return (request()->_user) ? $query->where('user',request()->_user) : $query;
        }
    }
