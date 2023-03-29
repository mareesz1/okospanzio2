<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\AdminCodes::factory(2)->create();
        \App\Models\User::factory(20)->create();
        // \App\Models\Rooms::factory(6)->create();
        \App\Models\Menu::factory(30)->create();
        \App\Models\RestaurantOrders::factory(25)->create();
        \App\Models\Tables::factory(10)->create();

        $this->call([
           RoomSeeder::class,
           CodesSeeder::class,
           UsersSeeder::class,
        ]);
    }
}
