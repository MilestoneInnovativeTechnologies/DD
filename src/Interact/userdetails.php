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
        private $cache = [
            'group' => '',
            'user' => '',
            'usrgrp' => [],
        ];

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

        public function getPrimaryIdFromImportRecord($data){ return Arr::get($this->cache['usrgrp'],$this->getGroupId($data) . "|" . $this->getUserId($data)); }

        public function getGroupId($data){ return Arr::get($this->cache['group'],$data['GROUPCODE']); }
        public function getUserId($data){ return Arr::get($this->cache['user'],$data['CODE']); }

        public function preImport($activity){
            $this->cache['group'] = Group::pluck('id','reference')->toArray();
            $this->cache['user'] = User::whereIn('reference',Arr::pluck($activity['data'],'CODE'))->pluck('id','reference')->toArray();
            $this->cache['usrgrp'] = GroupUser::whereIn('user',array_values($this->cache['user']))->orWhereIn('group',array_values($this->cache['group']))
                ->get()->mapWithKeys(function($usrgrp){
                    return [$usrgrp->group . "|" . $usrgrp->user => $usrgrp->id];
                })->toArray();
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