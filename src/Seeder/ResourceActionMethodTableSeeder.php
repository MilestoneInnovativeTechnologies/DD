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
            ->create([	'id' => '333103', 	'resource_action' => '332103', 	'type' => 'Data', 	'idn1' => '327101', 												])
            ->create([	'id' => '333104', 	'resource_action' => '332104', 	'type' => 'FormWithData', 	'idn1' => '309101', 	'idn2' => '327101', 											])
            ->create([	'id' => '333105', 	'resource_action' => '332105', 	'type' => 'List', 	'idn1' => '322102', 												])
            ->create([	'id' => '333106', 	'resource_action' => '332106', 	'type' => 'ListRelation', 	'idn1' => '308110', 	'idn2' => '322103', 											])
            ->create([	'id' => '333107', 	'resource_action' => '332107', 	'type' => 'List', 	'idn1' => '322104', 												])
            ->create([	'id' => '333108', 	'resource_action' => '332108', 	'type' => 'Form', 	'idn1' => '309102', 												])
            ->create([	'id' => '333109', 	'resource_action' => '332109', 	'type' => 'AddRelation', 	'idn1' => '308110', 	'idn2' => '309102', 	'idn3' => '310105', 										])
            ->create([	'id' => '333110', 	'resource_action' => '332110', 	'type' => 'ListRelation', 	'idn1' => '308107', 	'idn2' => '322103', 											])
            ->create([	'id' => '333111', 	'resource_action' => '332111', 	'type' => 'AddRelation', 	'idn1' => '308107', 	'idn2' => '309102', 	'idn3' => '310106', 										])
            ->create([	'id' => '333112', 	'resource_action' => '332112', 	'type' => 'List', 	'idn1' => '322103', 												])
            ->create([	'id' => '333113', 	'resource_action' => '332113', 	'type' => 'FormWithData', 	'idn1' => '309103', 	'idn2' => '327102', 											])
            ->create([	'id' => '333114', 	'resource_action' => '332114', 	'type' => 'Data', 	'idn1' => '327102', 												])
            ->create([	'id' => '333115', 	'resource_action' => '332115', 	'type' => 'Form', 	'idn1' => '309104', 												])
            ->create([	'id' => '333116', 	'resource_action' => '332116', 	'type' => 'List', 	'idn1' => '322105', 												])
            ->create([	'id' => '333117', 	'resource_action' => '332117', 	'type' => 'Data', 	'idn1' => '327103', 												])
            ->create([	'id' => '333118', 	'resource_action' => '332118', 	'type' => 'FormWithData', 	'idn1' => '309104', 	'idn2' => '327103', 											])
            ->create([	'id' => '333119', 	'resource_action' => '332119', 	'type' => 'List', 	'idn1' => '322106', 												])
            ->create([	'id' => '333120', 	'resource_action' => '332120', 	'type' => 'List', 	'idn1' => '322107', 												])
            ->create([	'id' => '333121', 	'resource_action' => '332121', 	'type' => 'ListRelation', 	'idn1' => '308112', 	'idn2' => '322105', 											])
            ->create([	'id' => '333122', 	'resource_action' => '332122', 	'type' => 'AddRelation', 	'idn1' => '308112', 	'idn2' => '309104', 	'idn3' => '310109', 										])
            ->create([	'id' => '333123', 	'resource_action' => '332123', 	'type' => 'ListRelation', 	'idn1' => '308117', 	'idn2' => '322105', 											])
            ->create([	'id' => '333124', 	'resource_action' => '332124', 	'type' => 'AddRelation', 	'idn1' => '308117', 	'idn2' => '309104', 	'idn3' => '310111', 										])
            ->create([	'id' => '333125', 	'resource_action' => '332125', 	'type' => 'ManageRelation', 	'idn1' => '308116', 	'idn2' => '322104', 											])
            ->create([	'id' => '333126', 	'resource_action' => '332126', 	'type' => 'Form', 	'idn1' => '309105', 												])
            ->create([	'id' => '333127', 	'resource_action' => '332127', 	'type' => 'FormWithData', 	'idn1' => '309105', 	'idn2' => '327104', 											])
            ->create([	'id' => '333128', 	'resource_action' => '332128', 	'type' => 'List', 	'idn1' => '322108', 												])
            ->create([	'id' => '333129', 	'resource_action' => '332129', 	'type' => 'Data', 	'idn1' => '327104', 												])
            ->create([	'id' => '333130', 	'resource_action' => '332130', 	'type' => 'List', 	'idn1' => '322110', 												])
            ->create([	'id' => '333131', 	'resource_action' => '332131', 	'type' => 'Form', 	'idn1' => '309106', 												])
            ->create([	'id' => '333132', 	'resource_action' => '332132', 	'type' => 'Data', 	'idn1' => '327105', 												])
            ->create([	'id' => '333133', 	'resource_action' => '332133', 	'type' => 'FormWithData', 	'idn1' => '309107', 	'idn2' => '327105', 											])
            ->create([	'id' => '333134', 	'resource_action' => '332134', 	'type' => 'List', 	'idn1' => '322111', 												])
            ->create([	'id' => '333135', 	'resource_action' => '332135', 	'type' => 'List', 	'idn1' => '322112', 												])
            ->create([	'id' => '333136', 	'resource_action' => '332136', 	'type' => 'List', 	'idn1' => '322113', 												])
            ->create([	'id' => '333137', 	'resource_action' => '332137', 	'type' => 'List', 	'idn1' => '322114', 												])
            ->create([	'id' => '333138', 	'resource_action' => '332138', 	'type' => 'FormWithData', 	'idn1' => '309108', 	'idn2' => '327106', 											])
            ->create([	'id' => '333139', 	'resource_action' => '332139', 	'type' => 'Data', 	'idn1' => '327106', 												])
            ->create([	'id' => '333140', 	'resource_action' => '332140', 	'type' => 'List', 	'idn1' => '322115', 												])
            ->create([	'id' => '333141', 	'resource_action' => '332141', 	'type' => 'Form', 	'idn1' => '309109', 												])
        ;
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
