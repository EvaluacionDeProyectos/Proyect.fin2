<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFichasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('ficha', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('codigo');
			$table->integer('FK_coordinacion')->unsigned();
			$table->foreign('FK_coordinacion')->references('id')->on('coordinacion');
			$table->integer('FK_programa')->unsigned();
			$table->foreign('FK_programa')->references('id')->on('programa');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('ficha');
	}

}
