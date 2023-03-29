<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

<<<<<<< Updated upstream:backend/database/seeders/FixDataSeeder.php
class FixDataSeeder extends Seeder
=======
use \App\Models\AdminCodes;

class CodesSeeder extends Seeder
>>>>>>> Stashed changes:backend/database/seeders/CodesSeeder.php
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
<<<<<<< Updated upstream:backend/database/seeders/FixDataSeeder.php
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
=======
        AdminCodes::factory()->create([
>>>>>>> Stashed changes:backend/database/seeders/CodesSeeder.php
            'roles' => 'admin',
            'code' => 9999,
        ]);

        \App\Models\AdminCodes::factory()->create([
            'roles' => 'staff',
            'code' => 1234,
        ]);

        AdminCodes::factory()->create([
            'roles' => 'restaurant',
            'code' => 2222,
        ]);
    }
}
