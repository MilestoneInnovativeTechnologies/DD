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
            ->create([	'id' => '325111', 	'resource_list' => '322105', 	'label' => 'User', 	'field' => 'name', 	'relation' => '308111', 											])
            ->create([	'id' => '325112', 	'resource_list' => '322105', 	'label' => 'Settings', 	'field' => 'name', 	'relation' => '308109', 											])
            ->create([	'id' => '325113', 	'resource_list' => '322105', 	'label' => 'Value', 	'field' => 'value', 												])
            ->create([	'id' => '325114', 	'resource_list' => '322105', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325115', 	'resource_list' => '322106', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325116', 	'resource_list' => '322106', 	'label' => 'Email', 	'field' => 'email', 												])
            ->create([	'id' => '325117', 	'resource_list' => '322106', 	'label' => 'Reference', 	'field' => 'reference', 												])
            ->create([	'id' => '325118', 	'resource_list' => '322107', 	'label' => 'Executive', 	'field' => 'name', 	'relation' => '308115', 											])
            ->create([	'id' => '325119', 	'resource_list' => '322107', 	'label' => 'Store', 	'field' => 'name', 	'relation' => '308114', 											])
            ->create([	'id' => '325120', 	'resource_list' => '322107', 	'label' => 'Area', 	'field' => 'name', 	'relation' => '308113', 											])
            ->create([	'id' => '325121', 	'resource_list' => '322107', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325122', 	'resource_list' => '322108', 	'label' => 'Code', 	'field' => 'code', 												])
            ->create([	'id' => '325123', 	'resource_list' => '322108', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325124', 	'resource_list' => '322108', 	'label' => 'Type', 	'field' => 'type', 												])
            ->create([	'id' => '325125', 	'resource_list' => '322108', 	'label' => 'Status', 	'field' => 'status', 												])
            ->create([	'id' => '325126', 	'resource_list' => '322109', 	'label' => 'Code', 	'field' => 'code', 												])
            ->create([	'id' => '325127', 	'resource_list' => '322109', 	'label' => 'Name', 	'field' => 'name', 												])
            ->create([	'id' => '325128', 	'resource_list' => '322109', 	'label' => 'Company Code', 	'field' => 'cocode', 												])
            ->create([	'id' => '325129', 	'resource_list' => '322109', 	'label' => 'Branch Code', 	'field' => 'brcode', 												])
            ->create([	'id' => '325130', 	'resource_list' => '322110', 	'label' => 'Product', 	'field' => 'narration', 	'relation' => '308144', 											])
            ->create([	'id' => '325131', 	'resource_list' => '322111', 	'label' => 'Code', 	'field' => 'code', 												])
            ->create([	'id' => '325132', 	'resource_list' => '322111', 	'label' => 'Abbreviation', 	'field' => 'abr', 												])
            ->create([	'id' => '325133', 	'resource_list' => '322111', 	'label' => 'Digit Length', 	'field' => 'digit_length', 												])
            ->create([	'id' => '325134', 	'resource_list' => '322112', 	'label' => 'Code', 	'field' => 'code', 												])
            ->create([	'id' => '325135', 	'resource_list' => '322112', 	'label' => 'User', 	'field' => 'name', 	'relation' => '308145', 											])
            ->create([	'id' => '325136', 	'resource_list' => '322112', 	'label' => 'Store', 	'field' => 'name', 	'relation' => '308146', 											])
            ->create([	'id' => '325137', 	'resource_list' => '322112', 	'label' => 'Progress', 	'field' => 'progress', 												])
            ->create([	'id' => '325138', 	'resource_list' => '322113', 	'label' => 'Code', 	'field' => 'code', 												])
            ->create([	'id' => '325139', 	'resource_list' => '322113', 	'label' => 'User', 	'field' => 'name', 	'relation' => '308145', 											])
            ->create([	'id' => '325140', 	'resource_list' => '322113', 	'label' => 'Store', 	'field' => 'name', 	'relation' => '308146', 											])
            ->create([	'id' => '325141', 	'resource_list' => '322113', 	'label' => 'Progress', 	'field' => 'progress', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
