<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class ShiftTransaction extends Model
{
    protected $table = 'shift_transactions';

    public function scopeOwn($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->whereHas('Shift',function($Q){ $Q->own(); });
    }

    public function Shift(){ return $this->belongsTo(Shift::class,'shift','id'); }
}
