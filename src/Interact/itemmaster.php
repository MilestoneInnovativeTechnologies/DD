<?php

namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Event;
use Milestone\SS\Model\Product;
use Milestone\SS\Model\ProductGroup;
use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroupMaster;

class itemmaster implements Table
{
    private $bulk = false, $minBulkQty = 10;
    private $cache = [
        'pgm' => null,
        'prd' => null,
        'products' => [],
        'groups' => [],
        'insert' => [],
        'update' => [],
    ];
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

    public function preImport($activity){
        $this->cacheImportAttrs();
        if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
        if($this->bulk){
            $created_at = $updated_at = now()->toDateTimeString();
            $this->cache['products'] = array_map(function($data) use($created_at,$updated_at){
                list('CODE' => $code,'NAME' => $name,'NARRATION' => $narration,'NARRATION2' => $narration2,'TYPE' => $type,'STATUS' => $status) = $data;
                $this->cache['groups'][$code] = $this->getGroups($data,$created_at,$updated_at);
                return compact('code','name','narration','narration2','type','status','created_at','updated_at');
            },$activity['data']);
        }
    }

    public static function LC($list,$code){ return implode("|",[$list,$code]); }
    public function cacheImportAttrs(){
        $this->cache['pgm'] = ProductGroupMaster::all()->mapWithKeys(function($pgm){ return [$this->LC($pgm->list,$pgm->code) => $pgm->id]; })->toArray();
        $this->cache['prd'] = Product::pluck('id','code')->toArray();
    }
    public function getGroups($record,$created_at,$updated_at){
        $range = ['01','02','03','04','05','06','07','08','09','10']; $groups = compact('created_at','updated_at');
        foreach ($range as $num){
            if($record['CATCODE_' . $num] && $record['GCODE_' . $num]){
                $groups['g'.$num] = Arr::get($this->cache['pgm'],$this->LC($record['CATCODE_' . $num],$record['GCODE_' . $num]));
            }
        }
        return $groups;
    }

    private $idx = 0;
    public function isValidImportRecord($record){
        if(!$this->bulk) return true; $pk = $this->getPrimaryIdFromImportRecord($record);
        if($pk) $this->cache['update'][$pk] = $this->cache['products'][$this->idx];
        else $this->cache['insert'][] = $this->cache['products'][$this->idx];
        $this->idx++;
        return false;
    }

    public function postImport(){
        if(!$this->bulk) return;
        if(!empty($this->cache['insert'])){ Product::insert($this->cache['insert']); Event::dispatch('eloquent.created: ' . Product::class,Product::latest()->first()); }
        if(!empty($this->cache['update'])){
            foreach ($this->cache['update'] as $id => $update){ Product::where(compact('id'))->update(Arr::except($update,'created_at')); }
            Event::dispatch('eloquent.updated: ' . Product::class,Product::find($id));
        }
        $this->cache['prd'] = Product::pluck('id','code')->toArray();
        $prdGroups = array_map(function($group,$code){
            $group['product'] = Arr::get($this->cache['prd'],$code);
            return $group;
        },$this->cache['groups'],array_keys($this->cache['groups']));
        if(!empty($this->cache['insert'])){
            $insertedProducts = array_map(function($code){ return $this->cache['prd'][$code]; },Arr::pluck($this->cache['insert'],'code'));
            $insertGroups = array_filter($prdGroups,function($prgGrp) use($insertedProducts){
                return in_array($prgGrp['product'],$insertedProducts);
            });
            ProductGroup::insert($insertGroups); Event::dispatch('eloquent.created: ' . ProductGroup::class,ProductGroup::latest()->first());
        }
        if(!empty($this->cache['update'])){
            $updatedProducts = array_map(function($code){ return $this->cache['prd'][$code]; },Arr::pluck($this->cache['update'],'code'));
            $updateGroups = array_filter($prdGroups,function($prgGrp) use($updatedProducts){
                return in_array($prgGrp['product'],$updatedProducts);
            });
            foreach ($updateGroups as $update)  ProductGroup::updateOrCreate(['product' => $update['product']],Arr::except($update,'created_at'));
            Event::dispatch('eloquent.updated: ' . ProductGroup::class,ProductGroup::where('product',Arr::get(Arr::last($updateGroups),'product'))->first());
        }
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        return Arr::get($this->cache['prd'],$data['CODE']);
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