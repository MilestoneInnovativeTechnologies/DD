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
        $_ = \DB::statement('SELECT @@GLOBAL.foreign_key_checks');
        \DB::statement('set foreign_key_checks = 0');
        \DB::statement('DELETE FROM users WHERE id > 300100');
        \DB::statement('DELETE FROM __groups WHERE id > 301100');
        \DB::statement('DELETE FROM __roles WHERE id > 302100');
        \DB::statement('DELETE FROM __group_roles WHERE id > 303100');
        \DB::statement('DELETE FROM __resources WHERE id > 304100');
        \DB::statement('DELETE FROM __resource_roles WHERE id > 305100');
        \DB::statement('DELETE FROM __resource_scopes WHERE id > 306100');
        \DB::statement('DELETE FROM __resource_relations WHERE id > 307100');
        \DB::statement('DELETE FROM __resource_forms WHERE id > 308100');
        \DB::statement('DELETE FROM __resource_form_fields WHERE id > 309100');
        \DB::statement('DELETE FROM __resource_form_field_data WHERE id > 310100');
        \DB::statement('DELETE FROM __resource_form_field_options WHERE id > 311100');
        \DB::statement('DELETE FROM __resource_form_field_attrs WHERE id > 312100');
        \DB::statement('DELETE FROM __resource_form_field_dynamic WHERE id > 313100');
        \DB::statement('DELETE FROM __resource_form_field_validations WHERE id > 314100');
        \DB::statement('DELETE FROM __resource_form_field_depends WHERE id > 315100');
        \DB::statement('DELETE FROM __resource_form_layout WHERE id > 316100');
        \DB::statement('DELETE FROM __resource_form_data_map WHERE id > 317100');
        \DB::statement('DELETE FROM __resource_form_defaults WHERE id > 318100');
        \DB::statement('DELETE FROM __resource_form_collection WHERE id > 319100');
        \DB::statement('DELETE FROM __resource_form_upload WHERE id > 320100');
        \DB::statement('DELETE FROM __resource_lists WHERE id > 321100');
        \DB::statement('DELETE FROM __resource_list_scopes WHERE id > 322100');
        \DB::statement('DELETE FROM __resource_list_relations WHERE id > 323100');
        \DB::statement('DELETE FROM __resource_list_layout WHERE id > 324100');
        \DB::statement('DELETE FROM __resource_list_search WHERE id > 325100');
        \DB::statement('DELETE FROM __resource_data WHERE id > 326100');
        \DB::statement('DELETE FROM __resource_data_scopes WHERE id > 327100');
        \DB::statement('DELETE FROM __resource_data_relations WHERE id > 328100');
        \DB::statement('DELETE FROM __resource_data_view_sections WHERE id > 329100');
        \DB::statement('DELETE FROM __resource_data_view_section_items WHERE id > 330100');
        \DB::statement('DELETE FROM __resource_actions WHERE id > 331100');
        \DB::statement('DELETE FROM __resource_action_methods WHERE id > 332100');
        \DB::statement('DELETE FROM __resource_action_attrs WHERE id > 333100');
        \DB::statement('DELETE FROM __resource_action_lists WHERE id > 334100');
        \DB::statement('DELETE FROM __resource_action_data WHERE id > 335100');
        \DB::statement('DELETE FROM __resource_defaults WHERE id > 336100');
        \DB::statement('DELETE FROM __resource_metrics WHERE id > 337100');
        \DB::statement('DELETE FROM __resource_dashboard WHERE id > 338100');
        \DB::statement('DELETE FROM __resource_dashboard_sections WHERE id > 339100');
        \DB::statement('DELETE FROM __resource_dashboard_section_items WHERE id > 340100');
        \DB::statement('set foreign_key_checks = ' . $_);
    }
}
