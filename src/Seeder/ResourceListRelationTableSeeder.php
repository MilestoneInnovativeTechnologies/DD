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
            ->create([	'id' => '324101', 	'resource_list' => '322105', 	'relation' => '308136', 													])
            ->create([	'id' => '324102', 	'resource_list' => '322105', 	'relation' => '308138', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
