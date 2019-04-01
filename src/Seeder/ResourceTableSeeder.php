<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $_ = \DB::statement('SELECT @@GLOBAL.foreign_key_checks');
        \DB::statement('set foreign_key_checks = 0');
        \Milestone\Appframe\Model\Resource::query()
            ->create([	'id' => '304101', 	'name' => 'User', 	'description' => 'Users of Smart Sale', 	'title' => 'Users', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'users', 										])
            ->create([	'id' => '304102', 	'name' => 'Setup', 	'description' => 'ePlus setup details', 	'title' => 'Setup', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'setup', 										])
            ->create([	'id' => '304103', 	'name' => 'Setting', 	'description' => 'Settings available in web and mob interface', 	'title' => 'Settings', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'settings', 										])
            ->create([	'id' => '304104', 	'name' => 'Tax', 	'description' => 'Tax master', 	'title' => 'Tax', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'tax', 										])
            ->create([	'id' => '304105', 	'name' => 'TaxDetail', 	'description' => 'Tax details', 	'title' => 'Tax Details', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'tax_details', 										])
            ->create([	'id' => '304106', 	'name' => 'Fiscalyearmaster', 	'description' => 'Financial Years', 	'title' => 'Fiscal Year', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'fiscalyearmaster', 										])
            ->create([	'id' => '304107', 	'name' => 'Functiondetail', 	'description' => 'ePlus functions', 	'title' => 'ePlus Functions', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'functiondetails', 										])
            ->create([	'id' => '304108', 	'name' => 'Productgroup', 	'description' => 'Product groups - item group and item group master', 	'title' => 'Product Group', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'productgroups', 										])
            ->create([	'id' => '304109', 	'name' => 'Product', 	'description' => 'Products or Items', 	'title' => 'Products', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'products', 										])
            ->create([	'id' => '304110', 	'name' => 'Pricelist', 	'description' => 'Price list header', 	'title' => 'Price List', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'pricelist', 										])
            ->create([	'id' => '304111', 	'name' => 'PricelistProduct', 	'description' => 'Price list products', 	'title' => 'Price List Products', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'pricelist_products', 										])
            ->create([	'id' => '304112', 	'name' => 'Store', 	'description' => 'Stores', 	'title' => 'Stores', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'stores', 										])
            ->create([	'id' => '304113', 	'name' => 'Area', 	'description' => 'Areas', 	'title' => 'Areas', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'areas', 										])
            ->create([	'id' => '304114', 	'name' => 'AreaUser', 	'description' => 'Users in an area', 	'title' => 'Area User', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'area_users', 										])
            ->create([	'id' => '304115', 	'name' => 'UserSetting', 	'description' => 'Web and Mob settings for each user', 	'title' => 'User Settings', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'user_settings', 										])
            ->create([	'id' => '304116', 	'name' => 'UserStoreArea', 	'description' => 'Stores and Areas assigned to a user (executive)', 	'title' => 'User Store and Area', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'user_store_area', 										])
            ->create([	'id' => '304117', 	'name' => 'StoreProduct', 	'description' => 'Products in a store', 	'title' => 'Store Products', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'store_products', 										])
            ->create([	'id' => '304118', 	'name' => 'ProductTransactionNature', 	'description' => 'Product transaction nature', 	'title' => 'Product Transaction Natures', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'product_transaction_natures', 										])
            ->create([	'id' => '304119', 	'name' => 'ProductTransactionType', 	'description' => 'Product transaction types', 	'title' => 'Product Transaction Types', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'product_transaction_types', 										])
            ->create([	'id' => '304120', 	'name' => 'StoreProductTransaction', 	'description' => 'Product transactions in a store - in and out', 	'title' => 'Product Transaction in Store', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'store_product_transactions', 										])
            ->create([	'id' => '304121', 	'name' => 'Transaction', 	'description' => 'Transaction header - customer, date, document number', 	'title' => 'Transactions', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'transactions', 										])
            ->create([	'id' => '304122', 	'name' => 'TransactionDetail', 	'description' => 'Products in a transaction, its price tax etc', 	'title' => 'Transaction Details', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'transaction_details', 										])
            ->create([	'id' => '304123', 	'name' => 'BillData', 	'description' => 'Bills generated during transactions', 	'title' => 'Bill Data', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'bill_data', 										])
            ->create([	'id' => '304124', 	'name' => 'DData', 	'description' => 'ePlus Ddata for detailed transaction bills', 	'title' => 'ePlus DData', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'd_data', 										])
            ->create([	'id' => '304125', 	'name' => 'ChequeDetail', 	'description' => 'Cheque Details', 	'title' => 'Cheque Details', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'cheque_details', 										])
            ->create([	'id' => '304126', 	'name' => 'SalesOrder', 	'description' => 'Sales orders', 	'title' => 'Sales Orders', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'sales_order', 										])
            ->create([	'id' => '304127', 	'name' => 'SalesOrderItem', 	'description' => 'Sales order items', 	'title' => 'Sales Order Items', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'sales_order_items', 										])
            ->create([	'id' => '304128', 	'name' => 'StockTransfer', 	'description' => 'Stock transfer from and to a store', 	'title' => 'Stock Transfers', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'stock_transfer', 										])
            ->create([	'id' => '304129', 	'name' => 'WBin', 	'description' => 'Waste bin used while ePlus direct import', 	'title' => 'Waste Bin', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'w_bin', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
