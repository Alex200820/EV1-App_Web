<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro Plato</title>
	<script src="js/bootstrap.js" type="text/javascript"></script>
	<script src="js/bootstrap.bundle.js" type="text/javascript"></script>
	<script src="js/jquery-4.0.0.min.js" type="text/javascript"></script>
	<script src="js/datatables.js" type="text/javascript"></script>
	
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/bootstrap-grid.css" rel="stylesheet">
	<link href="css/bootstrap-reboot.css" rel="stylesheet">
	<link href="css/bootstrap-utilities.css" rel="stylesheet">
	<link href="css/datatables.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		 <h1>Lista de Plato por título</h1>
		
		 <div class="row" style="margin-top: 2%;">
			 <div class="col-3">
					 <label for="titulo">Nombre</label> 
			 </div>
			 <div class="col-6">
					 <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="30">
			 </div>
			 <div class="col-3">
	                    <button class="btn btn-primary" id="btnBuscar"style="width: 200px">Buscar</button>
	            </div>        
		 </div>
		
		 <div class="row" style="margin-top: 2%;">
	            <div class="col-12">
	                <table class="table table-striped" id="id_table">
	                    <thead>
	                        <tr><th>Código</th>
	                            <th>Nombre</th>
	                            <th>Proteina</th>
	                            <th>Categoria</th>
	                            <th>Tiempo de Preparación</th>
	                            <th>Disponibilidad</th>
	                            <th>Popularidad</th>
	                            <th>Precio</th>
	                            <th>Resumen</th>
	                        </tr>
	                    </thead>
	                    <tbody >
	
	                    </tbody>
	                </table>
	           </div>
	      </div>
	</div>
</body>

<script type="text/javascript">

$("#btnBuscar").click(function (e) {
	
	var varNombre = $("#nombre").val();
	console.log(">>> nombre: " , varNombre);
	
	$.ajax({
		url: "listaPlatoPorNombre",
		type: "GET",
		data: {nombre: varNombre},
		success: function (response) {
			console.log(">>> response: " , response);
			agregarGrilla(response);
		},
		error: function () {
			alert("Error al buscar platos por nombres.");
		}
	});
	
});


function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			language: IDIOMA,
			searching: true,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: true,
			info:true,
			scrollY: 305,
	        scroller: {
	            loadingIndicator: true
	        },
			columns:[
				{data: "idPlato",className:'text-center'},
				{data: "nombre",className:'text-center'},
				{data: "proteinaPlato",className:'text-center'},
				{data: "categoria", className:'text-center'},
				{data: "tiempoPreparacion", className:'text-center'},
				{data: "disponibilidad",className:'text-center'},
				{data: "popularidad", className:'text-center'},
				{data: "precio", className:'text-center'},
				{
					data: function(row, type, val, meta) {
				        return row.nombre + " / " + row.proteinaPlato + " / " + row.categoria;
				    },
				    className: 'text-center'
				}
			]                                     
	    });
}

	var IDIOMA = {
		processing:"procesando...",
	    lengthMenu: "_MENU_ Registros por p&aacute;gina",
	    zeroRecords: "No existen registros",
	    info: "P&aacute;gina _PAGE_ de _PAGES_",
	    infoEmpty: "Sin registros",
	    infoFiltered: "(Filtro de _MAX_ registros)",
	    search: "Buscar:",
	    paginate: {
	        "first":      "Primero",
	        "last":       "Last",
	        "next":       "Siguiente",
	        "previous":   "Anterior"
	    }
	};
	
</script>
</html>