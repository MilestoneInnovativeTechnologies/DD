<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShiftTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shift_transactions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('shift', 'shift');
            $table->char('fncode', '15')->nullable()->index();
            $table->char('docno', '20')->nullable()->index();
            $table->enum('cancel', ['No','Yes'])->default('No');
            $table->decimal('cash', 30,10)->default(0);
            $table->decimal('credit', 30,10)->default(0);
            $table->decimal('card', 30,10)->default(0);
            $table->decimal('cheque', 30,10)->default(0);
            $table->decimal('digitalwallet', 30,10)->default(0);
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
        Schema::dropIfExists('shift_transactions');
    }
}
