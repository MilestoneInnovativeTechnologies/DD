<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Facades\DB;
    use Milestone\Interact\Table;

    class users implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\User::class;
        }

        public function getImportAttributes()
        {
            return ['id','name','phone'];
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
            return [
                'code' => 'reference',
                'outstanding_normal' => 'getOutstandingNormal',
                'outstanding_overdue' => 'getOutstandingOverdue',
                'outstanding_critical' => 'getOutstandingCritical'
            ];
        }

        public function getExportAttributes()
        {
            return ['id','name','code','phone','outstanding_normal','outstanding_overdue','outstanding_critical'];
        }

        public function getOutstandingNormal($record){ return $this->getOutstanding($record['reference'],'Normal'); }
        public function getOutstandingCritical($record){ return $this->getOutstanding($record['reference'],'Critical'); }
        public function getOutstandingOverdue($record){ return $this->getOutstanding($record['reference'],'Overdue'); }
        private function getOutstanding($account,$type){
            return DB::select('SELECT OUTSTANDINGASON(?,?,?,?) AS OST', [$account,date('Y-m-d H:i:s'),'Yes',$type])[0]->OST;
        }
    }