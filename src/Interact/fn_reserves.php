<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\FnReserve;

    class fn_reserves implements Table
    {
        public function getModel()
        {
            return FnReserve::class;
        }

        public function getImportAttributes()
        {
            return ['id','fncode','user','store','start_num','end_num','quantity','current','progress','status'];
        }

        public function getImportMappings()
        {
            return ['user' => 'getNull' ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(FnReserve::find($data['id']),'id',null);
//            list('fncode' => $fncode,'user' => $user,'store' => $store,'start_num' => $start_num) = $data;
//            return Arr::get(FnReserve::where(compact('fncode','user','store','start_num'))->first(),'id',null);
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['id','fncode','user','store','start_num','end_num','quantity','current','progress','status'];
        }

        public function preExportGet($query){
            if(!request()->_user) return $query->unCompleted();
            Auth::loginUsingId(request()->_user);
            return $query->unCompleted()->assignedStore();
        }
        public function preExportUpdate($query){
            return $this->preExportGet($query);
        }

        public function getNull(){ return null; }
    }