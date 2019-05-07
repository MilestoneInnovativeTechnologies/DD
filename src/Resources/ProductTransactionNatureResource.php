<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Milestone\SS\Model\Tax;

class ProductTransactionNatureResource extends JsonResource
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
            'name' => $this->name,
        ];
    }
}
