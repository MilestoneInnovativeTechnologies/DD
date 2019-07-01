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
            ->create([	'id' => '1', 	'name' => 'SALESB2CFNCODE', 	'description' => 'Function code used in sales form', 	'value' => 'SL1', 												])
            ->create([	'id' => '2', 	'name' => 'SALESB2BFNCODE', 	'description' => 'Function code used in sales form B2C', 	'value' => 'SL2', 												])
            ->create([	'id' => '3', 	'name' => 'SALESRETURNFNCODE', 	'description' => 'Function code used in sales return form', 	'value' => 'SR1', 												])
            ->create([	'id' => '4', 	'name' => 'SALESORDERFNCODE', 	'description' => 'Function code used in sales order form', 	'value' => 'SO1', 												])
            ->create([	'id' => '5', 	'name' => 'CASHRECEIPTFNCODE', 	'description' => 'Function code used in cash receipt form', 	'value' => 'CR1', 												])
            ->create([	'id' => '6', 	'name' => 'CHEQUERECEIPTFNCODE', 	'description' => 'Function code used in cheque receipt form', 	'value' => 'BR1', 												])
            ->create([	'id' => '7', 	'name' => 'STOCKTRANSFERINFNCODE', 	'description' => 'Function code used in stock transfer IN form', 	'value' => 'MT1', 												])
            ->create([	'id' => '8', 	'name' => 'STOCKTRANSFEROUTFNCODE', 	'description' => 'Function code used in stock transfer OUT form', 	'value' => 'MT2', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
