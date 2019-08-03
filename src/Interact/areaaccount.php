<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\Area;
    use Milestone\SS\Model\AreaUser;
    use Milestone\Interact\Table;

    class areaaccount implements Table
    {
        private $area_cache = null, $user_cache = null, $area_user_cache = null;
        private $implode_delimiter = '|';

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

        public function getPrimaryIdFromImportRecord($data)
        {
            $area_user = AreaUser::where(['area' => $data['AREACODE'],'user' => $data['ACCCODE']])->first();
            return $area_user ? $area_user->id : null;
        }

        public function preImport(){
            $this->area_cache = Area::pluck('id','code')->toArray();
            $this->user_cache = User::pluck('id','reference')->toArray();
            $this->area_user_cache = AreaUser::all()->map(function ($item){ return $this->AreaUserStr($item->area,$item->user); })->toArray();
        }
        public function isValidImportRecord($record){
            return !in_array($this->AreaUserStr($this->getAreaID($record),$this->getUserID($record)),$this->area_user_cache);
        }

        public function getAreaID($record){
            $area_code = $record['AREACODE'];
            return Arr::get($this->area_cache,$area_code);
        }
        public function getUserID($record){
            $user_code = $record['ACCCODE'];
            return Arr::get($this->user_cache,$user_code);
        }

        private function AreaUserStr($area,$user){
            return implode($this->implode_delimiter,[$area,$user]);
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