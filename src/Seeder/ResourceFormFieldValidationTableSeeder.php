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
            ->create([	'id' => '315101', 	'form_field' => '310101', 	'rule' => 'required', 	'message' => 'Name is mandatory', 												])
            ->create([	'id' => '315102', 	'form_field' => '310103', 	'rule' => 'required', 	'message' => 'Name is mandatory', 												])
            ->create([	'id' => '315103', 	'form_field' => '310105', 	'rule' => 'required', 	'message' => 'Name is mandatory', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
