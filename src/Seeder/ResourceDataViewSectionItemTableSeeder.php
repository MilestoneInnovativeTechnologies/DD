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
            ->create([	'id' => '331102', 	'section' => '330101', 	'label' => 'Default Value', 	'attribute' => 'value', 												])
            ->create([	'id' => '331103', 	'section' => '330101', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331104', 	'section' => '330102', 	'label' => 'Details', 	'attribute' => 'description', 												])
            ->create([	'id' => '331105', 	'section' => '330103', 	'label' => 'User', 	'attribute' => 'name', 	'relation' => '308111', 											])
            ->create([	'id' => '331106', 	'section' => '330103', 	'label' => 'Setings', 	'attribute' => 'name', 	'relation' => '308109', 											])
            ->create([	'id' => '331107', 	'section' => '330103', 	'label' => 'Value', 	'attribute' => 'value', 												])
            ->create([	'id' => '331108', 	'section' => '330103', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331109', 	'section' => '330104', 	'label' => 'Executive', 	'attribute' => 'name', 	'relation' => '308115', 											])
            ->create([	'id' => '331110', 	'section' => '330104', 	'label' => 'Store', 	'attribute' => 'name', 	'relation' => '308114', 											])
            ->create([	'id' => '331111', 	'section' => '330104', 	'label' => 'Area', 	'attribute' => 'name', 	'relation' => '308113', 											])
            ->create([	'id' => '331112', 	'section' => '330104', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331113', 	'section' => '330105', 	'label' => 'Image 01', 	'attribute' => 'image01', 												])
            ->create([	'id' => '331114', 	'section' => '330105', 	'label' => 'Image 02', 	'attribute' => 'image02', 												])
            ->create([	'id' => '331115', 	'section' => '330105', 	'label' => 'Image 03', 	'attribute' => 'image03', 												])
            ->create([	'id' => '331116', 	'section' => '330105', 	'label' => 'Image 04', 	'attribute' => 'image04', 												])
            ->create([	'id' => '331117', 	'section' => '330105', 	'label' => 'Image 05', 	'attribute' => 'image05', 												])
            ->create([	'id' => '331118', 	'section' => '330106', 	'label' => 'Code', 	'attribute' => 'code', 												])
            ->create([	'id' => '331119', 	'section' => '330106', 	'label' => 'User', 	'attribute' => 'name', 	'relation' => '308134', 											])
            ->create([	'id' => '331120', 	'section' => '330106', 	'label' => 'Store', 	'attribute' => 'name', 	'relation' => '308135', 											])
            ->create([	'id' => '331121', 	'section' => '330106', 	'label' => 'Start', 	'attribute' => 'start_num', 												])
            ->create([	'id' => '331122', 	'section' => '330106', 	'label' => 'End', 	'attribute' => 'end_num', 												])
            ->create([	'id' => '331123', 	'section' => '330107', 	'label' => 'Quantity', 	'attribute' => 'quantity', 												])
            ->create([	'id' => '331124', 	'section' => '330107', 	'label' => 'Current', 	'attribute' => 'current', 												])
            ->create([	'id' => '331125', 	'section' => '330107', 	'label' => 'Progress', 	'attribute' => 'progress', 												])
            ->create([	'id' => '331126', 	'section' => '330107', 	'label' => 'Status', 	'attribute' => 'status', 												])
            ->create([	'id' => '331127', 	'section' => '330108', 	'label' => 'Name', 	'attribute' => 'name', 												])
            ->create([	'id' => '331128', 	'section' => '330108', 	'label' => 'ICON', 	'attribute' => 'icon', 												])
            ->create([	'id' => '331129', 	'section' => '330108', 	'label' => 'Home display text', 	'attribute' => 'home_display', 												])
            ->create([	'id' => '331130', 	'section' => '330108', 	'label' => 'Drawer display text', 	'attribute' => 'drawer_display', 												])
            ->create([	'id' => '331131', 	'section' => '330108', 	'label' => 'Display Order', 	'attribute' => 'order', 												])
            ->create([	'id' => '331132', 	'section' => '330108', 	'label' => 'Status', 	'attribute' => 'status', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
