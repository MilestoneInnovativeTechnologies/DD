<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\SS\ModelTraits\ScopeActive;
use Milestone\SS\ModelTraits\ScopeRequester;

class Store extends Model
{
    use ScopeActive, ScopeRequester;

    private $requester_trait_relation = 'Users';
    private $requester_trait_db_field = 'users.id';
    private $requester_trait_request_attribute = 'id';

    protected $table = 'stores';

    public function Users(){ return $this->belongsToMany(User::class,'user_store_area','store','user'); }
    public function scopeAssigned($Q){
        return $Q->whereHas("Users",function($q){
            return $q->where('user',request()->user()->id);
        });
    }

}
