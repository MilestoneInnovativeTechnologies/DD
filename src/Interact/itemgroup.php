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

    public function getImportAttributes()
    {
        return ['code','name','status','type'];
    }

    public function getImportMappings()
    {
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'status' => 'STATUS',
            'type' => 'TYPE'
        ];
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        $record = Productgroup::where('code',$data['CODE'])->first();
        return $record ? $record->id : null;
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