<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class respuesta extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('respuestaM', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('Valor_Pregunta');
			$table->integer('FK_Pregunta')->unsigned();
 		 	$table->foreign('FK_Pregunta')->references('id')->on('preguntaM');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('respuestaM');
	}

}
