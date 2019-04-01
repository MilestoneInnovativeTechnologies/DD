<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceForm::query()
            ->create([	'id' => '308101', 	'resource' => '304118', 	'name' => 'NewTransactionProductNature', 	'description' => 'Enter a new nature of a product transaction', 	'title' => 'New Nature of Product in Transaction', 	'action_text' => 'Save', 										])
            ->create([	'id' => '308102', 	'resource' => '304119', 	'name' => 'NewProductTransactionType', 	'description' => 'Enter a new type of product transaction', 	'title' => 'New Type of Product Transaction', 	'action_text' => 'Save', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
