<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $v = $this->fieldvalidation($request);
        $out->writeln($request);
        if ($v != '') {
            return response()->json($v,400);
        }

        try{
            $user = new User();
            $user->firstName = $request->input('firstName');
            $user->lastName = $request->input('lastName');
            $user->gender = $request->input('gender');
            $user->email = $request->input('email');
            $user->phone = $request->input('phone');
            $user->passwordHash = $request->input('passwordHash');
            $user->roles = $request->input('roles');
            $user->save();  // insert into
            return response()->json(
             [
                 'message' => 'Item was created.',
                 'id' => $user->id
             ],201
            );
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
                //  'user' => $user,
             ],400
          );
       }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
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
                'firstName' => 'required',
                'lastName' => 'required',
                'gender' => 'required',
                // 'email' => 'required|email:rfc,dns',
                'email' => 'required|regex:/(.+)@(.+)\.(.+)/i', // nem tudom miert de igy mukodik
                'phone' => 'required|numeric',
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
