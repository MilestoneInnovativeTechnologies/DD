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
        \Illuminate\Support\Facades\Log::info('Demo reset called: ' . request()->fullUrl() . "\t" . request()->ip());
        \Illuminate\Support\Facades\Log::info(json_encode(request()->header()));
        return '<form method="post"><input type="submit" value="Confirm"></form>';
    });

    Route::post('demo/reset',function(){
        \Illuminate\Support\Facades\DB::unprepared(file_get_contents(__DIR__ . '/../ssdb.sql'));
        \Illuminate\Support\Facades\Log::info('Demo reset executed: ' . request()->fullUrl() . "\t" . request()->ip());
        \Illuminate\Support\Facades\Log::info(request()->header());
        return 'DONE';
//        \Illuminate\Support\Facades\Artisan::call('migrate:refresh');
//        \Illuminate\Support\Facades\Artisan::call('db:seed',['--class' => 'Milestone\\SS\\Seeder\\DatabaseSeeder']);
//        \Illuminate\Support\Facades\Artisan::call('db:seed',['--class' => 'Milestone\\SS\\Seeder\\SSDatabaseSeeder']);
    });

    Route::group([
        'namespace' => 'Milestone\SS\Controller',
        'middleware' => ['web']
    ],function(){
        Route::get('image/item/{id}','ProductImageController@image');
    });
