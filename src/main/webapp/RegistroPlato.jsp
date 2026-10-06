<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro Plato Elitec</title>
	<script src="js/jquery-4.0.0.min.js"></script>
	<script src="js/bootstrap.bundle.js"></script>
	<script src="js/sweetalert2@11.js"></script>
	
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/bootstrap-grid.css" rel="stylesheet">
	<link href="css/bootstrap-reboot.css" rel="stylesheet">
	<link href="css/bootstrap-utilities.css" rel="stylesheet">
	<link href="css/datatables.css" rel="stylesheet">
	
</head>
<body>
	<div class="container">
		<h1>Registro de Plato</h1>
		<form id="formPlato" method="post" novalidate >
			<div class="row" style="margin-top: 2%;">
				<div class="col-3">
					<label for="registro">Nombre</label> 
					<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del plato" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el nombre</div>
				</div>
				<div class="col-9">
					<label for="titulo">Proteina</label> 
					<input type="text" class="form-control" id="proteinaPlato" name="proteinaPlato" placeholder="Ej. Carne de res, pollo, pescado" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el nombre de la proteina</div>
				</div>
			</div>
			<div class="row" style="margin-top: 2%;">	
				<div class="col-4">
					<label for="pais">Categoria (números)</label> 
					<input type="text" class="form-control" id="idCategoria" name="idCategoria" placeholder="Ej. 1 = Carne de Res / Parillas" maxlength="30" required>
					<div class="invalid-feedback">Ingrese la categoria</div>
				</div>
				<div class="col-4">
					<label for="autor">Tiempo de preparación en minutos</label> 
					<input type="number" class="form-control" id="tiempoPreparacion" name="tiempoPreparacion" placeholder="Ej. 30" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el tiempo de preparación</div>
				</div>
				<div class="col-4">
					<label for="autor">Disponibilidad</label> 
					<input type="text" class="form-control" id="disponibilidad" name="disponibilidad" placeholder="Ej. Si/No" maxlength="30" required>
					<div class="invalid-feedback">Ingrese la disponibilidad</div>
				</div>
				<div class="col-4">
					<label for="popularidad">Popularidad</label>
					<div class="dropdown">
						<button class="btn btn-outline-secondary dropdown-toggle form-control" type="button" id="popularidad" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seleccione Popularidad</button>
						<ul class="dropdown-menu" aria-labelledby="popularidad">
							<li><a class="dropdown-item" href="#"
								onclick="seleccionarPopularidad('Alta'); return false;"> Alta </a></li>
							<li><a class="dropdown-item" href="#"
								onclick="seleccionarPopularidad('Media'); return false;"> Media </a></li>
							<li><a class="dropdown-item" href="#"
								onclick="seleccionarPopularidad('Baja'); return false;"> Baja </a></li>
						</ul>
					</div>
				</div>
				 <!-- Este campo es el que se enviará al Servlet -->
   				<input type="hidden" id="valorPopularidad" name="popularidad">
				<div class="col-4">
					<label for="autor">Precio S/</label> 
					<input type="text" class="form-control" id="precio" name="precio" placeholder="Ej. 25.50" maxlength="30"required>
					<div class="invalid-feedback">Ingrese el precio</div>
				</div>
			</div>
			<div class="row justify-content-center" style="margin-top: 2%">
				<button class="btn btn-primary" id="btnRegistrar"style="width: 200px">Registrar</button>
			</div>
		</form>
	</div>
	<script>
	    function seleccionarPopularidad(valor) {
	        // Cambia el texto del botón
	        document.getElementById("popularidad").innerText = valor;
	
	        // Guarda el valor para enviarlo mediante el formulario
	        document.getElementById("valorPopularidad").value = valor;
	    }
	</script>	
	<script type="text/javascript">
		$("#btnRegistrar").click(function(e) {
			console.log("click en registrar");		
			e.preventDefault(); //Evita que el formulario se envíe automáticamente
	
			
			let form = $('#formPlato')[0];
	        if (form.checkValidity() === false) {
	            $(form).addClass('was-validated');
	            return;
	        }
	
	        
	        $.ajax({
				url:'${pageContext.request.contextPath}/registraPlatoAlias',
				type: 'POST',
				data: $(form).serialize(),
				success: function (response) {
					
					console.log('response >>> '+ response);
					//limpiar el formulario
					$('#formPlato')[0].reset();
					
					//limpiar las validaciones
					$('#formPlato').removeClass('was-validated');
					
					//enviar un mensaje de éxito al usuario en forma de div que dure 3 segundos
					$('#formPlato').prepend('<div class="alert alert-success" role="alert">'+ response.mensajeSalida +'</div>');
					setTimeout(function () {
						$('.alert').remove();
					}, 3000);
				},
				error: function (xhr, status, error) {
					// Manejar errores aquí
					console.error('Error al registrar :', error);
				}
			});
		});
	</script>
</body>
</html>