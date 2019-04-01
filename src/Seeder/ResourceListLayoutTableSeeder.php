<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceListLayoutTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceListLayout::query()
            ->create([	'id' => '324101', 	'resource_list' => '321101', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '324102', 	'resource_list' => '321101', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '324103', 	'resource_list' => '321102', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '324104', 	'resource_list' => '321102', 	'label' => 'Status', 	'field' => 'status', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
