<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\DB;
    use Milestone\SS\Model\WBin;
    use Milestone\Interact\Table;

    class companymaster implements Table
    {
        private $cache = [
            'abr' => [],
        ];

        public function getModel()
        {
            return WBin::class;
        }

        public function getImportAttributes()
        {
            return ['bin'];
        }

        public function getImportMappings()
        {
            return ['bin' => 'doBin'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return 1;
        }

        public function doBin($data){
            $this->cache['abr'][$data['CODE']] = $data['ABR'];
            return 1;
        }

        public function postImport($content,$result){
            $abr =$this->cache['abr'];
            if(empty($abr)) return; $updated_at = now()->toDateTimeString();
            foreach ($abr as $cocode => $co_abr)
                DB::table('stores')->where(compact('cocode'))->update(compact('co_abr','updated_at'));
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