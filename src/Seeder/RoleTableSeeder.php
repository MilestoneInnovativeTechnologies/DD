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
            ->create([	'id' => '303101', 	'name' => 'eplus_administrators', 	'description' => 'ePlus administrators role', 	'title' => 'ePlus Administrator', 												])
            ->create([	'id' => '303102', 	'name' => 'eplus_accountant', 	'description' => 'ePlus accountant role', 	'title' => 'ePlus Accountant', 												])
            ->create([	'id' => '303103', 	'name' => 'eplus_salesExecutive', 	'description' => 'ePlus sales executive', 	'title' => 'ePlus Sales Executive', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
