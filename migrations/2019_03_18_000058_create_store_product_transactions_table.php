<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoreProductTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('store_product_transactions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignNullable('store', 'stores');
            $table->foreignNullable('product', 'products');
            $table->enum('direction', ['Out','In'])->default('Out');
            $table->decimal('quantity', 30,10)->default(1);
            $table->unsignedBigInteger('user')->nullable();
            $table->foreignNullable('nature', 'product_transaction_natures');
            $table->timestamp('date')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->foreignNullable('type', 'product_transaction_types');
            $table->enum('status', ['Active','Inactive'])->nullable()->default('Active');
            $table->audit();
            $table->foreign('user')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('store_product_transactions');
    }
}
