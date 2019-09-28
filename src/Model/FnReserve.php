<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class FnReserve extends Model
{
    protected $table = 'fn_reserves';

    protected static function boot()
    {
        parent::boot();
        static::saving(function($model){
            $start = intval($model->start_num); $end = intval($model->end_num);
            $model->setAttribute('quantity',$end - $start + 1);
        });
    }

    public function scopeUnCompleted($Q){
        return $Q->where('progress','!=','Completed');
    }

    public function User(){ return $this->belongsTo(User::class,'user','id'); }
    public function Store(){ return $this->belongsTo(Store::class,'store','id'); }
}
