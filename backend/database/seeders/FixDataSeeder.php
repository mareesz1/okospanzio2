<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

use \App\Models\User;
use \App\Models\AdminCodes;

class FixDataSeeder extends Seeder
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

        AdminCodes::factory()->create([
            'roles' => 'admin',
            'code' => 9999,
        ]);

        AdminCodes::factory()->create([
            'roles' => 'staff',
            'code' => 1234,
        ]);
    }
}
