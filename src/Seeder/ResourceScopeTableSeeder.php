<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceScopeTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceScope::query()
            ->create([	'id' => '307101', 	'resource' => '305101', 	'name' => 'SalesExecutives', 	'description' => 'User where has group reference as SLS', 	'method' => 'salesExecutive', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
