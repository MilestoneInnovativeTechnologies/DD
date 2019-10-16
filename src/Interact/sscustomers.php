<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;

    class sscustomers implements Table
    {
        private $user = ['export' => null];

        public function getModel()
        {
            return User::class;
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

        public function preExportGet(){
            $user = \Milestone\SS\Model\User::withoutGlobalScopes(['ExceptAppframeUsers'])->with(['Area.StoreAndUser.Store'])->whereNull('reference')->get();
            $this->user['export'] = $user->mapWithKeys(function($user){
                return [$user->id => ['store' => Arr::get($user,'Area.0.StoreAndUser.0.Store'),'area' => Arr::get($user,'Area.0')]];
            })->toArray();
        }
        public function preExportUpdate(){ return $this->preExportGet(); }

        public function getExportMappings()
        {
            return [
                'DISPLAYNAME' => 'name',
                'PHONE' => 'phone',
                'ADDRESS' => 'address',
                'EMAIL' => 'email',
                'COCODE' => 'getCOCode',
                'BRCODE' => 'getBRCode',
                'AREACODE' => 'getAreaCode'
            ];
        }

        public function getExportAttributes()
        {
            return ['DISPLAYNAME','PHONE','ADDRESS','EMAIL','COCODE','BRCODE','AREACODE'];
        }

        public function isValidExportGet($data){ return !$data['reference']; }
        public function isValidExportUpdate($data){ return $this->isValidExportGet($data); }
        public function getCOCode($data){ return Arr::get($this->user['export'],$data['id'] . '.store.cocode'); }
        public function getBRCode($data){ return Arr::get($this->user['export'],$data['id'] . '.store.brcode'); }
        public function getAreaCode($data){ return Arr::get($this->user['export'],$data['id'] . '.area.code'); }
    }