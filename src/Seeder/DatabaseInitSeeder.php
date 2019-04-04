<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

class DatabaseInitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        \DB::statement('ALTER TABLE `users`  AUTO_INCREMENT=300101');
//        \DB::statement('ALTER TABLE `__groups`  AUTO_INCREMENT=301101');
//        \DB::statement('ALTER TABLE `__group_users`  AUTO_INCREMENT=302101');
//        \DB::statement('ALTER TABLE `__roles`  AUTO_INCREMENT=303101');
//        \DB::statement('ALTER TABLE `__group_roles`  AUTO_INCREMENT=304101');
        \DB::statement('ALTER TABLE `__resources`  AUTO_INCREMENT=305101');
//        \DB::statement('ALTER TABLE `__resource_roles`  AUTO_INCREMENT=306101');
        \DB::statement('ALTER TABLE `__resource_scopes`  AUTO_INCREMENT=307101');
        \DB::statement('ALTER TABLE `__resource_relations`  AUTO_INCREMENT=308101');
        \DB::statement('ALTER TABLE `__resource_forms`  AUTO_INCREMENT=309101');
        \DB::statement('ALTER TABLE `__resource_form_fields`  AUTO_INCREMENT=310101');
        \DB::statement('ALTER TABLE `__resource_form_field_data`  AUTO_INCREMENT=311101');
        \DB::statement('ALTER TABLE `__resource_form_field_options`  AUTO_INCREMENT=312101');
        \DB::statement('ALTER TABLE `__resource_form_field_attrs`  AUTO_INCREMENT=313101');
        \DB::statement('ALTER TABLE `__resource_form_field_dynamic`  AUTO_INCREMENT=314101');
        \DB::statement('ALTER TABLE `__resource_form_field_validations`  AUTO_INCREMENT=315101');
        \DB::statement('ALTER TABLE `__resource_form_field_depends`  AUTO_INCREMENT=316101');
        \DB::statement('ALTER TABLE `__resource_form_layout`  AUTO_INCREMENT=317101');
        \DB::statement('ALTER TABLE `__resource_form_data_map`  AUTO_INCREMENT=318101');
        \DB::statement('ALTER TABLE `__resource_form_defaults`  AUTO_INCREMENT=319101');
        \DB::statement('ALTER TABLE `__resource_form_collection`  AUTO_INCREMENT=320101');
        \DB::statement('ALTER TABLE `__resource_form_upload`  AUTO_INCREMENT=321101');
        \DB::statement('ALTER TABLE `__resource_lists`  AUTO_INCREMENT=322101');
        \DB::statement('ALTER TABLE `__resource_list_scopes`  AUTO_INCREMENT=323101');
        \DB::statement('ALTER TABLE `__resource_list_relations`  AUTO_INCREMENT=324101');
        \DB::statement('ALTER TABLE `__resource_list_layout`  AUTO_INCREMENT=325101');
        \DB::statement('ALTER TABLE `__resource_list_search`  AUTO_INCREMENT=326101');
        \DB::statement('ALTER TABLE `__resource_data`  AUTO_INCREMENT=327101');
        \DB::statement('ALTER TABLE `__resource_data_scopes`  AUTO_INCREMENT=328101');
        \DB::statement('ALTER TABLE `__resource_data_relations`  AUTO_INCREMENT=329101');
        \DB::statement('ALTER TABLE `__resource_data_view_sections`  AUTO_INCREMENT=330101');
        \DB::statement('ALTER TABLE `__resource_data_view_section_items`  AUTO_INCREMENT=331101');
        \DB::statement('ALTER TABLE `__resource_actions`  AUTO_INCREMENT=332101');
        \DB::statement('ALTER TABLE `__resource_action_methods`  AUTO_INCREMENT=333101');
        \DB::statement('ALTER TABLE `__resource_action_attrs`  AUTO_INCREMENT=334101');
        \DB::statement('ALTER TABLE `__resource_action_lists`  AUTO_INCREMENT=335101');
        \DB::statement('ALTER TABLE `__resource_action_data`  AUTO_INCREMENT=336101');
        \DB::statement('ALTER TABLE `__resource_defaults`  AUTO_INCREMENT=337101');
        \DB::statement('ALTER TABLE `__resource_metrics`  AUTO_INCREMENT=338101');
        \DB::statement('ALTER TABLE `__resource_dashboard`  AUTO_INCREMENT=339101');
        \DB::statement('ALTER TABLE `__resource_dashboard_sections`  AUTO_INCREMENT=340101');
        \DB::statement('ALTER TABLE `__resource_dashboard_section_items`  AUTO_INCREMENT=341101');
    }
}
