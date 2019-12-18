<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldAttrTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormFieldAttr::query()
            ->create([	'id' => '313101', 	'form_field' => '310110', 	'name' => 'inline', 	'value' => '4', 												])
            ->create([	'id' => '313102', 	'form_field' => '310111', 	'name' => 'inline', 	'value' => '4', 												])
            ->create([	'id' => '313103', 	'form_field' => '310112', 	'name' => 'inline', 	'value' => '4', 												])
            ->create([	'id' => '313104', 	'form_field' => '310113', 	'name' => 'inline', 	'value' => '4', 												])
            ->create([	'id' => '313105', 	'form_field' => '310126', 	'name' => 'value', 	'value' => '0', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
