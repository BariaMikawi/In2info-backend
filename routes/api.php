<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Models\Product;


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
use App\Http\Controllers\CartController;
use App\Http\Controllers\OrderController;

Route::post('/checkout', [OrderController::class, 'checkout']);


Route::get('/cart/{cart_id}', [CartController::class, 'getCartItems']);
Route::post('/cart/add', [CartController::class, 'addItemToCart']);
Route::delete('/cart/remove/{id}', [CartController::class, 'removeItemFromCart']);



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::apiResource('products', ProductController::class);
Route::post('/products', [ProductController::class, 'store']);

    Route::get('/products', [ProductController::class, 'index']);
    Route::get('/orders', [OrderController::class, 'index']);
    Route::resource('products', ProductController::class);

    Route::apiResource('products', ProductController::class);
    Route::apiResource('orders', OrderController::class)->only(['index', 'show', 'update']);
    