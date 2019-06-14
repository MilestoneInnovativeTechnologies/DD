<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class TransactionDetail extends Model
{
    protected $table = 'transaction_details';

    public function Transaction(){ return $this->belongsTo(Transaction::class,'transaction'); }
    public function Product(){ return $this->belongsTo(StoreProductTransaction::class,'spt')->with(['Product']); }
}
