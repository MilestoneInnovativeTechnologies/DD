<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Menu extends Model
{
    protected static function boot(){
        parent::boot();
        static::saved(function($menu){
            if(!$menu->icon) $menu->icon = Arr::get(self::$default_icons,$menu->fncode);
            if(!$menu->home_display) $menu->home_display = $menu->name;
            if(!$menu->drawer_display) $menu->drawer_display = $menu->name;
            $menu->save();
        });
    }
    protected $table = 'menu';
    static public $default_icons = [
        'BR1' => 'attach_money',
        'BR2' => 'account_balance',
        'CR1' => 'money',
        'MT1' => 'transit_enterexit',
        'MT2' => 'transfer_within_a_station',
        'MT3' => 'trending_down',
        'MT4' => 'trending_up',
        'SL1' => 'shopping_cart',
        'SL2' => 'add_shopping_cart',
        'SL3' => 'shopping_basket',
        'SL4' => 'shop',
        'SL5' => 'shop_two',
        'SO1' => 'speaker_notes',
        'SO2' => 'note_add',
        'SR1' => 'keyboard_return',
        'SR2' => 'assignment_return',
        'SR3' => 'assignment_returned'
    ];
}
