<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateChequeDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cheque_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('COCODE', '5')->nullable();
            $table->char('BRCODE', '5')->nullable();
            $table->char('FYCODE', '5')->nullable();
            $table->char('FNCODE', '5')->nullable();
            $table->char('DOCNO', '20')->nullable();
            $table->decimal('SRNO', 10,0)->nullable();
            $table->decimal('VERSION', 10,0)->default(1);
            $table->datetime('DOCDATE')->nullable();
            $table->char('CO', '5')->nullable();
            $table->char('BR', '5')->nullable();
            $table->char('ACCCODE', '15')->nullable();
            $table->char('BANKCODE', '15')->nullable();
            $table->char('PDCCODE', '15')->nullable();
            $table->string('CHQNO', '60')->nullable();
            $table->datetime('CHQDATE')->nullable();
            $table->datetime('SUBMITTEDDATE')->nullable();
            $table->datetime('PROCESSEDDATE')->nullable();
            $table->decimal('AMT', 30,10)->default(0);
            $table->decimal('SIGN', 2,0)->default(1);
            $table->enum('CHQ_STATUS', ['Approved','Pending','Rejected'])->default('Pending');
            $table->enum('CANCEL', ['Yes','No'])->default('No');
            $table->enum('SETTLEMENT', ['NONE','National Electronics Funds Transfer(NEFT)','Real Time Gross Settlement(RTGS)','New Cheque','Resubmitt','Cash'])->default('NONE');
            $table->datetime('RESUBMITIONDATE')->nullable();
            $table->char('REFCOCODE', '5')->nullable();
            $table->char('REFBRCODE', '5')->nullable();
            $table->char('REFFNCODE', '5')->nullable();
            $table->char('REFFYCODE', '5')->nullable();
            $table->char('REFDOCNO', '20')->nullable();
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
        Schema::dropIfExists('cheque_details');
    }
}
