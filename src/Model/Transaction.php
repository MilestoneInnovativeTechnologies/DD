<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected static function boot()
    {
        parent::boot();
        static::addGlobalScope('ePlusAccountGroup',function(Builder $builder){
            $builder->orderBy('date','desc');
        });
    }

    protected $table = 'transactions';

    public function Details(){ return $this->hasMany(TransactionDetail::class,'transaction','id')->with(['Product']); }
    public function Store(){ return $this->belongsTo(Store::class,'store'); }
    public function STOut(){ return $this->hasOne(StockTransfer::class,'out','id'); }
    public function STIn(){ return $this->hasOne(StockTransfer::class,'in','id'); }

    public function scopeAssignedCustomerTransactions($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->whereIn('customer',User::find(request()->user()->id)->AreaCustomers->pluck('user')->all());
    }
    public function scopeSTPending($Q){
        return $Q->whereHas('STOut',function($Q){ $Q->pending(); });
    }
}
