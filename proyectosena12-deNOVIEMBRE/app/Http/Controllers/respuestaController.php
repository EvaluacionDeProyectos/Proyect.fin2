<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\respuesta as respuesta;
use App\Models\pregunta as pregunta;

class respuestaController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
		$respuesta = respuesta::all();
    	$respuesta = respuesta::orderBy('Valor_Respuesta','DESC')->select(
    						'respuestaM.*',
    						'preguntaM.Descripcion as pregunta')
    						->join('preguntaM','preguntaM.id','=','respuestaM.FK_Pregunta')
    						->paginate(4);
		return \View::make('respuesta/list',compact('respuesta'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
		$pregunta = ['pregunta' => pregunta::lists('Descripcion','id')];
		return \View::make('respuesta/new',$pregunta); 
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
		$respuesta = new respuesta;
	    $respuesta->create($request->all());
	    return redirect('respuesta');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
		$respuesta = respuesta::find($id); 
        return \View::make('respuesta/update',compact('respuesta'));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update(Request $request)
	{
		//
		$respuesta = respuesta::find($request->id);
        $respuesta->Valor_Respuesta = $request->Valor_Respuesta;
        $respuesta->FK_Pregunta = $request->FK_Pregunta;
        $respuesta->save();
        return redirect('respuesta');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
		$respuesta = respuesta::find($id);
        $respuesta->delete();
        return redirect()->back();
	}

	public function search(Request $request) 
	{ 
		$respuesta = respuesta::where('Valor_Respuesta','like','%'.$request->Valor_Respuesta.'%')->get(); 
		return \View::make('respuesta/list',compact('respuesta')); 
	}

}
