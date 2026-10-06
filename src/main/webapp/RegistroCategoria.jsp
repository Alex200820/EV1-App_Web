<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro Categoría Elitec</title>
	<script src="js/jquery-4.0.0.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.bundle.js" type="text/javascript"></script>
	<script src="js/sweetalert2@11.js" type="text/javascript"></script>
	
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/bootstrap-grid.css" rel="stylesheet">
	<link href="css/bootstrap-reboot.css" rel="stylesheet">
	<link href="css/bootstrap-utilities.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-4">
		<h1>Registro de Categoría</h1>
		<form id="formCategoria" method="post" class="needs-validation" novalidate>
			<div class="row mt-3">
				<div class="col-md-5">
					<label for="descripcion" class="form-label">Descripción / Nombre de Categoría</label> 
					<input type="text" class="form-control" id="descripcion" name="descripcion" 
						   placeholder="Ej. Entradas, Bebidas, Postres" 
						   maxlength="100" required>
					<div class="invalid-feedback">Por favor, ingrese la descripción de la categoría.</div>
				</div>
				<div class="col-md-3">
					<label for="fechaRegistro" class="form-label">Fecha de Registro</label>
					<input type="date" class="form-control" id="fechaRegistro" name="fechaRegistro" required readonly>
					<div class="invalid-feedback">Por favor, seleccione una fecha.</div>
				</div>

				<div class="col-md-4">
					<label for="popularidad" class="form-label">Nivel de Popularidad</label>
					<select class="form-select" id="popularidad" name="popularidad" required>
						<option value="" selected disabled>[Seleccione]</option>
					</select>
					<div class="invalid-feedback">Por favor, seleccione un nivel de popularidad.</div>
				</div>
			</div>

			<!-- Botón de Registro -->
			<div class="row justify-content-center mt-4">
				<button type="button" class="btn btn-primary" id="btnRegistrar" style="width: 200px;">
					Registrar Categoría
				</button>
			</div>
		</form>
	</div>

	<!-- Scripts JS -->
	<script type="text/javascript">
		$(document).ready(function() {
			// Asignar fecha actual al campo de fecha
			establecerFechaActual();
			
			// Cargar el combo de popularidad al iniciar la vista
			cargarComboPopularidad();
		});

		// Función para colocar la fecha del día de hoy en el input
		function establecerFechaActual() {
			let hoy = new Date().toISOString().split('T')[0];
			$('#fechaRegistro').val(hoy);
		}

		// Función para cargar dinámicamente el combo mediante AJAX
		function cargarComboPopularidad() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/cargaComboCategoria',
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		            console.log("Respuesta de la BD:", data);
		            
		            let $select = $('#popularidad');
		            $select.html('<option value="" selected disabled>[Seleccione]</option>');
		            
		            let popularidadesAgregadas = new Set();
		            
		            $.each(data, function(index, cat) {
		                // Se accede a la propiedad cat.popularidad del objeto JSON
		                if (cat.popularidad && !popularidadesAgregadas.has(cat.popularidad)) {
		                    popularidadesAgregadas.add(cat.popularidad);
		                    
		                    $select.append($('<option>', {
		                        value: cat.popularidad,
		                        text: cat.popularidad
		                    }));
		                }
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error('Error al cargar datos (Status ' + xhr.status + '):', error);
		        }
		    });
		}
		// Evento click para enviar el formulario
		$("#btnRegistrar").click(function(e) {
			e.preventDefault();
	
			let form = $('#formCategoria')[0];
			
			// Validar formulario con estilos Bootstrap
	        if (form.checkValidity() === false) {
	            $(form).addClass('was-validated');
	            return;
	        }
	
	        // Petición AJAX POST
	        $.ajax({
				url: '${pageContext.request.contextPath}/registroCategoriaAlias',
				type: 'POST',
				data: $(form).serialize(),
				dataType: 'json',
				success: function (response) {
					// Reiniciar el formulario y restablecer valores
					$('#formCategoria')[0].reset();
					$('#formCategoria').removeClass('was-validated');
					establecerFechaActual();
					cargarComboPopularidad();
					
					// Alerta de éxito
					$('#formCategoria').prepend(
						'<div class="alert alert-success alert-dismissible fade show" role="alert">' + 
							response.mensajeSalida + 
						'</div>'
					);
					
					setTimeout(function () {
						$('.alert').fadeOut('slow', function() {
							$(this).remove();
						});
					}, 3000);
				},
				error: function (xhr, status, error) {
					$('#formCategoria').prepend(
						'<div class="alert alert-danger alert-dismissible fade show" role="alert">' + 
							'Error al comunicarse con el servidor (' + xhr.status + ')' + 
						'</div>'
					);
					
					setTimeout(function () {
						$('.alert').fadeOut('slow', function() {
							$(this).remove();
						});
					}, 3000);
				}
			});
		});
	</script>
</body>
</html>