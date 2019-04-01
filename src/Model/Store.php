<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    protected $table = 'stores';

    public function Users(){ return $this->belongsToMany(User::class,'user_store_area','store','user'); }
    public function ProductTransaction(){ return $this->hasMany(StoreProductTransaction::class,'store')->with(['Product']); }
}
