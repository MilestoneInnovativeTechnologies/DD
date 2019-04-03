<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDataTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceData::query()
            ->create([	'id' => '326101', 	'resource' => '304118', 	'name' => 'TransactionProductNatureView', 	'description' => 'View details of a product transaction nature', 	'title_field' => 'name', 											])
            ->create([	'id' => '326102', 	'resource' => '304119', 	'name' => 'TransactionProductTypeView', 	'description' => 'View details of a product transaction type', 	'title_field' => 'name', 											])
            ->create([	'id' => '326103', 	'resource' => '304103', 	'name' => 'SettingsView', 	'description' => 'View details of a settings', 	'title_field' => 'name', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
