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
            $table->foreignCascade('spt', 'store_product_transactions');
            $table->decimal('price', 30,10)->default(0);
            $table->decimal('tax', 30,10)->default(0);
            $table->decimal('discount', 30,10)->default(0);
            $table->decimal('total', 30,10)->default(0);
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
        Schema::dropIfExists('transaction_details');
    }
}
