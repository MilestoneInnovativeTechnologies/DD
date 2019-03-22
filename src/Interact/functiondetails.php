<?php
namespace Milestone\SS\Interact;

use Milestone\SS\Model\Functiondetail;
use Milestone\Interact\Table;

class functiondetails implements Table
{
    public function getModel()
    {
        return Functiondetail::class;
    }

    public function getFillAttributes()
    {
        return ['code','format','digit_length','direction'];
    }

    public function attributeToColumnMapArray()
    {
        return [
            'code' => 'CODE',
            'format' => 'NUMBERING_FORMAT',
            'digit_length' => 'DIGIT_LENGTH'
        ];
    }

    public function attributeToColumnMethodMapArray()
    {
        return [
            'direction' => 'getDirectionFromDataRow'
        ];
    }

    public function getDirectionFromDataRow($row){
        return ($row['SIGN'] == '1') ? 'Out' : 'In';
    }

    public function getPrimaryValueFromRowData($data)
    {
        $function = Functiondetail::where('code',$data['CODE'])->first();
        return $function ? $function->id : null;
    }


}