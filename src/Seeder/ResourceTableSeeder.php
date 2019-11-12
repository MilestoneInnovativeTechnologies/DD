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
            ->create([	'id' => '305101', 	'name' => 'User', 	'description' => 'Users of Smart Sale', 	'title' => 'Users', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'users', 										])
            ->create([	'id' => '305102', 	'name' => 'Setup', 	'description' => 'ePlus setup details', 	'title' => 'Setup', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'setup', 										])
            ->create([	'id' => '305103', 	'name' => 'MenuType', 	'description' => 'Menu group to display name mapper', 	'title' => 'Menu Group', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'menu_types', 										])
            ->create([	'id' => '305104', 	'name' => 'Menu', 	'description' => 'Menu details', 	'title' => 'Menu', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'menu', 										])
            ->create([	'id' => '305105', 	'name' => 'Setting', 	'description' => 'Settings available in web and mob interface', 	'title' => 'Settings', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'settings', 										])
            ->create([	'id' => '305106', 	'name' => 'Fiscalyearmaster', 	'description' => 'Financial Years', 	'title' => 'Fiscal Year', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'fiscalyearmaster', 										])
            ->create([	'id' => '305107', 	'name' => 'ProductGroupMaster', 	'description' => 'Groups like Category, Brand etc', 	'title' => 'Product Group Masters', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'product_group_master', 										])
            ->create([	'id' => '305108', 	'name' => 'Product', 	'description' => 'Products or Items', 	'title' => 'Products', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'products', 										])
            ->create([	'id' => '305109', 	'name' => 'ProductGroup', 	'description' => 'Products and the groups they belongs to', 	'title' => 'Product Groups', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'product_groups', 										])
            ->create([	'id' => '305110', 	'name' => 'ProductImage', 	'description' => 'Images for  a product', 	'title' => 'Product Images', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'product_images', 	'controller' => 'ProductImageController', 	'controller_namespace' => 'Milestone\SS\Controller', 								])
            ->create([	'id' => '305111', 	'name' => 'Pricelist', 	'description' => 'Price list header', 	'title' => 'Price List', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'pricelist', 										])
            ->create([	'id' => '305112', 	'name' => 'PricelistProduct', 	'description' => 'Price list products', 	'title' => 'Price List Products', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'pricelist_products', 										])
            ->create([	'id' => '305113', 	'name' => 'Functiondetail', 	'description' => 'ePlus functions', 	'title' => 'ePlus Functions', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'functiondetails', 										])
            ->create([	'id' => '305114', 	'name' => 'Store', 	'description' => 'Stores', 	'title' => 'Stores', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'stores', 										])
            ->create([	'id' => '305115', 	'name' => 'Area', 	'description' => 'Areas', 	'title' => 'Areas', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'areas', 										])
            ->create([	'id' => '305116', 	'name' => 'AreaUser', 	'description' => 'Users in an area', 	'title' => 'Area User', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'area_users', 										])
            ->create([	'id' => '305117', 	'name' => 'UserSetting', 	'description' => 'Web and Mob settings for each user', 	'title' => 'User Settings', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'user_settings', 										])
            ->create([	'id' => '305118', 	'name' => 'UserStoreArea', 	'description' => 'Stores and Areas assigned to a user (executive)', 	'title' => 'User Store and Area', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'user_store_area', 										])
            ->create([	'id' => '305119', 	'name' => 'SalesOrder', 	'description' => 'Sales orders', 	'title' => 'Sales Orders', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'sales_order', 										])
            ->create([	'id' => '305120', 	'name' => 'SalesOrderItem', 	'description' => 'Sales order items', 	'title' => 'Sales Order Items', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'sales_order_items', 										])
            ->create([	'id' => '305121', 	'name' => 'Transaction', 	'description' => 'Transaction header - customer, date, document number', 	'title' => 'Transactions', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'transactions', 										])
            ->create([	'id' => '305122', 	'name' => 'TransactionDetail', 	'description' => 'Products in a transaction, its price tax etc', 	'title' => 'Transaction Details', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'transaction_details', 										])
            ->create([	'id' => '305123', 	'name' => 'DData', 	'description' => 'ePlus ddata for detailed transaction bills', 	'title' => 'ePlus DData', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'd_data', 										])
            ->create([	'id' => '305124', 	'name' => 'StockTransfer', 	'description' => 'Stock transfer from and to a store', 	'title' => 'Stock Transfers', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'stock_transfer', 										])
            ->create([	'id' => '305125', 	'name' => 'WBin', 	'description' => 'Waste bin used while ePlus direct import', 	'title' => 'Waste Bin', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'w_bin', 										])
            ->create([	'id' => '305126', 	'name' => 'Receipt', 	'description' => 'Receipts', 	'title' => 'Receipts', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'receipts', 										])
            ->create([	'id' => '305127', 	'name' => 'FnReserve', 	'description' => 'Function Reserves', 	'title' => 'Function Reserves', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'fn_reserves', 										])
            ->create([	'id' => '305128', 	'name' => 'UserExecutive', 	'description' => 'User Executive Login Map', 	'title' => 'User Executive Map', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'user_executive', 										])
            ->create([	'id' => '305129', 	'name' => 'Printing', 	'description' => 'Printing details', 	'title' => 'Prints', 	'namespace' => 'Milestone\SS\Model', 	'table' => 'printings', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
