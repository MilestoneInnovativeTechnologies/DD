<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;
use Milestone\SS\ModelTraits\ScopeActive;

class Receipt extends Model
{
    use ScopeActive;
    protected $table = 'receipts';
    protected $guarded = [];

    public function scopeAssignedCustomerReceipts($Q){
        if(!request()->user() || !request()->user()->id) return $Q;
        return $Q->whereIn('customer',User::find(request()->user()->id)->AreaCustomers->pluck('user')->all());
    }
}
