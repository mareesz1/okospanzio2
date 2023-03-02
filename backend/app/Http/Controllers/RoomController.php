<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Rooms;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $rooms = Rooms::all();
            return response()->json($rooms, 200);
        } catch (Exceotion $e) {
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
        // $out->writeln($request);
        if ($v != '') { // Validation failed
            return response()->json($v,400);
        }

        try{
            $room = new Rooms();
            $room->number = $request->input('number');
            $room->type = $request->input('type');
            $room->beds = $request->input('beds');
            $room->price = $request->input('price');
            $room->description = $request->input('description');
            $room->qrcode = $request->input('qrcode');
            $room->save();
        } catch (Exception $e){
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
     * @param  \App\Models\Rooms  $rooms
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $room = Rooms::find($id);
            if (!empty($room)) {
                return response()->json([$room]);
            } else {
                return response()->json(['message' => 'Room not found'], 404);
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
     * @param  \App\Models\Rooms  $rooms
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $v = $this->fieldvalidation($request);
        if ($v != '') {
            return response()->json($v,400);
        }

        try{
            if (Rooms::where('id', '=', $id) -> exists()) {
                $room = Rooms::find($id);
                $room->number = $request->input('number');
                $room->type = $request->input('type');
                $room->beds = $request->input('beds');
                $room->price = $request->input('price');
                $room->description = $request->input('description');
                $room->qrcode = $request->input('qrcode');
                // $out->writeln($room);
                $room->save();
                return response()->json(['Room was updated', $room], 200);
            } else {
                return response()->json(['message' => 'Room not found'], 404);
            }
        } catch (Exception $e){
            return response()->json(
                [
                    'message'=>'Database error!',
                 //  'user' => $user,
                ],400
           );
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rooms  $rooms
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            if(Rooms::where('id', '=', $id)->exists()) {
                $room = Rooms::find($id);
                $room->delete();
                return response()->json(['message' => 'Room deleted', 200]);
            }
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
               ],400
            );
        }
    }

    public function fieldvalidation(Request $request) {
        $validator = Validator::make(
            $request->all(),
            [
                'number' => 'required|integer',
                'type' => 'required|max:15',
                'beds' => 'required|integer|max_digits:1',
                'price' => 'required|integer|max_digits:6',
                'description' => 'required',
                // 'qrcode' => 'required',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
