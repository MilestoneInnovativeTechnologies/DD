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
            ->create([	'id' => '309101', 	'resource_form' => '308101', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Nature Name', 											])
            ->create([	'id' => '309102', 	'resource_form' => '308101', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '309103', 	'resource_form' => '308102', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Type Name', 											])
            ->create([	'id' => '309104', 	'resource_form' => '308102', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '309105', 	'resource_form' => '308103', 	'name' => 'name', 	'type' => 'text', 	'label' => 'Name of Settings', 											])
            ->create([	'id' => '309106', 	'resource_form' => '308103', 	'name' => 'value', 	'type' => 'text', 	'label' => 'Default Value', 											])
            ->create([	'id' => '309107', 	'resource_form' => '308103', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '309108', 	'resource_form' => '308103', 	'name' => 'description', 	'type' => 'textarea', 	'label' => 'Description', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
