@extends('app1')
@section('content')
<div class="container">
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			{!! Form::open(['route' => 'respuesta.store', 'method' => 'post', 'novalidate']) !!}
                <div class="form-group">
                      {!! Form::label('Valor_Respuesta', 'Valor_Respuesta') !!}
                      {!! Form::text('Valor_Respuesta', null, ['class' => 'form-control' , 'required' => 'required']) !!}
                      {!! Form::label('Pregunta', 'Pregunta') !!}
                      {!! Form::select('FK_Pregunta', $Pregunta, null ,['class' => 'form-control']) !!}
                  </div>                  
                <div class="form-group">
                      {!! Form::submit('Enviar', ['class' => 'btn btn-success ' ] ) !!}
                  </div>
            {!! Form::close() !!}
		</div>
	</div>
</div>
@endsection	