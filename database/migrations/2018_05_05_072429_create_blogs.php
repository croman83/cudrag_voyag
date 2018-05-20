<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBlogs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blogs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name_ru');
            $table->string('name_en');
            $table->string('name_ro');
            $table->string('image');
            $table->string('description_ru');
            $table->string('description_ro');
            $table->string('description_en');
            $table->string('description_mini_ru');
            $table->string('description_mini_ro');
            $table->string('description_mini_en');
            $table->string('seo_description_en');
            $table->string('seo_description_ro');
            $table->string('seo_description_ru');
            $table->string('seo_title_ru');
            $table->string('seo_title_ro');
            $table->string('seo_title_en');
            $table->tinyInteger('status');
            $table->string('slug')->unique('name_ro');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('blogs');
    }
}
