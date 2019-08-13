<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceAction::query()
            ->create([	'id' => '332101', 	'resource' => '305115', 	'name' => 'ProductTransactionNewNature', 	'description' => 'Nature of the product in a transaction.. Fresh, Expired, Damaged etc', 			'menu' => 'New', 									])
            ->create([	'id' => '332102', 	'resource' => '305115', 	'name' => 'ProductTransactionViewNature', 	'description' => 'List all natures a product transaction havs', 			'menu' => 'List', 									])
            ->create([	'id' => '332103', 	'resource' => '305116', 	'name' => 'ProductTransactionNewType', 	'description' => 'Type of transaction like Loading, Unloading, Sales', 			'menu' => 'New', 									])
            ->create([	'id' => '332104', 	'resource' => '305116', 	'name' => 'ProductTransactionViewTypes', 	'description' => 'List all available types of product transaction', 			'menu' => 'List', 									])
            ->create([	'id' => '332105', 	'resource' => '305115', 	'name' => 'UpdateProductTransactionNature', 	'description' => 'Edit Nature details, change status', 	'title' => 'Update', 	'type' => 'primary', 										])
            ->create([	'id' => '332106', 	'resource' => '305116', 	'name' => 'UpdateProductTransactionType', 	'description' => 'Change type status, update name ', 	'title' => 'Update', 	'type' => 'primary', 										])
            ->create([	'id' => '332107', 	'resource' => '305103', 	'name' => 'NewSettings', 	'description' => 'Create new setting', 			'menu' => 'New', 									])
            ->create([	'id' => '332108', 	'resource' => '305103', 	'name' => 'ListSettings', 	'description' => 'List all settings', 			'menu' => 'List All', 									])
            ->create([	'id' => '332109', 	'resource' => '305103', 	'name' => 'ViewSettingsDetails', 	'description' => 'Data view of a settings', 	'title' => 'Details', 	'type' => 'primary', 										])
            ->create([	'id' => '332110', 	'resource' => '305103', 	'name' => 'UpdateSettings', 	'description' => 'Edit settings details', 	'title' => 'Edit', 	'type' => 'primary', 										])
            ->create([	'id' => '332111', 	'resource' => '305101', 	'name' => 'UsersList', 	'description' => 'List all available users', 			'menu' => 'List All', 									])
            ->create([	'id' => '332112', 	'resource' => '305101', 	'name' => 'UserSettingsListAction', 	'description' => 'List all settings of a user', 	'title' => 'View Settings', 	'type' => 'primary', 										])
            ->create([	'id' => '332113', 	'resource' => '305101', 	'name' => 'ListSalesExecutiveAction', 	'description' => 'Action to list all sales executive', 			'menu' => 'Sales Executives', 									])
            ->create([	'id' => '332114', 	'resource' => '305112', 	'name' => 'AddNewUserSettingAction', 	'description' => 'Action to call form to add user setting', 			'menu' => 'New User Setting', 									])
            ->create([	'id' => '332115', 	'resource' => '305101', 	'name' => 'AddSettingsForSelectedUser', 	'description' => 'Action to call a form to add a setting for the selected user', 	'title' => 'Add Setting', 	'type' => 'primary', 										])
            ->create([	'id' => '332116', 	'resource' => '305103', 	'name' => 'SettingsUsersListAction', 	'description' => 'List all users having this setting', 	'title' => 'View Users', 	'type' => 'primary', 										])
            ->create([	'id' => '332117', 	'resource' => '305103', 	'name' => 'AddUserForSelectedSetting', 	'description' => 'Action to call a form to add a user for the selected setting', 	'title' => 'Add User', 	'type' => 'primary', 										])
            ->create([	'id' => '332118', 	'resource' => '305112', 	'name' => 'ListAllUserSettingsAction', 	'description' => 'Action to list all user settings', 			'menu' => 'List All', 									])
            ->create([	'id' => '332119', 	'resource' => '305112', 	'name' => 'ChangeUserSettingStatusAction', 	'description' => 'Action to call the form to change user setting status', 	'title' => 'Change Status', 	'type' => 'primary', 										])
            ->create([	'id' => '332120', 	'resource' => '305112', 	'name' => 'ViewUserSettingsDetails', 	'description' => 'Action to call resource data of user settings', 	'title' => 'View Details', 	'type' => 'primary', 										])
            ->create([	'id' => '332121', 	'resource' => '305113', 	'name' => 'AddUserStoreAreaRecordAction', 	'description' => 'Action to call form to add user store area', 			'menu' => 'New', 									])
            ->create([	'id' => '332122', 	'resource' => '305113', 	'name' => 'ListUserStoreAreaRecordAction', 	'description' => 'Action to list all user store area', 			'menu' => 'List All', 									])
            ->create([	'id' => '332123', 	'resource' => '305113', 	'name' => 'ViewUserStoreAreaAction', 	'description' => 'Action to view user store and area', 	'title' => 'View Details', 	'type' => 'primary', 										])
            ->create([	'id' => '332124', 	'resource' => '305113', 	'name' => 'EditUserStoreAreaAction', 	'description' => 'Action to call a form to update user store area', 	'title' => 'Edit', 	'type' => 'primary', 										])
            ->create([	'id' => '332125', 	'resource' => '305110', 	'name' => 'ListAreaAction', 	'description' => 'Action to list all areas', 			'menu' => 'List All', 									])
            ->create([	'id' => '332126', 	'resource' => '305109', 	'name' => 'ListStoreAction', 	'description' => 'Action to list all stores', 			'menu' => 'List All', 									])
            ->create([	'id' => '332127', 	'resource' => '305101', 	'name' => 'ListStoreAreaOfUserAction', 	'description' => 'Action to list all store and area of the selected user', 	'title' => 'View Store and Area', 	'type' => 'primary', 										])
            ->create([	'id' => '332128', 	'resource' => '305101', 	'name' => 'AddStoreAreaForUser', 	'description' => 'Action to call the form to add store area for a user', 	'title' => 'Add Store and Area', 	'type' => 'primary', 										])
            ->create([	'id' => '332129', 	'resource' => '305110', 	'name' => 'ListStoreAndUserOfArea', 	'description' => 'Action to list all Store and User assigned to selected area', 	'title' => 'View Store and User', 	'type' => 'primary', 										])
            ->create([	'id' => '332130', 	'resource' => '305110', 	'name' => 'AssignStoreAndUserForArea', 	'description' => 'Action to call the form to assign store and user for an area', 	'title' => 'Assign Store and Executive', 	'type' => 'primary', 										])
            ->create([	'id' => '332131', 	'resource' => '305109', 	'name' => 'ListUsersAssigned', 	'description' => 'Action to list all users assigned to a store', 	'title' => 'Manage Executives Assigned', 	'type' => 'primary', 										])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
