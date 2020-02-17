<?php
namespace Milestone\SS\Interact;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Milestone\Interact\Table;
use Milestone\SS\Model\UserExecutive;

class shift implements Table
{
    private $cache = [
        'exl' => [],
        'lex' => [],
    ];

    public function getModel()
    {
        return \Milestone\SS\Model\Shift::class;
    }

    public function getImportAttributes()
    {
        return ['_ref','cocode','brcode','fycode','fncode','docno','user','opening','closing','difference','start_date','end_date','ssinit','cancel','status'];
    }

    public function getImportMappings(){
        return [
            'user' => 'executiveToLogin',
        ];
    }

    public function executiveToLogin($record){
        if(!array_key_exists($record['user'],$this->cache['exl']))
            $this->cache['exl'][$record['user']] = Arr::get(UserExecutive::where('executive_user',$record['user'])->first(),'login_user',$record['user']);
        return Arr::get($this->cache['exl'],$record['user']);
    }

    public function getPrimaryIdFromImportRecord($data){
        return Arr::get(\Milestone\SS\Model\Shift::where('_ref',$data['_ref'])->first(),'id',null);
    }

    public function getExportMappings(){
        return ['user' => 'loginToExecutive'];
    }

    public function getExportAttributes(){
        return ['_ref','cocode','brcode','fycode','fncode','docno','user','opening','closing','difference','start_date','end_date','allow_difference','allow_cheque','ssinit','cancel','status'];
    }

    public function preExportGet($query){
        if (!request()->_user) return $query->where('status','Approved');
        $logUser = Arr::get(UserExecutive::where('executive_user',request()->_user)->first(),'login_user',request()->_user);
        Auth::loginUsingId($logUser); return $query->where('status','Approved')->own();
    }

    public function preExportUpdate($query){
        if (!request()->_user) return $query->where('status','Completed');
        $logUser = Arr::get(UserExecutive::where('executive_user',request()->_user)->first(),'login_user',request()->_user);
        Auth::loginUsingId($logUser); return $query->where('status','Completed')->own();
    }

    public function loginToExecutive($record){
        if(!array_key_exists($record['user'],$this->cache['lex']))
            $this->cache['lex'][$record['user']] = Arr::get(UserExecutive::where('login_user',$record['user'])->first(),'executive_user',$record['user']);
        return Arr::get($this->cache['lex'],$record['user']);
    }
}