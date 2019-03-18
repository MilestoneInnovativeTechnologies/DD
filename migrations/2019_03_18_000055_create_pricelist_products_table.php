<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePricelistProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pricelist_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('pricelist', 'pricelist');
            $table->foreignCascade('product', 'products');
            $table->decimal('price', 30,10)->default(0);
            $table->decimal('price_min', 30,10)->default(0);
            $table->decimal('price_max', 30,10)->default(0);
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
        Schema::dropIfExists('pricelist_products');
    }
}
