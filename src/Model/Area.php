<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\SS\ModelTraits\ScopeActive;
use Milestone\SS\ModelTraits\ScopeRequester;

class Area extends Model
{
    use ScopeActive, ScopeRequester;

    private $requester_trait_relation = 'StoreAndUser';
    private $requester_trait_db_field = '`user`';
    private $requester_trait_request_attribute = 'id';

    protected $table = 'areas';

    public function User(){ return $this->belongsToMany(User::class,'area_users','area','user'); }
    public function StoreAndUser(){ return $this->hasMany(UserStoreArea::class,'area')->with(['Store','User']); }
}
