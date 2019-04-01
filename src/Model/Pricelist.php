<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Pricelist extends Model
{
    protected $table = 'pricelist';

    public function Items(){ return $this->hasMany(PricelistProduct::class,'pricelist')->with(['Product']); }
}
