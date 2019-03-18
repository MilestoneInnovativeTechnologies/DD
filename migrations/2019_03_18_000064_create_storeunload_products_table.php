<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoreunloadProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('storeunload_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('storeunload', 'storeunload');
            $table->foreignCascade('spt', 'store_product_transactions');
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
        Schema::dropIfExists('storeunload_products');
    }
}
