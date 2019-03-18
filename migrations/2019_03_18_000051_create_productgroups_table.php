<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductgroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productgroups', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('code', '15')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->enum('master', ['No','Yes'])->default('No');
            $table->foreignNullable('parent', 'productgroups');
            $table->enum('type', ['Public','Protected','System'])->nullable()->default('Public');
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
        Schema::dropIfExists('productgroups');
    }
}
