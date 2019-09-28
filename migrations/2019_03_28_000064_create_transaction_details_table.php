<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransactionDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaction_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('transaction', 'transactions');
            $table->foreignNullable('store', 'stores');
            $table->foreignNullable('product', 'products');
            $table->enum('direction', ['Out','In'])->default('Out');
            $table->decimal('quantity', 30,10)->default(1);
            $table->decimal('rate', 30,10)->default(0);
            $table->char('taxrule', '15')->nullable();
            $table->decimal('tax', 30,10)->default(0);
            $table->decimal('discount01', 30,10)->default(0);
            $table->decimal('discount02', 30,10)->default(0);
            $table->foreignNullable('soi', 'sales_order_items');
            $table->char('_ref_trans', '30')->nullable()->index();
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
        Schema::dropIfExists('transaction_details');
    }
}
