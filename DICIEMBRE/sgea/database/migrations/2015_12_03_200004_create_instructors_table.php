<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInstructorsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('instructor', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('documento');
			$table->enum('tipo',['C.C.','T.I.','C.E.','PASS','NIT']);
			$table->string('nombres',45);
			$table->string('apellidos',45);
			$table->string('email',50);
			$table->string('tipoInstructor',30);
			$table->string('foto',100);
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('instructor');
	}

}
