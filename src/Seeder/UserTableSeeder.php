<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\User::query()
            ->create([	'id' => '300101', 	'name' => 'Milestone Setup', 	'email' => 'setup@milestoneit.net', 	'password' => 'metalic', 												])
            ->create([	'id' => '300102', 	'name' => 'Milestone Administrator', 	'email' => 'admin@milestoneit.net', 	'password' => 'metalic', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
