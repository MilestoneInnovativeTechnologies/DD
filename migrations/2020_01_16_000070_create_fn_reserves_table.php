<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFnReservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fn_reserves', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('fncode', '15')->nullable()->index();
            $table->foreignNullable('user', 'users');
            $table->foreignNullable('store', 'stores');
            $table->unsignedInteger('start_num')->nullable();
            $table->unsignedInteger('end_num')->nullable();
            $table->decimal('quantity', 30,10)->default(1);
            $table->unsignedInteger('current')->nullable()->default(0);
            $table->enum('progress', ['Awaiting','Processing','Completed'])->nullable()->default('Awaiting');
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
        Schema::dropIfExists('fn_reserves');
    }
}
