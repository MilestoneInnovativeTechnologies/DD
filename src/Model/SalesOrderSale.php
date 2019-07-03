<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class SalesOrderSale extends Model
{
    protected $table = 'sales_order_sales';
    protected $guarded = [];

    public function SalesOrder(){
        return $this->belongsTo(SalesOrder::class,'so');
    }
    public function Transaction(){
        return $this->belongsTo(Transaction::class,'transaction');
    }

    public function scopeAssignedCustomerSalesOrder($Q){
        return $Q->whereHas('SalesOrder',function ($Q){
            $Q->assignedAreaCustomer();
        });
    }
}
