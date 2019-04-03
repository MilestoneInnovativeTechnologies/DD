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
            ->create([	'id' => '1', 	'name' => 'Sales Function Code', 	'description' => 'Function code used in sales form', 	'value' => 'SL1', 												])
            ->create([	'id' => '2', 	'name' => 'Sales Return Function Code', 	'description' => 'Function code used in sales return form', 	'value' => 'SL2', 												])
            ->create([	'id' => '3', 	'name' => 'Sales Order Function Code', 	'description' => 'Function code used in sales order form', 	'value' => 'SO1', 												])
            ->create([	'id' => '4', 	'name' => 'Cash Receipt Function Code', 	'description' => 'Function code used in cash receipt form', 	'value' => 'CR1', 												])
            ->create([	'id' => '5', 	'name' => 'Cheque Receipt Function Code', 	'description' => 'Function code used in cheque receipt form', 	'value' => 'BR1', 												])
            ->create([	'id' => '6', 	'name' => 'Stock Transfer IN Function Code', 	'description' => 'Function code used in stock transfer IN form', 	'value' => 'MT1', 												])
            ->create([	'id' => '7', 	'name' => 'Stock Transfer OUT Function Code', 	'description' => 'Function code used in stock transfer OUT form', 	'value' => 'MT2', 												])
            ->create([	'id' => '8', 	'name' => 'Sales Reserve Count', 	'description' => 'No of document numbers to be reserved, while selling in no network area', 	'value' => '0', 												])
            ->create([	'id' => '9', 	'name' => 'Sales Order Reserve Count', 	'description' => 'No of document numbers to be reserved, while selling in no network area', 	'value' => '0', 												])
            ->create([	'id' => '10', 	'name' => 'Recent Sales in Product Detail', 	'description' => 'No of items to be listed in a record data table', 	'value' => '5', 												])
            ->create([	'id' => '11', 	'name' => 'Recent Returns in Product Detail', 	'description' => 'No of items to be listed in a record data table', 	'value' => '5', 												])
            ->create([	'id' => '12', 	'name' => 'Recent Sales in Customer Detail', 	'description' => 'No of items to be listed in a record data table', 	'value' => '5', 												])
            ->create([	'id' => '13', 	'name' => 'Recent Payments in Customer Detail', 	'description' => 'No of items to be listed in a record data table', 	'value' => '5', 												])
            ->create([	'id' => '14', 	'name' => 'Recent Returns in Customer Detail', 	'description' => 'No of items to be listed in a record data table', 	'value' => '5', 												])
            ->create([	'id' => '15', 	'name' => 'Recent Payments in Payments', 	'description' => 'No of items to be listed in a record data table', 	'value' => '10', 												])
            ->create([	'id' => '16', 	'name' => 'Recent Sales in Sales', 	'description' => 'No of items to be listed in a record data table', 	'value' => '10', 												])
            ->create([	'id' => '17', 	'name' => 'Recent Returns in Return', 	'description' => 'No of items to be listed in a record data table', 	'value' => '10', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
