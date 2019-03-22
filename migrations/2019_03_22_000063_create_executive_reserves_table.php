<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExecutiveReservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('executive_reserves', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('executive')->nullable()->index();
            $table->char('fncode', '15')->nullable()->index();
            $table->unsignedTinyInteger('reserves')->default(0);
            $table->audit();
            $table->foreign('executive')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('fncode')->references('code')->on('functiondetails')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('executive_reserves');
    }
}
