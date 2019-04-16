<?php

    namespace Milestone\SS\Seeder;

    use Illuminate\Database\Seeder;

    class DatabaseSeeder extends Seeder
    {
        /**
         * Run the database seeds.
         *
         * @return void
         */
        public function run()
        {
            $this->call(DatabaseResetSeeder::class);
            $this->call(DatabaseInitSeeder::class);
            $this->call([
                UserTableSeeder::class,
                GroupTableSeeder::class,
                GroupUserTableSeeder::class,
                RoleTableSeeder::class,
                GroupRoleTableSeeder::class,
                ResourceTableSeeder::class,
                ResourceRoleTableSeeder::class,
                ResourceRelationTableSeeder::class,
                ResourceScopeTableSeeder::class,
                ResourceFormTableSeeder::class,
                ResourceFormFieldTableSeeder::class,
                ResourceFormFieldAttrTableSeeder::class,
                ResourceFormFieldDataTableSeeder::class,
                ResourceFormFieldValidationTableSeeder::class,
                ResourceFormFieldOptionTableSeeder::class,
                ResourceFormFieldDependTableSeeder::class,
                ResourceFormFieldDynamicTableSeeder::class,
                ResourceFormLayoutTableSeeder::class,
                ResourceFormCollectionTableSeeder::class,
                ResourceFormUploadTableSeeder::class,
                ResourceFormDefaultTableSeeder::class,
                ResourceListTableSeeder::class,
                ResourceListRelationTableSeeder::class,
                ResourceListScopeTableSeeder::class,
                ResourceListLayoutTableSeeder::class,
                ResourceListSearchTableSeeder::class,
                ResourceDataTableSeeder::class,
                ResourceDataRelationTableSeeder::class,
                ResourceDataScopeTableSeeder::class,
                ResourceDataViewSectionTableSeeder::class,
                ResourceDataViewSectionItemTableSeeder::class,
                ResourceFormDataMapTableSeeder::class,
                ResourceActionTableSeeder::class,
                ResourceActionAttrTableSeeder::class,
                ResourceActionMethodTableSeeder::class,
                ResourceActionListTableSeeder::class,
                ResourceActionDataTableSeeder::class,
                ResourceDefaultTableSeeder::class,
                ResourceMetricTableSeeder::class,
                ResourceDashboardTableSeeder::class,
                ResourceDashboardSectionTableSeeder::class,
                ResourceDashboardSectionItemTableSeeder::class,
                OrganisationTableSeeder::class,
                OrganisationContactTableSeeder::class,
            ]);
        }
    }
