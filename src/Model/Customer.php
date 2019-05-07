<?php

namespace Milestone\SS\Model;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Milestone\SS\Model\User as SSUser;

class Customer extends SSUser
{

    protected static function boot(){
        parent::boot();
        static::addGlobalScope('ePlusAccountGroup',function(Builder $builder){
            $builder->whereHas('Groups',function($q){ $q->where('__groups.name','eplus_account'); })
                ->where('reference','like','120201%');
        });
    }

    protected $table = 'users';

    protected $appends = ['due'];

    public function getDueAttribute(){
        $myDues = ['Normal' => null, 'Overdue' => null, 'Critical' => null];
        $account = $this->reference; $date = now()->toDateTimeString();
        foreach($myDues as $type => &$val){ $val = DB::select('SELECT OUTSTANDINGASON(?,?,"Yes",?) as result',[$account,$date,$type])[0]->result; }
        return $myDues;
    }

    public function scopeRequesterArea($Q){
        $areas = Area::active()->requester()->pluck('id')->toArray();
        $Q->whereHas('Area',function($q)use($areas){
            $q->whereIn(\DB::raw('areas.id'),$areas);
        });
    }

}
