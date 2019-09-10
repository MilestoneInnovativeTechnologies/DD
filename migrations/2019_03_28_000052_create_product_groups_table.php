<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_groups', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('product', 'products');
            $table->foreignNullable('g01', 'product_group_master');
            $table->foreignNullable('g02', 'product_group_master');
            $table->foreignNullable('g03', 'product_group_master');
            $table->foreignNullable('g04', 'product_group_master');
            $table->foreignNullable('g05', 'product_group_master');
            $table->foreignNullable('g06', 'product_group_master');
            $table->foreignNullable('g07', 'product_group_master');
            $table->foreignNullable('g08', 'product_group_master');
            $table->foreignNullable('g09', 'product_group_master');
            $table->foreignNullable('g10', 'product_group_master');
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
        Schema::dropIfExists('product_groups');
    }
}
