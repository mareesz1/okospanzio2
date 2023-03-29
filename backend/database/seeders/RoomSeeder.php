<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
// use Faker\Generator as Faker;

use \App\Models\Rooms;

class RoomSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Rooms::factory()->create([
            'IMG' => 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304',
            'type' => 'normal',
            'number' => 3,
            'price' => 16000,
            'description' => 'Repellendus praesentium aspernatur quo a similique laudantium. Tempore blanditiis sunt dolores modi unde quia. Eius distinctio sint dolor et sapiente rerum rerum.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://media.nomadicmatt.com/2021/hoteltips2.jpg',
            'type' => 'normal',
            'number' => 4,
            'price' => 20000,
            'description' => 'Aspernatur mollitia occaecati quo qui omnis. Quisquam expedita esse nobis tempore illo sit vero. Sed adipisci error ad sint omnis expedita earum.',
            'beds' => '3'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://www.rwlasvegas.com/wp-content/uploads/2022/05/crockfords-las-vegas-standard-deluxe-bedroom_1000x880.jpg',
            'type' => 'superior',
            'number' => 6,
            'price' => 26000,
            'description' => 'Facere aut molestias eius sit. Autem distinctio illo ex eum omnis expedita optio dolor. Itaque aut cupiditate eveniet illo recusandae autem rerum.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://www.italianbark.com/wp-content/uploads/2018/01/hotel-room-design-trends-italianbark-interior-design-blog.jpg',
            'type' => 'VIP',
            'number' => 5,
            'price' => 30000,
            'description' => 'Similique unde molestias quod eos asperiores suscipit. Sed dolor et natus. Rerum et aperiam enim necessitatibus beatae illo nisi.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://img1.10bestmedia.com/Images/Photos/378649/Park-Hyatt-New-York-Manhattan-Sky-Suite-Master-Bedroom-low-res_54_990x660.jpg',
            'type' => 'penthouse',
            'number' => 10,
            'price' => 35000,
            'description' => 'Quasi quia voluptas qui architecto. Veniam dolorem dicta enim sit aperiam sapiente sunt. Dolorem eum et ex eius distinctio.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
            'type' => 'grand',
            'number' => 9,
            'price' => 40000,
            'description' => 'Vel consequuntur deserunt eveniet quis. Quo provident et eveniet ut aut. Laborum iusto voluptatem quia.',
            'beds' => '2'
        ]);
    }
}
