<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('d_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('COCODE', '5')->nullable();
            $table->char('BRCODE', '5')->nullable();
            $table->char('FYCODE', '5')->nullable();
            $table->char('FNCODE', '5')->nullable();
            $table->char('DOCNO', '20')->nullable();
            $table->decimal('SRNO', 10,0)->nullable();
            $table->decimal('SLNO', 10,0 )->nullable();
            $table->datetime('DOCDATE')->nullable();
            $table->char('CO', '5')->nullable();
            $table->char('BR', '5')->nullable();
            $table->char('ACCCODE', '15')->nullable();
            $table->string('REFNO', '60')->nullable();
            $table->datetime('REFDATE')->nullable();
            $table->decimal('AMT', 30,10)->default(0);
            $table->decimal('SIGN', 2,0)->default(1);
            $table->string('NARRATION', '255')->nullable();
            $table->string('NARRATION2', '255')->nullable();
            $table->char('REFCOCODE', '5')->nullable();
            $table->char('REFBRCODE', '5')->nullable();
            $table->char('REFFYCODE', '5')->nullable();
            $table->char('REFFNCODE', '5')->nullable();
            $table->char('REFDOCNO', '20')->nullable();
            $table->decimal('REFSRNO', 10,0 )->nullable();
            $table->enum('TYPE', ['System','Normal','PostDated'])->default('Normal');
            $table->enum('APPROVAL_STATUS', ['Approved','Pending','Rejected'])->nullable()->default('Pending');
            $table->enum('APPROVAL_MODE', ['Insert','Update','Delete'])->nullable()->default('Insert');
            $table->enum('APPROVAL_TYPE', ['Default','User'])->nullable()->default('Default');
            $table->enum('CANCEL', ['Yes','No'])->default('No');
            $table->decimal('VERSION', 10,0)->default(1);
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
        Schema::dropIfExists('d_data');
    }
}
