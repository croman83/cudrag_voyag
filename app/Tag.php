<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Tag extends Model
{
    public function products()
    {
        return $this->hasMany('App\Product');
    }
    public function categoriesId()
    {
        return $this->belongsTo('App\Category','id');
    }
}
