<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePrintingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('printings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', '64')->nullable()->index();
            $table->string('description', '1024')->nullable();
            $table->char('fncode', '5')->nullable()->index();
            $table->string('query1', '1024')->nullable();
            $table->string('query2', '1024')->nullable();
            $table->string('query3', '1024')->nullable();
            $table->string('query1_props', '512')->nullable();
            $table->string('query2_props', '512')->nullable();
            $table->string('query3_props', '512')->nullable();
            $table->string('header1', '512')->nullable();
            $table->string('header2', '512')->nullable();
            $table->string('header3', '512')->nullable();
            $table->string('footer1', '512')->nullable();
            $table->string('footer2', '512')->nullable();
            $table->string('footer3', '512')->nullable();
            $table->text('template')->nullable();
            $table->text('object')->nullable();
            $table->unsignedBigInteger('file')->nullable();
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
        Schema::dropIfExists('printings');
    }
}
