<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $table = 'settings';

    public function Users(){ return $this->hasMany(UserSetting::class,'setting')->with(['User']); }

    public function scopeActive($q){ $q->where('status','Active'); }

}
