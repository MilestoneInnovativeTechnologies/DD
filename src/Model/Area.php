<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    protected $table = 'areas';

    public function User(){ return $this->belongsToMany(User::class,'area_user','area','user'); }
    public function StoreAndUser(){ return $this->hasMany(UserStoreArea::class,'area')->with(['Store','User']); }
}
