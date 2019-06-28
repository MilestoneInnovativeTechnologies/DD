<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFiscalyearmasterTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fiscalyearmaster', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('code', '15')->nullable()->index();
            $table->char('cocode', '5')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->string('abr', '15')->nullable();
            $table->datetime('start_date')->nullable();
            $table->datetime('end_date')->nullable();
            $table->enum('status', ['ReadWrite','ReadOnly','Inactive'])->default('ReadWrite')->nullable();
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
        Schema::dropIfExists('fiscalyearmaster');
    }
}
