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
            ->create([	'id' => '310101', 	'resource_form' => '309101', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Nature Name', 											])
            ->create([	'id' => '310102', 	'resource_form' => '309101', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '310103', 	'resource_form' => '309102', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Type Name', 											])
            ->create([	'id' => '310104', 	'resource_form' => '309102', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '310105', 	'resource_form' => '309103', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Name of Settings', 											])
            ->create([	'id' => '310106', 	'resource_form' => '309103', 	'name' => 'value', 	'type' => 'text', 	'label' => 'Default Value', 											])
            ->create([	'id' => '310107', 	'resource_form' => '309103', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '310108', 	'resource_form' => '309103', 	'name' => 'description', 	'type' => 'textarea', 	'label' => 'Description', 											])
            ->create([	'id' => '310109', 	'resource_form' => '309104', 	'name' => 'user', 	'type' => 'select', 	'label' => 'User', 											])
            ->create([	'id' => '310110', 	'resource_form' => '309104', 	'name' => 'setting', 	'type' => 'select', 	'label' => 'Setting', 											])
            ->create([	'id' => '310111', 	'resource_form' => '309104', 	'name' => 'value', 	'type' => 'text', 	'label' => 'Value', 											])
            ->create([	'id' => '310112', 	'resource_form' => '309105', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Change Status to', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
