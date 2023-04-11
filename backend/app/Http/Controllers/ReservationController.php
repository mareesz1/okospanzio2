<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReservationController extends Controller
{
    public function indexAll() {
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
}
