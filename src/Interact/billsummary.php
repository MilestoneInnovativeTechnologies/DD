<?php


    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\User;

    class billsummary implements Table
    {
        private $cache = [
            'user' => null,
        ];
        public function getModel()
        {
            return User::class;
        }

        public function getImportAttributes()
        {
            return ['outstanding','overdue'];
        }

        public function getImportMappings()
        {
            return ['outstanding' => 'OUTSTANDING', 'overdue' => 'OVERDUE'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return $this->getUserId($data);
        }

        public function getExportAttributes()
        {
            return [];
        }

        public function getExportMappings()
        {
            return [];
        }

        public function getUserId($data){
            if($this->cache['user'] === null) $this->cache['user'] = User::pluck('id','reference')->toArray();
            return Arr::get($this->cache['user'],$data['ACCCODE'],null);
        }

        public function isValidImportRecord($record){
            return ($record['ACCCODE'] && $this->getUserId($record));
        }
    }
