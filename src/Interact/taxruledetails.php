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

        public function getImportAttributes()
        {
            return ['tax','taxcode','code','name','percentage','percentageequation','taxtype','taxnature','amount','inputcode','outputcode','reftaxcode','processorder'];
        }

        public function getImportMappings()
        {
            $direct = $this->getImportAttributes();
            return array_merge(array_combine($direct,array_map('strtoupper',$direct)),['tax' => 'getTaxID']);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $taxrule = TaxDetail::where(['tax' => $data['TAXCODE'],'code' => $data['CODE']])->first();
            return $taxrule ? $taxrule->id : null;
        }
        public function getTaxID($record){
            $tax = Tax::where('code',$record['TAXCODE'])->first();
            return $tax ? $tax->id : null;
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }
    }