<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductGroupMasterTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_group_master', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', '64')->nullable()->index();
            $table->char('code', '15')->nullable()->index();
            $table->char('list', '15')->nullable()->index();
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
        Schema::dropIfExists('product_group_master');
    }
}
