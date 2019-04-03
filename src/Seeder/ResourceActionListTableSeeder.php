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
            ->create([	'id' => '334101', 	'resource_action' => '331105', 	'resource_list' => '321101', 													])
            ->create([	'id' => '334102', 	'resource_action' => '331106', 	'resource_list' => '321102', 													])
            ->create([	'id' => '334103', 	'resource_action' => '331109', 	'resource_list' => '321103', 													])
            ->create([	'id' => '334104', 	'resource_action' => '331110', 	'resource_list' => '321103', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
