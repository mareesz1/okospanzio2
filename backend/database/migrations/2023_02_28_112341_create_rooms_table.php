<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rooms', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('number');
            $table->string('type', 20);
            $table->bigInteger('beds');
            $table->bigInteger('price')->nullable();
            // $table->bigInteger('extraPrice')->nullable();
            $table->string('description', 255);
            $table->string('qrcode')->nullable();
            // $table->string('nfc');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rooms');
    }
};
