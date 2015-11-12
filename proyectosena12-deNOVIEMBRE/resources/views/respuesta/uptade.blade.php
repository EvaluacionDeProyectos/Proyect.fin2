@extends('app1')

@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::model($respuesta,['route' => 'respuesta.update', 'method' => 'put', 'novalidate']) !!}
            
                {!! Form::hidden('id', $respuesta->id) !!}
            
                <div class="form-group">
                      {!! Form::label('Valor_Respuesta', 'Valor_Respuesta') !!}
                      {!! Form::text('Valor_Respuesta', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      
                      {!! Form::label('full_name', 'Pregunta') !!}
                      {!! Form::text('FK_Pregunta', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                </div>                           
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection