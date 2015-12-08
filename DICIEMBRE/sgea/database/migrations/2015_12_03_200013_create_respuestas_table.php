<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRespuestasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('respuesta', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('valor',30);
			$table->integer('FK_pregunta')->unsigned();
			$table->foreign('FK_pregunta')->references('id')->on('pregunta');

		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('respuesta');
	}

}
