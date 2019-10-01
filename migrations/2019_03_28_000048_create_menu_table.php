<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('fncode', '5')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->string('icon', '128')->nullable();
            $table->string('home_display', '128')->nullable();
            $table->string('drawer_display', '128')->nullable();
            $table->tinyInteger('order')->nullable()->default('1');
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
        Schema::dropIfExists('menu');
    }
}
