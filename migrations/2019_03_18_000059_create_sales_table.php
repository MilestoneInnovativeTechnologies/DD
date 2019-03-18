<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('docno', '20')->nullable()->index();
            $table->unsignedBigInteger('customer')->nullable()->index();
            $table->unsignedBigInteger('executive')->nullable()->index();
            $table->enum('status', ['Active','Inactive'])->nullable()->default('Active');
            $table->audit();
            $table->foreign('customer')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('executive')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sales');
    }
}
