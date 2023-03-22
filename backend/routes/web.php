<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/tokens/create', function (Request $request) {
    $token = csrf_token();
    $out = $out = new \Symfony\Component\Console\Output\ConsoleOutput();
    $out->writeln($token);

    // return ['token' => $token->plainTextToken];
    return response()->json([
        'status' => true,
        'csrf-token' => $token
    ]);
});
