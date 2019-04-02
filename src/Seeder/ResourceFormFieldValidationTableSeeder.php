<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormFieldValidationTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceFormFieldValidation::query()
            ->create([	'id' => '314101', 	'form_field' => '309101', 	'rule' => 'required', 	'message' => 'Name is mandatory', 												])
            ->create([	'id' => '314102', 	'form_field' => '309103', 	'rule' => 'required', 	'message' => 'Name is mandatory', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
