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
            ->create([	'id' => '326102', 	'resource_list' => '322101', 	'field' => 'description', 													])
            ->create([	'id' => '326103', 	'resource_list' => '322102', 	'field' => 'name', 													])
            ->create([	'id' => '326104', 	'resource_list' => '322102', 	'field' => 'reference', 													])
            ->create([	'id' => '326105', 	'resource_list' => '322102', 	'field' => 'email', 													])
            ->create([	'id' => '326106', 	'resource_list' => '322103', 	'field' => 'name', 	'relation' => '308111', 												])
            ->create([	'id' => '326107', 	'resource_list' => '322103', 	'field' => 'name', 	'relation' => '308109', 												])
            ->create([	'id' => '326108', 	'resource_list' => '322104', 	'field' => 'name', 													])
            ->create([	'id' => '326109', 	'resource_list' => '322105', 	'field' => 'name', 	'relation' => '308113', 												])
            ->create([	'id' => '326110', 	'resource_list' => '322105', 	'field' => 'name', 	'relation' => '308114', 												])
            ->create([	'id' => '326111', 	'resource_list' => '322105', 	'field' => 'name', 	'relation' => '308115', 												])
            ->create([	'id' => '326112', 	'resource_list' => '322106', 	'field' => 'name', 													])
            ->create([	'id' => '326113', 	'resource_list' => '322107', 	'field' => 'name', 													])
            ->create([	'id' => '326114', 	'resource_list' => '322108', 	'field' => 'narration', 	'relation' => '308133', 												])
            ->create([	'id' => '326115', 	'resource_list' => '322109', 	'field' => 'code', 													])
            ->create([	'id' => '326116', 	'resource_list' => '322110', 	'field' => 'fncode', 													])
            ->create([	'id' => '326117', 	'resource_list' => '322110', 	'field' => 'name', 	'relation' => '308134', 												])
            ->create([	'id' => '326118', 	'resource_list' => '322110', 	'field' => 'name', 	'relation' => '308135', 												])
            ->create([	'id' => '326119', 	'resource_list' => '322111', 	'field' => 'fncode', 													])
            ->create([	'id' => '326120', 	'resource_list' => '322111', 	'field' => 'name', 	'relation' => '308134', 												])
            ->create([	'id' => '326121', 	'resource_list' => '322111', 	'field' => 'name', 	'relation' => '308135', 												])
            ->create([	'id' => '326122', 	'resource_list' => '322112', 	'field' => 'name', 													])
            ->create([	'id' => '326123', 	'resource_list' => '322112', 	'field' => 'login', 													])
            ->create([	'id' => '326124', 	'resource_list' => '322112', 	'field' => 'reference', 													])
            ->create([	'id' => '326125', 	'resource_list' => '322113', 	'field' => 'name', 													])
            ->create([	'id' => '326126', 	'resource_list' => '322113', 	'field' => 'login', 													])
            ->create([	'id' => '326127', 	'resource_list' => '322113', 	'field' => 'reference', 													])
            ->create([	'id' => '326128', 	'resource_list' => '322116', 	'field' => 'name', 													])
            ->create([	'id' => '326129', 	'resource_list' => '322116', 	'field' => 'description', 													])
            ->create([	'id' => '326130', 	'resource_list' => '322116', 	'field' => 'query1', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
