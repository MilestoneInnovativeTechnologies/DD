<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Model;

class ProductTransactionType extends Model
{
    protected $table = 'product_transaction_types';

    public function scopeActive($q){ $q->where('status','Active'); }
}
