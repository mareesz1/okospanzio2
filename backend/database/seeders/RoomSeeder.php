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
            'type' => 'Normal',
            'number' => 1,
            'price' => 32000,
            'description' => 'Két személyre szóló szoba, saját fürdővel, konyhával. A konyha és a hálószoba a folyópartra nyújt kilátást.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://media.nomadicmatt.com/2021/hoteltips2.jpg',
            'type' => 'Normal',
            'number' => 2,
            'price' => 45000,
            'description' => 'Három fő részére egy kiváló nyugodt, letisztult, csendes szoba saját konyhával fürdővel.',
            'beds' => '3'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://www.rwlasvegas.com/wp-content/uploads/2022/05/crockfords-las-vegas-standard-deluxe-bedroom_1000x880.jpg',
            'type' => 'Normal',
            'number' => 3,
            'price' => 32000,
            'description' => 'Egy kisebb szoba franciaággyal vidéki stílusú dekorációval. A természetet szeretőknek ajánljuk.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://www.italianbark.com/wp-content/uploads/2018/01/hotel-room-design-trends-italianbark-interior-design-blog.jpg',
            'type' => 'VIP',
            'number' => 4,
            'price' => 65000,
            'description' => 'Egy modern felszereltséggel, hatalmas hellyel rendelkező szoba. Egy franciaágy mellett két vendégágy is rendelkezésre áll.',
            'beds' => '2'
        ]);

        Rooms::factory()->create([
            'IMG' => 'https://img1.10bestmedia.com/Images/Photos/378649/Park-Hyatt-New-York-Manhattan-Sky-Suite-Master-Bedroom-low-res_54_990x660.jpg',
            'type' => 'Penthouse',
            'number' => 5,
            'price' => 160000,
            'description' => 'Hotelunk luxusfelszereltésgű lakosztálya rendelkezik erkéllyel, minibárral, jakuzzival mindemellett a hotel összes szolgáltatása is igénybevehető.',
            'beds' => '6'
        ]);
    }
}
