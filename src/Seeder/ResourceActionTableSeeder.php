<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceAction::query()
            ->create([	'id' => '331101', 	'resource' => '304118', 	'name' => 'ProductTransactionNewNature', 	'description' => 'Nature of the product in a transaction.. Fresh, Expired, Damaged etc', 			'menu' => 'New', 									])
            ->create([	'id' => '331102', 	'resource' => '304118', 	'name' => 'ProductTransactionViewNature', 	'description' => 'List all natures a product transaction havs', 			'menu' => 'List', 									])
            ->create([	'id' => '331103', 	'resource' => '304119', 	'name' => 'ProductTransactionNewType', 	'description' => 'Type of transaction like Loading, Unloading, Sales', 			'menu' => 'New', 									])
            ->create([	'id' => '331104', 	'resource' => '304119', 	'name' => 'ProductTransactionViewTypes', 	'description' => 'List all available types of product transaction', 			'menu' => 'List', 									])
            ->create([	'id' => '331105', 	'resource' => '304118', 	'name' => 'UpdateProductTransactionNature', 	'description' => 'Edit Nature details, change status', 	'title' => 'Update', 	'type' => 'primary', 										])
            ->create([	'id' => '331106', 	'resource' => '304119', 	'name' => 'UpdateProductTransactionType', 	'description' => 'Change type status, update name ', 	'title' => 'Update', 	'type' => 'primary', 										])
            ->create([	'id' => '331107', 	'resource' => '304103', 	'name' => 'NewSettings', 	'description' => 'Create new setting', 			'menu' => 'New', 									])
            ->create([	'id' => '331108', 	'resource' => '304103', 	'name' => 'ListSettings', 	'description' => 'List all settings', 			'menu' => 'List All', 									])
            ->create([	'id' => '331109', 	'resource' => '304103', 	'name' => 'ViewSettingsDetails', 	'description' => 'Data view of a settings', 	'title' => 'Details', 	'type' => 'primary', 										])
            ->create([	'id' => '331110', 	'resource' => '304103', 	'name' => 'UpdateSettings', 	'description' => 'Edit settings details', 	'title' => 'Edit', 	'type' => 'primary', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
