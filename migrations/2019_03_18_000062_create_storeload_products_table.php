<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoreloadProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('storeload_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('storeload', 'storeload');
            $table->foreignCascade('spt', 'store_product_transactions');
            $table->enum('verified', [0,1])->default(0)->index();
            $table->unsignedBigInteger('verified_user')->nullable();
            $table->audit();
            $table->foreign('verified_user')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('storeload_products');
    }
}
