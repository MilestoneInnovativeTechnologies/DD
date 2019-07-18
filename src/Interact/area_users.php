<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Area;
    use Milestone\SS\Model\User;

    class area_users implements Table
    {
        private $cache = [
            'area' => [],
            'user' => [],
        ];

        public function getModel()
        {
            return \Milestone\SS\Model\AreaUser::class;
        }

        public function getImportAttributes()
        {
            return ['area','user'];
        }

        public function getImportMappings()
        {
            return [
                'area' => 'getAreaId',
                'user' => 'getCustomerId',
            ];
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

        public function preImport($records){
            $areaCodes = array_column($records,'AREACODE');
            $Areas = Area::whereIn('code',$areaCodes)->get();
            if($Areas->isNotEmpty()) $this->cache['area'] = $Areas->pluck('id','code');

            $customerCodes = array_column($records,'ACCCODE');
            $Customers = User::where('reference',$customerCodes);
            if($Customers->isNotEmpty()) $this->cache['user'] = $Customers->pluck('id','reference');
        }
        public function getAreaId($record){
            return array_key_exists($record['AREACODE'],$this->cache['area'])
                ? $this->cache['area'][$record['AREACODE']]
                : null;
        }
        public function getCustomerId($record){
            return array_key_exists($record['ACCCODE'],$this->cache['user'])
                ? $this->cache['user'][$record['ACCCODE']]
                : null;
        }
        public function isValidImportRecord($record){
            return (array_key_exists($record['AREACODE'],$this->cache['area']) && array_key_exists($record['ACCCODE'],$this->cache['user']));
        }
    }