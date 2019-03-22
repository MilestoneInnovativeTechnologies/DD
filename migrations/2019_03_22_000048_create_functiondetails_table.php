<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFunctiondetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('functiondetails', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('code', '15')->nullable()->index();
            $table->string('format', '30')->nullable()->default('[BR][FN]-[FY]-[AI]');
            $table->decimal('digit_length', 2,0)->default(4);
            $table->enum('direction', ['Out','In'])->default('Out');
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
        Schema::dropIfExists('functiondetails');
    }
}
