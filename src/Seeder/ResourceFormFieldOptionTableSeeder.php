<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldOptionTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormFieldOption::query()
            ->create([	'id' => '312101', 	'form_field' => '310102', 	'type' => 'Enum', 													])
            ->create([	'id' => '312102', 	'form_field' => '310104', 	'type' => 'Enum', 													])
            ->create([	'id' => '312103', 	'form_field' => '310107', 	'type' => 'Enum', 													])
            ->create([	'id' => '312104', 	'form_field' => '310109', 	'type' => 'List', 	'detail' => '322106', 	'value_attr' => 'id', 	'label_attr' => 'name', 	'preload' => 'Yes', 									])
            ->create([	'id' => '312105', 	'form_field' => '310110', 	'type' => 'Foreign', 		'value_attr' => 'id', 	'label_attr' => 'name', 	'preload' => 'Yes', 									])
            ->create([	'id' => '312106', 	'form_field' => '310112', 	'type' => 'Enum', 													])
            ->create([	'id' => '312107', 	'form_field' => '310113', 	'type' => 'List', 	'detail' => '322106', 	'value_attr' => 'id', 	'label_attr' => 'name', 	'preload' => 'Yes', 									])
            ->create([	'id' => '312108', 	'form_field' => '310114', 	'type' => 'Foreign', 		'value_attr' => 'id', 	'label_attr' => 'name', 	'preload' => 'Yes', 									])
            ->create([	'id' => '312109', 	'form_field' => '310115', 	'type' => 'Foreign', 		'value_attr' => 'id', 	'label_attr' => 'name', 	'preload' => 'Yes', 									])
            ->create([	'id' => '312110', 	'form_field' => '310116', 	'type' => 'Enum', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
