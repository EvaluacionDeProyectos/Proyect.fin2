<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetallePreguntasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('detalle_pregunta', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('FK_pregunta')->unsigned();
			$table->foreign('FK_pregunta')->references('id')->on('pregunta');
			$table->integer('FK_cuestionario')->unsigned();
			$table->foreign('FK_cuestionario')->references('id')->on('cuestionario');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('detalle_pregunta');
	}

}
