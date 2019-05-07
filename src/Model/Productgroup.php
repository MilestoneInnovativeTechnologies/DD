<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\SS\ModelTraits\ScopeActive;

class Productgroup extends Model
{
    use ScopeActive;

    protected $table = 'productgroups';

    public function Belongs(){ return $this->belongsTo(self::class,'belongs'); }
    public function Parent(){ return $this->belongsTo(self::class,'parent'); }
    public function Tax(){ return $this->belongsTo(Tax::class,'tax1'); }
    public function Tax2(){ return $this->belongsTo(Tax::class,'tax2'); }

    public function ProductsAsOfGroup01(){ return $this->ProductsOfGroup('1'); }
    public function ProductsAsOfGroup02(){ return $this->ProductsOfGroup('2'); }
    public function ProductsAsOfGroup03(){ return $this->ProductsOfGroup('3'); }
    public function ProductsAsOfGroup04(){ return $this->ProductsOfGroup('4'); }
    public function ProductsAsOfGroup05(){ return $this->ProductsOfGroup('5'); }
    public function ProductsAsOfGroup06(){ return $this->ProductsOfGroup('6'); }
    public function ProductsAsOfGroup07(){ return $this->ProductsOfGroup('7'); }
    public function ProductsAsOfGroup08(){ return $this->ProductsOfGroup('8'); }
    public function ProductsAsOfGroup09(){ return $this->ProductsOfGroup('9'); }
    public function ProductsAsOfGroup10(){ return $this->ProductsOfGroup('10'); }

    public function ProductsOfGroup($num){
        $field = 'group' . $num;
        return $this->hasMany(Productgroup::class,$field);
    }

    public function scopeActive($q){ $q->where('status','Active'); }
}
