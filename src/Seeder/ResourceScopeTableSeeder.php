<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceScopeTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceScope::query()
            ->create([	'id' => '307101', 	'resource' => '305101', 	'name' => 'SalesExecutives', 	'description' => 'User where has group reference as SLS', 	'method' => 'salesExecutive', 											])
            ->create([	'id' => '307102', 	'resource' => '305113', 	'name' => 'Assigned', 	'description' => 'The store and area whih is assigned to the requesting user', 	'method' => 'assigned', 											])
            ->create([	'id' => '307103', 	'resource' => '305111', 	'name' => 'Assigned', 	'description' => 'The records where area is assigned to the requester', 	'method' => 'assigned', 											])
            ->create([	'id' => '307104', 	'resource' => '305121', 	'name' => 'AssignedAreaCustomer', 	'description' => 'Sales orders of customers belongs to a area which assigned to a executive', 	'method' => 'assignedAreaCustomer', 											])
            ->create([	'id' => '307105', 	'resource' => '305118', 	'name' => 'AssignedCustomerTransactions', 	'description' => 'Transactions related to customers who are assigned to the requesting executive', 	'method' => 'assignedCustomerTransactions', 											])
            ->create([	'id' => '307106', 	'resource' => '305125', 	'name' => 'AssignedCustomerReceipts', 	'description' => 'Receipts related to customers who are assigned to the requesting executive', 	'method' => 'assignedCustomerReceipts', 											])
            ->create([	'id' => '307107', 	'resource' => '305127', 	'name' => 'AssignedCustomerSalesOrder', 	'description' => 'The records of sales order in which sales order belongs to any assigned customer', 	'method' => 'assignedCustomerSalesOrder', 											])
            ->create([	'id' => '307108', 	'resource' => '305118', 	'name' => 'StockTransferPending', 	'description' => 'The transactions which are all pending stock transfer', 	'method' => 'sTPending', 											])
            ->create([	'id' => '307109', 	'resource' => '305123', 	'name' => 'PendingStockTransfer', 	'description' => 'Stock transfers which are pending', 	'method' => 'pending', 											])
            ->create([	'id' => '307110', 	'resource' => '305117', 	'name' => 'PendingStockTransferOut', 	'description' => 'The store product transaction of a pending stock transfer out', 	'method' => 'pendingSTOut', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
