<?php

namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\SS\Model\Productgroup;
use Milestone\Interact\Table;
use Milestone\SS\Model\Tax;

class itemgroupmaster implements Table
{
    public $tax_cache = null;
    public function getModel()
    {
        return Productgroup::class;
    }

    public function getFillAttributes()
    {
        return [
            'code','name','igmref','parent','belongs','type','tax1','tax2','status'
        ];
    }

    public function attributeToColumnMapArray()
    {
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'type' => 'TYPE',
            'status' => 'STATUS'
        ];
    }

    public function attributeToColumnMethodMapArray()
    {
        return [
            'igmref' => 'getIGMReference',
            'belongs' => 'getBelongsValue',
            'parent' => 'getParentValue',
            'tax1' => 'getTax1ID',
            'tax2' => 'getTax2ID'
        ];
    }

    public function getIGMReference($data){
        return implode("-",Arr::only($data,['CATCODE','CODE']));
    }

    public function getBelongsValue($data){
        $product_group = Productgroup::where(['code' => $data['CATCODE'],'belongs' => NULL])->first();
        return $product_group ? $product_group->id : null;
    }

    public function getParentValue($data){
        $parent = $data['PCODE']; if(is_null($parent)) return null; $belongs = $data['CATCODE'];
        $product_group = Productgroup::where(['belongs' => $belongs,'code' => $parent])->first();
        return $product_group ? $product_group->id : null;
    }

    public function getPrimaryValueFromRowData($data)
    {
        $product_group = Productgroup::where(['belongs' => $data['CATCODE'],'code' => $data['CODE']]);
        return $product_group->exists() ? $product_group->first()->id : null;
    }

    public function getTax1ID($record){
        return $this->getTaxID($record['TAXRULE']);
    }
    public function getTax2ID($record){
        return $this->getTaxID($record['TAXRULE02']);
    }

    private function getTaxID($code){
        if(!$code) return null;
        if(!$this->tax_cache) $this->tax_cache = Tax::pluck('id','code')->toArray();
        return Arr::get($this->tax_cache,$code);
    }
}