<?php

    namespace Milestone\SS\Interact;

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
            //
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return $data['id'];
        }

        public function getExportMappings()
        {
            //
        }

        public function getExportAttributes()
        {
            return ['id','fncode','user','store','start_num','end_num','quantity','current','progress','status'];
        }
    }