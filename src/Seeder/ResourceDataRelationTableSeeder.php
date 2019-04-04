<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDataRelationTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceDataRelation::query()
            ->create([	'id' => '329101', 	'resource_data' => '327104', 	'relation' => '308138', 													])
            ->create([	'id' => '329102', 	'resource_data' => '327104', 	'relation' => '308136', 													])
            ->create([	'id' => '329103', 	'resource_data' => '327105', 	'relation' => '308140', 													])
            ->create([	'id' => '329104', 	'resource_data' => '327105', 	'relation' => '308141', 													])
            ->create([	'id' => '329105', 	'resource_data' => '327105', 	'relation' => '308142', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
