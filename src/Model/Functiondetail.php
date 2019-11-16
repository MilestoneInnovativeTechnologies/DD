<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Functiondetail extends Model
{
    protected $table = 'functiondetails';
    protected $guarded = [];

    protected $appends = ['code_name'];
    public function getCodeNameAttribute(){
        return $this->code . '/' . $this->display_name;
    }
}
