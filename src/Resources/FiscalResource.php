<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Milestone\SS\Model\Tax;

class FiscalResource extends JsonResource
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
            'code' => $this->code,
            'name' => $this->name,
            'start' => $this->start_date,
            'end' => $this->end_date,
        ];
    }
}
