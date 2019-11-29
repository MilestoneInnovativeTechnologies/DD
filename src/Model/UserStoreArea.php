<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class UserStoreArea extends Model
{
    protected $table = 'user_store_area';

    public function Store(){ return $this->belongsTo(Store::class,'store'); }
    public function Area(){ return $this->belongsTo(Area::class,'area'); }
    public function User(){ return $this->belongsTo(User::class,'user'); }
    public function AssignedAreas(){ return $this->hasMany(AreaUser::class,'area','area'); }
    public function Customers(){ return $this->belongsToMany(User::class,'area_users','area','user','area','id'); }

    public function scopeAssigned($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->where('user',request()->user()->id);
    }
}
