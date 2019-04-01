<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceRelationTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceRelation::query()
            ->create([	'id' => '307101', 	'resource' => '304104', 	'name' => 'TaxDetail', 	'description' => 'Details and sub taxes', 	'method' => 'Detail', 	'type' => 'hasMany', 	'relate_resource' => '304105', 									])
            ->create([	'id' => '307102', 	'resource' => '304105', 	'name' => 'Tax', 	'description' => 'Detail of Tax', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '304104', 									])
            ->create([	'id' => '307103', 	'resource' => '304107', 	'name' => 'Tax', 	'description' => 'Detail of Tax', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '304104', 									])
            ->create([	'id' => '307104', 	'resource' => '304108', 	'name' => 'Belongs', 	'description' => 'Detail of main group this group belongs', 	'method' => 'Belongs', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307105', 	'resource' => '304108', 	'name' => 'Parent', 	'description' => 'The parent group details of this group', 	'method' => 'Parent', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307106', 	'resource' => '304108', 	'name' => 'Tax01', 	'description' => 'Details of Tax for this group', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '304104', 									])
            ->create([	'id' => '307107', 	'resource' => '304108', 	'name' => 'Tax02', 	'description' => 'Details of Sub Tax for this group', 	'method' => 'Tax2', 	'type' => 'belongsTo', 	'relate_resource' => '304104', 									])
            ->create([	'id' => '307108', 	'resource' => '304109', 	'name' => 'Group01', 	'description' => 'Detail of group this product belongs to via group 01', 	'method' => 'Group01', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307109', 	'resource' => '304109', 	'name' => 'Group02', 	'description' => 'Detail of group this product belongs to via group 02', 	'method' => 'Group02', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307110', 	'resource' => '304109', 	'name' => 'Group03', 	'description' => 'Detail of group this product belongs to via group 03', 	'method' => 'Group03', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307111', 	'resource' => '304109', 	'name' => 'Group04', 	'description' => 'Detail of group this product belongs to via group 04', 	'method' => 'Group04', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307112', 	'resource' => '304109', 	'name' => 'Group05', 	'description' => 'Detail of group this product belongs to via group 05', 	'method' => 'Group05', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307113', 	'resource' => '304109', 	'name' => 'Group06', 	'description' => 'Detail of group this product belongs to via group 06', 	'method' => 'Group06', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307114', 	'resource' => '304109', 	'name' => 'Group07', 	'description' => 'Detail of group this product belongs to via group 07', 	'method' => 'Group07', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307115', 	'resource' => '304109', 	'name' => 'Group08', 	'description' => 'Detail of group this product belongs to via group 08', 	'method' => 'Group08', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307116', 	'resource' => '304109', 	'name' => 'Group09', 	'description' => 'Detail of group this product belongs to via group 09', 	'method' => 'Group09', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307117', 	'resource' => '304109', 	'name' => 'Group10', 	'description' => 'Detail of group this product belongs to via group 10', 	'method' => 'Group10', 	'type' => 'belongsTo', 	'relate_resource' => '304108', 									])
            ->create([	'id' => '307118', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup01', 	'description' => 'Products belongs to this group via group 01', 	'method' => 'ProductsAsOfGroup01', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307119', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup02', 	'description' => 'Products belongs to this group via group 02', 	'method' => 'ProductsAsOfGroup02', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307120', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup03', 	'description' => 'Products belongs to this group via group 03', 	'method' => 'ProductsAsOfGroup03', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307121', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup04', 	'description' => 'Products belongs to this group via group 04', 	'method' => 'ProductsAsOfGroup04', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307122', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup05', 	'description' => 'Products belongs to this group via group 05', 	'method' => 'ProductsAsOfGroup05', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307123', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup06', 	'description' => 'Products belongs to this group via group 06', 	'method' => 'ProductsAsOfGroup06', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307124', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup07', 	'description' => 'Products belongs to this group via group 07', 	'method' => 'ProductsAsOfGroup07', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307125', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup08', 	'description' => 'Products belongs to this group via group 08', 	'method' => 'ProductsAsOfGroup08', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307126', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup09', 	'description' => 'Products belongs to this group via group 09', 	'method' => 'ProductsAsOfGroup09', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307127', 	'resource' => '304108', 	'name' => 'ProductsAsOfGroup10', 	'description' => 'Products belongs to this group via group 10', 	'method' => 'ProductsAsOfGroup10', 	'type' => 'hasMany', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307128', 	'resource' => '304110', 	'name' => 'Items', 	'description' => 'Each items of this pricelist', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '304111', 									])
            ->create([	'id' => '307129', 	'resource' => '304111', 	'name' => 'Pricelist', 	'description' => 'Details of pricelist this item belongs to', 	'method' => 'Pricelist', 	'type' => 'belongsTo', 	'relate_resource' => '304110', 									])
            ->create([	'id' => '307130', 	'resource' => '304111', 	'name' => 'Product', 	'description' => 'Details of product this item consist of', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307131', 	'resource' => '304114', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '304113', 									])
            ->create([	'id' => '307132', 	'resource' => '304114', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '304101', 									])
            ->create([	'id' => '307133', 	'resource' => '304113', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsToMany', 	'relate_resource' => '304101', 									])
            ->create([	'id' => '307134', 	'resource' => '304101', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsToMany', 	'relate_resource' => '304113', 									])
            ->create([	'id' => '307135', 	'resource' => '304115', 	'name' => 'Settings', 	'description' => 'Details of settings this setting belongs to', 	'method' => 'Settings', 	'type' => 'belongsTo', 	'relate_resource' => '304103', 									])
            ->create([	'id' => '307136', 	'resource' => '304101', 	'name' => 'Settings', 	'description' => 'Settings assigned for a user', 	'method' => 'Settings', 	'type' => 'hasMany', 	'relate_resource' => '304115', 									])
            ->create([	'id' => '307137', 	'resource' => '304101', 	'name' => 'StoreAndArea', 	'description' => 'Store and Areas assigned for a user', 	'method' => 'StoreAndArea', 	'type' => 'hasMany', 	'relate_resource' => '304116', 									])
            ->create([	'id' => '307138', 	'resource' => '304116', 	'name' => 'Area', 	'description' => 'Area details', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '304113', 									])
            ->create([	'id' => '307139', 	'resource' => '304116', 	'name' => 'Store', 	'description' => 'Store Details', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '304112', 									])
            ->create([	'id' => '307140', 	'resource' => '304116', 	'name' => 'User', 	'description' => 'User Details', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '304101', 									])
            ->create([	'id' => '307141', 	'resource' => '304112', 	'name' => 'Users', 	'description' => 'Users assigned to this store', 	'method' => 'Users', 	'type' => 'belongsToMany', 	'relate_resource' => '304101', 									])
            ->create([	'id' => '307142', 	'resource' => '304113', 	'name' => 'StoreAndUser', 	'description' => 'Store and Users assigned to a area', 	'method' => 'StoreAndUser', 	'type' => 'hasMany', 	'relate_resource' => '304116', 									])
            ->create([	'id' => '307143', 	'resource' => '304120', 	'name' => 'Product', 	'description' => 'Details of product', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307144', 	'resource' => '304120', 	'name' => 'Store', 	'description' => 'Details of store', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '304112', 									])
            ->create([	'id' => '307145', 	'resource' => '304120', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '304101', 									])
            ->create([	'id' => '307146', 	'resource' => '304120', 	'name' => 'Nature', 	'description' => 'Nature of transaction', 	'method' => 'Nature', 	'type' => 'belongsTo', 	'relate_resource' => '304118', 									])
            ->create([	'id' => '307147', 	'resource' => '304120', 	'name' => 'Type', 	'description' => 'Type of transaction', 	'method' => 'Type', 	'type' => 'belongsTo', 	'relate_resource' => '304119', 									])
            ->create([	'id' => '307148', 	'resource' => '304112', 	'name' => 'ProductTransaction', 	'description' => 'Product transaction of a store', 	'method' => 'ProductTransaction', 	'type' => 'hasMany', 	'relate_resource' => '304120', 									])
            ->create([	'id' => '307149', 	'resource' => '304121', 	'name' => 'Details', 	'description' => 'Product wise details of transaction', 	'method' => 'Details', 	'type' => 'hasMany', 	'relate_resource' => '304122', 									])
            ->create([	'id' => '307150', 	'resource' => '304121', 	'name' => 'Products', 	'description' => 'Product transactions', 	'method' => 'Products', 	'type' => 'belongsToMany', 	'relate_resource' => '304120', 									])
            ->create([	'id' => '307151', 	'resource' => '304122', 	'name' => 'Product', 	'description' => 'Product and its transaction details', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '304120', 									])
            ->create([	'id' => '307152', 	'resource' => '304126', 	'name' => 'Items', 	'description' => 'Items of a transaction', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '304127', 									])
            ->create([	'id' => '307153', 	'resource' => '304127', 	'name' => 'Product', 	'description' => 'Product details of an sales order item', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '304109', 									])
            ->create([	'id' => '307154', 	'resource' => '304128', 	'name' => 'IN', 	'description' => 'Stock in transactions', 	'method' => 'IN', 	'type' => 'belongsTo', 	'relate_resource' => '304121', 									])
            ->create([	'id' => '307155', 	'resource' => '304128', 	'name' => 'OUT', 	'description' => 'Stock out transactions', 	'method' => 'OUT', 	'type' => 'belongsTo', 	'relate_resource' => '304121', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
