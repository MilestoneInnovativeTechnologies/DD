<?php

    namespace Milestone\SS\Interact;


    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Cache;
    use Milestone\Appframe\Model\User;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\Receipt;

    class ddata implements Table
    {
        private $cr = 'CR';
        private $br = 'BR';
        private $cache_key = 'ddata';
        private $cache = [
            'customer' => []
        ];

        public function getModel()
        {
            return \Milestone\SS\Model\DData::class;
        }

        public function getImportAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'SLNO', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'REFNO', 'REFDATE', 'AMT', 'SIGN', 'NARRATION', 'NARRATION2', 'REFCOCODE', 'REFBRCODE', 'REFFYCODE', 'REFFNCODE', 'REFDOCNO', 'REFSRNO', 'TYPE', 'APPROVAL_STATUS', 'APPROVAL_MODE', 'APPROVAL_TYPE', 'CANCEL', 'VERSION'];
        }

        public function getImportMappings()
        {
            return [];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $pks = ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO'];
            $priData = Arr::only($data,$pks);
            return Arr::get(\Milestone\SS\Model\DData::where($priData)->first(),'id');
        }

        public function preImport($activity){
            if($activity['mode'] === 'create'){
                $cachedRecords = Cache::pull($this->cache_key,[]);
                if(!empty($cachedRecords)) $activity['data'] = array_merge($cachedRecords,$activity['data']);
            }
            if($activity['data'] && !empty($activity['data'])) $this->cache['customer'] = User::whereIn('reference',array_column($activity['data'],'ACCCODE'))->get()->pluck('id','reference')->toArray();
            return $activity;
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }

        public function recordImported($record){
            if(!in_array(substr($record['FNCODE'],0,2),[$this->cr,$this->br]) || $record['TYPE'] === 'System') return;
            list('DOCNO' => $docno, 'FYCODE' => $fycode, 'FNCODE' => $fncode, 'NARRATION2' => $bank, 'REFNO' => $cheque, 'REFDATE' => $cheque_date) = $record;
            $customer = $this->getCustomerID($record);
            $pri = compact('docno','fycode','fncode'); $data = compact('customer','bank','cheque','cheque_date');
            $receipt = Receipt::where($pri);
            if($receipt->exists()) $receipt->update($data);
            else $this->doCacheRecord($record);
        }

        public function getCustomerID($data){
            return Arr::get($this->cache['customer'],$data['ACCCODE']);
        }

        private function doCacheRecord($record){
            $cachedRecords = Cache::pull($this->cache_key,[]);
            array_push($cachedRecords,$record);
            Cache::put($this->cache_key,$cachedRecords);
        }

    }