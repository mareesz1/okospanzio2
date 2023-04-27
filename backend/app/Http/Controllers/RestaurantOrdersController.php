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
            ->select('restaurant_orders.id as orderId', 'menus.id as foodId', 'restaurant_orders.*', 'menus.*')
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
        $v = $this->fieldvalidation($request);
        if ($v != '') {
        return response()->json($v,400);
        }

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
     * Change active restaurant order state
     *
     * @param \Illuminate\Http\Request $request
     * @param $id
     * @return \illuminate\Http\Response
     */
    public function saveState(Request $request, $id) {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            if (RestaurantOrders::where('id', '=', $id) -> exists()) {
                $order = RestaurantOrders::find($id);
                $order->status = $request->input('status');
                $order->save();
                // $out->writeln('asd');
                return response()->json(['success' => true], 200);
            }
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
                ], 404);
        } catch (Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Database error!',
            ], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  $id
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
            // $out->writeln($id);
            $order = DB::table('restaurant_orders')
            ->select('restaurant_orders.id as orderId', 'menus.id as foodId', 'restaurant_orders.*', 'menus.*')
            ->where('restaurant_orders.id', '=', $id)
            ->join('menus', 'restaurant_orders.foodId', '=', 'menus.id')
            ->get();
            // $out->writeln('showJoined lefut');
            return response()->json([
                'data' => $order,
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
    public function update(Request $request, $id)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $v = $this->fieldvalidation($request);
        if ($v != '') {
            return response()->json($v,400);
        }

        try {
            if (RestaurantOrders::where('id', '=', $id)->exists()) {
                $order = RestaurantOrders::find($id);
                $food = Menu::find($order->foodId);
                // $out->writeln($food);
                $order->foodId = $request->input('foodId');
                $order->quantity = $request->input('quantity');
                if ($request->input('actualPrice') != null) {
                    $order->actualPrice = $request->input('actualPrice');
                } else {
                    $order->actualPrice = $food->price;
                }
                $order->status = $request->input('status');
                $order->tableId = $request->input('tableId');
                $order->userId = $request->input('userId');
                $order->save();
                return response()->json([
                    'message' => 'Order updated',
                    'data' => $order,
                ], 200);
            }
            return response()->json(['message' => 'Order or food not found'], 404);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
               ],400
            );
        }
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

    public function fieldvalidation(Request $request){
        $validator = Validator::make(
            $request->all(),
            [
                'foodId' => 'required|integer',
                'quantity' => 'required|integer',
                'status' => 'required',
                'tableId' => 'required|integer',
                'userId' => 'integer|nullable',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
