<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateImportsalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('importsales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('BILLNO', '60')->nullable();
            $table->datetime('DOCDATE')->nullable();
            $table->char('ACCCODE', '15')->nullable();
            $table->char('ITEMCODE', '30')->nullable();
            $table->char('UNITCODE', '15')->nullable();
            $table->char('PARTCODE', '30')->nullable();
            $table->decimal('QTY', 30,10)->default('1');
            $table->decimal('RATE', 30,10)->default('0');
            $table->decimal('DISCOUNT', 30,10)->default('0');
            $table->char('COCODE', '5')->nullable();
            $table->char('BRCODE', '5')->nullable();
            $table->char('FYCODE', '5')->nullable();
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
        Schema::dropIfExists('importsales');
    }
}
