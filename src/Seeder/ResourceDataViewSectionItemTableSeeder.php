<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDataViewSectionItemTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceDataViewSectionItem::query()
            ->create([	'id' => '331101', 	'section' => '330101', 	'label' => 'Name', 	'attribute' => 'name', 												])
            ->create([	'id' => '331102', 	'section' => '330101', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331103', 	'section' => '330102', 	'label' => 'Name', 	'attribute' => 'name', 												])
            ->create([	'id' => '331104', 	'section' => '330102', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331105', 	'section' => '330103', 	'label' => 'Name', 	'attribute' => 'name', 												])
            ->create([	'id' => '331106', 	'section' => '330103', 	'label' => 'Default Value', 	'attribute' => 'value', 												])
            ->create([	'id' => '331107', 	'section' => '330103', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331108', 	'section' => '330104', 	'label' => 'Details', 	'attribute' => 'description', 												])
            ->create([	'id' => '331109', 	'section' => '330105', 	'label' => 'User', 	'attribute' => 'name', 	'relation' => '308138', 											])
            ->create([	'id' => '331110', 	'section' => '330105', 	'label' => 'Setings', 	'attribute' => 'name', 	'relation' => '308136', 											])
            ->create([	'id' => '331111', 	'section' => '330105', 	'label' => 'Value', 	'attribute' => 'value', 												])
            ->create([	'id' => '331112', 	'section' => '330105', 	'label' => 'Status', 	'attribute' => 'status', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
