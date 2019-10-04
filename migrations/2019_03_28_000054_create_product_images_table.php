<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_images', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignNullable('product', 'products');
            $table->string('image01', '1024')->nullable();
            $table->string('image02', '1024')->nullable();
            $table->string('image03', '1024')->nullable();
            $table->string('image04', '1024')->nullable();
            $table->string('image05', '1024')->nullable();
            $table->enum('default', ['Image 01','Image 02','Image 03','Image 04','Image 05'])->nullable()->default('Image 01');
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
        Schema::dropIfExists('product_images');
    }
}
