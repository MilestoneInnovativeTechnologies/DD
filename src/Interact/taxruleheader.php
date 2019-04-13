<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;
    use Milestone\SS\Model\Tax;

    class taxruleheader implements Table
    {
        public function getModel()
        {
            return Tax::class;
        }

        public function getImportAttributes()
        {
            return ['code','name','status'];
        }

        public function getImportMappings()
        {
            return [
                'code' => 'CODE',
                'name' => 'NAME',
                'status' => 'STATUS'
            ];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $tax = Tax::where('code',$data['CODE'])->first();
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