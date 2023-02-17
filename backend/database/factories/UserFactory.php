<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        //     $table->id();
        //     $table->string('firstName');
        //     $table->string('lastName');
        //     $table->boolval('gender');
        //     $table->string('email');
        //     $table->number('phone', 16);
        //     $table->string('passwordHash');
        //     $table->timestamps();
        return [
            'firstName' => $this->faker->word,
            'lastName' => $this->faker->word,
            'gender' => $this->faker->randomElement(['male', 'female']),
            'email' => $this->faker->unique->email,
            'phone' => $this->faker->unique->phoneNumber,
            'passwordHash' => null,
        ];
    }
}
