<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Builder;
use Milestone\Appframe\Model\Group;
use Milestone\Appframe\Model\User as AppframeUser;

class User extends AppframeUser
{
    protected static function boot(){
        parent::boot();
        static::addGlobalScope('ExceptAppframeUsers',function(Builder $builder){
            $builder->whereNotNull('users.reference');
        });
    }
    public function Area(){ return $this->belongsToMany(Area::class,'area_users','user','area'); }
    public function Settings(){ return $this->hasMany(UserSetting::class,'user')->with(['Settings']); }
    public function StoreAndArea(){ return $this->hasMany(UserStoreArea::class,'user')->with(['Store','Area']); }
    public function Transactions(){ return $this->hasMany(Transaction::class,'customer'); }
    public function AreaCustomers(){ return $this->hasManyThrough(AreaUser::class,UserStoreArea::class,'user','area','id','area'); }

    public function Groups(){ return $this->belongsToMany(Group::class,'__group_users','user','group'); }

    public function scopeSalesExecutive($q){
        return $q->whereHas('Groups',function($q){
            $q->where('reference','SLS');
        });
    }
}
