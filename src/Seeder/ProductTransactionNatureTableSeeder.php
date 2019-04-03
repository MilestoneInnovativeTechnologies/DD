<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ProductTransactionNatureTableSeeder extends Seeder
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
        \Milestone\SS\Model\ProductTransactionNature::truncate()
            ->create([	'id' => '1', 	'name' => 'Fresh', 														])
            ->create([	'id' => '2', 	'name' => 'Damaged', 														])
            ->create([	'id' => '3', 	'name' => 'Expired', 														])
            ->create([	'id' => '4', 	'name' => 'Unsold', 														])
            ->create([	'id' => '5', 	'name' => 'Other', 														])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
