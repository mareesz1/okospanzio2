<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            $menu = Menu::all();
            return response()->json($menu,200);
        } catch (Exception $e){
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
       }
    }

    public function indexAll() {
        try {
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            $menu = DB::table('menus')
            ->get();
            // $out->writeln($orders);
            return response()->json($menu,200);
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
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $v = $this->fieldvalidation($request);
        if ($v != '') { // Validation failed
            return response()->json($v,400);
        }
        try {
            $food = new Menu();
            $food->name = $request->input('name');
            $food->description = $request->input('description');
            $food->price = $request->input('price');
            $food->type = $request->input('type');
            $food->pictureURL = $request->input('pictureURL');
            $out->writeln($food);
            $food->save();
            return response()->json(
                [
                    'message' => 'New food saved.',
                    'id' => $food->id,
                    'data' => $food
                ],201
               );
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
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            // $out->writeln($id);
            $food = Menu::find($id);
            // $food = Menu::where('foodId', '=', $id)->get()[0];
            if (!empty($food)) {
                return response()->json($food);
            } else {
                return response()->json(['message' => 'Food not found'], 404);
            }
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
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $v = $this->fieldvalidation($request);
        if ($v != '') { // Validation failed
            return response()->json($v,400);
        }

        try {
            if (Menu::find($id)->exists()) {
                $food = Menu::find($id);
                // $food = Menu::where('foodId', '=', $id)->get()[0];
                $food->name = $request->input('name');
                $food->description = $request->input('description');
                $food->price = $request->input('price');
                $food->type = $request->input('type');
                $food->pictureURL = $request->input('pictureURL');
                // $out->writeln($food);
                // DB::table('menus')->upsert($food);
                $food->save();
                // $food->save();
                return response()->json(['Food updated', $food], 200);
            } else {
                return response()->json(['message' => 'Food not found'], 404);
            }
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!',
               ],400
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) // Ha nem működik próbálj más IDt (adatb kapcsolat miatt)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            if(Menu::where('id', '=', $id)->exists()) {
                $food = Menu::find($id);
                // $out->writeln($food);
                $food->delete();
                return response()->json([
                    'message' => 'Food deleted',
                    'id' => $food->id,
                ], 200);
            }
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
                'name' => 'required',
                'description' => 'required',
                'price' => 'required|integer',
                'type' => 'required',
                // 'pictureURL' => 'required',
            ],

        );
        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
