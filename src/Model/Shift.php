<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Shift extends Model
{
    protected $table = 'shift';

    public function scopeOwn($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->where('user',request()->user()->id);
    }

    public function Transactions(){ return $this->hasMany(ShiftTransaction::class,'shift','id'); }

}
