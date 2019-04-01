<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class TransactionDetail extends Model
{
    protected $table = 'transaction_details';

    public function Product(){ $this->belongsTo(StoreProductTransaction::class,'spt')->with(['Product']); }
}
