<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionMethodTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceActionMethod::query()
            ->create([	'id' => '332101', 	'resource_action' => '331101', 	'type' => 'Form', 	'idn1' => '308101', 												])
            ->create([	'id' => '332102', 	'resource_action' => '331102', 	'type' => 'List', 	'idn1' => '321101', 												])
            ->create([	'id' => '332103', 	'resource_action' => '331103', 	'type' => 'Form', 	'idn1' => '308101', 												])
            ->create([	'id' => '332104', 	'resource_action' => '331104', 	'type' => 'List', 	'idn1' => '321102', 												])
            ->create([	'id' => '332105', 	'resource_action' => '331105', 	'type' => 'FormWithData', 	'idn1' => '308101', 	'idn2' => '326101', 											])
            ->create([	'id' => '332106', 	'resource_action' => '331106', 	'type' => 'FormWithData', 	'idn1' => '308102', 	'idn2' => '326102', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
