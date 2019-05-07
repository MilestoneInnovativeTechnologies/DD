<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Milestone\SS\Model\StoreProductTransaction;

class TransactionDetailsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'price' => $this->price,
            'tax' => $this->tax,
            'discount' => $this->discount,
            'total' => $this->total,
            'product' => $this->whenLoaded('Product',new StoreProductTransactionResource(StoreProductTransaction::find($this->spt)))
        ];
    }
}
