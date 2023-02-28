<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Menu>
 */
class MenuFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word(3),
            'description' => $this->faker->sentence(3),
            'price' => $this->faker->numberBetween(300, 19000),
            'type' => $this->faker->randomElement(['Leves', 'Szárnyas', 'Sertés', 'Marha', 'Hal', 'Desszert']),
        ];
    }
}
