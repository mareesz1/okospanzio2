<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Service;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Services::factory()->create([
            'name' => 'Konditerem',
            'price' => 1500,
        ]);

        Services::factory()->create([
            'name' => 'Szauna',
            'price' => 1000,
        ]);
        Services::factory()->create([
            'name' => 'Uszoda',
            'price' => 1200,
        ]);
        Services::factory()->create([
            'name' => 'Thai masszázs (igen az)',
            'price' => 50000,
        ]);
        Services::factory()->create([
            'name' => 'Seggtörlés',
            'price' => 500,
        ]);
    }
}
