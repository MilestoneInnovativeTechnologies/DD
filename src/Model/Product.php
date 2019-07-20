<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Milestone\SS\ModelTraits\ScopeActive;

class Product extends Model
{
    use ScopeActive;

    protected $table = 'products';

    protected $appends =['groups','tax','price'];
    private $price_list_fetch_keys = ['price','price_min','price_max'];

    public function Group01(){ return $this->belongsToGroup('1'); }
    public function Group02(){ return $this->belongsToGroup('2'); }
    public function Group03(){ return $this->belongsToGroup('3'); }
    public function Group04(){ return $this->belongsToGroup('4'); }
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

    public function getGroupsAttribute(){
        $this->setGroupCache(); $myGroups = [];
        foreach (range(1,10) as $num){
            $key = 'group' . $num;
            if($this->$key){
                $group_name = $this->group_master[$this->group_cache[$this->$key]->belongs];
                $myGroups[$group_name] = $this->group_cache[$this->$key]->name;
            }
        }
        return $myGroups;
    }

    public function getTaxAttribute(){
        return 0;
        $this->setTaxCache();
        $taxKeys = ['tax1','tax2']; $myTax = [];
        $product_group = $this->group_cache[$this->group1];
        foreach ($taxKeys as $key){
            if($product_group->$key) $myTax[$this->tax_cache[$product_group->$key]->name] = $this->getTaxValue($product_group->$key);
        };
        return $myTax;
    }

    public function getPriceAttribute(){
        return $this->getProductPrices($this->id);
    }

    private $group_cache = null, $group_master, $group_name;
    private function setGroupCache(){
        if(!$this->group_cache){
            $this->group_cache = Productgroup::with(['Parent','Tax','Tax2'])->get()->keyBy->id;
            $this->group_master = Productgroup::whereNull('belongs')->pluck('name','id')->toArray();
        }
    }

    private $tax_cache = null, $tax_value = [];
    private function setTaxCache(){
        if(!$this->tax_cache){
            $this->tax_cache = Tax::all()->keyBy->id;
        }
    }
    private function getTaxValue($taxId){
        if(!array_key_exists($taxId,$this->tax_value)){
            $tax_code = $this->tax_cache[$taxId]->code;
            $tax = DB::select('SELECT TAXVALUE(?,1,?,1) as tax',[$tax_code,100])[0]->tax/100;
            $this->tax_value[$taxId] = $tax;
        }
        return $this->tax_value[$taxId];
    }

    private $price_cache = null;
    private function setPriceCache(){
        if(!$this->price_cache){
            $this->price_cache = PricelistProduct::with('Pricelist')->whereHas('Pricelist',function($q){ $q->where('status','Active'); })->get()
                ->groupBy->product
                ->transform(function($item){
                    return $item->keyBy(function($itm){ return $itm->Pricelist->name; });
                })
                ->toArray();
        }
    }
    private function getProductPrices($id){
        $this->setPriceCache();
        return array_key_exists($id,$this->price_cache) ? array_map(function($item){ return Arr::only($item,$this->price_list_fetch_keys); },$this->price_cache[$id]) : null;
    }

}
