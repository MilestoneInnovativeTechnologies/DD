<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales_order_items', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignNullable('so', 'sales_order');
            $table->foreignNullable('store', 'stores');
            $table->char('fycode', '5')->nullable()->index();
            $table->char('fncode', '15')->nullable()->index();
            $table->foreignNullable('product', 'products');
            $table->decimal('rate', 30,10)->default(0);
            $table->decimal('quantity', 30,10)->default(1);
            $table->char('taxrule', '15')->nullable();
            $table->decimal('tax', 30,10)->default(0);
            $table->decimal('discount01', 30,10)->default(0);
            $table->decimal('discount02', 30,10)->default(0);
            $table->char('_ref', '30')->nullable()->index();
            $table->audit();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sales_order_items');
    }
}
