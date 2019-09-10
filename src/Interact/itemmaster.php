<?php

namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\SS\Model\Product;
use Milestone\SS\Model\ProductGroup;
use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroupMaster;

class itemmaster implements Table
{
    private $cache_pgm = [];
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
        return [
            'code' => 'CODE',
            'name' => 'NAME',
            'narration' => 'NARRATION',
            'narration2' => 'NARRATION2',
            'type' => 'TYPE',
            'status' => 'STATUS'
        ];
    }

    public function recordImported($record,$id){
        $Array = ['01','02','03','04','05','06','07','08','09','10'];
        foreach ($Array as $num){
            if($record['CATCODE_' . $num] && $record['GCODE_' . $num]){
                $g = $this->getPGMId($record['CATCODE_' . $num],$record['GCODE_' . $num]);
                ProductGroup::updateOrCreate(['product' => $id],['g'.$num => $g]);
            }
        }
    }

    private function getPGMId($list,$code){
        if(Arr::has($this->cache_pgm,["$list.$code"])) return Arr::get($this->cache_pgm,"$list.$code");
        Arr::set($this->cache_pgm,"$list.$code",Arr::get(ProductGroupMaster::where(compact('code','list'))->first(),'id'));
        return Arr::get($this->cache_pgm,"$list.$code");
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        return Arr::get(Product::where('code',$data['CODE'])->first(),'id',null);
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