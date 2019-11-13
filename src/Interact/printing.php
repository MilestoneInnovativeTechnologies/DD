<?php


namespace Milestone\SS\Interact;

use Milestone\Interact\Table;

class printing implements Table
{
    public function getModel(){ return \Milestone\SS\Model\Printing::class; }

    public function preImport(){}

    public function getImportAttributes(){}

    public function getImportMappings(){
        return [];
    }

    public function getPrimaryIdFromImportRecord($data){
        return null;
    }

    public function getExportAttributes(){
        return ['id','name','description','fncode','query1','query2','query3','query1_props','query2_props','query3_props','header1','header2','header3','footer1','footer2','footer3','template','object','status'];
    }

    public function getExportMappings(){
        return [];
    }
}