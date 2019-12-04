<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Event;
    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\Area;
    use Milestone\SS\Model\AreaUser;
    use Milestone\Interact\Table;

    class areaaccount implements Table
    {
        private $area_cache = null, $user_cache = null, $area_user_cache = null;

        private $implode_delimiter = '|';
        private $bulk = false, $minBulkQty = 10;
        private $cache = [
            'user' => [],
            'area' => [],
            'arus' => [],
            'data' => [],
            'del' => [],
        ];

        public function getModel()
        {
            return AreaUser::class;
        }

        public function getImportAttributes()
        {
            return ['area','user'];
        }

        public function getImportMappings()
        {
            return [
                'area' => 'getAreaID',
                'user' => 'getUserID',
            ];
        }

        public function getPrimaryIdFromImportRecord($record){
            return Arr::get($this->cache['arus'],$this->AreaUserStr($record,$record,true));
        }

        public function preImport($activity){
            $this->cache['area'] = Area::pluck('id','code')->toArray();
            $this->cache['user'] = User::pluck('id','reference')->toArray();
            $this->cache['arus'] = AreaUser::all()->mapWithKeys(function ($item){ return [$this->AreaUserStr($item->area,$item->user) => $item->id]; })->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk) {
                $created_at = $updated_at = now()->toDateTimeString();
                foreach($activity['data'] as $record){
                    $area = $this->getAreaID($record); $user = $this->getUserID($record);
                    array_push($this->cache['data'],compact('area','user','created_at','updated_at'));
                }
            }
        }
        public function isValidImportRecord($record){
            $pk = Arr::get($this->cache['arus'],$this->AreaUserStr($record,$record,true));
            if($this->bulk) {
                if($pk) $this->cache['del'][] = $pk;
                return false;
            }
            return ($this->getAreaID($record) && $this->getUserID($record) && !$pk);
        }

        public function getAreaID($record){
            return Arr::get($this->cache['area'],$record['AREACODE']);
        }
        public function getUserID($record){
            return Arr::get($this->cache['user'],$record['ACCCODE']);
        }

        private function AreaUserStr($area,$user,$import = false){
            return ($import)
                ? implode($this->implode_delimiter,[$this->getAreaID($area),$this->getUserID($user)])
                : implode($this->implode_delimiter,[$area,$user]);
        }

        public function postImport(){
            if($this->bulk){
                if(!empty($this->cache['del'])) AreaUser::whereIn('id',$this->cache['del'])->delete();
                if(!empty($this->cache['data'])) AreaUser::insert($this->cache['data']);
                Event::dispatch('eloquent.created: ' . AreaUser::class,AreaUser::latest()->first());
            }
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