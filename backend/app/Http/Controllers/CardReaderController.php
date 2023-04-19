<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CardReaderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            return response()->json([
                'data' => 'siker',
                'id' => $id
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'data' => 'CardReaderController/index'
            ], 400);
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
        try {
            $id = $request->query('id');
            $out->writeln($id);
            return response()->json([
                'success' => true,
                'data' => $id
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'data' => 'CardReaderController/index'
            ], 400);
        }
    }

    public static function sendBackId(Request $request)
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            $id = $request->query('id');
            $id = (string)$id;
            $out->writeln($id);
            if ($id == 777022179) {
                return response()->json([
                    'success' => true,
                    'id' => $id,
                    'auth' => 'igen'
                ], 200);
            } else {
                return response()->json([
                    'success' => true,
                    'id' => $id,
                    'auth' => 'nem'
                ], 200);
            }
        } catch (Exception $e) {
            return response()->json([
                'data' => 'CardReaderController/index',
                'lofasz' => 'lofasz'
            ], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
