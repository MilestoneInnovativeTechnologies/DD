<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class GroupTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\Group::query()
            ->create([	'id' => '301101', 	'name' => 'accountant', 	'description' => 'ePlus Accountant', 	'title' => 'Accountant', 	'reference' => 'ACC', 											])
            ->create([	'id' => '301102', 	'name' => 'administrators', 	'description' => 'ePlus Administrator', 	'title' => 'ePlus Administrators', 	'reference' => 'ADM', 											])
            ->create([	'id' => '301103', 	'name' => 'salesExecutive', 	'description' => 'ePlus Sales Executives', 	'title' => 'Sales Executives', 	'reference' => 'SLS', 											])
            ->create([	'id' => '301104', 	'name' => 'eplus_account', 	'description' => 'ePlus user accounts or customers', 	'title' => 'ePlus Accounts', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
