<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldDataTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormFieldData::query()
            ->create([	'id' => '311101', 	'form_field' => '310101', 	'attribute' => 'name', 													])
            ->create([	'id' => '311102', 	'form_field' => '310102', 	'attribute' => 'status', 													])
            ->create([	'id' => '311103', 	'form_field' => '310103', 	'attribute' => 'name', 													])
            ->create([	'id' => '311104', 	'form_field' => '310104', 	'attribute' => 'status', 													])
            ->create([	'id' => '311105', 	'form_field' => '310105', 	'attribute' => 'name', 													])
            ->create([	'id' => '311106', 	'form_field' => '310106', 	'attribute' => 'value', 													])
            ->create([	'id' => '311107', 	'form_field' => '310107', 	'attribute' => 'status', 													])
            ->create([	'id' => '311108', 	'form_field' => '310108', 	'attribute' => 'description', 													])
            ->create([	'id' => '311109', 	'form_field' => '310109', 	'attribute' => 'user', 													])
            ->create([	'id' => '311110', 	'form_field' => '310110', 	'attribute' => 'setting', 													])
            ->create([	'id' => '311111', 	'form_field' => '310111', 	'attribute' => 'value', 													])
            ->create([	'id' => '311112', 	'form_field' => '310112', 	'attribute' => 'status', 													])
            ->create([	'id' => '311113', 	'form_field' => '310113', 	'attribute' => 'user', 													])
            ->create([	'id' => '311114', 	'form_field' => '310114', 	'attribute' => 'store', 													])
            ->create([	'id' => '311115', 	'form_field' => '310115', 	'attribute' => 'area', 													])
            ->create([	'id' => '311116', 	'form_field' => '310116', 	'attribute' => 'status', 													])
            ->create([	'id' => '311117', 	'form_field' => '310117', 	'attribute' => 'product', 													])
            ->create([	'id' => '311118', 	'form_field' => '310118', 	'attribute' => 'image01', 													])
            ->create([	'id' => '311119', 	'form_field' => '310119', 	'attribute' => 'image02', 													])
            ->create([	'id' => '311120', 	'form_field' => '310120', 	'attribute' => 'image03', 													])
            ->create([	'id' => '311121', 	'form_field' => '310121', 	'attribute' => 'image04', 													])
            ->create([	'id' => '311122', 	'form_field' => '310122', 	'attribute' => 'image05', 													])
            ->create([	'id' => '311123', 	'form_field' => '310123', 	'attribute' => 'default', 													])
            ->create([	'id' => '311124', 	'form_field' => '310124', 	'attribute' => 'fncode', 													])
            ->create([	'id' => '311125', 	'form_field' => '310125', 	'attribute' => 'user', 													])
            ->create([	'id' => '311126', 	'form_field' => '310126', 	'attribute' => 'store', 													])
            ->create([	'id' => '311127', 	'form_field' => '310127', 	'attribute' => 'start_num', 													])
            ->create([	'id' => '311128', 	'form_field' => '310128', 	'attribute' => 'end_num', 													])
            ->create([	'id' => '311129', 	'form_field' => '310129', 	'attribute' => 'start_num', 													])
            ->create([	'id' => '311130', 	'form_field' => '310130', 	'attribute' => 'end_num', 													])
            ->create([	'id' => '311131', 	'form_field' => '310131', 	'attribute' => 'current', 													])
            ->create([	'id' => '311132', 	'form_field' => '310132', 	'attribute' => 'progress', 													])
            ->create([	'id' => '311133', 	'form_field' => '310133', 	'attribute' => 'status', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
