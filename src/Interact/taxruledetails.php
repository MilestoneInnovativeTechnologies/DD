<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Tax;
    use Milestone\SS\Model\TaxDetail;
    use Milestone\Interact\Table;

    class taxruledetails implements Table
    {
        public function getModel()
        {
            return TaxDetail::class;
        }

        public function getFillAttributes()
        {
            return ['tax','taxcode','code','name','percentage','percentageequation','taxtype','taxnature','amount','inputcode','outputcode','reftaxcode','processorder'];
        }

        public function attributeToColumnMapArray()
        {
            $direct = $this->getFillAttributes();
            return array_combine($direct,array_map('strtoupper',$direct));
        }

        public function attributeToColumnMethodMapArray()
        {
            return ['tax' => 'getTaxID'];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $taxrule = TaxDetail::where(['tax' => $data['TAXCODE'],'code' => $data['CODE']])->first();
            return $taxrule ? $taxrule->id : null;
        }
        public function getTaxID($record){
            $tax = Tax::where('code',$record['TAXCODE'])->first();
            return $tax ? $tax->id : null;
        }
    }