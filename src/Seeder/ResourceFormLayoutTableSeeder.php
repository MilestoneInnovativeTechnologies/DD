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
            ->create([	'id' => '317101', 	'resource_form' => '309101', 	'form_field' => '310101', 	'colspan' => '4', 												])
            ->create([	'id' => '317102', 	'resource_form' => '309101', 	'form_field' => '310102', 	'colspan' => '4', 												])
            ->create([	'id' => '317103', 	'resource_form' => '309101', 	'form_field' => '310103', 	'colspan' => '4', 												])
            ->create([	'id' => '317104', 	'resource_form' => '309101', 	'form_field' => '310104', 	'colspan' => '12', 												])
            ->create([	'id' => '317105', 	'resource_form' => '309102', 	'form_field' => '310105', 	'colspan' => '6', 												])
            ->create([	'id' => '317106', 	'resource_form' => '309102', 	'form_field' => '310106', 	'colspan' => '6', 												])
            ->create([	'id' => '317107', 	'resource_form' => '309102', 	'form_field' => '310107', 	'colspan' => '12', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
