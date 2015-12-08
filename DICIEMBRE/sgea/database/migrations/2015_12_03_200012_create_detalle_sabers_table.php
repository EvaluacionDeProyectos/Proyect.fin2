<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetalleSabersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('detalle_saber', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('FK_saber')->unsigned();
			$table->foreign('FK_saber')->references('id')->on('saber');
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
		Schema::drop('detalle_saber');
	}

}
