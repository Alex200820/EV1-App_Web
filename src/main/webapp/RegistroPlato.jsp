<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro Plato Elitec</title>
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
		<h1>Registro de Plato</h1>
		<form id="formPlato" method="post" class="needs-validation" novalidate>
			<div class="row" style="margin-top: 2%;">
				<div class="col-3">
					<label for="nombre">Nombre</label> 
					<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del plato" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el nombre</div>
				</div>
				<div class="col-9">
					<label for="proteinaPlato">Proteina</label> 
					<input type="text" class="form-control" id="proteinaPlato" name="proteinaPlato" placeholder="Ej. Carne de res, pollo, pescado" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el nombre de la proteina</div>
				</div>
			</div>
			<div class="row" style="margin-top: 2%;">	
				<div class="col-4">
					<label for="categoria">Categoria</label> 
					<div class="dropdown">
						<button class="btn btn-outline-secondary dropdown-toggle form-control" type="button" id="categoria" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seleccione Categoria</button>
						<ul class="dropdown-menu" id="ulCategorias" aria-labelledby="categoria">
						</ul>
					</div>
					<div class="invalid-feedback">Ingrese la categoria</div>
				</div>
				<input type="hidden" id="idCategoria" name="idCategoria" required>

				<div class="col-4">
					<label for="tiempoPreparacion">Tiempo de preparación en minutos</label> 
					<input type="number" class="form-control" id="tiempoPreparacion" name="tiempoPreparacion" placeholder="Ej. 30" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el tiempo de preparación</div>
				</div>
				<div class="col-4">
					<label for="disponibilidad">Disponibilidad</label> 
					<input type="text" class="form-control" id="disponibilidad" name="disponibilidad" placeholder="Ej. Si/No" maxlength="30" required>
					<div class="invalid-feedback">Ingrese la disponibilidad</div>
				</div>
				
				<!-- DROPDOWN DE POPULARIDAD ORIGINAL -->
				<div class="col-4" style="margin-top: 2%;">
					<label for="popularidad">Popularidad</label>
					<div class="dropdown">
						<button class="btn btn-outline-secondary dropdown-toggle form-control" type="button" id="popularidad" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Seleccione Popularidad</button>
						<ul class="dropdown-menu" aria-labelledby="popularidad">
							<li><a class="dropdown-item" href="#" onclick="seleccionarPopularidad('Alta'); return false;"> Alta </a></li>
							<li><a class="dropdown-item" href="#" onclick="seleccionarPopularidad('Media'); return false;"> Media </a></li>
							<li><a class="dropdown-item" href="#" onclick="seleccionarPopularidad('Baja'); return false;"> Baja </a></li>
						</ul>
					</div>
				</div>
   				<input type="hidden" id="valorPopularidad" name="popularidad">

				<div class="col-4" style="margin-top: 2%;">
					<label for="precio">Precio S/</label> 
					<input type="text" class="form-control" id="precio" name="precio" placeholder="Ej. 25.50" maxlength="30" required>
					<div class="invalid-feedback">Ingrese el precio</div>
				</div>
			</div>
			<div class="row justify-content-center" style="margin-top: 2%">
				<button type="button" class="btn btn-primary" id="btnRegistrar" style="width: 200px;">Registrar</button>
			</div>
		</form>
	</div>

	<!-- Funciones de Selección Originales -->
	<script>
	    function seleccionarCategoria(id, descripcion) {
	        document.getElementById("categoria").innerText = descripcion;
	        document.getElementById("idCategoria").value = id;
	    }

	    function seleccionarPopularidad(valor) {
	        document.getElementById("popularidad").innerText = valor;
	        document.getElementById("valorPopularidad").value = valor;
	    }
	</script>	

	<!-- Script AJAX -->
	<script type="text/javascript">
		$(document).ready(function() {
			// Cargar el combo de categorías dinámicamente vía AJAX al inicio
			cargarComboCategorias();
		});

		function cargarComboCategorias() {
		    $.ajax({
		        url: '${pageContext.request.contextPath}/cargaComboCategoria',
		        type: 'GET',
		        dataType: 'json',
		        success: function(data) {
		            let $ul = $('#ulCategorias');
		            $ul.empty(); // Limpiar lista
		            
		            $.each(data, function(index, cat) {
		                // Mantiene el formato exacto de tu dropdown-item original
		                let htmlItem = '<li>' +
		                    '<a class="dropdown-item" href="#" onclick="seleccionarCategoria(\'' + cat.idCategoria + '\', \'' + cat.descripcion + '\'); return false;">' +
		                        cat.descripcion +
		                    '</a>' +
		                '</li>';
		                
		                $ul.append(htmlItem);
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error('Error al cargar categorías (Status ' + xhr.status + '):', error);
		        }
		    });
		}

		$("#btnRegistrar").click(function(e) {
			e.preventDefault();

			let form = $('#formPlato')[0];
	        if (form.checkValidity() === false) {
	            $(form).addClass('was-validated');
	            return;
	        }

	        $.ajax({
				url: '${pageContext.request.contextPath}/registraPlatoAlias',
				type: 'POST',
				data: $(form).serialize(),
				dataType: 'json',
				success: function (response) {
					// Limpieza de campos
					$('#formPlato')[0].reset();
					document.getElementById("categoria").innerText = "Seleccione Categoria";
					document.getElementById("idCategoria").value = "";
					document.getElementById("popularidad").innerText = "Seleccione Popularidad";
					document.getElementById("valorPopularidad").value = "";
					
					$('#formPlato').removeClass('was-validated');
					
					// Alerta de éxito
					$('#formPlato').prepend(
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
					$('#formPlato').prepend(
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