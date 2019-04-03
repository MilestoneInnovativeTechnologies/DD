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
            ->create([	'id' => '310105', 	'form_field' => '309105', 	'attribute' => 'name', 													])
            ->create([	'id' => '310106', 	'form_field' => '309106', 	'attribute' => 'value', 													])
            ->create([	'id' => '310107', 	'form_field' => '309107', 	'attribute' => 'status', 													])
            ->create([	'id' => '310108', 	'form_field' => '309108', 	'attribute' => 'description', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
