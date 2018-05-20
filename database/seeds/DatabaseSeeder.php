<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        DB::table('categories')->insert([
            'order' => 1,
            'slug' => 'category-one',
            'name_ru' => 'Category-one',
            'name_ro' => 'Category-one',
            'name_en' => 'Category-one',
            'status' => 1,
            'parent_id' => 0
        ]);
    }
}
