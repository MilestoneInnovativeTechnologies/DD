<?php


namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\Interact\Table;
use Milestone\SS\Model\Printing;

class functionprint implements Table
{
    private $cache = [
        'data' => []
    ];

    public function getModel(){
        return Printing::class;
    }

    public function preImport(){
        $this->cache['data'] = Printing::all()->keyBy->fncode->toArray();
    }

    public function getImportAttributes(){
        return ['fncode','header1','header2','header3','footer1','footer2','footer3'];
    }

    public function getImportMappings(){
        return [
            'fncode' => 'CODE','name' => 'PRINTNAME',
            'header1' => 'PRNHEADER1','header2' => 'PRNHEADER2','header3' => 'PRNHEADER3',
            'footer1' => 'PRNFOOTER1','footer2' => 'PRNFOOTER2','footer3' => 'PRNFOOTER3'
        ];
    }

    public function getPrimaryIdFromImportRecord($data){
        return Arr::get($this->cache['data'],$data['CODE'] . '.id',null);
    }

    public function getExportAttributes(){
        return [];
    }

    public function getExportMappings(){
        return [];
    }
}