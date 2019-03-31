<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTaxDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tax_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignCascade('tax', 'tax');
            $table->char('taxcode', '15')->nullable()->index();
            $table->char('code', '15')->nullable()->index();
            $table->string('name', '64')->nullable()->index();
            $table->decimal('percentage', 5,2)->default(0);
            $table->string('percentageequation', '200')->nullable();
            $table->enum('taxtype', ['TaxOnTaxableAmount','TaxOnMRP','TaxOnTotalAmount','TaxOnTax','TaxOnTotalTax','TaxOnQuantity','FixedTax'])->nullable()->default('TaxOnTaxableAmount');
            $table->enum('taxnature', ['Tax','SubTax','AdditionalTax'])->nullable()->default('Tax');
            $table->decimal('amount', 30,10)->default(0);
            $table->char('inputcode', '15')->nullable();
            $table->char('outputcode', '15')->nullable();
            $table->char('reftaxcode', '15')->nullable();
            $table->unsignedTinyInteger('processorder')->default(1);
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
        Schema::dropIfExists('tax_details');
    }
}
