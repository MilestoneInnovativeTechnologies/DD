<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Milestone\Interact\Table;
use Milestone\SS\Model\Functiondetail;
use Milestone\SS\Model\Shift;
use Milestone\SS\Model\User;
use Milestone\SS\Model\UserExecutive;

class shdata implements Table
{
    private $cache = [
        'func' => [],
        'ulgn' => [],
        'uref' => [],
    ];

    public function getModel()
    {
        return Shift::class;
    }

    public function getImportAttributes()
    {
        return ['_ref','cocode','brcode','fycode','fncode','docno','user','opening','closing','difference','start_date','end_date','cancel','status'];
    }

    public function getImportMappings()
    {
        return [
            '_ref' => 'getRefNo',
            'cocode' => 'COCODE',
            'brcode' => 'BRCODE',
            'fycode' => 'FYCODE',
            'fncode' => 'FNCODE',
            'docno' => 'DOCNO',
            'user' => 'getUserID',
            'opening' => 'OPCASH',
            'closing' => 'CLSCASH',
            'difference' => 'DIFF',
            'start_date' => 'START_DATE',
            'end_date' => 'END_DATE',
            'cancel' => 'CANCEL',
            'status' => 'STATUS'
        ];
    }

    public function getPrimaryIdFromImportRecord($data){
        return Arr::get($this->cache['func'],$data['FNCODE']);
    }

    public function preImport(){
        $this->cache['func'] = Functiondetail::pluck('id','code')->toArray();
        $this->cache['ulgn'] = User::whereNotNull('login')->where('reference','NOT LIKE','SE%')->pluck('id','login')->toArray();
    }

    public function isValidImportRecord($record){
        return !$record['END_DATE'] && !Shift::where(['docno' => $record['DOCNO'],'ssinit' => 'Yes','opening' => $record['OPCASH']])->exists();
    }

    public function getRefNo($data){
        return implode('',['U',$this->getUserID($data),'T',intval(microtime(true)*10000)]);
    }

    public function getUserID($data){
        $login = $data['USERCODE'];
        return Arr::get($this->cache['ulgn'],$login);
    }

    public function getExportMappings(){
        return [
            'COCODE' => 'cocode',
            'BRCODE' => 'brcode',
            'FYCODE' => 'fycode',
            'FNCODE' => 'fncode',
            'DOCNO' => 'docno',
            'REFCOCODE' => 'cocode',
            'REFBRCODE' => 'brcode',
            'REFFYCODE' => 'fycode',
            'REFFNCODE' => 'getRefFNCode',
            'REFDOCNO' => 'getRefDocNo',
            'START_DATE' => 'start_date',
            'END_DATE' => 'end_date',
            'USERCODE' => 'getUserLogin',
            'ANALYSISCATCODE' => 'getAnalysisCat',
            'ANALYSISCODE' => 'getAnalysisCod',
            'OPCASH' => 'opening',
            'CLSCASH' => 'closing',
            'DIFF' => 'difference',
            'STATUS' => 'status',
            'CANCEL' => 'cancel',
        ];
    }

    public function getExportAttributes(){
        return array_keys($this->getExportMappings());
    }

    public function preExportGet($query){ $query = $query->where('ssinit','Yes'); $this->preExportCache($query); return $query; }
    public function preExportUpdate($query){ $this->preExportCache($query); return $query; }
    public function preExportCache($query){
        $users = array_unique($query->pluck('user')->toArray());
        $this->cache['ulgn'] = User::find($users)->pluck('login','id')->toArray();
        $this->cache['uref'] = UserExecutive::whereIn('login_user',$users)->with('executive')->get()->pluck('executive.reference','login_user')->toArray();
    }

    public function getRefFNCode($data){ return $data['status'] === 'Completed' ? 'JV4' : null; }
    public function getRefDocNo($data){ return $data['status'] === 'Completed' ? '0001' : null; }
    public function getUserLogin($data){ return Arr::get($this->cache['ulgn'],$data['user'],null); }
    public function getAnalysisCat($data){ return 'SE'; }
    public function getAnalysisCod($data){ return str_ireplace($this->getAnalysisCat($data),'',Arr::get($this->cache['uref'],$data['user'],'SE')); }

}