<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class RoleTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\Role::query()
            ->create([	'id' => '302101', 	'name' => 'eplus_administrators', 	'description' => 'ePlus administrators role', 	'title' => 'Administrator', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
