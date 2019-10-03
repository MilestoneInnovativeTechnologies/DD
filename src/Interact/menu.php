<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\Interact\Table;
use Milestone\SS\Model\Menu as mMenu;
use Milestone\SS\Model\MenuType;

class menu implements Table
{
    private $cache = [
        'category' => [],
        'order' => null,
    ];

    public function getModel()
    {
        return mMenu::class;
    }

    public function getImportAttributes(){ return []; }
    public function getImportMappings(){ return []; }
    public function getPrimaryIdFromImportRecord($data){ return null; }

    public function preExportGet(){
        MenuType::all()->each(function($menu_type){
            $fnCodes = explode(',',$menu_type->fncodes);
            $category = $menu_type->name; $category_display = $menu_type->display_name;
            $this->cache['category'] = array_merge($this->cache['category'],array_fill_keys($fnCodes,compact('category','category_display')));
        });
        $this->cache['order'] = mMenu::all()->mapWithKeys(function($menu){ return [$menu->fncode => $menu->order]; })->sort()->keys()->flip()->toArray();
    }

    public function getExportAttributes()
    {
        return ['fncode','category','category_display','name','order','icon','home_display','drawer_display','status'];
    }

    public function getExportMappings()
    {
        return [
            'category' => 'getCategory',
            'category_display' => 'getCategoryDisplay',
            'order' => 'getOrder',
        ];
    }

    public function getCategory($data){ return Arr::get($this->cache['category'],$data['fncode'] . '.category'); }
    public function getCategoryDisplay($data){ return Arr::get($this->cache['category'],$data['fncode'] . '.category_display'); }
    public function getOrder($data){ return Arr::get($this->cache['order'],$data['fncode']); }
}