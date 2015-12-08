<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAprendizsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('aprendiz', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('documento');
			$table->enum('tipo',['C.C.','T.I.','C.E.','PASS','NIT']);
			$table->string('nombres',40);
			$table->string('apellidos',40);
			$table->date('fecha_nacimiento');
			$table->string('email',50);
			$table->string('direccion',50);
			$table->string('telefono',50);
			$table->date('inicioLectiva');
			$table->date('FinLectiva');
			$table->date('inicioProductiva');
			$table->date('finProductiva');
			$table->integer('FK_ficha')->unsigned();
			$table->foreign('FK_ficha')->references('id')->on('ficha');


		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('aprendiz');
	}

}
