<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionListTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceActionList::query()
            ->create([	'id' => '335101', 	'resource_action' => '332103', 	'resource_list' => '322101', 													])
            ->create([	'id' => '335102', 	'resource_action' => '332104', 	'resource_list' => '322101', 													])
            ->create([	'id' => '335103', 	'resource_action' => '332106', 	'resource_list' => '322104', 													])
            ->create([	'id' => '335104', 	'resource_action' => '332109', 	'resource_list' => '322104', 													])
            ->create([	'id' => '335105', 	'resource_action' => '332110', 	'resource_list' => '322101', 													])
            ->create([	'id' => '335106', 	'resource_action' => '332111', 	'resource_list' => '322101', 													])
            ->create([	'id' => '335107', 	'resource_action' => '332114', 	'resource_list' => '322103', 													])
            ->create([	'id' => '335108', 	'resource_action' => '332113', 	'resource_list' => '322103', 													])
            ->create([	'id' => '335109', 	'resource_action' => '332117', 	'resource_list' => '322105', 													])
            ->create([	'id' => '335110', 	'resource_action' => '332118', 	'resource_list' => '322105', 													])
            ->create([	'id' => '335111', 	'resource_action' => '332121', 	'resource_list' => '322104', 													])
            ->create([	'id' => '335112', 	'resource_action' => '332122', 	'resource_list' => '322104', 													])
            ->create([	'id' => '335113', 	'resource_action' => '332123', 	'resource_list' => '322106', 													])
            ->create([	'id' => '335114', 	'resource_action' => '332124', 	'resource_list' => '322106', 													])
            ->create([	'id' => '335115', 	'resource_action' => '332125', 	'resource_list' => '322107', 													])
            ->create([	'id' => '335116', 	'resource_action' => '332127', 	'resource_list' => '322108', 													])
            ->create([	'id' => '335117', 	'resource_action' => '332129', 	'resource_list' => '322108', 													])
            ->create([	'id' => '335118', 	'resource_action' => '332132', 	'resource_list' => '322110', 													])
            ->create([	'id' => '335119', 	'resource_action' => '332133', 	'resource_list' => '322110', 													])
            ->create([	'id' => '335120', 	'resource_action' => '332132', 	'resource_list' => '322111', 													])
            ->create([	'id' => '335121', 	'resource_action' => '332133', 	'resource_list' => '322111', 													])
            ->create([	'id' => '335122', 	'resource_action' => '332138', 	'resource_list' => '322114', 													])
            ->create([	'id' => '335123', 	'resource_action' => '332139', 	'resource_list' => '322114', 													])
            ->create([	'id' => '335124', 	'resource_action' => '332146', 	'resource_list' => '322116', 													])
            ->create([	'id' => '335125', 	'resource_action' => '332145', 	'resource_list' => '322116', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
