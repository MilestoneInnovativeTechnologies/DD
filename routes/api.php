<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('api',function(){
    $DATA = [];
    \Milestone\SS\Model\User::where('reference','like','SE%')->get()->each(function($user)use(&$DATA){
        $token = now()->toDateTimeString() . random_bytes(8); $hash = hash('sha256',$token);
        $DATA[$user->name] = '?api_token=' . $hash; $user->api_token = $hash; $user->password = 123456; $user->save();
    });
    return $DATA;
});

Route::group([
    'prefix' => 'api'
],function(){
    Route::post('login',function(Request $request){
        $login = $request->get('login'); $login_password = strtoupper(sha1($request->get('password')));
        $user = \Milestone\SS\Model\User::where(compact('login','login_password'))->where('reference','like','SE%')->first();
        return ($user) ? $user->toArray() : [];
    });
    Route::get('setup',function(){ return new \Milestone\SS\Resources\SetupResource(\Milestone\SS\Model\Setup::find(1)); });
    Route::get('settings',function(){ return \Milestone\SS\Resources\SettingResource::collection(\Milestone\SS\Model\Setting::active()->get()); });
    Route::get('fiscal',function(){ return \Milestone\SS\Resources\FiscalResource::collection(\Milestone\SS\Model\Fiscalyearmaster::write()->get()); });
    Route::get('function',function(){ return \Milestone\SS\Resources\FunctionResource::collection(\Milestone\SS\Model\Functiondetail::all()); });
    Route::get('ptnature',function(){ return \Milestone\SS\Resources\ProductTransactionNatureResource::collection(\Milestone\SS\Model\ProductTransactionNature::active()->get()); });
    Route::get('pttype',function(){ return \Milestone\SS\Resources\ProductTransactionTypeResource::collection(\Milestone\SS\Model\ProductTransactionType::active()->get()); });
    Route::get('products',function(){ return \Milestone\SS\Resources\ProductResource::collection(\Milestone\SS\Model\Product::active()->get()); });
    Route::group([
        'middleware' => 'api',
    ],function(){
        Route::get('stores',function(){ return \Milestone\SS\Resources\StoreResource::collection(\Milestone\SS\Model\Store::requester()->active()->get()); });
        Route::get('areas',function(){ return \Milestone\SS\Resources\AreaResource::collection(\Milestone\SS\Model\Area::requester()->active()->get()); });
        Route::get('customers',function(){ return \Milestone\SS\Resources\CustomerResource::collection(\Milestone\SS\Model\Customer::requesterArea()->get()); });
        Route::get('transaction/{id}',function($id){ return new \Milestone\SS\Resources\TransactionResource(\Milestone\SS\Model\Transaction::with('Details')->find($id)); });
    });
});
