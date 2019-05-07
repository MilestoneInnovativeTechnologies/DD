<?php

    namespace Milestone\SS\ModelTraits;

    trait ScopeRequester
    {

        public function scopeRequester($Q){
            if($this->requester_trait_relation){
                $Q->whereHas($this->requester_trait_relation,function($q){
                    $dbField = $this->requester_trait_db_field ?: 'user';
                    $requestAttribute = $this->requester_trait_request_attribute ?: 'id';
                    $q->where(\DB::raw($dbField),request()->user()->$requestAttribute);
                });
            } else {
                $Q->where(function($q){
                    $dbField = $this->requester_trait_db_field ?: 'user';
                    $requestAttribute = $this->requester_trait_request_attribute ?: 'id';
                    $q->where(\DB::raw($dbField),request()->user()->$requestAttribute);
                });
            }
        }

    }