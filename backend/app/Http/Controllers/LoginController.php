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
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    public static function getSessionId(Request $request) {
        try {
            $value = $request->session()->get('key');
            return response()->json([
                'success' => true,
                'lofasz' => $value
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'catch' => 'catch',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    // /**
    //  * Store a newly created resource in storage.
    //  *
    //  * @param  \Illuminate\Http\Request  $request
    //  * @return \Illuminate\Http\Response
    //  */
    // public function store(Request $request)
    // {
    //     $out = new \Symfony\Component\Console\Output\ConsoleOutput();
    //     $ldate = date('Y-m-d H:i:s');
    //     // $out->writeln($ldate);
    //     // $out->writeln($request);
    //     try {
    //         // if (!User::where('email', '=', $request->email) -> exists()) {
    //         //     return response()->json([
    //         //         'message' => 'Email not found 01'
    //         //     ], 200);
    //         // }
    //         if (User::where('email', '=', $request->email) -> exists()) {
    //             $userInfo = User::where('email', '=', $request->email)->get()[0];
    //             if ($userInfo->passwordHash == $request->passwordHash) {
    //                 // $out->writeln('userInfo: ' + $userInfo);
    //                 // $out->writeln($userInfo->roles);
    //                 return response()->json([
    //                     'email' => $userInfo->email,
    //                     // 'passwordHash' => $userInfo->passwordHash,
    //                     'auth' => true,
    //                     'loginTime' => $ldate,
    //                     'roles' => $userInfo->roles,
    //             ]);
    //             }
    //         } else {
    //             return response()->json([
    //                 'message' => 'Email not found',
    //                 // 'data' => null
    //             ], 200);
    //         }
    //     } catch (Exception $e) {
    //         $out->writeln($e);
    //         return response()->json(
    //             [
    //                'message'=> $e
    //            ],400
    //         );
    //     }
    // }



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
                // 'code' => 'required'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'success' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            $credentials = [
                'email' => $request->email,
                'password' => $request->password
            ];

            // $out->writeln($credentials);
            try {
                if (Auth::attempt([
                    'email' => $request->email,
                    'password' => $request->password,
                    'code' => $request->code
                    ])) {
                        // $code = AdminCodes::where('code', '=', $request->code)->first();
                        $user = User::where('email', $request->email)->first();
                        // if ($request->roles == $code->roles) {
                            // if ($request->code == $code->code) {
                                // $roles = 'roles:'.$user->roles;
                                // $role = $request->roles;
                                // $out->writeln($role);
                                $request->session()->regenerate();
                                $data = $request->session()->all();
                                // $out->writeln($data);
                                // $out->writeln('login done es megy a kurva auth:attempt');
                                return response()->json([
                                    'success' => true,
                                    'message' => 'User Logged In Successfully',
                                    'token' => $user->createToken("API TOKEN", [$request->roles])->plainTextToken,
                                    // 'sessionData' => $data, // TESZT
                                ], 200);
                            // }
                        // }
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

    // teszt mert idiota vagyok
    /**
     * Login The User
     * @param Request $request
     * @return User
     */
    public function loginUser(Request $request)
    {
        $out = $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try {
            $validateUser = Validator::make($request->all(),
            [
                'email' => 'required|email',
                'password' => 'required'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'success' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            // if(!Auth::attempt($request->only(['email', 'password']))){
            //     return response()->json([
            //         'status' => false,
            //         'message' => 'Email & Password does not match with our record.',
            //     ], 401);
            // }

            if (!User::where('email', '=', $request->email)->exists()) {
                return response()->json([
                    'success' => false,
                    'message' => 'A kurva anyád'
                ], 404);
            }

            $user = User::where('email', $request->email)->first();
            if ($user->passwordHash != $request->password) {
                // $out->writeln($user->passwordHash);
                return response()->json([
                    'success' => false,
                    'message' => 'anyád'
                ], 401);
            }

            return response()->json([
                'success' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'cazch' => 'catch',
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
