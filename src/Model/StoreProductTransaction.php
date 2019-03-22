<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class StoreProductTransaction extends Model
{
    protected $table = 'store_product_transactions';

    public function Product(){
        return $this->belongsTo(Product::class,'product','id');
    }
}
