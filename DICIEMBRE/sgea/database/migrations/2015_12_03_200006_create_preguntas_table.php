<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePreguntasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('pregunta', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('tipoPregunta',50);
			$table->string('descripcion',255);
			$table->string('indicacion',255);


		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('pregunta');
	}

}
