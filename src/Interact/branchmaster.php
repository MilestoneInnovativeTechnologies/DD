<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Milestone\SS\Model\Store;
    use Milestone\Interact\Table;

    class branchmaster implements Table
    {

        public function getModel()
        {
            return Store::class;
        }

        public function preImport($activity){
            $BrAbr = Arr::pluck($activity['data'],'ABR','CODE'); $updated_at = now()->toDateTimeString();
            if(!empty($BrAbr))
                foreach ($BrAbr as $brcode => $br_abr)
                    DB::table('stores')->where(compact('brcode'))->update(compact('br_abr','updated_at'));
        }

        public function isValidImportRecord(){ return false; }

        public function getImportAttributes()
        {
            return ['br_abr'];
        }

        public function getImportMappings()
        {
            return ['br_abr' => 'ABR'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return 1;
        }

        public function getExportMappings(){}

        public function getExportAttributes(){}

    }