<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ProductTransactionTypeTableSeeder extends Seeder
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
        \Milestone\SS\Model\ProductTransactionType::truncate()
            ->create([	'id' => '1', 	'name' => 'Load', 														])
            ->create([	'id' => '2', 	'name' => 'Unload', 														])
            ->create([	'id' => '3', 	'name' => 'Sale', 														])
            ->create([	'id' => '4', 	'name' => 'Return', 														])
            ->create([	'id' => '5', 	'name' => 'Other', 														])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
