<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class SalesOrder extends Model
{
    protected $table = 'sales_order';

    public function Items(){ return $this->hasMany(SalesOrderItem::class,'so'); }
}
