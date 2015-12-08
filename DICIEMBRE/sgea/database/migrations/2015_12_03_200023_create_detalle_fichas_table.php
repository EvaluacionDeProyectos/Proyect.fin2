<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDetalleFichasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('detalle_ficha', function(Blueprint $table)
		{
			$table->increments('id');
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
		Schema::drop('detalle_ficha');
	}

}
