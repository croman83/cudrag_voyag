<?php

namespace App\Http\Controllers;
use App\Partner;
use App\Page;
use App\Tag;
use App\Category;
use App\Product;
use App\Service;
use Illuminate\Http\Request;
//use TCG\Voyager\Models\Category as Category;


class ResourceController extends Controller
{
    public function products(Request $request)
    {
        $input = $request->all();
        $per_page = setting('site.product_per_page');
        $lang = $input['lang'];
        $filter = $input['filter'];

        // find category
        $category = Category::where('slug',$input['categorySlug'])
            ->select('name_'.$lang.' as name','slug','id')
            ->first();


        // filter status 
        $products = Product::join('product_tag','product_tag.product_id','=','products.id')->where('status',1)->where(function ($query) use ($category,$filter){

            if(isset($category['id'])){
                $query->where('category_id',$category['id']);
            }

            if (isset($filter) && count($filter)){
                $query->whereIn('product_tag.tag_id',$filter);
//                $query->where('product_tag.tag_id',$filter);
            }

        })->groupBy('products.id');

        $col = count($products->get());
        // num page
        $ar = (count($products->get())) / $per_page;
        $chunk = ceil($ar);
        unset($ar);


        // filter page
        $products = $products
            ->skip($input['page'] * $per_page - $per_page)
            ->take($per_page);

        // select from product

        $products = $products
            ->select('name_'.$lang.' as name','slug','category_image','price')
            ->get();

        // get category tags
        $tag = Tag::where('category_id',$category['id'])
            ->select('name_'.$lang.' as name','id')
            ->get();

//        $foo = Product::find(1)->tags()->get();

        //collect data
        $data['foo'] = $col;
        $data['searchParams']['filter'] = $input['filter'];
        $data['searchParams']['page'] = $input['page'];
        $data['products'] = $products;
        $data['tag'] = $tag;
        $data['category'] = $category;
        $data['chunk'] = $chunk;

        return $data;
    }
    public function product(Request $request){
        $input = $request->all();
        $lang = $input['lang'];
        $product = Product::where('slug',$input['slug'])->first();
        $id = $product['id'];
        $cat_id = $product['category_id'];

        // all products with category
        $all = Product::where('status',1)->where('category_id',$cat_id)->pluck('id')->all();

        sort($all);
        $key = array_search($id,$all);
        if($key !== 0){
            $prev = Product::where('id',$all[$key-1])->select('slug')->first();
        }else{
            $prev = '';
        }
        if($key === count($all) - 1){
            $next = '';
        }else{
            $next = Product::where('id',$all[$key+1])->select('slug')->first();
        }


        $data['next'] = $next;
        $data['prev'] = $prev;
        $data['product'] = $product;
        return $data;
    }
    public function services(){
        $data = Service::where('status',1)->get();
        return $data;
    }
    public function service($slug){
        $data = Service::where('status',1)->where('slug',$slug)->first();
        return $data;
    }
    public function partners(){
        $data = Partner::where('status',1)->get();
        return $data;
    }
    public function partner($slug){
        $data = Partner::where('status',1)->where('slug',$slug)->first();
        return $data;
    }
    public function contacts(){
        $data = Page::where('slug','contacts')->first();
        return $data;
    }
}
