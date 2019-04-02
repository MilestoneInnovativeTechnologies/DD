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
            ->create([	'id' => '331101', 	'resource' => '304118', 	'name' => 'ProductTransactionNewNature', 	'description' => 'Nature of the product in a transaction.. Fresh, Expired, Damaged etc', 	'title' => 'Transaction Product Nature', 		'menu' => 'New', 									])
            ->create([	'id' => '331102', 	'resource' => '304118', 	'name' => 'ProductTransactionViewNature', 	'description' => 'List all natures a product transaction havs', 	'title' => 'Transaction Product Nature', 		'menu' => 'List', 									])
            ->create([	'id' => '331103', 	'resource' => '304119', 	'name' => 'ProductTransactionNewType', 	'description' => 'Type of transaction like Loading, Unloading, Sales', 	'title' => 'Product Transaction Type', 		'menu' => 'New', 									])
            ->create([	'id' => '331104', 	'resource' => '304119', 	'name' => 'ProductTransactionViewTypes', 	'description' => 'List all available types of product transaction', 	'title' => 'Product Transaction Types', 		'menu' => 'List', 									])
            ->create([	'id' => '331105', 	'resource' => '304118', 	'name' => 'UpdateProductTransactionNature', 	'description' => 'Edit Nature details, change status', 	'title' => 'Update', 	'type' => 'primary', 										])
            ->create([	'id' => '331106', 	'resource' => '304119', 	'name' => 'UpdateProductTransactionType', 	'description' => 'Change type status, update name ', 	'title' => 'Update', 	'type' => 'primary', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
