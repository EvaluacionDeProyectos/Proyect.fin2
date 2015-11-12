<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class respuesta extends Model {

	//
	protected $table = 'respuestaM';
	protected $fillable = ['Valor_Respuesta','FK_Pregunta'];
	protected $guarded = ['id'];

}
