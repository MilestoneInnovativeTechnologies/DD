<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDataViewSectionTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceDataViewSection::query()
            ->create([	'id' => '329101', 	'resource_data' => '326101', 		'title_field' => 'name', 		'colspan' => '12', 										])
            ->create([	'id' => '329102', 	'resource_data' => '326102', 		'title_field' => 'name', 		'colspan' => '12', 										])
            ->create([	'id' => '329103', 	'resource_data' => '326103', 	'title' => 'Basic', 			'colspan' => '4', 										])
            ->create([	'id' => '329104', 	'resource_data' => '326103', 	'title' => 'Detail', 			'colspan' => '12', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
