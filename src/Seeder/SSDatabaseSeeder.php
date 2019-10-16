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
                SetupTableSeeder::class,
                MenuTypeTableSeeder::class,
                MenuTableSeeder::class,
                SettingTableSeeder::class,
                FiscalyearmasterTableSeeder::class,
                ProductGroupMasterTableSeeder::class,
                ProductTableSeeder::class,
                ProductGroupTableSeeder::class,
                ProductImageTableSeeder::class,
                PricelistTableSeeder::class,
                PricelistProductTableSeeder::class,
                FunctiondetailTableSeeder::class,
                StoreTableSeeder::class,
                AreaTableSeeder::class,
                AreaUserTableSeeder::class,
                UserSettingTableSeeder::class,
                UserStoreAreaTableSeeder::class,
                SalesOrderTableSeeder::class,
                SalesOrderItemTableSeeder::class,
                TransactionTableSeeder::class,
                TransactionDetailTableSeeder::class,
                DDataTableSeeder::class,
                StockTransferTableSeeder::class,
                ReceiptTableSeeder::class,
                FnReserveTableSeeder::class,
                WBinTableSeeder::class,
                UserExecutiveTableSeeder::class,
            ]);
        }
    }
