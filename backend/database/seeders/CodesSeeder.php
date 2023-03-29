<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use \App\Models\AdminCodes;

class CodesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        AdminCodes::factory()->create([
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
