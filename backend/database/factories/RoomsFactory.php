<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Rooms>
 */
class RoomsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'number' => $this->faker->randomElement([1, 2, 3, 4, 5, 6, 7, 8, 9]),
            'type' => $this->faker->randomElement(['Normal', 'Superior', 'VIP', 'Penthouse']),
            'beds' => $this->faker->randomElement([1, 2, 3, 4, 5, 6]),
            'price' => $this->faker->randomNumber(5, true),
            'description' => $this->faker->paragraph(3, false),
            'qrcode' => null,
        ];
    }
}
