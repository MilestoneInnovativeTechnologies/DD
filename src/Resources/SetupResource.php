<?php

namespace Milestone\SS\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SetupResource extends JsonResource
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
            'decimal_quantity' => $this->QUANTITY_DECIMAL,
            'decimal_rate' => $this->RATE_DECIMAL,
            'decimal_amount' => $this->AMOUNT_DECIMAL,
            'format_docdate' => $this->DOCDATE_FORMAT,
            'farmat_chqdate' => $this->CHQDATE_FORMAT,
            'format_othdate' => $this->OTHDATE_FORMAT,
            'tax' => $this->TAX,
            'tax02' => $this->TAX02
        ];
    }
}
