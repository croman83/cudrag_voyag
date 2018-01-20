<?php

namespace App\Http\Controllers;

use View;
use Config;
use Lang;
use Redirect;
use Illuminate\Http\Request;
use App;
use App\Category;
use LaravelLocalization;
use App\Service;


class ViewController extends Controller
{
    public function __construct()
    {
        // во всех конструкторах необходимо кинуть локаль и список поддерживаемых локалей в шаблонизатор, чтобы реализовать переключатель языка. Для примера бросил здесь, но лучше где-нить в Controller::constructor'е
        View::share( 'locale', Lang::getLocale() );
        View::share( 'locales', LaravelLocalization::getSupportedLocales() );
    }

    public function index()
    {
//        $cat = Category::where([
//            ['status',1],
//        ])
//            ->select([
//                'name_'.App::getLocale().' as name',
//                'parent_category',
//                'slug',
//                'id'
//            ])
//            ->get()->toJson();
//        return view('welcome',compact('cat'));
        $lang = App::getLocale();
        $cats = Category::where('status',1)->select('name_'.$lang.' as name','id','slug','image')->get();
        $serv = Service::where('status',1)->select('name_'.$lang.' as name','id','slug','category_image')->get();
        return view('index',compact('cats','serv'));
    }

    public function getCategories(Request $request)
    {
        $category = $request->input('category');
        $data['locale'] = App::getLocale();
        $cat = DB::table('categories')
            ->where([
                ['status',1],
                ['parent_category',$category]
            ])
            ->select(
            'name_'.$data['locale'].' as name',
            'image',
            'id',
            'slug')->get();

        return $cat;
    }




}
