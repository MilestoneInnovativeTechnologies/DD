<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesOrderSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales_order_sales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignNullable('so', 'sales_order');
            $table->foreignNullable('product', 'products');
            $table->decimal('quantity', 30,10)->default(1);
            $table->foreignNullable('transaction', 'transactions');
            $table->decimal('sale_quantity', 30,10)->default(0);
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
        Schema::dropIfExists('sales_order_sales');
    }
}
