<?php

use App\Http\Controllers\TaskController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\RestaurantOrdersController;
use App\Http\Controllers\TablesController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::apiResource('task',TaskController::class);
Route::apiResource('user',UserController::class);
Route::apiResource('login',LoginController::class);
Route::apiResource('room',RoomController::class);
Route::apiResource('menu',MenuController::class);
Route::apiResource('tables',TablesController::class);

Route::get('/orders/all', function () {
    return RestaurantOrdersController::indexALl();
});
Route::get('/tables/all', function () {
    return TablesController:: indexAll();
});
Route::get('/orders/all/{id}', function (string $id) {
    return RestaurantOrdersController::showJoined($id);
});
Route::post('/orders/state/{id}', [RestaurantOrdersController::class, 'saveState']);

Route::apiResource('orders',RestaurantOrdersController::class);

