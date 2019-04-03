<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\Appframe\Model\User;

class AreaUser extends Model
{
    protected $table = 'area_users';

    public function Area(){ return $this->belongsTo(Area::class,'area'); }
    public function User(){ return $this->belongsTo(User::class,'user'); }
}
