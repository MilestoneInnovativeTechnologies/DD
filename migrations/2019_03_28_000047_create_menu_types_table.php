<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu_types', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', '64')->nullable()->index();
            $table->string('display_name', '128')->nullable();
            $table->string('fncodes', '256')->nullable();
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
        Schema::dropIfExists('menu_types');
    }
}
