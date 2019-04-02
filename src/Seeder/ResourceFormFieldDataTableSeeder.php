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
            ->create([	'id' => '310101', 	'form_field' => '309101', 	'attribute' => 'name', 													])
            ->create([	'id' => '310102', 	'form_field' => '309102', 	'attribute' => 'status', 													])
            ->create([	'id' => '310103', 	'form_field' => '309103', 	'attribute' => 'name', 													])
            ->create([	'id' => '310104', 	'form_field' => '309104', 	'attribute' => 'status', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
