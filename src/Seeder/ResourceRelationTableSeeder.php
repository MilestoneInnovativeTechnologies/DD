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
            ->create([	'id' => '308101', 	'resource' => '305104', 	'name' => 'TaxDetail', 	'description' => 'Details and sub taxes', 	'method' => 'Detail', 	'type' => 'hasMany', 	'relate_resource' => '305105', 									])
            ->create([	'id' => '308102', 	'resource' => '305105', 	'name' => 'Tax', 	'description' => 'Detail of Tax', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '305104', 									])
            ->create([	'id' => '308103', 	'resource' => '305107', 	'name' => 'Tax', 	'description' => 'Detail of Tax', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '305104', 									])
            ->create([	'id' => '308104', 	'resource' => '305108', 	'name' => 'Belongs', 	'description' => 'Detail of main group this group belongs', 	'method' => 'Belongs', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308105', 	'resource' => '305108', 	'name' => 'Parent', 	'description' => 'The parent group details of this group', 	'method' => 'Parent', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308106', 	'resource' => '305108', 	'name' => 'Tax01', 	'description' => 'Details of Tax for this group', 	'method' => 'Tax', 	'type' => 'belongsTo', 	'relate_resource' => '305104', 									])
            ->create([	'id' => '308107', 	'resource' => '305108', 	'name' => 'Tax02', 	'description' => 'Details of Sub Tax for this group', 	'method' => 'Tax2', 	'type' => 'belongsTo', 	'relate_resource' => '305104', 									])
            ->create([	'id' => '308108', 	'resource' => '305109', 	'name' => 'Group01', 	'description' => 'Detail of group this product belongs to via group 01', 	'method' => 'Group01', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308109', 	'resource' => '305109', 	'name' => 'Group02', 	'description' => 'Detail of group this product belongs to via group 02', 	'method' => 'Group02', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308110', 	'resource' => '305109', 	'name' => 'Group03', 	'description' => 'Detail of group this product belongs to via group 03', 	'method' => 'Group03', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308111', 	'resource' => '305109', 	'name' => 'Group04', 	'description' => 'Detail of group this product belongs to via group 04', 	'method' => 'Group04', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308112', 	'resource' => '305109', 	'name' => 'Group05', 	'description' => 'Detail of group this product belongs to via group 05', 	'method' => 'Group05', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308113', 	'resource' => '305109', 	'name' => 'Group06', 	'description' => 'Detail of group this product belongs to via group 06', 	'method' => 'Group06', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308114', 	'resource' => '305109', 	'name' => 'Group07', 	'description' => 'Detail of group this product belongs to via group 07', 	'method' => 'Group07', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308115', 	'resource' => '305109', 	'name' => 'Group08', 	'description' => 'Detail of group this product belongs to via group 08', 	'method' => 'Group08', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308116', 	'resource' => '305109', 	'name' => 'Group09', 	'description' => 'Detail of group this product belongs to via group 09', 	'method' => 'Group09', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308117', 	'resource' => '305109', 	'name' => 'Group10', 	'description' => 'Detail of group this product belongs to via group 10', 	'method' => 'Group10', 	'type' => 'belongsTo', 	'relate_resource' => '305108', 									])
            ->create([	'id' => '308118', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup01', 	'description' => 'Products belongs to this group via group 01', 	'method' => 'ProductsAsOfGroup01', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308119', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup02', 	'description' => 'Products belongs to this group via group 02', 	'method' => 'ProductsAsOfGroup02', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308120', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup03', 	'description' => 'Products belongs to this group via group 03', 	'method' => 'ProductsAsOfGroup03', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308121', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup04', 	'description' => 'Products belongs to this group via group 04', 	'method' => 'ProductsAsOfGroup04', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308122', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup05', 	'description' => 'Products belongs to this group via group 05', 	'method' => 'ProductsAsOfGroup05', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308123', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup06', 	'description' => 'Products belongs to this group via group 06', 	'method' => 'ProductsAsOfGroup06', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308124', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup07', 	'description' => 'Products belongs to this group via group 07', 	'method' => 'ProductsAsOfGroup07', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308125', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup08', 	'description' => 'Products belongs to this group via group 08', 	'method' => 'ProductsAsOfGroup08', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308126', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup09', 	'description' => 'Products belongs to this group via group 09', 	'method' => 'ProductsAsOfGroup09', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308127', 	'resource' => '305108', 	'name' => 'ProductsAsOfGroup10', 	'description' => 'Products belongs to this group via group 10', 	'method' => 'ProductsAsOfGroup10', 	'type' => 'hasMany', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308128', 	'resource' => '305110', 	'name' => 'Items', 	'description' => 'Each items of this pricelist', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '305111', 									])
            ->create([	'id' => '308129', 	'resource' => '305111', 	'name' => 'Pricelist', 	'description' => 'Details of pricelist this item belongs to', 	'method' => 'Pricelist', 	'type' => 'belongsTo', 	'relate_resource' => '305110', 									])
            ->create([	'id' => '308130', 	'resource' => '305111', 	'name' => 'Product', 	'description' => 'Details of product this item consist of', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308131', 	'resource' => '305114', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '305113', 									])
            ->create([	'id' => '308132', 	'resource' => '305114', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308133', 	'resource' => '305113', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsToMany', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308134', 	'resource' => '305103', 	'name' => 'Users', 	'description' => 'Users list corresponding to a settings', 	'method' => 'Users', 	'type' => 'hasMany', 	'relate_resource' => '305115', 									])
            ->create([	'id' => '308135', 	'resource' => '305101', 	'name' => 'Area', 	'description' => 'Details of area', 	'method' => 'Area', 	'type' => 'belongsToMany', 	'relate_resource' => '305113', 									])
            ->create([	'id' => '308136', 	'resource' => '305115', 	'name' => 'Settings', 	'description' => 'Details of settings this setting belongs to', 	'method' => 'Settings', 	'type' => 'belongsTo', 	'relate_resource' => '305103', 									])
            ->create([	'id' => '308137', 	'resource' => '305101', 	'name' => 'Settings', 	'description' => 'Settings assigned for a user', 	'method' => 'Settings', 	'type' => 'hasMany', 	'relate_resource' => '305115', 									])
            ->create([	'id' => '308138', 	'resource' => '305115', 	'name' => 'User', 	'description' => 'Details of user this settings belongs to', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308139', 	'resource' => '305101', 	'name' => 'StoreAndArea', 	'description' => 'Store and Areas assigned for a user', 	'method' => 'StoreAndArea', 	'type' => 'hasMany', 	'relate_resource' => '305116', 									])
            ->create([	'id' => '308140', 	'resource' => '305116', 	'name' => 'Area', 	'description' => 'Area details', 	'method' => 'Area', 	'type' => 'belongsTo', 	'relate_resource' => '305113', 									])
            ->create([	'id' => '308141', 	'resource' => '305116', 	'name' => 'Store', 	'description' => 'Store Details', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305112', 									])
            ->create([	'id' => '308142', 	'resource' => '305116', 	'name' => 'User', 	'description' => 'User Details', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308143', 	'resource' => '305112', 	'name' => 'Users', 	'description' => 'Users assigned to this store', 	'method' => 'Users', 	'type' => 'belongsToMany', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308144', 	'resource' => '305113', 	'name' => 'StoreAndUser', 	'description' => 'Store and Users assigned to a area', 	'method' => 'StoreAndUser', 	'type' => 'hasMany', 	'relate_resource' => '305116', 									])
            ->create([	'id' => '308145', 	'resource' => '305120', 	'name' => 'Product', 	'description' => 'Details of product', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308146', 	'resource' => '305120', 	'name' => 'Store', 	'description' => 'Details of store', 	'method' => 'Store', 	'type' => 'belongsTo', 	'relate_resource' => '305112', 									])
            ->create([	'id' => '308147', 	'resource' => '305120', 	'name' => 'User', 	'description' => 'Details of user', 	'method' => 'User', 	'type' => 'belongsTo', 	'relate_resource' => '305101', 									])
            ->create([	'id' => '308148', 	'resource' => '305120', 	'name' => 'Nature', 	'description' => 'Nature of transaction', 	'method' => 'Nature', 	'type' => 'belongsTo', 	'relate_resource' => '305118', 									])
            ->create([	'id' => '308149', 	'resource' => '305120', 	'name' => 'Type', 	'description' => 'Type of transaction', 	'method' => 'Type', 	'type' => 'belongsTo', 	'relate_resource' => '305119', 									])
            ->create([	'id' => '308150', 	'resource' => '305112', 	'name' => 'ProductTransaction', 	'description' => 'Product transaction of a store', 	'method' => 'ProductTransaction', 	'type' => 'hasMany', 	'relate_resource' => '305120', 									])
            ->create([	'id' => '308151', 	'resource' => '305121', 	'name' => 'Details', 	'description' => 'Product wise details of transaction', 	'method' => 'Details', 	'type' => 'hasMany', 	'relate_resource' => '305122', 									])
            ->create([	'id' => '308152', 	'resource' => '305121', 	'name' => 'Products', 	'description' => 'Product transactions', 	'method' => 'Products', 	'type' => 'belongsToMany', 	'relate_resource' => '305120', 									])
            ->create([	'id' => '308153', 	'resource' => '305122', 	'name' => 'Product', 	'description' => 'Product and its transaction details', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305120', 									])
            ->create([	'id' => '308154', 	'resource' => '305126', 	'name' => 'Items', 	'description' => 'Items of a transaction', 	'method' => 'Items', 	'type' => 'hasMany', 	'relate_resource' => '305127', 									])
            ->create([	'id' => '308155', 	'resource' => '305127', 	'name' => 'Product', 	'description' => 'Product details of an sales order item', 	'method' => 'Product', 	'type' => 'belongsTo', 	'relate_resource' => '305109', 									])
            ->create([	'id' => '308156', 	'resource' => '305128', 	'name' => 'IN', 	'description' => 'Stock in transactions', 	'method' => 'IN', 	'type' => 'belongsTo', 	'relate_resource' => '305121', 									])
            ->create([	'id' => '308157', 	'resource' => '305128', 	'name' => 'OUT', 	'description' => 'Stock out transactions', 	'method' => 'OUT', 	'type' => 'belongsTo', 	'relate_resource' => '305121', 									])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
