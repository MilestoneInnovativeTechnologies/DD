<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceDataTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceData::query()
            ->create([	'id' => '327101', 	'resource' => '305115', 	'name' => 'TransactionProductNatureView', 	'description' => 'View details of a product transaction nature', 	'title_field' => 'name', 											])
            ->create([	'id' => '327102', 	'resource' => '305116', 	'name' => 'TransactionProductTypeView', 	'description' => 'View details of a product transaction type', 	'title_field' => 'name', 											])
            ->create([	'id' => '327103', 	'resource' => '305103', 	'name' => 'SettingsView', 	'description' => 'View details of a settings', 	'title_field' => 'name', 											])
            ->create([	'id' => '327104', 	'resource' => '305112', 	'name' => 'UserSettingsView', 	'description' => 'View details of a user setting', 	'title_field' => 'user.name', 											])
            ->create([	'id' => '327105', 	'resource' => '305113', 	'name' => 'UserStoreAreaView', 	'description' => 'View details of user store area', 	'title_field' => 'user.name', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
