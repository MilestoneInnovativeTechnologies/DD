<?php


    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Support\Facades\Event;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\User;

    class billsummary implements Table
    {
        private $bulk = false, $minBulkQty = 10;
        private $cache = [
            'user' => null,
            'data' => [],
        ];
        public function getModel()
        {
            return User::class;
        }

        public function preImport($activity){
            $this->cache['user'] = User::pluck('id','reference')->toArray();
            if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
            if($this->bulk){
                $data = $activity['data'];
                $this->cache['data'] = collect($data)->mapWithKeys(function($record){
                    return [ $this->getUserId($record) => ['outstanding' => $record['OUTSTANDING'], 'overdue' => $record['OVERDUE']] ];
                })->toArray();
            }
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
            return Arr::get($this->cache['user'],$data['ACCCODE'],null);
        }

        public function isValidImportRecord($record){
            if($this->bulk) return false;
            return ($record['ACCCODE'] && $this->getUserId($record));
        }

        public function postImport(){
            if($this->bulk && !empty($this->cache['data'])){
                $statement = []; $updated_at = now()->toDateTimeString();
                foreach ($this->cache['data'] as $id => $update)
                    if($id)
                        $statement[] = "UPDATE users SET " . $this->getSetData($update,$updated_at) . " WHERE `id` = '".$id."';";
                if(!empty($statement)) {
                    DB::unprepared(join('',$statement));
                    Event::dispatch('eloquent.updated: ' . User::class,User::where('updated_at',$updated_at)->first());
                }
            }
        }

        private function getSetData($array,$updated_at){
            $sets = ["`updated_at` = '".$updated_at."'"];
            foreach ($array as $key => $value) $sets[] = "`".$key."` = '".$value."'";
            return join(',',$sets);
        }
    }
