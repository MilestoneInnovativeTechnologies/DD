<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class ddata implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\DData::class;
        }

        public function getFillAttributes()
        {
            return ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO', 'SLNO', 'DOCDATE', 'CO', 'BR', 'ACCCODE', 'REFNO', 'REFDATE', 'AMT', 'SIGN', 'NARRATION', 'NARRATION2', 'REFCOCODE', 'REFBRCODE', 'REFFYCODE', 'REFFNCODE', 'REFDOCNO', 'REFSRNO', 'TYPE', 'APPROVAL_STATUS', 'APPROVAL_MODE', 'APPROVAL_TYPE', 'CANCEL', 'VERSION'];
        }

        public function attributeToColumnMapArray()
        {
            return [];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $pks = ['COCODE', 'BRCODE', 'FYCODE', 'FNCODE', 'DOCNO', 'SRNO'];
            $ddata = \Milestone\SS\Model\DData::where($pks)->first();
            return $ddata ? $ddata->id : null;
        }
    }