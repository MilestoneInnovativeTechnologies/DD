<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class MenuTypeTableSeeder extends Seeder
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
        \Milestone\SS\Model\MenuType::truncate()
            ->create([	'id' => '1', 	'name' => 'PURCHASE', 	'display_name' => 'PURCHASE', 	'fncodes' => 'PUR1,PUR2,PUR3,PUR4,PUR5', 												])
            ->create([	'id' => '2', 	'name' => 'PURCHASE RETURN', 	'display_name' => 'PURCHASE RETURN', 	'fncodes' => 'PR1,PR2,PR3', 												])
            ->create([	'id' => '3', 	'name' => 'PURCHASE ORDER', 	'display_name' => 'PURCHASE ORDER', 	'fncodes' => 'PO1', 												])
            ->create([	'id' => '4', 	'name' => 'PAYMENT', 	'display_name' => 'PAYMENT', 	'fncodes' => 'CP1,BP1,BP2', 												])
            ->create([	'id' => '5', 	'name' => 'SALES', 	'display_name' => 'SALES', 	'fncodes' => 'SL1,SL2,SL3,SL4,SL5', 												])
            ->create([	'id' => '6', 	'name' => 'SALES RETURN', 	'display_name' => 'SALES RETURN', 	'fncodes' => 'SR1,SR2,SR3', 												])
            ->create([	'id' => '7', 	'name' => 'SALES ORDER', 	'display_name' => 'SALES ORDER', 	'fncodes' => 'SO1,SO2', 												])
            ->create([	'id' => '8', 	'name' => 'RECEIPT', 	'display_name' => 'RECEIPT', 	'fncodes' => 'CR1,BR1,BR2', 												])
            ->create([	'id' => '9', 	'name' => 'MATERIAL TRANSFER', 	'display_name' => 'MATERIAL TRANSFER', 	'fncodes' => 'MT1,MT2', 												])
            ->create([	'id' => '10', 	'name' => 'BRANCH TRANSFER', 	'display_name' => 'BRANCH TRANSFER', 	'fncodes' => 'MT3,MT4', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
