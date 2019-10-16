<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceFormTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceForm::query()
            ->create([	'id' => '309101', 	'resource' => '305105', 	'name' => 'AddNewSetting', 	'description' => 'Add a new setting, the value mentioned will be deault to all users', 	'title' => 'Settings', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309102', 	'resource' => '305117', 	'name' => 'AddNewUserSetting', 	'description' => 'Add new user setting', 	'title' => 'User Setting', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309103', 	'resource' => '305117', 	'name' => 'ChangeUserSettingStatus', 	'description' => 'Form to update user settings status', 	'title' => 'Change Status', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309104', 	'resource' => '305118', 	'name' => 'AddUserStoreAreaForm', 	'description' => 'Form to add user store area', 	'title' => 'User, Store and Area', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309105', 	'resource' => '305110', 	'name' => 'AddProductImage', 	'description' => 'Form to add product images', 	'title' => 'Product Images', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309106', 	'resource' => '305127', 	'name' => 'AddFNReserves', 	'description' => 'Form to add function reserves', 	'title' => 'Function Reserves', 	'action_text' => 'Save', 										])
            ->create([	'id' => '309107', 	'resource' => '305127', 	'name' => 'UpdateReserves', 	'description' => 'Form to update reserves', 	'title' => 'Function Reserves', 	'action_text' => 'Update', 										])
            ->create([	'id' => '309108', 	'resource' => '305104', 	'name' => 'UpdateMenu', 	'description' => 'Form to update menu details', 	'title' => 'Menu', 	'action_text' => 'Update', 										])
            ->create([	'id' => '309109', 	'resource' => '305128', 	'name' => 'NewExecutiveLoginMap', 	'description' => 'Form to map a user to login', 	'title' => 'Map Executive', 	'action_text' => 'Set', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
