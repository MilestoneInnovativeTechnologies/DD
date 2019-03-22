<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $table = 'transactions';

    public function Details(){
        return $this->hasMany(TransactionDetail::class,'transaction','id')->with(['Product']);
    }

    public function Products(){
        return $this->belongsToMany(StoreProductTransaction::class,'transaction_details','transaction','spt','id','id');
    }
}
