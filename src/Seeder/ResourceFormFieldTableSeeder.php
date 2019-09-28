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
            ->create([	'id' => '310113', 	'resource_form' => '309106', 	'name' => 'user', 	'type' => 'select', 	'label' => 'Sales Executive', 											])
            ->create([	'id' => '310114', 	'resource_form' => '309106', 	'name' => 'store', 	'type' => 'select', 	'label' => 'Store', 											])
            ->create([	'id' => '310115', 	'resource_form' => '309106', 	'name' => 'area', 	'type' => 'select', 	'label' => 'Area', 											])
            ->create([	'id' => '310116', 	'resource_form' => '309106', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
            ->create([	'id' => '310117', 	'resource_form' => '309107', 	'name' => 'product', 	'type' => 'select', 	'label' => 'Product', 											])
            ->create([	'id' => '310118', 	'resource_form' => '309107', 	'name' => 'image01', 	'type' => 'file', 	'label' => 'Image 01', 											])
            ->create([	'id' => '310119', 	'resource_form' => '309107', 	'name' => 'image02', 	'type' => 'file', 	'label' => 'Image 02', 											])
            ->create([	'id' => '310120', 	'resource_form' => '309107', 	'name' => 'image03', 	'type' => 'file', 	'label' => 'Image 03', 											])
            ->create([	'id' => '310121', 	'resource_form' => '309107', 	'name' => 'image04', 	'type' => 'file', 	'label' => 'Image 04', 											])
            ->create([	'id' => '310122', 	'resource_form' => '309107', 	'name' => 'image05', 	'type' => 'file', 	'label' => 'Image 05', 											])
            ->create([	'id' => '310123', 	'resource_form' => '309107', 	'name' => 'default', 	'type' => 'select', 	'label' => 'Set Default Image', 											])
            ->create([	'id' => '310124', 	'resource_form' => '309108', 	'name' => 'fncode', 	'type' => 'select', 	'label' => 'Select FN Code', 											])
            ->create([	'id' => '310125', 	'resource_form' => '309108', 	'name' => 'user', 	'type' => 'select', 	'label' => 'Select User', 											])
            ->create([	'id' => '310126', 	'resource_form' => '309108', 	'name' => 'store', 	'type' => 'select', 	'label' => 'Select Store', 											])
            ->create([	'id' => '310127', 	'resource_form' => '309108', 	'name' => 'start_num', 	'type' => 'text', 	'label' => 'Enter Sequence Start Number', 											])
            ->create([	'id' => '310128', 	'resource_form' => '309108', 	'name' => 'end_num', 	'type' => 'text', 	'label' => 'Enter Sequence End Number', 											])
            ->create([	'id' => '310129', 	'resource_form' => '309109', 	'name' => 'start_num', 	'type' => 'text', 	'label' => 'Start Num', 											])
            ->create([	'id' => '310130', 	'resource_form' => '309109', 	'name' => 'end_num', 	'type' => 'text', 	'label' => 'End Num', 											])
            ->create([	'id' => '310131', 	'resource_form' => '309109', 	'name' => 'current', 	'type' => 'text', 	'label' => 'Current', 											])
            ->create([	'id' => '310132', 	'resource_form' => '309109', 	'name' => 'progress', 	'type' => 'select', 	'label' => 'Progress', 											])
            ->create([	'id' => '310133', 	'resource_form' => '309109', 	'name' => 'status', 	'type' => 'select', 	'label' => 'Status', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
