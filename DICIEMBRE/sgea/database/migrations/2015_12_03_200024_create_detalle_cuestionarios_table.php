<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetalleCuestionariosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('detalle_cuestionario', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('estado');
			$table->integer('FK_cuestionario')->unsigned();
			$table->foreign('FK_cuestionario')->references('id')->on('cuestionario');
			$table->integer('FK_ficha')->unsigned();
			$table->foreign('FK_ficha')->references('id')->on('ficha');
			$table->integer('FK_instructor')->unsigned();
			$table->foreign('FK_instructor')->references('id')->on('instructor');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('detalle_cuestionario');
	}

}
