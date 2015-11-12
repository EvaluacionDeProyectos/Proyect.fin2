@extends('app1')
@section('content')
<div class="container">
    <div class="row">
         {!! Form::open(['route' => 'respuesta/search', 'method' => 'post', 'novalidate', 'class' => 'form-inline']) !!}
          <div class="form-group">
            <label for="exampleInputName2">Nombre</label>
            <input type="text" class="form-control" name = "nombre" >
          </div>
          <button type="submit" class="btn btn-default">Buscar</button>
        <a href="{{ route('respuesta.index') }}" class="btn btn-primary">Todos los datos</a>
         <a href="{{ route('respuesta.create') }}" class="btn btn-primary">Crear nuevo registro</a>
        {!! Form::close() !!}
        <br>
    <table class="table table-condensed table-striped table-bordered">
            <thead>
                <tr>
                  <th>Valor Respuesta</th>
                  
                  <th>Pregunta</th>   
 
                  <th>Accion</th>          
                  
                </tr>
            </thead>
            <tbody>
                @foreach($respuesta as $respuesta)
                <tr>
                    <td>{{ $respuesta->Valor_Respuesta }}</td> 
                    <td>{{ $respuesta->FK_Pregunta }}</td>                    
                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('respuesta.edit',['id' => $respuesta->id] )}}" >Editar</a> 
                        <a class="btn btn-danger btn-xs" href="{{ route('respuesta/destroy',['id' => $respuesta->id] )}}" >Borrar</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
  </div>
</div>
@endsection