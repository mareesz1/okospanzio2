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

// Route::apiResource('task',TaskController::class);
Route::apiResource('user',UserController::class);

Route::post('login', function (Request $request) {
    return LoginController::authenticate($request);
});
Route::get('login', function (Request $request) {
    return LoginController::getSessionId($request);
});
Route::get('/login/get', function (Request $request) {
    return LoginController::getAuthenticatedUser($request);
})->middleware('auth:sanctum');
Route::delete('/login', function (Request $request) {
    return LoginController::logout($request);
});

Route::get('room', [RoomController::class, 'index']);
Route::apiResource('room',RoomController::class);
Route::apiResource('menu',MenuController::class);
Route::apiResource('tables',TablesController::class)->middleware('auth:sanctum');

Route::get('/orders/all', function () {
    return RestaurantOrdersController::indexALl();

})->middleware('auth:sanctum');

Route::get('/tables/all', function () {
    return TablesController:: indexAll();
})->middleware('auth:sanctum');

Route::get('/orders/all/{id}', function (string $id) {
    return RestaurantOrdersController::showJoined($id);
})->middleware('auth:sanctum');
Route::post('/orders/state/{id}', [RestaurantOrdersController::class, 'saveState'])->middleware('auth:sanctum');

Route::apiResource('orders',RestaurantOrdersController::class)->middleware('auth:sanctum');
Route::get('room', [RoomController::class, 'index']);

// TESZT
// Route::post('/auth/login', [LoginController::class, 'loginUser']);

