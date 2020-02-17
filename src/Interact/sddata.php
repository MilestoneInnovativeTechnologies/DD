<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\Interact\Table;
use Milestone\SS\Model\Shift;
use Milestone\SS\Model\ShiftTransaction;

class sddata implements Table
{

    private $cache = [
        'shifts' => [],
        'srno' => [],
    ];

    public function getModel(){
        return ShiftTransaction::class;
    }

    public function preImport($content){
        $data = $content['data']; if(empty($data)) return;
        foreach ($data as $record){
            $cocode = $record['COCODE']; $brcode = $record['BRCODE']; $fycode = $record['FYCODE']; $fncode = $record['FNCODE']; $docno = $record['DOCNO'];
            $key = $this->getKeyFromRecord($record);
            if(!array_key_exists($key,$this->cache['shifts'])){
                $shift = Shift::where(compact('cocode','brcode','fycode','fncode','docno'))->first();
                $this->cache['shifts'][$key] = $shift ? $shift->toArray() : null;
            }
        }
    }

    private function getKeyFromRecord($record){
        $cocode = $record['COCODE']; $brcode = $record['BRCODE']; $fycode = $record['FYCODE']; $fncode = $record['FNCODE']; $docno = $record['DOCNO'];
        return implode("|",[$cocode,$brcode,$fycode,$fncode,$docno]);
    }

    public function getImportAttributes(){
        return ['shift','fncode','docno','cancel','cash','credit','card','cheque','digitalwallet'];
    }

    public function getImportMappings(){
        return [
            'shift' => 'getShiftNo',
            'fncode' => 'REFFNCODE',
            'docno' => 'REFDOCNO',
            'cancel' => 'CANCEL',
            'cash' => 'CASH',
            'credit' => 'CREDIT',
            'card' => 'CARD',
            'cheque' => 'CHEQUE',
            'digitalwallet' => 'DIGITALWALLET'
        ];
    }

    public function getPrimaryIdFromImportRecord($data){
        return null;
    }

    public function isValidImportRecord($record){
        $shift = $this->getShiftNo($record); if(!$shift) return false;
        $id = $record['SRNO']; $fncode = $record['REFFNCODE']; $cash = $record['CASH']; $ssinit = 'Yes';
        return !ShiftTransaction::where(compact('id','shift','fncode','cash','ssinit'))->exists();
    }

    public function getShiftNo($record){
        $key = $this->getKeyFromRecord($record);
        return Arr::get($this->cache['shifts'],"$key.id",null);
    }

    public function getExportMappings(){
        return [
            'COCODE' => 'getShiftCOCode',
            'BRCODE' => 'getShiftBRCode',
            'FYCODE' => 'getShiftFYCode',
            'FNCODE' => 'getShiftFNCode',
            'DOCNO' => 'getShiftDocNum',
            'SRNO' => 'getSRNo',
            'REFCOCODE' => 'getShiftCOCode',
            'REFBRCODE' => 'getShiftBRCode',
            'REFFYCODE' => 'getShiftFYCode',
            'REFFNCODE' => 'fncode',
            'REFDOCNO' => 'docno',
            'CANCEL' => 'cancel',
            'CASH' => 'cash',
            'CREDIT' => 'credit',
            'CARD' => 'card',
            'CHEQUE' => 'cheque',
            'DIGITALWALLET' => 'digitalwallet'
        ];
    }

    public function getExportAttributes(){
        return array_keys($this->getExportMappings());
    }

    public function preExportGet($query){ $query = $query->where('ssinit','Yes'); $this->preExportCache($query); return $query; }
    public function preExportUpdate($query){ return $this->preExportGet($query); }
    public function preExportCache($query){
        $shifts = array_unique($query->pluck('shift')->toArray());
        $this->cache['shifts'] = Shift::find($shifts)->keyBy->id->toArray();
    }

    public function getShiftProp($data,$prop){ return Arr::get($this->cache['shifts'][$data['shift']],$prop,null); }
    public function getShiftFYCode($data){ return $this->getShiftProp($data,'fycode'); }
    public function getShiftBRCode($data){ return $this->getShiftProp($data,'brcode'); }
    public function getShiftCOCode($data){ return $this->getShiftProp($data,'cocode'); }
    public function getShiftFNCode($data){ return $this->getShiftProp($data,'fncode'); }
    public function getShiftDocNum($data){ return $this->getShiftProp($data,'docno'); }

    public function getSRNo($data){
        return $data['id'];
        $shift = $data['shift']; if(!array_key_exists($shift,$this->cache['srno'])) $this->cache['srno'][$shift] = 0;
        return ++$this->cache['srno'][$shift];
    }

}