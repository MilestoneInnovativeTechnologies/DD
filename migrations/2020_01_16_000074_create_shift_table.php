<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShiftTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shift', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('_ref', '30')->nullable()->index();
            $table->char('cocode', '5')->nullable()->index();
            $table->char('brcode', '6')->nullable()->index();
            $table->char('fycode', '5')->nullable()->index();
            $table->char('fncode', '15')->nullable()->index();
            $table->char('docno', '20')->nullable()->index();
            $table->foreignNullable('user', 'users');
            $table->decimal('opening', 30,10)->default(0);
            $table->decimal('closing', 30,10)->default(0);
            $table->decimal('difference', 30,10)->default(0);
            $table->datetime('start_date')->nullable();
            $table->datetime('end_date')->nullable();
            $table->enum('allow_difference', ['Yes','No'])->default('Yes');
            $table->enum('allow_cheque', ['No','Yes'])->default('No');
            $table->enum('cancel', ['No','Yes'])->default('No');
            $table->enum('status', ['Approved','Pending','Rejected','Completed','Cancelled'])->default('Approved');
            $table->enum('ssinit', ['No','Yes'])->default('No');
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
        Schema::dropIfExists('shift');
    }
}
