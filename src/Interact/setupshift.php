<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Facades\Schema;
use Milestone\Interact\Table;
use Milestone\SS\Model\Shift;

class setupshift implements Table
{

    public function getModel(){
        return Shift::class;
    }

    public function getImportAttributes(){
        return ['allow_difference','allow_cheque'];
    }

    public function getImportMappings(){
        return [
            'allow_difference' => 'ALLOWCASHDIFFERENCE',
            'allow_cheque' => 'CHEQUE',
        ];
    }

    public function getPrimaryIdFromImportRecord($data){
        return null;
    }

    public function preImport($content){
        $allow_difference = $content['data'][0]['ALLOWCASHDIFFERENCE'];
        $allow_cheque = $content['data'][0]['CHEQUE'];
        Shift::query()->update(compact('allow_cheque','allow_difference'));
//        Schema::table('shift', function($table) use($allow_difference,$allow_cheque) {
//            $table->enum('allow_difference', ['Yes','No'])->default($allow_difference)->change();
//            $table->enum('allow_cheque', ['No','Yes'])->default($allow_cheque)->change();
//        });
    }

    public function isValidImportRecord($record){
        return false;
    }

    public function getExportMappings(){
        return [];
    }

    public function getExportAttributes(){}

}