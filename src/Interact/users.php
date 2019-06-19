<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class users implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\User::class;
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

        public function getExportMappings()
        {
            return [];
        }

        public function getExportAttributes()
        {
            return ['id','name','code','phone','outstanding_normal','outstanding_overdue','outstanding_critical'];
        }
    }