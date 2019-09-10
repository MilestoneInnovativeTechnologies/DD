<?php

namespace Milestone\SS\Interact;

use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroup;

class product_groups implements Table
{
    public function getModel()
    {
        return ProductGroup::class;
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
        return ['id','product','g01','g02','g03','g04','g05','g06','g07','g08','g09','g10'];
    }
}