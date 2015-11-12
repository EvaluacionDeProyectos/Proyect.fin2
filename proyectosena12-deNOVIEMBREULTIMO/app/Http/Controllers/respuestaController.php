<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Models\respuesta as respuesta;
use App\Models\pregunta as pregunta;

class respuestaController extends Controller {

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
	public function create()
	{
		//
		$pregunta = ['pregunta' => pregunta::lists('Descripcion','id')];
		return \View::make('respuesta/new',$pregunta); 
	}
	public function store(Request $request)
	{
		//
		$respuesta = new respuesta;
	    $respuesta->create($request->all());
	    return redirect('respuesta');
	}
	public function show($id)
	{
		//
	}
	public function edit($id)
	{
		//
		$respuesta = respuesta::find($id); 
        return \View::make('respuesta/update',compact('respuesta'));
	}
	public function update(Request $request)
	{
		//
		$respuesta = respuesta::find($request->id);
        $respuesta->Valor_Respuesta = $request->Valor_Respuesta;
        $respuesta->FK_Pregunta = $request->FK_Pregunta;
        $respuesta->save();
        return redirect('respuesta');
	}
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
