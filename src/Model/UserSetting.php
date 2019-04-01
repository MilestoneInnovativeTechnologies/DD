<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class UserSetting extends Model
{
    protected $table = 'user_settings';

    public function Settings(){ $this->belongsTo(Setting::class,'setting'); }
}
