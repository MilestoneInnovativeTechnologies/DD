<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\Appframe\Model\User;

class AreaUser extends Model
{
    protected $table = 'area_users';

    public function Area(){ return $this->belongsTo(Area::class,'area'); }
    public function Customer(){ return $this->belongsTo(User::class,'user'); }
    public function Users(){ return $this->hasMany(UserStoreArea::class,'area','area'); }

    public function scopeAssigned($Q){
        $Q->whereHas('Users',function($q){
            $q->assigned();
        });
    }
}
