<?php

    namespace Milestone\SS\Interact;

    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\WBin;
    use Milestone\Interact\Table;

    class itemunit implements Table
    {
        public function getModel()
        {
            return WBin::class;
        }

        public function getImportAttributes()
        {
            return ['bin'];
        }

        public function getImportMappings()
        {
            return ['bin' => 'doBin'];
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return 1;
        }

        public function doBin($data){
            $product = Product::where(['code' => $data['ITEMCODE'], 'uom' => $data['UNITCODE']])->first();
            if($product) { $product->barcode = $data['BARCODE']; $product->save(); }
            return 1;
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