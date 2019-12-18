<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
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
        \Milestone\SS\Model\Setting::truncate()
            ->create([	'id' => '1', 	'name' => 'home_screen_out_standing', 	'description' => 'Customers outstanding and overdue metric should display in Home Screen', 	'value' => 'Yes', 												])
            ->create([	'id' => '2', 	'name' => 'home_screen_sales_order_progress', 	'description' => 'Sales order progress which mentions the incomplete and partially completed sales orders count', 	'value' => 'No', 												])
            ->create([	'id' => '3', 	'name' => 'receipts_daily_weekly_metric_on_receipt_index', 	'description' => 'Receipts daily and weekly total amount display metric on receipts index window.', 	'value' => 'No', 												])
            ->create([	'id' => '4', 	'name' => 'receipts_monthly_metric_on_receipt_index', 	'description' => 'Receipts monthly total amount display metric on receipts index window.', 	'value' => 'Yes', 												])
            ->create([	'id' => '5', 	'name' => 'daily_sales_total_amount_in_sales_index', 	'description' => 'Total Sales amount in a day to be displayed in sales transaction index window', 	'value' => 'Yes', 												])
            ->create([	'id' => '6', 	'name' => 'weekly_and_monthly_sales_total_amount_in_sales_index', 	'description' => 'Total Sales amount in the current week and month to be displayed in sales transaction index window', 	'value' => 'No', 												])
            ->create([	'id' => '7', 	'name' => 'daily_sales_total_amount_in_sales_order_index', 	'description' => 'Total Sales amount in a day to be displayed in sales transaction index window', 	'value' => 'Yes', 												])
            ->create([	'id' => '8', 	'name' => 'weekly_and_monthly_sales_total_amount_in_sales_order_index', 	'description' => 'Total Sales amount in the current week and month to be displayed in sales transaction index window', 	'value' => 'No', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
