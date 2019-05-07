<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    protected $table = 'tax';

    public function Details(){ return $this->hasMany(TaxDetail::class,'tax'); }

    public function scopeActive($q){ $q->where('status','Active'); }
}
