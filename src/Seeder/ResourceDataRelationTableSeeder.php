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
            ->create([	'id' => '329101', 	'resource_data' => '327102', 	'relation' => '308111', 													])
            ->create([	'id' => '329102', 	'resource_data' => '327102', 	'relation' => '308109', 													])
            ->create([	'id' => '329103', 	'resource_data' => '327103', 	'relation' => '308113', 													])
            ->create([	'id' => '329104', 	'resource_data' => '327103', 	'relation' => '308114', 													])
            ->create([	'id' => '329105', 	'resource_data' => '327103', 	'relation' => '308115', 													])
            ->create([	'id' => '329106', 	'resource_data' => '327104', 	'relation' => '308133', 													])
            ->create([	'id' => '329107', 	'resource_data' => '327105', 	'relation' => '308134', 													])
            ->create([	'id' => '329108', 	'resource_data' => '327105', 	'relation' => '308135', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
