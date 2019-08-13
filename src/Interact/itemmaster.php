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
            'code','name','narration','narration2','type','status'
        ];
    }

    public function getImportMappings()
    {
        return array_merge([
            'code' => 'CODE',
            'name' => 'NAME',
            'narration' => 'NARRATION',
            'narration2' => 'NARRATION2',
            'type' => 'TYPE',
            'status' => 'STATUS'
        ],
            array_combine(array_map(function($n){ return 'group' . $n; },range(1,10)),
            array_map(function($n){ return 'getGroupValue' . $n; },range(1,10))));
    }

    public function __call($name, $arguments)
    {
        $num = str_replace('getGroupValue','',$name);
        return $this->getGroupValue($num,$arguments[0]);
    }

    private function getGroupValue($group,$row){
        $belongs = $row['CATCODE_'.str_pad($group,2,"0",STR_PAD_LEFT)];
        $code = $row['GCODE_'.str_pad($group,2,"0",STR_PAD_LEFT)];
        if(is_null($belongs) || is_null($code)) return null;
        $product_group = Productgroup::where(['igmref' => implode('-',[$belongs,$code])])->first();
        return $product_group ? $product_group->id : null;
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