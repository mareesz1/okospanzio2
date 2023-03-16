<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;


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
                    'status' => false,
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
                'status' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
