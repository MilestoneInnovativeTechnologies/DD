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
            ->create([	'id' => '337101', 	'resource' => '305118', 	'list' => '332102', 	'create' => '332101', 		'update' => '332105', 										])
            ->create([	'id' => '337102', 	'resource' => '305119', 	'list' => '332104', 	'create' => '332103', 		'update' => '332106', 										])
            ->create([	'id' => '337103', 	'resource' => '305103', 	'list' => '332108', 	'create' => '332107', 	'read' => '332109', 	'update' => '332110', 										])
            ->create([	'id' => '337104', 	'resource' => '305101', 	'list' => '332111', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
