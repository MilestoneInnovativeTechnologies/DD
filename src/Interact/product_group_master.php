<?php

namespace Milestone\SS\Interact;

use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroupMaster;

class product_group_master implements Table
{
    public function getModel()
    {
        return ProductGroupMaster::class;
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
        return null;
    }


    public function getExportMappings()
    {
        // TODO: Implement getExportMappings() method.
    }

    public function getExportAttributes()
    {
        return ['id','code','name','list'];
    }
}