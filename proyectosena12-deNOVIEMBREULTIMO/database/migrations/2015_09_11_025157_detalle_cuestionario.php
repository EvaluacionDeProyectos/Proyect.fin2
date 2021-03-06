<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DetalleCuestionario extends Migration {

	public function up()
	{
		Schema::create('detalle_cuestionarioM', function(Blueprint $table)
		{
			$table->increments('id');
			
			$table->integer('FK_Cuestionario')->unsigned();
            $table->foreign('FK_Cuestionario')->references('id')->on('cuestionarioM');

            $table->integer('FK_Ficha')->unsigned();
            $table->foreign('FK_Ficha')->references('id')->on('fichaM');

            $table->integer('FK_Instructor')->unsigned();
            $table->foreign('FK_Instructor')->references('id')->on('instructorM');
			$table->timestamps(); //basicamente hara dos atributos: create_at update_up
		});
	}

	public function down()
	{
		Schema::drop('detalle_cuestionarioM');
	}

}
