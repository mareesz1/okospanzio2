<?php

namespace App\Http\Controllers;

use App\Models\Reservation;
use DateTime;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public static function index()
    {
        try {
            $data = Reservation::all();
            return response()->json($data, 200);
        } catch (Exception $e) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Database error!'
                ],
                400
            );
        }
    }
    public static function store(Request $request)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $out->writeln($request);
        try {
            $reservation = new Reservation();
            $reservation->roomId = $request->input('roomId');
            $reservation->start = $request->input('start');
            $reservation->end = $request->input('end');
            $reservation->mainUserId = $request->input('mainUserId');
            $reservation->users = $request->input('users');
            $reservation->balance = $request->input('balance');
            $reservation->save();
        } catch (Exception $e) {
            return response()->json(
                [
                    'message' => 'Database error!'
                ],
                400
            );
        }
    }
    public static function notOccupied(Request $request)
    {
        try {

        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $start = Reservation::select('roomId')
            ->where(function ($query) use ($request) {
                $query->where('start', '>', $request->end)
                    ->orWhere('end', '<', $request->start);
            })
            ->get();
            $out->writeln($start);
        $end = Reservation::select('roomId')
            ->where(function ($query) use ($request) {
                $query->where('end', '<', $request->start)
                    ->orWhere('start', '>', $request->end);
            })
            ->get();
            $out->writeln($end);
        $matchingelements = $start->intersect($end)->values();
        $matchingelements = $matchingelements->unique(function ($item) {
            return $item->roomId;
        });
        $out->writeln($matchingelements);
        if (!empty($matchingelements)) {
            return response()->json($matchingelements);
        } else {
            return response()->json(['message' => 'Item not found'], 404);
        }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }

    }
}
