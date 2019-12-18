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
            ->create([	'id' => '317108', 	'resource_form' => '309110', 	'form_field' => '310138', 	'colspan' => '6', 												])
            ->create([	'id' => '317109', 	'resource_form' => '309110', 	'form_field' => '310139', 	'colspan' => '3', 												])
            ->create([	'id' => '317110', 	'resource_form' => '309110', 	'form_field' => '310140', 	'colspan' => '3', 												])
            ->create([	'id' => '317111', 	'resource_form' => '309110', 	'form_field' => '310141', 	'colspan' => '12', 												])
            ->create([	'id' => '317112', 	'resource_form' => '309110', 	'form_field' => '310142', 	'colspan' => '9', 												])
            ->create([	'id' => '317113', 	'resource_form' => '309110', 	'form_field' => '310143', 	'colspan' => '3', 												])
            ->create([	'id' => '317114', 	'resource_form' => '309110', 	'form_field' => '310144', 	'colspan' => '6', 												])
            ->create([	'id' => '317115', 	'resource_form' => '309110', 	'form_field' => '310145', 	'colspan' => '6', 												])
            ->create([	'id' => '317116', 	'resource_form' => '309110', 	'form_field' => '310146', 	'colspan' => '6', 												])
            ->create([	'id' => '317117', 	'resource_form' => '309110', 	'form_field' => '310147', 	'colspan' => '6', 												])
            ->create([	'id' => '317118', 	'resource_form' => '309110', 	'form_field' => '310148', 	'colspan' => '4', 												])
            ->create([	'id' => '317119', 	'resource_form' => '309110', 	'form_field' => '310149', 	'colspan' => '4', 												])
            ->create([	'id' => '317120', 	'resource_form' => '309110', 	'form_field' => '310150', 	'colspan' => '4', 												])
            ->create([	'id' => '317121', 	'resource_form' => '309110', 	'form_field' => '310151', 	'colspan' => '4', 												])
            ->create([	'id' => '317122', 	'resource_form' => '309110', 	'form_field' => '310152', 	'colspan' => '4', 												])
            ->create([	'id' => '317123', 	'resource_form' => '309110', 	'form_field' => '310153', 	'colspan' => '4', 												])
            ->create([	'id' => '317124', 	'resource_form' => '309110', 	'form_field' => '310154', 	'colspan' => '12', 												])
            ->create([	'id' => '317125', 	'resource_form' => '309110', 	'form_field' => '310155', 	'colspan' => '12', 												])
            ->create([	'id' => '317126', 	'resource_form' => '309111', 	'form_field' => '310156', 	'colspan' => '6', 												])
            ->create([	'id' => '317127', 	'resource_form' => '309111', 	'form_field' => '310157', 	'colspan' => '6', 												])
            ->create([	'id' => '317128', 	'resource_form' => '309111', 	'form_field' => '310158', 	'colspan' => '12', 												])
            ->create([	'id' => '317129', 	'resource_form' => '309111', 	'form_field' => '310159', 	'colspan' => '12', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
