<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

use \App\Models\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::factory()->create([
            'email' => 'mareszadmin@maresz.com',
            'password' => Hash::make('Maresz'),
            'roles' => 'admin',
            'code' => 9999,
            'firstName' => 'Maresz',
            'lastName' => 'Maresz',
            'gender' => 'deer',
            'phone' => 123,
        ]);

        User::factory()->create([
            'email' => 'admin@admin.com',
            'password' => Hash::make('admin'),
            'roles' => 'admin',
            'code' => 9999,
            'firstName' => 'admin',
            'lastName' => 'admin',
            'gender' => 'generic discord admin',
            'phone' => 124,
        ]);

        User::factory()->create([
            'email' => 'staff@staff.com',
            'password' => Hash::make('staff'),
            'roles' => 'staff',
            'code' => 1234,
            'firstName' => 'staff',
            'lastName' => 'staff',
            'gender' => 'male',
            'phone' => 125,
        ]);

        User::factory()->create([
            'email' => 'restaurant@restaurant.com',
            'password' => Hash::make('restaurant'),
            'roles' => 'restaurant',
            'code' => 2222,
            'firstName' => 'restaurant',
            'lastName' => 'restaurant',
            'gender' => 'helicopter',
            'phone' => 126,
        ]);
    }
}
