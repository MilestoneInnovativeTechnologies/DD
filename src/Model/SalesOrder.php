<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class SalesOrder extends Model
{
    protected $table = 'sales_order';

    public function Items(){ return $this->hasMany(SalesOrderItem::class,'so'); }
    public function Customer(){ return $this->belongsTo(User::class,'customer'); }
    public function Store(){ return $this->belongsTo(Store::class,'store'); }

    public function scopeAssignedAreaCustomer($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->whereHas('Customer',function ($Q){
            $Q->whereIn('id',User::find(request()->user()->id)->AreaCustomers->pluck('user')->all());
        });
    }
}
