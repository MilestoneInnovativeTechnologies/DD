<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('code', '30')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->char('uom', '15')->nullable();
            $table->char('partcode', '30')->nullable();
            $table->string('barcode', '128')->nullable();
            $table->string('narration', '1024')->nullable();
            $table->string('narration2', '1024')->nullable();
            $table->decimal('taxfactor', 30,10)->default('0');
            $table->decimal('subtaxfactor', 30,10)->default('0');
            $table->decimal('taxfactor02', 30,10)->default('0');
            $table->decimal('subtaxfactor02', 30,10)->default('0');
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
        Schema::dropIfExists('products');
    }
}
