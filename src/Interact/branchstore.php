<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\WBin;
    use Milestone\Interact\Table;

    class branchstore implements Table
    {
        public function getModel()
        {
            return WBin::class;
        }

        public function getFillAttributes()
        {
            return ['bin'];
        }

        public function attributeToColumnMapArray()
        {
            return [];
        }

        public function attributeToColumnMethodMapArray()
        {
            return ['bin' => 'doBin'];
        }

        public function getPrimaryValueFromRowData($data)
        {
            return 1;
        }

        public function doBin($data){
            $catcode = $data['STRCATCODE']; $code = $data['STRCODE'];
            $store = Store::where(compact('catcode','code'))->first();
            if($store) { $store->cocode = $data['COCODE']; $store->brcode = $data['BRCODE']; $store->save(); }
            return 1;
        }

    }