<?php

use App\Mainslider;
use Illuminate\Http\Request;
use App\Http\Resources\MainSlider as MainSliderRes;
use App\Partner;
use App\Http\Resources\PartnersShort;
use App\Blog;
use App\Http\Resources\BlogList;
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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/sliders', function () {
    return MainSliderRes::collection(Mainslider::where('status',1)->get());
});
Route::get('/partners_short', function () {
    return PartnersShort::collection(Partner::where('status',1)->get());
});
Route::get('/blog-list', function () {
    return BlogList::collection(Blog::where('status',1)->get());
});