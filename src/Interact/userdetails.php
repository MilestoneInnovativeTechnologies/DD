<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\GroupUser;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class userdetails implements Table
    {
        private $group_cache = null;
        private $user_cache = null;

        public function getModel()
        {
            return GroupUser::class;
        }

        public function getImportAttributes()
        {
            return ['group','user'];
        }

        public function getImportMappings()
        {
            return [
                'group' => 'getGroupId',
                'user' => 'getUserId',
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return null;
        }

        public function getGroupId($data){
            return Arr::get($this->group_cache,$data['GROUPCODE']);
        }
        public function getUserId($data){
            return Arr::get($this->user_cache,$data['CODE']);
        }

        public function preImport($Content){
            $this->group_cache = Group::pluck('id','reference')->toArray();
            $this->user_cache = User::pluck('id','reference')->toArray();
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }
    }