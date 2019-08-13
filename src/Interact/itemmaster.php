<?php

namespace Milestone\SS\Interact;

use Milestone\SS\Model\Product;
use Milestone\SS\Model\Productgroup;
use Milestone\Interact\Table;

class itemmaster implements Table
{
    public function getModel()
    {
        return Product::class;
    }

    public function getImportAttributes()
    {
        return [
            'code','name','type','status'
        ];
    }

    public function getImportMappings()
    {
        return array_merge([
            'code' => 'CODE',
            'name' => 'NAME',
            'type' => 'TYPE',
            'status' => 'STATUS'
        ],
            array_combine(array_map(function($n){ return 'group' . $n; },range(1,10)),
            array_map(function($n){ return 'getGroupValue' . $n; },range(1,10))));
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        $product = Product::where('code',$data['CODE'])->first();
        return $product ? $product->id : null;
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