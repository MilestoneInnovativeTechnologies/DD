<?php

namespace Milestone\SS\Seeder;

use Illuminate\Database\Seeder;

class ResourceActionMethodTableSeeder extends Seeder
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
        \Milestone\Appframe\Model\ResourceActionMethod::query()
            ->create([	'id' => '333101', 	'resource_action' => '332101', 	'type' => 'Form', 	'idn1' => '309101', 												])
            ->create([	'id' => '333102', 	'resource_action' => '332102', 	'type' => 'List', 	'idn1' => '322101', 												])
            ->create([	'id' => '333103', 	'resource_action' => '332103', 	'type' => 'Form', 	'idn1' => '309101', 												])
            ->create([	'id' => '333104', 	'resource_action' => '332104', 	'type' => 'List', 	'idn1' => '322102', 												])
            ->create([	'id' => '333105', 	'resource_action' => '332105', 	'type' => 'FormWithData', 	'idn1' => '309101', 	'idn2' => '327101', 											])
            ->create([	'id' => '333106', 	'resource_action' => '332106', 	'type' => 'FormWithData', 	'idn1' => '309102', 	'idn2' => '327102', 											])
            ->create([	'id' => '333107', 	'resource_action' => '332107', 	'type' => 'Form', 	'idn1' => '309103', 												])
            ->create([	'id' => '333108', 	'resource_action' => '332108', 	'type' => 'List', 	'idn1' => '322103', 												])
            ->create([	'id' => '333109', 	'resource_action' => '332109', 	'type' => 'Data', 	'idn1' => '327103', 												])
            ->create([	'id' => '333110', 	'resource_action' => '332110', 	'type' => 'FormWithData', 	'idn1' => '309103', 	'idn2' => '327103', 											])
            ->create([	'id' => '333111', 	'resource_action' => '332111', 	'type' => 'List', 	'idn1' => '322104', 												])
            ->create([	'id' => '333112', 	'resource_action' => '332112', 	'type' => 'ListRelation', 	'idn1' => '308137', 	'idn2' => '322105', 											])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
