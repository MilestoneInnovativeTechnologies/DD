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
            ->create([	'id' => '335101', 	'resource_action' => '331105', 	'resource_data' => '326101', 													])
            ->create([	'id' => '335102', 	'resource_action' => '331106', 	'resource_data' => '326102', 													])
            ->create([	'id' => '335103', 	'resource_action' => '331110', 	'resource_data' => '326103', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
