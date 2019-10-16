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
            ->create([	'id' => '322101', 	'resource' => '305105', 	'name' => 'Settings', 	'description' => 'List all available Settings', 	'title' => 'Settings', 	'identity' => 'name', 	'items_per_page' => '20', 									])
            ->create([	'id' => '322102', 	'resource' => '305101', 	'name' => 'ListAllUsers', 	'description' => 'List all available users', 	'title' => 'Users', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322103', 	'resource' => '305117', 	'name' => 'ListAllUserSetting', 	'description' => 'List all user setting and value', 	'title' => 'User Settings', 	'identity' => 'user.name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322104', 	'resource' => '305101', 	'name' => 'SalesExecutiveUserList', 	'description' => 'List all sales executives from users', 	'title' => 'Sales Executives', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322105', 	'resource' => '305118', 	'name' => 'UserStoreAreaList', 	'description' => 'List all records in User Store Area', 	'title' => 'User, Store and Area', 	'identity' => 'user.name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322106', 	'resource' => '305115', 	'name' => 'AreaList', 	'description' => 'List all areas', 	'title' => 'Area', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322107', 	'resource' => '305114', 	'name' => 'StoresList', 	'description' => 'List all stores', 	'title' => 'Stores', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322108', 	'resource' => '305110', 	'name' => 'ProductImageList', 	'description' => 'List All entries', 	'title' => 'Product Images', 	'identity' => 'product.narration', 	'items_per_page' => '15', 									])
            ->create([	'id' => '322109', 	'resource' => '305113', 	'name' => 'FunctionDetailList', 	'description' => 'List All functions available', 	'title' => 'Function details list', 	'identity' => 'code', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322110', 	'resource' => '305127', 	'name' => 'ReservesList', 	'description' => 'List all reserves', 	'title' => 'Function Reserves', 	'identity' => 'fncode', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322111', 	'resource' => '305127', 	'name' => 'UncompletedReservesList', 	'description' => 'List all reserve entries which are uncompleted', 	'title' => 'Function Reserves', 	'identity' => 'fncode', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322112', 	'resource' => '305101', 	'name' => 'LoginUsers', 	'description' => 'Users having login details', 	'title' => 'Users', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322113', 	'resource' => '305101', 	'name' => 'LoginSalesExecutives', 	'description' => 'Sales Executive having login details', 	'title' => 'Users', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322114', 	'resource' => '305104', 	'name' => 'MenuList', 	'description' => 'List all menu', 	'title' => 'Menu', 	'identity' => 'name', 	'items_per_page' => '50', 									])
            ->create([	'id' => '322115', 	'resource' => '305128', 	'name' => 'UserToExecutiveMapList', 	'description' => 'User to Executive maps', 	'title' => 'User Executive Map', 	'identity' => 'executive.name', 	'items_per_page' => '50', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
