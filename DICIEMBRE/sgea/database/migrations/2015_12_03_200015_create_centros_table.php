<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCentrosTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('centro', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('descripcion',255);
			$table->string('direccion',100);
			$table->integer('FK_regional')->unsigned();
			$table->foreign('FK_regional')->references('id')->on('regional');

		});
	}

	/*
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('centro');
	}

}
