<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




    Route::get('demo/reset',function(){
        \Illuminate\Support\Facades\DB::unprepared(file_get_contents(__DIR__ . '/../ssdb.sql'));
//        \Illuminate\Support\Facades\Artisan::call('migrate:refresh');
//        \Illuminate\Support\Facades\Artisan::call('db:seed',['--class' => 'Milestone\\SS\\Seeder\\DatabaseSeeder']);
//        \Illuminate\Support\Facades\Artisan::call('db:seed',['--class' => 'Milestone\\SS\\Seeder\\SSDatabaseSeeder']);
        return 'DONE';
    });