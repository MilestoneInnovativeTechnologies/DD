<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Arr;
    use Illuminate\Support\Facades\Auth;
    use Milestone\Interact\Table;
    use Milestone\SS\Model\SalesOrder;
    use Milestone\SS\Model\SalesOrderSale;
    use Milestone\SS\Model\Transaction;

    class sales_order_sales implements Table
    {
        private $cache = [
            'so_ref' => [],
            'tr_ref' => []
        ];

        public function getModel()
        {
            return SalesOrderSale::class;
        }

        public function getImportAttributes()
        {
            return ['so','product','so_quantity','transaction','sale_quantity'];
        }

        public function getImportMappings()
        {
            return [
                'so' => 'getSOId',
                'transaction' => 'getTransId',
            ];
        }

        public function getSOId($record){
            if(array_key_exists($record['so'],$this->cache['so_ref'])) return $this->cache['so_ref'][$record['so']];
            return $this->cache['so_ref'][$record['so']] = Arr::get(SalesOrder::where('_ref',$record['so'])->first(),'id',null);
        }
        public function getTransId($record){
            if(array_key_exists($record['transaction'],$this->cache['tr_ref'])) return $this->cache['tr_ref'][$record['transaction']];
            return $this->cache['tr_ref'][$record['transaction']] = Arr::get(Transaction::where('_ref',$record['transaction'])->first(),'id',null);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            return Arr::get(SalesOrderSale::where(['so' => $this->getSOId($data),'transaction' => $this->getTransId($data), 'product' => $data['product']])->first(),'id',null);
        }

        public function getExportMappings()
        {
            return [
                'so' => 'getSORef',
                'transaction' => 'getTransactionRef',
            ];
        }

        public function getExportAttributes()
        {
            return ['so','product','so_quantity','transaction','sale_quantity'];
        }

        public function getSORef($record){
            if(array_key_exists($record['so'],$this->cache['so_ref'])) return $this->cache['so_ref'][$record['so']];
            return $this->cache['so_ref'][$record['so']] = Arr::get(SalesOrder::find($record['so']),'_ref',null);
        }
        public function getTransactionRef($record){
            if(array_key_exists($record['transaction'],$this->cache['tr_ref'])) return $this->cache['tr_ref'][$record['transaction']];
            return $this->cache['tr_ref'][$record['transaction']] = Arr::get(Transaction::find($record['transaction']),'_ref',null);
        }

        public function preExportGet($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerSalesOrder();
        }
        public function preExportUpdate($query){
            if (request()->_user) Auth::loginUsingId(request()->_user); else return $query;
            return $query->assignedCustomerSalesOrder();
        }
    }