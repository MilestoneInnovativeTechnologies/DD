<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class UserSetting extends Model
{
    protected $table = 'user_settings';

    public function Settings(){ return $this->belongsTo(Setting::class,'setting'); }
    public function User(){ return $this->belongsTo(User::class,'user'); }
}
