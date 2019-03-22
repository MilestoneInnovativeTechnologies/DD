<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\Group;
    use Milestone\Interact\Table;

    class usermaster implements Table
    {
        public function getModel()
        {
            return Group::class;
        }

        public function getFillAttributes()
        {
            return ['name','title','reference'];
        }

        public function attributeToColumnMapArray()
        {
            return [
                'reference' => 'CODE',
                'title' => 'NAME',
            ];
        }

        public function attributeToColumnMethodMapArray()
        {
            return ['name' => 'getName'];
        }

        public function getName($data){
            return Str::camel($data['NAME']);
        }

        public function getPrimaryValueFromRowData($data)
        {
            $group = Group::where('reference',$data['CODE'])->first();
            $group ? $group->id : null;
        }

        public function isRecordValid($record){
            return $record['ISGROUP'] === 'Y';
        }
    }