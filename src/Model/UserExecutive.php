<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class UserExecutive extends Model
{
    protected $table = 'user_executive';
    protected static function boot()
    {
        parent::boot();
        static::saving(function($model){
            UserExecutive::where('login_user',$model->login_user)->orWhere('executive_user',$model->executive_user)->delete();
            $eUser = User::find($model->executive_user); $lUser = User::find($model->login_user);
            $eUser->login = $lUser->login; $eUser->login_password = $lUser->login_password; $eUser->save();
        });
    }
    public function user(){ return $this->belongsTo(User::class,'login_user','id'); }
    public function executive(){ return $this->belongsTo(User::class,'executive_user','id'); }
}
