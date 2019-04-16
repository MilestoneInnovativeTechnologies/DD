<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

    class SSDatabaseSeeder extends Seeder
    {
        /**
         * Run the database seeds.
         *
         * @return void
         */
        public function run()
        {
            $this->call([
                SettingTableSeeder::class,
                ProductTransactionNatureTableSeeder::class,
                ProductTransactionTypeTableSeeder::class,
            ]);
        }
    }
