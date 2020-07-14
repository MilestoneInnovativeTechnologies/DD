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
            ->create([	'id' => '9', 	'name' => 'advance_sale_container_width', 	'description' => 'Container width in percentage', 	'value' => '99', 												])
            ->create([	'id' => '10', 	'name' => 'advance_sale_left_portion_width', 	'description' => 'Width to be allocated for the left portion', 	'value' => '440', 												])
            ->create([	'id' => '11', 	'name' => 'advance_sale_space_between_left_portion_and_right_portion', 	'description' => 'The space between left and right portions', 	'value' => '10', 												])
            ->create([	'id' => '12', 	'name' => 'advance_sale_items_container_padding', 	'description' => 'The padding amount of  container where Filter, Items and Pagination exists', 	'value' => '10', 												])
            ->create([	'id' => '13', 	'name' => 'advance_sale_main_filter_width', 	'description' => 'Width of main filter - right to container', 	'value' => '110', 												])
            ->create([	'id' => '14', 	'name' => 'advance_sale_secondary_filter_height', 	'description' => 'Height of secondary filter - top to container', 	'value' => '70', 												])
            ->create([	'id' => '15', 	'name' => 'advance_sale_item_with_to_height_ratio', 	'description' => 'Product list item - width to height ratio', 	'value' => '1.35', 												])
            ->create([	'id' => '16', 	'name' => 'advance_sale_items_per_page', 	'description' => 'Items to be shown in one page', 	'value' => '100', 												])
            ->create([	'id' => '17', 	'name' => 'advance_sale_items_per_row', 	'description' => 'Items to be shown in one row', 	'value' => '5', 												])
            ->create([	'id' => '18', 	'name' => 'advance_sale_space_between_each_item', 	'description' => 'The space between each items', 	'value' => '2', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
