<?php

    namespace Milestone\SS\ModelTraits;

    trait ScopeActive
    {

        public function scopeActive($Q){ $Q->where('status','Active'); }

    }