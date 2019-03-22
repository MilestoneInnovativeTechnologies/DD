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

    public function getFillAttributes()
    {
        return [
            'code','name','narration','narration2','narration3','narration4','narration5','narration6','narration7',
            'narration8','narration9','narration10','group1','group2','group3','group4','group5','group6','group7',
            'group8','group9','group10','type','status'
        ];
    }

    public function attributeToColumnMapArray()
    {
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'narration' => 'NARRATION',
            'narration2' => 'NARRATION2',
            'narration3' => 'NARRATION3',
            'narration4' => 'NARRATION4',
            'narration5' => 'NARRATION5',
            'narration6' => 'NARRATION6',
            'narration7' => 'NARRATION7',
            'narration8' => 'NARRATION8',
            'narration9' => 'NARRATION9',
            'narration10' => 'NARRATION10',
            'type' => 'TYPE',
            'status' => 'STATUS'
        ];
    }

    public function attributeToColumnMethodMapArray()
    {
        return array_combine(array_map(function($n){ return 'group' . $n; },range(1,10)),
        array_map(function($n){ return 'getGroupValue' . $n; },range(1,10)));
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

    public function getPrimaryValueFromRowData($data)
    {
        $product = Product::where('code',$data['CODE'])->first();
        return $product ? $product->id : null;
    }


}