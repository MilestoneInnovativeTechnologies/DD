<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class SalesOrderItem extends Model
{
    protected $table = 'sales_order_items';

    public function Product(){ return $this->belongsTo(Product::class,'product'); }
    public function SalesOrder(){ return $this->belongsTo(SalesOrder::class,'so'); }
}
