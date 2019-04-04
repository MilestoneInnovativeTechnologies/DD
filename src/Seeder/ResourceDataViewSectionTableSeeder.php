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
            ->create([	'id' => '330101', 	'resource_data' => '327101', 		'title_field' => 'name', 		'colspan' => '12', 										])
            ->create([	'id' => '330102', 	'resource_data' => '327102', 		'title_field' => 'name', 		'colspan' => '12', 										])
            ->create([	'id' => '330103', 	'resource_data' => '327103', 	'title' => 'Basic', 			'colspan' => '4', 										])
            ->create([	'id' => '330104', 	'resource_data' => '327103', 	'title' => 'Detail', 			'colspan' => '12', 										])
            ->create([	'id' => '330105', 	'resource_data' => '327104', 	'title' => 'User Settings Details', 			'colspan' => '12', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
