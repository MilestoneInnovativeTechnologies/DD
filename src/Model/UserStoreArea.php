<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class UserStoreArea extends Model
{
    protected $table = 'user_store_area';

    public function Store(){ return $this->belongsTo(Store::class,'store'); }
    public function Area(){ return $this->belongsTo(Area::class,'area'); }
    public function User(){ return $this->belongsTo(User::class,'user'); }
}
