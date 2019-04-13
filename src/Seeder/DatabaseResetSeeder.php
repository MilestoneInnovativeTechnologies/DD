<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

class DatabaseResetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::statement('DELETE FROM users WHERE id > 300100');\DB::statement('ALTER TABLE `users` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __groups WHERE id > 301100');\DB::statement('ALTER TABLE `__groups` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __group_users WHERE id > 302100');\DB::statement('ALTER TABLE `__group_users` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __roles WHERE id > 303100');\DB::statement('ALTER TABLE `__roles` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __group_roles WHERE id > 304100');\DB::statement('ALTER TABLE `__group_roles` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resources WHERE id > 305100');\DB::statement('ALTER TABLE `__resources` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_roles WHERE id > 306100');\DB::statement('ALTER TABLE `__resource_roles` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_scopes WHERE id > 307100');\DB::statement('ALTER TABLE `__resource_scopes` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_relations WHERE id > 308100');\DB::statement('ALTER TABLE `__resource_relations` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_forms WHERE id > 309100');\DB::statement('ALTER TABLE `__resource_forms` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_fields WHERE id > 310100');\DB::statement('ALTER TABLE `__resource_form_fields` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_data WHERE id > 311100');\DB::statement('ALTER TABLE `__resource_form_field_data` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_options WHERE id > 312100');\DB::statement('ALTER TABLE `__resource_form_field_options` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_attrs WHERE id > 313100');\DB::statement('ALTER TABLE `__resource_form_field_attrs` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_dynamic WHERE id > 314100');\DB::statement('ALTER TABLE `__resource_form_field_dynamic` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_validations WHERE id > 315100');\DB::statement('ALTER TABLE `__resource_form_field_validations` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_field_depends WHERE id > 316100');\DB::statement('ALTER TABLE `__resource_form_field_depends` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_layout WHERE id > 317100');\DB::statement('ALTER TABLE `__resource_form_layout` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_data_map WHERE id > 318100');\DB::statement('ALTER TABLE `__resource_form_data_map` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_defaults WHERE id > 319100');\DB::statement('ALTER TABLE `__resource_form_defaults` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_collection WHERE id > 320100');\DB::statement('ALTER TABLE `__resource_form_collection` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_form_upload WHERE id > 321100');\DB::statement('ALTER TABLE `__resource_form_upload` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_lists WHERE id > 322100');\DB::statement('ALTER TABLE `__resource_lists` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_list_scopes WHERE id > 323100');\DB::statement('ALTER TABLE `__resource_list_scopes` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_list_relations WHERE id > 324100');\DB::statement('ALTER TABLE `__resource_list_relations` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_list_layout WHERE id > 325100');\DB::statement('ALTER TABLE `__resource_list_layout` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_list_search WHERE id > 326100');\DB::statement('ALTER TABLE `__resource_list_search` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_data WHERE id > 327100');\DB::statement('ALTER TABLE `__resource_data` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_data_scopes WHERE id > 328100');\DB::statement('ALTER TABLE `__resource_data_scopes` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_data_relations WHERE id > 329100');\DB::statement('ALTER TABLE `__resource_data_relations` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_data_view_sections WHERE id > 330100');\DB::statement('ALTER TABLE `__resource_data_view_sections` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_data_view_section_items WHERE id > 331100');\DB::statement('ALTER TABLE `__resource_data_view_section_items` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_actions WHERE id > 332100');\DB::statement('ALTER TABLE `__resource_actions` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_action_methods WHERE id > 333100');\DB::statement('ALTER TABLE `__resource_action_methods` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_action_attrs WHERE id > 334100');\DB::statement('ALTER TABLE `__resource_action_attrs` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_action_lists WHERE id > 335100');\DB::statement('ALTER TABLE `__resource_action_lists` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_action_data WHERE id > 336100');\DB::statement('ALTER TABLE `__resource_action_data` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_defaults WHERE id > 337100');\DB::statement('ALTER TABLE `__resource_defaults` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_metrics WHERE id > 338100');\DB::statement('ALTER TABLE `__resource_metrics` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_dashboard WHERE id > 339100');\DB::statement('ALTER TABLE `__resource_dashboard` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_dashboard_sections WHERE id > 340100');\DB::statement('ALTER TABLE `__resource_dashboard_sections` AUTO_INCREMENT=1');
        \DB::statement('DELETE FROM __resource_dashboard_section_items WHERE id > 341100');\DB::statement('ALTER TABLE `__resource_dashboard_section_items` AUTO_INCREMENT=1');
    }
}
