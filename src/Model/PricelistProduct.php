<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class PricelistProduct extends Model
{
    protected $table = 'pricelist_products';

    public function Pricelist(){ return $this->belongsTo(Pricelist::class,'pricelist'); }
    public function Product(){ return $this->belongsTo(Product::class,'product'); }
}
