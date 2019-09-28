<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class GroupUserTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\GroupUser::query()
            ->create([	'id' => '302101', 	'group' => '1', 	'user' => '300101', 													])
            ->create([	'id' => '302102', 	'group' => '3', 	'user' => '300102', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
