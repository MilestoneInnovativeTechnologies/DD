<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

    class SSDatabaseReset extends Seeder
    {
        /**
         * Run the database seeds.
         *
         * @return void
         */
        public function run()
        {
            $this->call([
                UserTableSeeder::class,
                SetupTableSeeder::class,
                TaxTableSeeder::class,
                TaxDetailTableSeeder::class,
                FiscalyearmasterTableSeeder::class,
                FunctiondetailTableSeeder::class,
                ProductgroupTableSeeder::class,
                ProductTableSeeder::class,
                PricelistTableSeeder::class,
                PricelistProductTableSeeder::class,
                StoreTableSeeder::class,
                AreaTableSeeder::class,
                AreaUserTableSeeder::class,
                UserSettingTableSeeder::class,
                UserStoreAreaTableSeeder::class,
                StoreProductTableSeeder::class,
                StoreProductTransactionTableSeeder::class,
                TransactionTableSeeder::class,
                TransactionDetailTableSeeder::class,
                BillDataTableSeeder::class,
                DDataTableSeeder::class,
                ChequeDetailTableSeeder::class,
                SalesOrderTableSeeder::class,
                SalesOrderItemTableSeeder::class,
                StockTransferTableSeeder::class,
                WBinTableSeeder::class,
            ]);
        }
    }
