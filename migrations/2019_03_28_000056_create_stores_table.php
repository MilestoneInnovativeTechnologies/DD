<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stores', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('catcode', '15')->nullable()->index();
            $table->char('code', '15')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->char('cocode', '5')->nullable()->index();
            $table->string('co_abr', '15')->nullable();
            $table->char('brcode', '6')->nullable()->index();
            $table->string('br_abr', '15')->nullable();
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
        Schema::dropIfExists('stores');
    }
}
