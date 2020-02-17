<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceRelationTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceRelation::query()
            ->create([	'id' => '308101', 	'resource' => '305111', 	'name' => 'Items', 	'description' => 'Each items of this pricelist', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '305112', 									])
            ->create([	'id' => '308102', 	'resource' => '305112', 	'name' => 'Pricelist', 	'description' => 'Details of pricelist this item belongs to', 	'method' => 'Pricelist', 	'type' => 'belongsTo', 	'relate_resource' => '305111', 									])
            ->create([	'id' => '308103', 	'resource' => '305112', 	'name' => 'Product', 	'description' => 'Details of product this item consist of', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308104', 	'resource' => '305116', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '305115', 									])
            ->create([	'id' => '308105', 	'resource' => '305116', 	'name' => 'Customer', 	'description' => 'Details of customer', 	'method' => 'Customer', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308106', 	'resource' => '305115', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsToMany', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308107', 	'resource' => '305105', 	'name' => 'Users', 	'description' => 'Users list corresponding to a settings', 	'method' => 'Users', 	'type' => 'hasMany', 	'relate_resource' => '305117', 									])
            ->create([	'id' => '308108', 	'resource' => '305101', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsToMany', 	'relate_resource' => '305115', 									])
            ->create([	'id' => '308109', 	'resource' => '305117', 	'name' => 'Settings', 	'description' => 'Details of settings this setting belongs to', 	'method' => 'Settings', 	'type' => 'belongsTo', 	'relate_resource' => '305105', 									])
            ->create([	'id' => '308110', 	'resource' => '305101', 	'name' => 'Settings', 	'description' => 'Settings assigned for a user', 	'method' => 'Settings', 	'type' => 'hasMany', 	'relate_resource' => '305117', 									])
            ->create([	'id' => '308111', 	'resource' => '305117', 	'name' => 'User', 	'description' => 'Details of user this settings belongs to', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308112', 	'resource' => '305101', 	'name' => 'StoreAndArea', 	'description' => 'Store and Areas assigned for a user', 	'method' => 'StoreAndArea', 	'type' => 'hasMany', 	'relate_resource' => '305118', 									])
            ->create([	'id' => '308113', 	'resource' => '305118', 	'name' => 'Area', 	'description' => 'Area details', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '305115', 									])
            ->create([	'id' => '308114', 	'resource' => '305118', 	'name' => 'Store', 	'description' => 'Store Details', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305114', 									])
            ->create([	'id' => '308115', 	'resource' => '305118', 	'name' => 'User', 	'description' => 'User Details', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308116', 	'resource' => '305114', 	'name' => 'Users', 	'description' => 'Users assigned to this store', 	'method' => 'Users', 	'type' => 'belongsToMany', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308117', 	'resource' => '305115', 	'name' => 'StoreAndUser', 	'description' => 'Store and Users assigned to a area', 	'method' => 'StoreAndUser', 	'type' => 'hasMany', 	'relate_resource' => '305118', 									])
            ->create([	'id' => '308118', 	'resource' => '305121', 	'name' => 'Details', 	'description' => 'Product wise details of transaction', 	'method' => 'Details', 	'type' => 'hasMany', 	'relate_resource' => '305122', 									])
            ->create([	'id' => '308119', 	'resource' => '305119', 	'name' => 'Items', 	'description' => 'Items of a transaction', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '305120', 									])
            ->create([	'id' => '308120', 	'resource' => '305120', 	'name' => 'Product', 	'description' => 'Product details of an sales order item', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308121', 	'resource' => '305124', 	'name' => 'IN', 	'description' => 'Stock in transactions', 	'method' => 'IN', 	'type' => 'belongsTo', 	'relate_resource' => '305121', 									])
            ->create([	'id' => '308122', 	'resource' => '305124', 	'name' => 'OUT', 	'description' => 'Stock out transactions', 	'method' => 'OUT', 	'type' => 'belongsTo', 	'relate_resource' => '305121', 									])
            ->create([	'id' => '308123', 	'resource' => '305119', 	'name' => 'Customer', 	'description' => 'The customer to which this sales order belongs', 	'method' => 'Customer', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308124', 	'resource' => '305118', 	'name' => 'AssignedAreas', 	'description' => 'The user_areas which assigned to this record', 	'method' => 'AssignedAreas', 	'type' => 'hasMany', 	'relate_resource' => '305116', 									])
            ->create([	'id' => '308125', 	'resource' => '305116', 	'name' => 'Users', 	'description' => 'The executives assigned to a area_user', 	'method' => 'Users', 	'type' => 'hasMany', 	'relate_resource' => '305118', 									])
            ->create([	'id' => '308126', 	'resource' => '305118', 	'name' => 'Customers', 	'description' => 'Customers who are in selected records area', 	'method' => 'Customers', 	'type' => 'belongsToMany', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308127', 	'resource' => '305101', 	'name' => 'AreaCustomers', 	'description' => 'List of customers belongs to the area which are assigned to a user', 	'method' => 'AreaCustomers', 	'type' => 'hasManyThrough', 	'relate_resource' => '305116', 									])
            ->create([	'id' => '308128', 	'resource' => '305120', 	'name' => 'SalesOrder', 	'description' => 'Sales order details for a so item', 	'method' => 'SalesOrder', 	'type' => 'belongsTo', 	'relate_resource' => '305119', 									])
            ->create([	'id' => '308129', 	'resource' => '305122', 	'name' => 'Transaction', 	'description' => 'Detail of transaction header', 	'method' => 'Transaction', 	'type' => 'belongsTo', 	'relate_resource' => '305121', 									])
            ->create([	'id' => '308130', 	'resource' => '305121', 	'name' => 'StockOutTransactions', 	'description' => 'TransferOut transactions', 	'method' => 'STOut', 	'type' => 'hasOne', 	'relate_resource' => '305124', 									])
            ->create([	'id' => '308131', 	'resource' => '305121', 	'name' => 'StockInTransactions', 	'description' => 'TransferIn transactions', 	'method' => 'STIn', 	'type' => 'hasOne', 	'relate_resource' => '305124', 									])
            ->create([	'id' => '308132', 	'resource' => '305108', 	'name' => 'ProductImages', 	'description' => 'Images of a product', 	'method' => 'Images', 	'type' => 'hasOne', 	'relate_resource' => '305110', 									])
            ->create([	'id' => '308133', 	'resource' => '305110', 	'name' => 'ProductDetails', 	'description' => 'Product Details', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308134', 	'resource' => '305127', 	'name' => 'ReserveUser', 	'description' => 'User details of reserve', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308135', 	'resource' => '305127', 	'name' => 'ReserveStore', 	'description' => 'Store details of reserve', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305114', 									])
            ->create([	'id' => '308136', 	'resource' => '305122', 	'name' => 'ProductDetails', 	'description' => 'Product Details', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308137', 	'resource' => '305122', 	'name' => 'StoreDetails', 	'description' => 'Store details of a transaction entry', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305114', 									])
            ->create([	'id' => '308138', 	'resource' => '305120', 	'name' => 'StoreDetails', 	'description' => 'Store details of a sales order entry', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305114', 									])
            ->create([	'id' => '308139', 	'resource' => '305119', 	'name' => 'StoreDetails', 	'description' => 'Store details of a sales order', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305114', 									])
            ->create([	'id' => '308140', 	'resource' => '305128', 	'name' => 'LoginUser', 	'description' => 'Login user details', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308141', 	'resource' => '305128', 	'name' => 'ExecutiveUser', 	'description' => 'Executive user details', 	'method' => 'Executive', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308142', 	'resource' => '305130', 	'name' => 'ShiftTransactions', 	'description' => 'Transactions of a shift', 	'method' => 'Transactions', 	'type' => 'hasMany', 	'relate_resource' => '305131', 									])
            ->create([	'id' => '308143', 	'resource' => '305131', 	'name' => 'TransactionShift', 	'description' => 'Shift details ofa transaction', 	'method' => 'Shift', 	'type' => 'belongsTo', 	'relate_resource' => '305130', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
