<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Milestone\SS\Model\Store;
    use Milestone\Interact\Table;

    class companymaster implements Table
    {

        public function getModel()
        {
            return Store::class;
        }

        public function preImport($activity){
            $CoAbr = Arr::pluck($activity['data'],'ABR','CODE'); $updated_at = now()->toDateTimeString();
            if(!empty($CoAbr))
                foreach ($CoAbr as $cocode => $co_abr)
                    DB::table('stores')->where(compact('cocode'))->update(compact('co_abr','updated_at'));
        }

        public function isValidImportRecord(){ return false; }

        public function getImportAttributes()
        {
            return ['co_abr'];
        }

        public function getImportMappings()
        {
            return ['co_abr' => 'ABR'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return 1;
        }

        public function getExportMappings(){}

        public function getExportAttributes(){}
    }