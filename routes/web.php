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



Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::group(['prefix' => LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]], function() {
//    Route::get( 'set-language', [ 'as' => 'set-language', 'uses' => 'LangController@setLocale' ] );
//    Route::get('/{vue?}','ViewController@index')->where('vue', '[\/\w\.-]*');
//});
//Route::group(['prefix' => LaravelLocalization::setLocale()], function() {
    Route::get( 'set-language', [ 'as' => 'set-language', 'uses' => 'LangController@setLocale' ] );
    Route::get('/{vue?}','ViewController@index')->where('vue', '[\/\w\.-]*');
});




