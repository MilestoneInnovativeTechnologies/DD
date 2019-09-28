<?php

namespace Milestone\SS\Model;

use Milestone\Appframe\Model\Model;

class ProductImage extends Model
{
    protected $table = 'product_images';

    public $storage = [
        ['disk' => 'sspi', 'path' => ''],
    ];
    public $files = ['image01','image02','image03','image04','image05'];

    public function Product(){
        return $this->belongsTo(Product::class,'product','id');
    }
}
