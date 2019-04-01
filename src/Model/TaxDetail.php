<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class TaxDetail extends Model
{
    protected $table = 'tax_details';

    public function Tax(){ return $this->belongsTo(Tax::class,'tax'); }
}
