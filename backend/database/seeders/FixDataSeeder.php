<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class FixDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory()->create([
            'email' => 'mareszadmin@maresz.com',
            'password' => Hash::make('Maresz'),
            'roles' => 'admin',
            'code' => 9999,
            'firstName' => 'Maresz',
            'lastName' => 'Maresz',
            'gender' => 'deer',
            'phone' => 123,
        ]);

        \App\Models\AdminCodes::factory()->create([
            'roles' => 'admin',
            'code' => 9999,
        ]);

        \App\Models\AdminCodes::factory()->create([
            'roles' => 'staff',
            'code' => 1234,
        ]);
    }
}
