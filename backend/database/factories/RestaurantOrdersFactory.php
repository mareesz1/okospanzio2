<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RestaurantOrders>
 */
class RestaurantOrdersFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'foodId' => $this->faker->numberBetween(1, 30),
            'quantity' => $this->faker->numberBetween(1, 8),
            'actualPrice' => $this->faker->numberBetween(300, 25000),
            'status' => $this->faker->randomElement(['sent', 'confirmed', 'cooking', 'waiting', 'out']),
            'tableId' => $this->faker->numberBetween(1, 8),
        ];
    }
}
