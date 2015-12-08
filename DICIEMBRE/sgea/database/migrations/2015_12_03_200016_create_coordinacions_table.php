<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCoordinacionsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('coordinacion', function(Blueprint $table)
		{
			$table->increments('id');
			$table->string('nombre');
			$table->integer('FK_centro')->unsigned();
			$table->foreign('FK_centro')->references('id')->on('centro');

		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('coordinacion');
	}

}
