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
                ProductTransactionNatureTableSeeder::class,
                ProductTransactionTypeTableSeeder::class,
                StoreProductTransactionTableSeeder::class,
                TransactionTableSeeder::class,
                TransactionDetailTableSeeder::class,
                BillDataTableSeeder::class,
                DDataTableSeeder::class,
                ChequeDetailTableSeeder::class,
                SalesOrderTableSeeder::class,
                SalesOrderItemTableSeeder::class,
                StockTransferTableSeeder::class,
                ReceiptTableSeeder::class,
                FnReserveTableSeeder::class,
                SalesOrderSaleTableSeeder::class,
                WBinTableSeeder::class,
                ImportsaleTableSeeder::class,
            ]);
        }
    }
