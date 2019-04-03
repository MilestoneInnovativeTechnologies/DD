<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSetupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('setup', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->char('CODE', '15')->nullable();
            $table->enum('DBTYPE', ['Normal','DistributedServer','DistributedClient'])->nullable()->default('Normal');
            $table->decimal('QUANTITY_DECIMAL', 10,0)->nullable()->default('0');
            $table->decimal('RATE_DECIMAL', 10,0)->nullable()->default('2');
            $table->decimal('AMOUNT_DECIMAL', 10,0)->nullable()->default('2');
            $table->decimal('CURRENCY_DECIMAL', 10,0)->nullable()->default('6');
            $table->enum('QUANTITY_SEPARATOR', ['Yes','No'])->nullable();
            $table->enum('RATE_SEPARATOR', ['Yes','No'])->nullable();
            $table->enum('AMOUNT_SEPARATOR', ['Yes','No'])->nullable();
            $table->enum('CURRENCY_SEPARATOR', ['Yes','No'])->nullable();
            $table->string('DOCDATE_FORMAT', '30')->nullable()->default('dd-MM-yyyy');
            $table->string('REFDATE_FORMAT', '30')->nullable()->default('dd-MM-yyyy');
            $table->string('CHQDATE_FORMAT', '30')->nullable()->default('dd-MM-yyyy');
            $table->string('OTHDATE_FORMAT', '30')->nullable()->default('dd-MM-yyyy');
            $table->string('CURRENCYDENOMINATION', '200')->nullable();
            $table->enum('MULTICOMPANY', ['Yes','No'])->nullable()->default('No');
            $table->enum('MULTIBRANCH', ['Yes','No'])->nullable()->default('No');
            $table->enum('MULTICURRENCY', ['Yes','No'])->nullable()->default('No');
            $table->enum('MULTIPRINT', ['Yes','No'])->nullable()->default('No');
            $table->enum('MULTISTORE', ['Yes','No'])->nullable()->default('No');
            $table->enum('MULTIUNIT', ['Yes','No'])->nullable()->default('No');
            $table->enum('SHIFTMANAGEMENT', ['Yes','No'])->nullable()->default('No');
            $table->string('BUSINESSKEY', '60')->nullable();
            $table->enum('INVACCPOSTING', ['ExactValue','RoundedValue'])->nullable()->default('ExactValue');
            $table->enum('ITEMCACHE', ['Yes','No'])->nullable()->default('No');
            $table->enum('NEGATIVESTOCK', ['Allow','Block','Question','User'])->nullable()->default('Allow');
            $table->string('POQTYUDATE', '200')->nullable();
            $table->string('SOQTYUDATE', '200')->nullable();
            $table->enum('PRODUCTION', ['None','Simple','Standard','Advanced'])->nullable()->default('None');
            $table->enum('PRODUCTIONCOSTUPDATION', ['Auto','None'])->nullable()->default('None');
            $table->enum('PRODUCTIONNARRATION', ['Public','Protected'])->nullable()->default('Protected');
            $table->char('DEFAULTBRANCH', '15')->nullable()->default('HO');
            $table->char('DEFAULTUNIT', '15')->default('PCS');
            $table->enum('TAX', ['Yes','No'])->nullable()->default('Yes');
            $table->enum('TAX02', ['Yes','No'])->nullable()->default('No');
            $table->enum('TAXREF', ['ItemGroup','Item'])->nullable()->default('Item');
            $table->enum('ITEMSERIAL', ['Yes','No'])->nullable()->default('No');
            $table->string('ITEMSERIALTEXT', '30')->DEFAULT ('Item Serial');
            $table->enum('PAYMENTMODEACTION', ['Direct','Ledger'])->nullable()->default('Direct');
            $table->enum('BILLPOSTING', ['Auto','Manual','None'])->nullable()->default('Manual');
            $table->enum('AUTOBILLPOSTING', ['UptoDate','AnyDate'])->nullable()->default('UptoDate');
            $table->enum('PROFIT', ['Profit','Margin'])->nullable()->default('Profit');
            $table->enum('PROFITCALCULATION', ['Online','Offline'])->nullable()->default('Online');
            $table->datetime('CLOSEDUPTO')->nullable();
            $table->enum('COSTING', ['FIFO','WeightedAverage','LIFO','Manual'])->nullable()->default('FIFO');
            $table->enum('BATCHNO', ['Auto','Manual','None'])->nullable()->default('None');
            $table->enum('MFGDATE', ['Auto','Manual','None'])->nullable()->default('None');
            $table->enum('EXPDATE', ['Auto','Manual','None'])->nullable()->default('None');
            $table->string('MFGDATE_FORMAT', '30')->nullable()->default('MMM-yyyy');
            $table->string('EXPDATE_FORMAT', '30')->nullable()->default('MMM-yyyy');
            $table->mediumInteger('LIFETIME')->default('2');
            $table->enum('LIFETIMEINTERVAL', ['Day','Week','Month','Year'])->nullable()->default('Year');
            $table->enum('PARTCODE', ['Yes','No'])->nullable()->default('No');
            $table->string('PARTCODETEXT', '30')->default('PARTCODE');
            $table->enum('AREA', ['Yes','No'])->nullable()->default('No');
            $table->string('AREATEXT', '30')->default('Area');
            $table->enum('STORAGEBIN', ['Yes','No'])->nullable()->default('No');
            $table->string('STORAGEBINTEXT', '30')->DEFAULT ('Storage Bin');
            $table->enum('WORKFLOW', ['Enabled','Disabled'])->nullable()->default('Disabled');
            $table->char('LANGUAGE', '15')->nullable();
            $table->string('CULTURE', '30')->nullable();
            $table->enum('STOCKJVPOSTING', ['Monthly','Quarterly','Half-Yearly','Annually'])->nullable()->default('Monthly');
            $table->enum('PROFITJVPOSTING', ['Monthly','Quarterly','Half-Yearly','Annually'])->nullable()->default('Annually');
            $table->enum('REPORTTITLE', ['CompanyName','BranchName','Branches'])->nullable()->default('CompanyName');
            $table->enum('PRINTLOG', ['None','Function','Report','All'])->nullable()->default('None');
            $table->enum('LOADIMAGEONSTARTUP', ['Yes','No'])->nullable()->default('No');
            $table->char('THEME', '15')->nullable();
            $table->enum('SERACHFROMBEGINNING', ['Yes','No'])->nullable()->default('No');
            $table->enum('SEACHAUTOLOCK', ['Yes','No'])->nullable()->default('Yes');
            $table->enum('REMEMBERLASTSEARCH', ['Yes','No'])->nullable()->default('No');
            $table->string('DIGITALWALLETTEXT', '30')->nullable()->default('eWallet');
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
        Schema::dropIfExists('setup');
    }
}
