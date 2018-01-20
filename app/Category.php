<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //
    public function products()
    {
        return $this->hasMany('App\Product');
    }
    public function tags()
    {
        return $this->hasMany('App\Tag','category_id');
    }
}
