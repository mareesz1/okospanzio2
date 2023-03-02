<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use App\Models\RestaurantOrders;
use \App\Models\Menu;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class RestaurantOrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $orders = RestaurantOrders::all();
            return response()->json($orders,200);
        } catch (Exception $e){
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
       }

    }

    /**
     *
     * @return \Illuminate\Http\Response
     */
    public static function indexAll() {
        try {
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            $orders = DB::table('restaurant_orders')
            ->select('restaurant_orders.id as orderId', 'menus.id as kajaid', 'restaurant_orders.*', 'menus.*')
           // ->orderBy('restaurant_orders.id', 'asc')
            ->join('menus', 'restaurant_orders.foodId', '=', 'menus.id')
            ->get();
            // $out->writeln($orders);
            return response()->json($orders, 200);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            $order = new RestaurantOrders();
            $food = Menu::find($request->input('foodId'));
            $order->foodId = $request->input('foodId');
            $order->quantity = $request->input('quantity');
            $order->actualPrice = $food->price;
            $order->status = $request->input('status');
            $order->tableId = $request->input('tableId');
            $order->userId = $request->input('userId');
            $order->save();
            return response()->json([
                'message' => 'New order saved',
                'data' => $order,
            ], 201);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RestaurantOrders  $restaurantOrders
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            if (RestaurantOrders::find($id)->exists()) {
                $order = RestaurantOrders::find($id);
                return response()->json($order);
            }
            return response()->json(['message' => 'Order not found'], 404);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
        }
    }

    /**
     *Find the order with food details
     *
     * @param $id
     * @return \Illuminate\Http\Response
     */
    public static function showJoined($id) {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            // $out->writeln('showJoined lefut');
            return response()->json([
                'message' => 'Route incomplete'
            ], 200);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RestaurantOrders  $restaurantOrders
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RestaurantOrders $restaurantOrders)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RestaurantOrders  $restaurantOrders
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            if (RestaurantOrders::find($id)->exists()) {
                $order = RestaurantOrders::find($id);
                $order->delete();
                return response()->json([
                    'message' => 'Order deleted',
                    'id' => $id,
                ], 200);
            }
            return response()->json([
                'message' => 'Order not found'
            ], 404);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
               ],400
            );
        }
    }
}
