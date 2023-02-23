<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $ldate = date('Y-m-d H:i:s');
        // $out->writeln($ldate);
        // $out->writeln($request);
        try {
            // if (!User::where('email', '=', $request->email) -> exists()) {
            //     return response()->json([
            //         'message' => 'Email not found 01'
            //     ], 200);
            // }
            if (User::where('email', '=', $request->email) -> exists()) {
                $userInfo = User::where('email', '=', $request->email)->get()[0];
                if ($userInfo->passwordHash == $request->passwordHash) {
                    // $out->writeln('userInfo: ' + $userInfo);
                    // $out->writeln($userInfo->roles);
                    return response()->json([
                        'email' => $userInfo->email,
                        // 'passwordHash' => $userInfo->passwordHash,
                        'auth' => true,
                        'loginTime' => $ldate,
                        'roles' => $userInfo->roles,
                ]);
                }
            } else {
                return response()->json([
                    'message' => 'Email not found',
                    // 'data' => null
                ], 200);
            }
        } catch (Exception $e) {
            $out->writeln($e);
            return response()->json(
                [
                   'message'=> $e
               ],400
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $email)
    {
        // $out->writeln($request);
        // try {
        //     if (User::where('email', '=', $email) -> exists()) {
        //         $userInfo = User::where($email)->get();
        //         return response()->json($email);
        //     } else {
        //         response()->json(['message' => 'Email not found'], 404);
        //     }
        // } catch (Exception $e) {

        // }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $email)
    {
        // $out->writeln($request);
        // try {
        //     if (User::where('email', '=', $email) -> exists()) {
        //         $userInfo = User::where($email)->get();
        //         return response()->json($email);
        //     } else {
        //         response()->json(['message' => 'Email not found'], 404);
        //     }
        // } catch (Exception $e) {

        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
