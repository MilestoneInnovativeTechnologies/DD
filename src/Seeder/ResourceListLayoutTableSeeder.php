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
            ->create([	'id' => '325101', 	'resource_list' => '322101', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325102', 	'resource_list' => '322101', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325103', 	'resource_list' => '322102', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325104', 	'resource_list' => '322102', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325105', 	'resource_list' => '322103', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325106', 	'resource_list' => '322103', 	'label' => 'Default Value', 	'field' => 'value', 												])
            ->create([	'id' => '325107', 	'resource_list' => '322103', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325108', 	'resource_list' => '322104', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325109', 	'resource_list' => '322104', 	'label' => 'Reference', 	'field' => 'reference', 												])
            ->create([	'id' => '325110', 	'resource_list' => '322104', 	'label' => 'Email', 	'field' => 'email', 												])
            ->create([	'id' => '325111', 	'resource_list' => '322105', 	'label' => 'User', 	'field' => 'name', 	'relation' => '308138', 											])
            ->create([	'id' => '325112', 	'resource_list' => '322105', 	'label' => 'Settings', 	'field' => 'name', 	'relation' => '308136', 											])
            ->create([	'id' => '325113', 	'resource_list' => '322105', 	'label' => 'Value', 	'field' => 'value', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
