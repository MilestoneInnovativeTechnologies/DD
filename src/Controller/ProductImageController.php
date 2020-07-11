<?php

namespace Milestone\SS\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Milestone\SS\Model\ProductImage;

class ProductImageController extends Controller
{
    public function image($id){
        $productImage = ProductImage::where('product',$id)->first();
        if(!$id || !$productImage) return null;
        Storage::prepend('ImageRequestCount',$id . "\t" . now());
        $image = $this->getDefaultImageDetails($productImage); if(!$image) return null;
        $file = implode('/',array_filter([$image->path,$image->file]));
        return Storage::disk($image->disk)->exists($file) ? Storage::disk($image->disk)->response($file) : null;
    }

    private function getDefaultImageDetails($productImage){
        $default = str_replace(' ','',strtolower($productImage->default));
        return Arr::get($productImage,"__upload_file_details.{$default}",null);
    }
}
