<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionDataTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceActionData::query()
            ->create([	'id' => '336101', 	'resource_action' => '332104', 	'resource_data' => '327101', 													])
            ->create([	'id' => '336102', 	'resource_action' => '332113', 	'resource_data' => '327102', 													])
            ->create([	'id' => '336103', 	'resource_action' => '332118', 	'resource_data' => '327103', 													])
            ->create([	'id' => '336104', 	'resource_action' => '332133', 	'resource_data' => '327105', 													])
            ->create([	'id' => '336105', 	'resource_action' => '332133', 	'resource_data' => '327105', 													])
            ->create([	'id' => '336106', 	'resource_action' => '332138', 	'resource_data' => '327106', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
