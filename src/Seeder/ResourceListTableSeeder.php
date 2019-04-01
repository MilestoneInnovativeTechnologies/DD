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
            ->create([	'id' => '321101', 	'resource' => '304118', 	'name' => 'TransactionProductNature', 	'description' => 'Nature of the product in a transaction', 	'title' => 'Product Nature', 	'identity' => 'name', 	'items_per_page' => '20', 									])
            ->create([	'id' => '321102', 	'resource' => '304119', 	'name' => 'TransactionProductType', 	'description' => 'Type of transaction whether is load, unload etc', 	'title' => 'Transaction Types', 	'identity' => 'name', 	'items_per_page' => '20', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
