<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Functiondetail extends Model
{
    protected $table = 'functiondetails';

    public function Tax(){ return $this->belongsTo(Tax::class,'taxrule'); }
}
