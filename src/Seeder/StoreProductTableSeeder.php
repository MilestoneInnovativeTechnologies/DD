<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class StoreProductTableSeeder extends Seeder
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
        \Milestone\SS\Model\StoreProduct::truncate()
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
