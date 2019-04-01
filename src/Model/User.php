<?php

namespace Milestone\SS\Model;

use Milestone\Appframe\Model\User as AppframeUser;

class User extends AppframeUser
{
    public function Area(){ $this->belongsToMany(Area::class,'area_user','area'); }
}
