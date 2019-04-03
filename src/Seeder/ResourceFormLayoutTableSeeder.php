<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormLayoutTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormLayout::query()
            ->create([	'id' => '316101', 	'resource_form' => '308103', 	'form_field' => '309105', 	'colspan' => '4', 												])
            ->create([	'id' => '316102', 	'resource_form' => '308103', 	'form_field' => '309106', 	'colspan' => '4', 												])
            ->create([	'id' => '316103', 	'resource_form' => '308103', 	'form_field' => '309107', 	'colspan' => '4', 												])
            ->create([	'id' => '316104', 	'resource_form' => '308103', 	'form_field' => '309108', 	'colspan' => '12', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
