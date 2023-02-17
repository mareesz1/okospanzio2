<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // echo 'ok';
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $user = User::find($id);
            if (!empty($user)) {
                return response()->json([$user]);
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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
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

    public function fieldvalidation(Request $request){
        $validator = Validator::make(
            $request->all(),
            [
                'firstName' => 'required',
                'lastName' => 'required',
                'gender' => 'required',
                'email' => 'required|email:rfc,dns',
                'phone' => 'required',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
