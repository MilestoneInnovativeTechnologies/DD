<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoreunloadTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('storeunload', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('store', 'stores');
            $table->timestamp('date')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->unsignedBigInteger('user');
            $table->audit();
            $table->foreign('user')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('storeunload');
    }
}
