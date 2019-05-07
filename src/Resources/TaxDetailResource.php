<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Milestone\SS\Model\Tax;

class TaxDetailResource extends JsonResource
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
            'tax' => new TaxResource(Tax::find($this->tax)),
            'code' => $this->code,
            'name' => $this->name,
            'percentage' => $this->percentage,
        ];
    }
}
