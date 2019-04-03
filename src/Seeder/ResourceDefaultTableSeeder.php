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
            ->create([	'id' => '336101', 	'resource' => '304118', 	'list' => '331102', 	'create' => '331101', 		'update' => '331105', 										])
            ->create([	'id' => '336102', 	'resource' => '304119', 	'list' => '331104', 	'create' => '331103', 		'update' => '331106', 										])
            ->create([	'id' => '336103', 	'resource' => '304103', 	'list' => '331108', 	'create' => '331107', 	'read' => '331109', 	'update' => '331110', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
