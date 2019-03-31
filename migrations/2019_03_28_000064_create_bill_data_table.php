<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBillDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('COCODE', '5')->nullable();
            $table->char('BRCODE', '5')->nullable();
            $table->char('FYCODE', '5')->nullable();
            $table->char('FNCODE', '5')->nullable();
            $table->char('DOCNO', '20')->nullable();
            $table->decimal('SRNO', 10,0)->nullable();
            $table->decimal('DSRNO', 10,0)->nullable();
            $table->datetime('DOCDATE')->nullable();
            $table->char('CO', '5')->nullable();
            $table->char('BR', '5')->nullable();
            $table->char('ACCCODE', '15')->nullable();
            $table->string('BILLNO', '60')->nullable();
            $table->datetime('BILLDATE')->nullable();
            $table->datetime('DUEDATE')->nullable();
            $table->decimal('AMT', 30,10)->default(0);
            $table->decimal('SIGN', 2,0)->default(1);
            $table->enum('BILL_TYPE', ['Original','Allocation'])->default('Original');
            $table->enum('TYPE', ['System','Normal','PostDated'])->default('Normal');
            $table->enum('CANCEL', ['Yes','No'])->default('No');
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
        Schema::dropIfExists('bill_data');
    }
}
