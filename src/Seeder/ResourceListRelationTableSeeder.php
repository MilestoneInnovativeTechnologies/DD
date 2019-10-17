<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceListRelationTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceListRelation::query()
            ->create([	'id' => '324101', 	'resource_list' => '322103', 	'relation' => '308109', 													])
            ->create([	'id' => '324102', 	'resource_list' => '322103', 	'relation' => '308111', 													])
            ->create([	'id' => '324103', 	'resource_list' => '322105', 	'relation' => '308113', 													])
            ->create([	'id' => '324104', 	'resource_list' => '322105', 	'relation' => '308114', 													])
            ->create([	'id' => '324105', 	'resource_list' => '322105', 	'relation' => '308115', 													])
            ->create([	'id' => '324106', 	'resource_list' => '322108', 	'relation' => '308133', 													])
            ->create([	'id' => '324107', 	'resource_list' => '322110', 	'relation' => '308134', 													])
            ->create([	'id' => '324108', 	'resource_list' => '322110', 	'relation' => '308135', 													])
            ->create([	'id' => '324109', 	'resource_list' => '322111', 	'relation' => '308134', 													])
            ->create([	'id' => '324110', 	'resource_list' => '322111', 	'relation' => '308135', 													])
            ->create([	'id' => '324111', 	'resource_list' => '322115', 	'relation' => '308140', 													])
            ->create([	'id' => '324112', 	'resource_list' => '322115', 	'relation' => '308141', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
