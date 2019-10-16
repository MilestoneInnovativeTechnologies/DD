<?php

namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;
use Milestone\Interact\Table;
use Milestone\SS\Model\ProductGroupMaster;

class itemgroupmaster implements Table
{
    private $bulk = false, $minBulkQty = 10;
    private $cache = [
        'igm' => null,
        'pks' => null,
        'ins' => [],
        'upd' => [],
    ];

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

    public function preImport($activity){
        if(count($activity['data']) > $this->minBulkQty) $this->bulk = true;
        $this->cache['pks'] = ProductGroupMaster::all()->mapWithKeys(function($pgm){ return [self::LC($pgm->list,$pgm->code) => $pgm->id]; })->toArray();
        if($this->bulk){
            $created_at = $updated_at = now()->toDateTimeString();
            $this->cache['igm'] = array_map(function($record)use($created_at,$updated_at){ return self::IGMArray($record,$created_at,$updated_at); },$activity['data']);
        }
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        return Arr::get($this->cache['pks'],self::LC($data['CATCODE'],$data['CODE']),null);
    }

    private $idx = 0;

    public function isValidImportRecord($record){
        if(!$this->bulk) return true;
        $pk = $this->getPrimaryIdFromImportRecord($record);
        if($pk) $this->cache['upd'][$pk] = $this->idx;
        else array_push($this->cache['ins'],$this->idx);
        $this->idx++; return false;
    }

    public function postImport(){
        if(!$this->bulk) return;
        if(!empty($this->cache['ins'])) {
            ProductGroupMaster::insert(Arr::only($this->cache['igm'],$this->cache['ins']));
            Event::dispatch('eloquent.created: ' . ProductGroupMaster::class,ProductGroupMaster::latest()->first());
        }
        if(!empty($this->cache['upd'])) {
            foreach ($this->cache['upd'] as $id => $idx) {
                $data = Arr::except($this->cache['igm'][$idx], ['created_at']);
                DB::table('product_group_master')->where('id', $id)->update($data);
            }
            Event::dispatch('eloquent.updated: ' . ProductGroupMaster::class,ProductGroupMaster::find($id));
        }
    }

    public static function LC($list,$code){ return implode("|",[$list,$code]); }
    public static function IGMArray($record,$created_at,$updated_at){
        list('CODE' => $code,'NAME' => $name, 'CATCODE' => $list) = $record;
        return compact('code','name','list','created_at','updated_at');
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