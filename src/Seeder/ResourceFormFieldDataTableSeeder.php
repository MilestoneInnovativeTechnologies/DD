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
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
