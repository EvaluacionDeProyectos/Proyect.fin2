<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetalleRespuestasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('detalle_respuesta', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('FK_aprendiz')->unsigned();
			$table->foreign('FK_aprendiz')->references('id')->on('aprendiz');
			$table->integer('FK_respuesta')->unsigned();
			$table->foreign('FK_respuesta')->references('id')->on('respuesta');


		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('detalle_respuesta');
	}

}
