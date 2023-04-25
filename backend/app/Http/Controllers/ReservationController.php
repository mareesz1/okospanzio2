<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReservationController extends Controller
{
    public static function indexAll() {
        try {
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            $reservation = DB::table('reservations')
            ->get();
            // $out->writeln($orders);
            return response()->json($reservation,200);
        } catch (Exception $e) {
            return response()->json(
                [
                   'message'=>'Database error!'
                ],400
            );
        }
    }
    public static function store(Request $request)
    {
        try{
            $reservation = new Reservation();
            $reservation->roomId = $request->input('roomId');
            $reservation->start = $request->input('start');
            $reservation->end = $request->input('end');
            $reservation->mainUserId = $request->input('mainUserId');
            $reservation->users = $request->input('users');
            $reservation->balance = $request->input('balance');
            $reservation->save();
            }
            catch (Exception $e){
             return response()->json(
                 [
                    'message'=>'Database error!'
                 ],400
             );
        }
    }
    public static function notOccupied(Request $request)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();

            $notoccupied = DB::table('reservations')->where(['start', '<=', $request->start ],[ 'end', '>=', $request->end])->select('roomId');
            $out->writeln((string)$notoccupied);
            try{
                if (!empty($notoccupied)) {
                    return response()->json();
                } else {
                    return response()->json(['message' => 'Item not foundDDD'], 404);
                }
            }
            
          catch (Exception $e) {
             return response()->json(
                 [
                    'message'=>'Database error!'
                ],400
             );
         }
    }
}
