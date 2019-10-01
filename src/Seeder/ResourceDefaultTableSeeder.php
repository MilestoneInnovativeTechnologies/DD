<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDefaultTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceDefault::query()
            ->create([	'id' => '337101', 	'resource' => '305105', 	'list' => '332102', 	'create' => '332101', 	'read' => '332103', 	'update' => '332104', 										])
            ->create([	'id' => '337102', 	'resource' => '305117', 	'list' => '332112', 	'create' => '332108', 	'read' => '332114', 	'update' => '332113', 										])
            ->create([	'id' => '337103', 	'resource' => '305118', 	'list' => '332116', 	'create' => '332115', 	'read' => '332117', 	'update' => '332118', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
