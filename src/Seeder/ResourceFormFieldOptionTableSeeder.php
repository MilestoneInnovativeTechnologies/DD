<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldOptionTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormFieldOption::query()
            ->create([	'id' => '311101', 	'form_field' => '309102', 	'type' => 'enum', 													])
            ->create([	'id' => '311102', 	'form_field' => '309104', 	'type' => 'enum', 													])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
