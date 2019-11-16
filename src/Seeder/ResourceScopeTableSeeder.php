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
            ->create([	'id' => '307102', 	'resource' => '305118', 	'name' => 'Assigned', 	'description' => 'The store and area whih is assigned to the requesting user', 	'method' => 'assigned', 											])
            ->create([	'id' => '307103', 	'resource' => '305116', 	'name' => 'Assigned', 	'description' => 'The records where area is assigned to the requester', 	'method' => 'assigned', 											])
            ->create([	'id' => '307104', 	'resource' => '305119', 	'name' => 'AssignedAreaCustomer', 	'description' => 'Sales orders of customers belongs to a area which assigned to a executive', 	'method' => 'assignedAreaCustomer', 											])
            ->create([	'id' => '307105', 	'resource' => '305121', 	'name' => 'AssignedCustomerTransactions', 	'description' => 'Transactions related to customers who are assigned to the requesting executive', 	'method' => 'assignedCustomerTransactions', 											])
            ->create([	'id' => '307106', 	'resource' => '305126', 	'name' => 'AssignedCustomerReceipts', 	'description' => 'Receipts related to customers who are assigned to the requesting executive', 	'method' => 'assignedCustomerReceipts', 											])
            ->create([	'id' => '307107', 	'resource' => '305121', 	'name' => 'StockTransferPending', 	'description' => 'The transactions which are all pending stock transfer', 	'method' => 'sTPending', 											])
            ->create([	'id' => '307108', 	'resource' => '305124', 	'name' => 'PendingStockTransfer', 	'description' => 'Stock transfers which are pending', 	'method' => 'pending', 											])
            ->create([	'id' => '307109', 	'resource' => '305127', 	'name' => 'UncompletedReserves', 	'description' => 'Reserve entries which have progress not equal to Completed', 	'method' => 'unCompleted', 											])
            ->create([	'id' => '307110', 	'resource' => '305101', 	'name' => 'LoginUsers', 	'description' => 'Users having login info', 	'method' => 'loginUsers', 											])
            ->create([	'id' => '307111', 	'resource' => '305101', 	'name' => 'LoginExecutives', 	'description' => 'Sales Executives having logins', 	'method' => 'loginExecutives', 											])
            ->create([	'id' => '307112', 	'resource' => '305101', 	'name' => 'Executives', 	'description' => 'Users having reference like SE%', 	'method' => 'executives', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
