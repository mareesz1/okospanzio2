<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\AdminCodes;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;


class LoginController extends Controller
{
    public static function getSessionId(Request $request) {
        // try {
            $value = $request->session()->get('key');
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            $out->writeln((string)$request->cookie('laravel_session'));
            $sessionData = decrypt($request->cookie('laravel_session'));
            return response()->json([
                'success' => true,
                'lofasz' => $value,
                'sessionData' => $sessionData,
            ], 200);
        // } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                // 'message' => $th->getMessage()
            ], 500);
        // }
    }

    public static function getAuthenticatedUser2(Request $request) {
        try {
            $value = Auth::user();
            $id = Auth::id();
            return response()->json([
                'success' => true,
                'user' => $value,
                'id' => $id,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Authenticate user
     *
     * @param \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public static function authenticate(Request $request) {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        // $out->writeln('asd');
        // $out->writeln($request);
        try {
            $validateUser = Validator::make($request->all(),
            [
                'email' => 'required|email',
                'password' => 'required',
                'roles' => 'required',
                'code' => 'required|max:4'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'success' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            // $credentials = [
            //     'email' => $request->email,
            //     'password' => $request->password,
            //     'code' => $request->code
            // ];

            $credentials = $request->validate([
                'email' => ['required', 'email'],
                'password' => ['required'],
                'code' => ['required', 'max:4'],
            ]);

            // $out->writeln($credentials);
            try {
                if (Auth::attempt($credentials)) {
                        $user = User::where('email', $request->email)->first();
                                $request->session()->regenerate();
                                $data = $request->session()->all();
                                return response()->json([
                                    'success' => true,
                                    'message' => 'User Logged In Successfully',
                                    'token' => $user->createToken("API TOKEN", [$request->roles])->plainTextToken,
                                    'data' => $data,
                                ], 200);
                    }
                    return response()->json([
                        'success' => false,
                        'message' => 'Authentication failed in auth:attempt'
                    ], 401);
                } catch (Exception $e) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Authentication failed s'
                    ], 401);
                }

                return response()->json([
                    'success' => false,
                    'message' => 'Authentication failed d'
                ], 401);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function fieldvalidation(Request $request){
        $validator = Validator::make(
            $request->all(),
            [
                'firstName' => 'required|max:100',
                'lastName' => 'required|max:100',
                'gender' => 'required|max:50',
                // 'email' => 'required|email:rfc,dns',
                'email' => 'required|regex:/(.+)@(.+)\.(.+)/i|unique:users', // nem tudom miert de igy mukodik
                'phone' => 'required|numeric|unique:users',
                'roles' => 'required|max:25',
                'passwordHash' => 'required',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public static function logout(Request $request)
    {
        try {
            Auth::logout();
            $request->session()->invalidate();
            return response()->json([
                'success' => true,
                'message' => 'Logged out'
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public static function getAuthenticatedUser(Request $request) {
        try {
            $out = new \Symfony\Component\Console\Output\ConsoleOutput();
            // $out->writeln('asd');
            $user = $request->user();
            // $out->writeln($user);
            return response()->json([
                'user' => $request->user()
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }
    }
}
