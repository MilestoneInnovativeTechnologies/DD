<?php

namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroupMaster;

class itemgroupmaster implements Table
{
    public function getModel()
    {
        return ProductGroupMaster::class;
    }

    public function getImportAttributes()
    {
        return [
            'code','name','list'
        ];
    }

    public function getImportMappings()
    {
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'list' => 'CATCODE'
        ];
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        return Arr::get(ProductGroupMaster::where('list',$data['CATCODE'])->where('code',$data['CODE'])->first(),'id',null);
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