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
             UserTableSeeder::class,
             SetupTableSeeder::class,
             SettingTableSeeder::class,
             TaxTableSeeder::class,
             TaxDetailTableSeeder::class,
             FiscalyearmasterTableSeeder::class,
             FunctiondetailTableSeeder::class,
             ProductgroupTableSeeder::class,
             ProductTableSeeder::class,
             PricelistTableSeeder::class,
             PricelistProductTableSeeder::class,
             StoreTableSeeder::class,
             AreaTableSeeder::class,
             AreaUserTableSeeder::class,
             UserSettingTableSeeder::class,
             UserStoreAreaTableSeeder::class,
             StoreProductTableSeeder::class,
             ProductTransactionNatureTableSeeder::class,
             ProductTransactionTypeTableSeeder::class,
             StoreProductTransactionTableSeeder::class,
             TransactionTableSeeder::class,
             TransactionDetailTableSeeder::class,
             BillDataTableSeeder::class,
             DDataTableSeeder::class,
             ChequeDetailTableSeeder::class,
             SalesOrderTableSeeder::class,
             SalesOrderItemTableSeeder::class,
             StockTransferTableSeeder::class,
             WBinTableSeeder::class,
        ]);
    }
}
