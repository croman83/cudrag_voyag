<?php

namespace App\Http\Controllers;
use App\Tag;
use App\Categorie;
use App\Product;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category as Category;


class ResourceController extends Controller
{
    public function products(Request $request)
    {
        $input = $request->all();
        $per_page = setting('site.product_per_page');
        $lang = $input['lang'];
        $filter = $input['filter'];

        // find category
        $category = Categorie::where('slug',$input['categorySlug'])
            ->select('name_'.$lang.' as name','slug','id')
            ->first();


        // filter status
        $products = Product::where('status',1);




        // filter category
        $products = $products
            ->where('category_id',$category['id']);


        // filter tags
        if(true){
//        if(count($filter)){
            $col = [];
            $i = 0;
            foreach ($products as $item){
//                $col[$i] = Product::find($item['id'])->tags()->get();
                $col[$i] = $i+1;
                $i++;
            }
            unset($item);
        }
        else{
            $products = $products;
        }

        // filter page
        $products = $products
            ->skip($input['page'] * $per_page - $per_page)
            ->take($per_page)
            ->get();

        // get category tags
        $tag = Tag::where('category_id',$category['id'])
            ->select('name_'.$lang.' as name','id')
            ->get();

        $foo = Product::find(1)->tags()->get();

        //collect data
        $data['foo'] = $col;
        $data['searchParams']['filter'] = $input['filter'];
        $data['products'] = $products;
        $data['tag'] = $tag;
        $data['category'] = $category;

        return $data;
    }
}
