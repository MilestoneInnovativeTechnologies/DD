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

    protected $appends =['price'];
    private $price_list_fetch_keys = ['price','price_min','price_max'];

    public function getPriceAttribute(){
        return $this->getProductPrices($this->id);
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
