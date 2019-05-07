<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StoreProductTransactionResource extends JsonResource
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
            'product' => $this->product,
            'quantity' => $this->quantity,
            'nature' => $this->nature,
            'type' => $this->type,
        ];
    }
}
