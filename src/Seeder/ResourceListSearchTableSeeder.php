<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceListSearchTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceListSearch::query()
            ->create([	'id' => '326101', 	'resource_list' => '322101', 	'field' => 'name', 													])
            ->create([	'id' => '326102', 	'resource_list' => '322102', 	'field' => 'name', 													])
            ->create([	'id' => '326103', 	'resource_list' => '322103', 	'field' => 'name', 													])
            ->create([	'id' => '326104', 	'resource_list' => '322103', 	'field' => 'description', 													])
            ->create([	'id' => '326105', 	'resource_list' => '322104', 	'field' => 'name', 													])
            ->create([	'id' => '326106', 	'resource_list' => '322104', 	'field' => 'reference', 													])
            ->create([	'id' => '326107', 	'resource_list' => '322104', 	'field' => 'email', 													])
            ->create([	'id' => '326108', 	'resource_list' => '322105', 	'field' => 'name', 	'relation' => '308138', 												])
            ->create([	'id' => '326109', 	'resource_list' => '322105', 	'field' => 'name', 	'relation' => '308136', 												])
            ->create([	'id' => '326110', 	'resource_list' => '322106', 	'field' => 'name', 													])
            ->create([	'id' => '326111', 	'resource_list' => '322107', 	'field' => 'name', 	'relation' => '308140', 												])
            ->create([	'id' => '326112', 	'resource_list' => '322107', 	'field' => 'name', 	'relation' => '308141', 												])
            ->create([	'id' => '326113', 	'resource_list' => '322107', 	'field' => 'name', 	'relation' => '308142', 												])
            ->create([	'id' => '326114', 	'resource_list' => '322108', 	'field' => 'name', 													])
            ->create([	'id' => '326115', 	'resource_list' => '322109', 	'field' => 'name', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
