<?php
namespace Milestone\SS\Interact;

use Milestone\SS\Model\Functiondetail;
use Milestone\Interact\Table;
use Milestone\SS\Model\WBin;

class functionR implements Table
{

    public function getModel()
    {
        return WBin::class;
    }

    public function getImportAttributes()
    {
        return ['bin'];
    }

    public function getImportMappings()
    {
        return [
            'bin' => 'processBin'
        ];
    }

    public function processBin($record) {
        $code = $record['CODE'];
        $FN = Functiondetail::where(compact('code'))->first();
        if($FN){
            $FN->abr = $record['ABR'];
            $FN->category = $record['CATEGORY'];
            $FN->save();
        }
        return 1;
    }

    public function getPrimaryIdFromImportRecord($data)
    {
        return null;
    }


    public function getExportMappings()
    {
        return [];
    }

    public function getExportAttributes()
    {
        return ['id','code','format','digit_length'];
    }

}