<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Milestone\Interact\Table;
use Milestone\SS\Model\ShiftTransaction;
use Milestone\SS\Model\UserExecutive;

class shift_transactions implements Table
{

    private $cache = [
        'rshf' => [],
    ];

    public function getModel(){
        return ShiftTransaction::class;
    }

    public function getImportAttributes(){
        return ['shift','fncode','docno','cancel','cash','credit','card','cheque','digitalwallet','ssinit'];
    }

    public function getImportMappings(){
        return ['shift' => 'getShiftIDFromRef'];
    }

    public function getPrimaryIdFromImportRecord($data){
        return Arr::get(ShiftTransaction::where('shift',$data['shift'])->first(),'id',null);
    }

    public function getShiftRefFromID($record){
        return $record['shift']['_ref'];
    }
    public function getShiftIDFromRef($record){
        return Arr::get($this->cache['rshf'],$record['shift']);
    }

    public function isValidImportRecord($record){
        if($record['ssinit'] !== 'Yes') return false;
        if(!array_key_exists($record['shift'],$this->cache['rshf'])){
            $this->cache['rshf'][$record['shift']] = Arr::get(\Milestone\SS\Model\Shift::where('_ref',$record['shift'])->first(),'id');
        }
        return true;
    }

    public function getExportMappings(){
        return ['shift' => 'getShiftRefFromID'];
    }

    public function getExportAttributes(){
        return ['shift','fncode','docno','cancel','cash','credit','card','cheque','digitalwallet'];
    }

    public function preExportGet($query){
        if (!request()->_user) return $query->with('Shift');
        $logUser = Arr::get(UserExecutive::where('executive_user',request()->_user)->first(),'login_user',request()->_user);
        Auth::loginUsingId($logUser); return $query->with('Shift')->own();
    }

    public function preExportUpdate($query){
        return $this->preExportGet($query);
    }
}