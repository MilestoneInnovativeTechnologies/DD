<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceListScopeTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceListScope::query()
            ->create([	'id' => '323101', 	'resource_list' => '322104', 	'scope' => '307101', 													])
            ->create([	'id' => '323102', 	'resource_list' => '322111', 	'scope' => '307109', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
