<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';

    public function Group01(){ return $this->belongsToGroup('1'); }
    public function Group02(){ return $this->belongsToGroup('2'); }
    public function Group03(){ return $this->belongsToGroup('3'); }
    public function Group04(){ return $this->belongsToGroup('41'); }
    public function Group05(){ return $this->belongsToGroup('5'); }
    public function Group06(){ return $this->belongsToGroup('6'); }
    public function Group07(){ return $this->belongsToGroup('7'); }
    public function Group08(){ return $this->belongsToGroup('8'); }
    public function Group09(){ return $this->belongsToGroup('9'); }
    public function Group10(){ return $this->belongsToGroup('10'); }

    public function belongsToGroup($num){
        $field = 'group' . $num;
        return $this->belongsTo(Productgroup::class,$field);
    }
}
