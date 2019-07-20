<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Tax;

    class productgroups implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Productgroup::class;
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
            return ['tax1' => 'getTax1Value','tax2' => 'getTax2Value'];
        }

        public function getExportAttributes()
        {
            return ['id','name','belongs','parent','tax1','tax2'];
        }

        public function getTax1Value($record){
            $tax = $record['tax1']; if (!$tax) return 0;
            return $this->getTaxValue($tax);
        }
        public function getTax2Value($record){
            $tax = $record['tax2']; if (!$tax) return 0;
            return $this->getTaxValue($tax);
        }
        private function getTaxValue($tax){
            return 0;
            $taxCode = Arr::get(Tax::find($tax),'code',0);
            return $taxCode ? DB::select('SELECT TAXVALUE(?,1,1,1) AS TV', [$taxCode])[0]->TV : $taxCode;
        }
    }