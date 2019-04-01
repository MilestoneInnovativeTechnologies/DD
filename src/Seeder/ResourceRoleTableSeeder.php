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
            ->create([	'id' => '305101', 	'role' => '302101', 	'resource' => '304101', 													])
            ->create([	'id' => '305102', 	'role' => '302101', 	'resource' => '304102', 													])
            ->create([	'id' => '305103', 	'role' => '302101', 	'resource' => '304103', 													])
            ->create([	'id' => '305104', 	'role' => '302101', 	'resource' => '304104', 													])
            ->create([	'id' => '305105', 	'role' => '302101', 	'resource' => '304105', 													])
            ->create([	'id' => '305106', 	'role' => '302101', 	'resource' => '304106', 													])
            ->create([	'id' => '305107', 	'role' => '302101', 	'resource' => '304107', 													])
            ->create([	'id' => '305108', 	'role' => '302101', 	'resource' => '304108', 													])
            ->create([	'id' => '305109', 	'role' => '302101', 	'resource' => '304109', 													])
            ->create([	'id' => '305110', 	'role' => '302101', 	'resource' => '304110', 													])
            ->create([	'id' => '305111', 	'role' => '302101', 	'resource' => '304111', 													])
            ->create([	'id' => '305112', 	'role' => '302101', 	'resource' => '304112', 													])
            ->create([	'id' => '305113', 	'role' => '302101', 	'resource' => '304113', 													])
            ->create([	'id' => '305114', 	'role' => '302101', 	'resource' => '304114', 													])
            ->create([	'id' => '305115', 	'role' => '302101', 	'resource' => '304115', 													])
            ->create([	'id' => '305116', 	'role' => '302101', 	'resource' => '304116', 													])
            ->create([	'id' => '305117', 	'role' => '302101', 	'resource' => '304117', 													])
            ->create([	'id' => '305118', 	'role' => '302101', 	'resource' => '304118', 													])
            ->create([	'id' => '305119', 	'role' => '302101', 	'resource' => '304119', 													])
            ->create([	'id' => '305120', 	'role' => '302101', 	'resource' => '304120', 													])
            ->create([	'id' => '305121', 	'role' => '302101', 	'resource' => '304121', 													])
            ->create([	'id' => '305122', 	'role' => '302101', 	'resource' => '304122', 													])
            ->create([	'id' => '305123', 	'role' => '302101', 	'resource' => '304123', 													])
            ->create([	'id' => '305124', 	'role' => '302101', 	'resource' => '304124', 													])
            ->create([	'id' => '305125', 	'role' => '302101', 	'resource' => '304125', 													])
            ->create([	'id' => '305126', 	'role' => '302101', 	'resource' => '304126', 													])
            ->create([	'id' => '305127', 	'role' => '302101', 	'resource' => '304127', 													])
            ->create([	'id' => '305128', 	'role' => '302101', 	'resource' => '304128', 													])
            ->create([	'id' => '305129', 	'role' => '302101', 	'resource' => '304129', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
