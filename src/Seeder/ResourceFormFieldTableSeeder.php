<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormField::query()
            ->create([	'id' => '309101', 	'resource_form' => '308101', 	'name' => 'name', 	'type' => 'Text', 	'label' => 'Nature Name', 											])
            ->create([	'id' => '309102', 	'resource_form' => '308102', 	'name' => 'name', 	'type' => 'Text', 	'label' => 'Type Name', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
