<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class GroupRoleTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\GroupRole::query()
            ->create([	'id' => '304101', 	'group' => '301101', 	'role' => '303102', 													])
            ->create([	'id' => '304102', 	'group' => '301102', 	'role' => '303101', 													])
            ->create([	'id' => '304103', 	'group' => '301103', 	'role' => '303103', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
