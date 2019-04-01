<?php

namespace Milestone\SS\Model;

use Milestone\Appframe\Model\User as AppframeUser;

class User extends AppframeUser
{
    public function Area(){ $this->belongsToMany(Area::class,'area_user','user','area'); }
    public function Settings(){ $this->hasMany(UserSetting::class,'user'); }
    public function StoreAndArea(){ $this->hasMany(UserStoreArea::class,'user')->with(['Store','Area']); }
}
