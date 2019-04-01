<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class StockTransfer extends Model
{
    protected $table = 'stock_transfer';

    public function IN(){ return $this->belongsTo(Transaction::class,'in'); }
    public function OUT(){ return $this->belongsTo(Transaction::class,'out'); }
}
