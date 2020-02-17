<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceRoleTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceRole::query()
            ->create([	'id' => '306101', 	'role' => '303101', 	'resource' => '305101', 													])
            ->create([	'id' => '306102', 	'role' => '303101', 	'resource' => '305102', 													])
            ->create([	'id' => '306103', 	'role' => '303101', 	'resource' => '305103', 													])
            ->create([	'id' => '306104', 	'role' => '303101', 	'resource' => '305104', 													])
            ->create([	'id' => '306105', 	'role' => '303101', 	'resource' => '305105', 													])
            ->create([	'id' => '306106', 	'role' => '303101', 	'resource' => '305106', 													])
            ->create([	'id' => '306107', 	'role' => '303101', 	'resource' => '305107', 													])
            ->create([	'id' => '306108', 	'role' => '303101', 	'resource' => '305108', 													])
            ->create([	'id' => '306109', 	'role' => '303101', 	'resource' => '305109', 													])
            ->create([	'id' => '306110', 	'role' => '303101', 	'resource' => '305110', 													])
            ->create([	'id' => '306111', 	'role' => '303101', 	'resource' => '305111', 													])
            ->create([	'id' => '306112', 	'role' => '303101', 	'resource' => '305112', 													])
            ->create([	'id' => '306113', 	'role' => '303101', 	'resource' => '305113', 													])
            ->create([	'id' => '306114', 	'role' => '303101', 	'resource' => '305114', 													])
            ->create([	'id' => '306115', 	'role' => '303101', 	'resource' => '305115', 													])
            ->create([	'id' => '306116', 	'role' => '303101', 	'resource' => '305116', 													])
            ->create([	'id' => '306117', 	'role' => '303101', 	'resource' => '305117', 													])
            ->create([	'id' => '306118', 	'role' => '303101', 	'resource' => '305118', 													])
            ->create([	'id' => '306119', 	'role' => '303101', 	'resource' => '305119', 													])
            ->create([	'id' => '306120', 	'role' => '303101', 	'resource' => '305120', 													])
            ->create([	'id' => '306121', 	'role' => '303101', 	'resource' => '305121', 													])
            ->create([	'id' => '306122', 	'role' => '303101', 	'resource' => '305122', 													])
            ->create([	'id' => '306123', 	'role' => '303101', 	'resource' => '305123', 													])
            ->create([	'id' => '306124', 	'role' => '303101', 	'resource' => '305124', 													])
            ->create([	'id' => '306125', 	'role' => '303101', 	'resource' => '305125', 													])
            ->create([	'id' => '306126', 	'role' => '303101', 	'resource' => '305126', 													])
            ->create([	'id' => '306127', 	'role' => '303101', 	'resource' => '305127', 													])
            ->create([	'id' => '306128', 	'role' => '303101', 	'resource' => '305128', 													])
            ->create([	'id' => '306129', 	'role' => '303101', 	'resource' => '305129', 													])
            ->create([	'id' => '306130', 	'role' => '303101', 	'resource' => '305130', 													])
            ->create([	'id' => '306131', 	'role' => '303101', 	'resource' => '305131', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
