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
                SettingTableSeeder::class,
                FiscalyearmasterTableSeeder::class,
                FunctiondetailTableSeeder::class,
                ProductGroupMasterTableSeeder::class,
                ProductTableSeeder::class,
                ProductGroupTableSeeder::class,
                ProductImageTableSeeder::class,
                PricelistTableSeeder::class,
                PricelistProductTableSeeder::class,
                StoreTableSeeder::class,
                AreaTableSeeder::class,
                AreaUserTableSeeder::class,
                UserSettingTableSeeder::class,
                UserStoreAreaTableSeeder::class,
                TransactionTableSeeder::class,
                TransactionDetailTableSeeder::class,
                DDataTableSeeder::class,
                SalesOrderTableSeeder::class,
                SalesOrderItemTableSeeder::class,
                StockTransferTableSeeder::class,
                ReceiptTableSeeder::class,
                FnReserveTableSeeder::class,
                SalesOrderSaleTableSeeder::class,
                WBinTableSeeder::class,
            ]);
        }
    }
