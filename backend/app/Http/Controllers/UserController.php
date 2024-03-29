<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\AdminCodes;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
$out = new \Symfony\Component\Console\Output\ConsoleOutput();

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        try{
            $user = User::all();
            return response()->json($user,200);
        } catch (Exception $e){
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

        try{
            $user = new User();
            $user->firstName = $request->input('firstName');
            $user->lastName = $request->input('lastName');
            $user->gender = $request->input('gender');
            $user->email = $request->input('email');
            $user->phone = $request->input('phone');
            $user->roles = $request->input('roles');
            $user->code = $request->input('code');
            $out->writeln((string)$request->input('password'));
            $user->password = Hash::make($request->input('password'));
            if ($request->input('code') == 0 && $request->input('roles') == 'guest') {
                $out->writeln($user);
                $user->save();  // insert into
                return response()->json(
                 [
                     'message' => 'New user saved.',
                     'id' => $user->id,
                     'data' => $user
                 ],201
                );
            }
            if ($user->code) {
                $existingCode = AdminCodes::where('roles', '=', $request->input('roles'))->select('code')->get()[0];
                if ($request->input('code') == $existingCode->code) {
                    $user->save();
                    return response()->json([
                        'message' => 'New higher clearance level user saved',
                        'id' => $user->id,
                        'data' => $user,
                        'token' => $user->createToken("API TOKEN")->plainTextToken
                    ], 201);
                }
            }
            return response()->json(['message' => 'Code doesnt match'], 404);
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
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $user = User::find($id);
            if (!empty($user)) {
                return response()->json($user);
            } else {
                return response()->json(['message' => 'Item not found'], 404);
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
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $v = $this->fieldvalidation($request);
       if ($v != '') {
        return response()->json($v,400);
       }

        try{
            if (User::where('id', '=', $id) -> exists()) {
                $user = User::find($id);
                $user->firstName = $request->input('firstName');
                $user->lastName = $request->input('lastName');
                $user->gender = $request->input('gender');
                $user->email = $request->input('email');
                $user->phone = $request->input('phone');
                $user->passwordHash = $request->input('passwordHash');
                $user->roles = $request->input('roles');
                $user->save();
                return response()->json(['Item was updated', $user], 200);
            } else {
                return response()->json(['message' => 'Item not found'], 404);
            }
        } catch (Exception $e){
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
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            if(User::where('id', '=', $id)->exists()) {
                $user = User::find($id);
                $user->delete();
                return response()->json(['message' => 'Item deleted', 200]);
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
                'firstName' => 'required|max:100',
                'lastName' => 'required|max:100',
                'gender' => 'required|max:50',
                // 'email' => 'required|email:rfc,dns',
                'email' => 'required|regex:/(.+)@(.+)\.(.+)/i|unique:users', // nem tudom miert de igy mukodik
                'phone' => 'required|numeric|unique:users',
                'roles' => 'required|max:25',
                'code' => 'max:6',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
