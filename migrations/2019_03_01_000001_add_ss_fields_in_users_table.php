<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddSsFieldsInUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('email',191)->change();
            $table->char('reference',15)->nullable()->index()->after('email');
            $table->string('api_token',128)->nullable()->index()->after('email');
            $table->decimal('overdue',30,10)->nullable()->default(0)->after('email');
            $table->decimal('outstanding',30,10)->nullable()->default(0)->after('email');
            $table->string('address',512)->nullable()->after('email');
            $table->string('phone',128)->nullable()->index()->after('email');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['reference','api_token','address','phone','outstanding','overdue']);
        });
    }
}
