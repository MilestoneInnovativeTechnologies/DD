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
            ->create([	'id' => '335101', 	'resource_action' => '332105', 	'resource_list' => '322101', 													])
            ->create([	'id' => '335102', 	'resource_action' => '332106', 	'resource_list' => '322102', 													])
            ->create([	'id' => '335103', 	'resource_action' => '332109', 	'resource_list' => '322103', 													])
            ->create([	'id' => '335104', 	'resource_action' => '332110', 	'resource_list' => '322103', 													])
            ->create([	'id' => '335105', 	'resource_action' => '332112', 	'resource_list' => '322104', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
