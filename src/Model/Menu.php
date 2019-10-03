<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'menu';
    static public $default_icons = [
        'BR1' => 'account_balance',
        'BR2' => 'credit_card',
        'CR1' => 'attach_money',
        'MT1' => 'format_textdirection_r_to_l',
        'MT2' => 'format_textdirection_l_to_r',
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
