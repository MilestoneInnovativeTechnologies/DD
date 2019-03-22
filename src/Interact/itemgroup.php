<?php

namespace Milestone\SS\Interact;

use Milestone\SS\Model\Productgroup;
use Milestone\Interact\Table;

class itemgroup implements Table
{
    public function getModel()
    {
        return Productgroup::class;
    }

    public function getFillAttributes()
    {
        return ['code','name','status','type'];
    }

    public function attributeToColumnMapArray()
    {
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'status' => 'STATUS',
            'type' => 'TYPE'
        ];
    }

    public function attributeToColumnMethodMapArray()
    {
        return [];
    }

    public function getPrimaryValueFromRowData($data)
    {
        $record = Productgroup::where('code',$data['CODE'])->first();
        return $record ? $record->id : null;
    }


}