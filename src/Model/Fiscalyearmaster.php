<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Fiscalyearmaster extends Model
{
    protected $table = 'fiscalyearmaster';

    public function scopeWrite($q){ $q->where('status','ReadWrite'); }
}
