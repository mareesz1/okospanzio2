<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //echo 'ok';
        try{
            $task = Task::all();
            return response()->json($task,200);
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

       $v = $this->fieldvalidation($request);
       if ($v != '') {
        return response()->json($v,400);
       }

       try{
           $task = new Task();
           $task->title = $request->input('title');
           $task->description = $request->input('description');
           $task->save();  // insert into
           return response()->json(
            [
                'message' => 'Item was created.',
                'id' => $task->id
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
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $task = Task::find($id);
            if (!empty($task)) {
                return response()->json([$task]);
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
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $v = $this->fieldvalidation($request);
       if ($v != '') {
        return response()->json($v,400);
       }

        try{
            if (Task::where('id', '=', $id) -> exists()) {
                $task = Task::find($id);
                $task->title = $request->input('title');
                $task->description = $request->input('description');
                $task->save();
                return response()->json(['Item was updated', $task], 200);
            } else {
                return response()->json(['message' => 'Item not found'], 404);
            }
        } catch (Exception $e){
          return response()->json(
              [
                 'message'=>'Database error!'
             ],400
          );
       }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            if(Task::where('id', '=', $id)->exists()) {
                $task = Task::find($id);
                $task->delete();
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
                'title' => 'required|min:10',
                'description' => 'required'
            ],

        );

        if ($validator->fails()){
            return $validator->messages();
        }
        return '';
    }
}
