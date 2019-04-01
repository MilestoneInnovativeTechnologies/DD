<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class StoreProductTransaction extends Model
{
    protected $table = 'store_product_transactions';

    public function Product(){ return $this->belongsTo(Product::class,'product'); }
    public function Store(){ return $this->belongsTo(Store::class,'store'); }
    public function User(){ return $this->belongsTo(User::class,'user'); }
    public function Nature(){ return $this->belongsTo(ProductTransactionNature::class,'nature'); }
    public function type(){ return $this->belongsTo(ProductTransactionType::class,'type'); }
}
