<?php

    namespace Milestone\SS\Interact;

    use Milestone\Appframe\Model\User;
    use Milestone\SS\Model\Product;
    use Milestone\SS\Model\Store;
    use Milestone\SS\Model\StoreProductTransaction;
    use Milestone\SS\Model\Transaction;
    use Milestone\Interact\Table;

    class idata implements Table
    {
        public function getModel()
        {
            return StoreProductTransaction::class;
        }

        public function getImportAttributes()
        {
            return ['store','product','direction','quantity','user','nature','date','type','status'];
        }

        public function getImportMappings()
        {
            return [
                'quantity' => 'QTY',
                'date' => 'DOCDATE',
                'store' => 'getStoreID',
                'product' => 'getProductID',
                'direction' => 'getDirection',
                'user' => 'getUserID',
                'nature' => 'getNature',
                'type' => 'getType',
                'status' => 'getStatus'
            ];
        }

        public function getStoreID($data){
            $store = Store::where(['catcode' => $data['STRCATCODE'],'code' => $data['STRCODE']])->first();
            return $store ? $store->id : null;
        }

        public function getProductID($data){
            $product = Product::where(['code' => $data['ITEMCODE']])->first();
            return $product ? $product->id : null;
        }

        public function getDirection($data){
            return $data['SIGN'] == "1" ? "In" : "Out";
        }

        public function getUserID($data){
            $user = User::where(['reference' => $data['CREATED_USER']])->first();
            return $user ? $user->id : null;
        }

        public function getNature($data){
            return null;
        }

        public function getType($data){
            return null;
        }

        public function getStatus($data){
            return $data['CANCEL_USER'] ? 'Inactive' : 'Active';
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            list('DOCNO' => $docno,'FYCODE' => $fycode,'FNCODE' => $fncode,'ITEMCODE' => $product_code, 'QTY' => $quantity) = $data;
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            $product_model = Product::where('code',$product_code)->first();
            if($transaction && $product_model){
                $product = $product_model->id;
                $spt = $transaction->Products()->where(compact('product','quantity'))->first();
                if($spt) return $spt->id;
            }
            return null;
        }

        public function recordImported($record,$id){
            list('DOCNO' => $docno,'FYCODE' => $fycode,'FNCODE' => $fncode,
                'QTY' => $quantity, 'RATE' => $rate, 'TAX' => $tax,
                'DISCOUNT01' => $discount1, 'DISCOUNT02' => $discount2, 'DISCOUNT03' => $discount3,
                ) = $record;
            $transaction = Transaction::where(compact('docno','fncode','fycode'))->first();
            if($transaction){
                $price = $quantity * $rate; $discount = $discount1+$discount2+$discount3; $total = $price+$tax-$discount;
                $transaction->Products()->attach([$id => compact('price','tax','discount','total')]);
            }
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