<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
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
            'executive' => $this->user,
            'customer' => $this->customer,
            'docno' => $this->docno,
            'date' => $this->date,
            'details' => TransactionDetailsResource::collection($this->whenLoaded('Details'))
        ];
    }
}
