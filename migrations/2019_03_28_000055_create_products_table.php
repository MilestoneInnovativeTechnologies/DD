<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('code', '30')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->char('uom', '15')->nullable();
            $table->char('partcode', '30')->nullable();
            $table->string('barcode', '128')->nullable();
            $table->string('narration', '1024')->nullable();
            $table->string('narration2', '1024')->nullable();
            $table->string('narration3', '1024')->nullable();
            $table->string('narration4', '1024')->nullable();
            $table->string('narration5', '1024')->nullable();
            $table->string('narration6', '1024')->nullable();
            $table->string('narration7', '1024')->nullable();
            $table->string('narration8', '1024')->nullable();
            $table->string('narration9', '1024')->nullable();
            $table->string('narration10', '1024')->nullable();
            $table->foreignNullable('group1', 'productgroups');
            $table->foreignNullable('group2', 'productgroups');
            $table->foreignNullable('group3', 'productgroups');
            $table->foreignNullable('group4', 'productgroups');
            $table->foreignNullable('group5', 'productgroups');
            $table->foreignNullable('group6', 'productgroups');
            $table->foreignNullable('group7', 'productgroups');
            $table->foreignNullable('group8', 'productgroups');
            $table->foreignNullable('group9', 'productgroups');
            $table->foreignNullable('group10', 'productgroups');
            $table->enum('type', ['Public','Protected','System'])->nullable()->default('Public');
            $table->enum('status', ['Active','Inactive'])->nullable()->default('Active');
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
        Schema::dropIfExists('products');
    }
}
