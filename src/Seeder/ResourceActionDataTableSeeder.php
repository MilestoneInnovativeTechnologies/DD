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
            ->create([	'id' => '336101', 	'resource_action' => '332105', 	'resource_data' => '327101', 													])
            ->create([	'id' => '336102', 	'resource_action' => '332106', 	'resource_data' => '327102', 													])
            ->create([	'id' => '336103', 	'resource_action' => '332110', 	'resource_data' => '327103', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
