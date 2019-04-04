<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Builder;
use Milestone\Appframe\Model\User as AppframeUser;

class User extends AppframeUser
{
    protected static function boot(){
        parent::boot();
        static::addGlobalScope('ExceptAppframeUsers',function(Builder $builder){
            $builder->whereNotNull('reference');
        });
    }
    public function Area(){ return $this->belongsToMany(Area::class,'area_user','user','area'); }
    public function Settings(){ return $this->hasMany(UserSetting::class,'user')->with(['Settings']); }
    public function StoreAndArea(){ return $this->hasMany(UserStoreArea::class,'user')->with(['Store','Area']); }

    public function scopeSalesExecutive($q){
        return $q->whereHas('Groups',function($q){
            $q->where('reference','SLS');
        });
    }
}
