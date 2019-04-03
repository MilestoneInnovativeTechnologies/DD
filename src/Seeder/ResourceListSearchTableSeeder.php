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
            ->create([	'id' => '325101', 	'resource_list' => '321101', 	'field' => 'name', 													])
            ->create([	'id' => '325102', 	'resource_list' => '321102', 	'field' => 'name', 													])
            ->create([	'id' => '325103', 	'resource_list' => '321103', 	'field' => 'name', 													])
            ->create([	'id' => '325104', 	'resource_list' => '321103', 	'field' => 'description', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
