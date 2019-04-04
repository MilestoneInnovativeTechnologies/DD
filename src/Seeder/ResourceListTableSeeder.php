<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceListTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceList::query()
            ->create([	'id' => '322101', 	'resource' => '305118', 	'name' => 'TransactionProductNature', 	'description' => 'Nature of the product in a transaction', 	'title' => 'Product Nature', 	'identity' => 'name', 	'items_per_page' => '20', 									])
            ->create([	'id' => '322102', 	'resource' => '305119', 	'name' => 'TransactionProductType', 	'description' => 'Type of transaction whether is load, unload etc', 	'title' => 'Transaction Types', 	'identity' => 'name', 	'items_per_page' => '20', 									])
            ->create([	'id' => '322103', 	'resource' => '305103', 	'name' => 'Settings', 	'description' => 'List all available Settings', 	'title' => 'Settings', 	'identity' => 'name', 	'items_per_page' => '20', 									])
            ->create([	'id' => '322104', 	'resource' => '305101', 	'name' => 'ListAllUsers', 	'description' => 'List all available users', 	'title' => 'Users', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322105', 	'resource' => '305115', 	'name' => 'ListAllUserSetting', 	'description' => 'List all user setting and value', 	'title' => 'User Settings', 	'identity' => 'user.name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322106', 	'resource' => '305101', 	'name' => 'SalesExecutiveUserList', 	'description' => 'List all sales executives from users', 	'title' => 'Sales Executives', 	'identity' => 'name', 	'items_per_page' => '50', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
