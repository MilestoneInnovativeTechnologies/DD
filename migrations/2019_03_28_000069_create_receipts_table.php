<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReceiptsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('receipts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('docno', '20')->nullable()->index();
            $table->foreignNullable('store', 'stores');
            $table->char('fycode', '5')->nullable()->index();
            $table->char('fncode', '5')->nullable()->index();
            $table->foreignNullable('user', 'users');
            $table->enum('mode', ['Cash','Cheque'])->nullable()->default('Cash');
            $table->foreignNullable('customer', 'users');
            $table->timestamp('date')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->decimal('amount', 30,10)->default(0);
            $table->string('bank', '60')->nullable();
            $table->string('cheque', '60')->nullable();
            $table->datetime('cheque_date')->nullable();
            $table->char('_ref', '30')->nullable()->index();
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
        Schema::dropIfExists('receipts');
    }
}
