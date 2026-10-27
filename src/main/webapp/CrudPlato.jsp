<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro Plato Elitec</title>

    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap.bundle.js" type="text/javascript"></script>
    <script src="js/jquery-4.0.0.min.js" type="text/javascript"></script>
    <script src="js/datatables.js" type="text/javascript"></script>
    <script src="js/sweetalert2@11.js" type="text/javascript"></script>

    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-grid.css" rel="stylesheet">
    <link href="css/bootstrap-reboot.css" rel="stylesheet">
    <link href="css/bootstrap-utilities.css" rel="stylesheet">
    <link href="css/datatables.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Crud de Plato</h1>
        <div class="row" style="margin-top: 2%;">
            <div class="col-3">
                <label for="nombre">Nombre</label>
            </div>
            <div class="col-3">
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre del Plato" maxlength="100">
            </div>
            <div class="col-3">
                <button class="btn btn-primary" id="btnBuscar" 
                	style="width: 200px">Buscar</button>
            </div>
            <div class="col-3">
                <button class="btn btn-primary" type="button"
                    style="width: 200px" onclick="abrirModal()">Registra</button>
            </div>
        </div>
        <div class="row" style="margin-top: 2%;">
            <div class="col-12">
                <table class="table table-striped" id="id_table">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Proteína</th>
                            <th>Categoría</th>
                            <th>Tiempo de Preparación</th>
                            <th>Disponibilidad</th>
                            <th>Popularidad</th>
                            <th>Precio</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- INICIO MODAL DE REGISTRO -->
    <div class="modal fade" id="id_div_modal_registra" tabindex="-1"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Registro de Plato</h5>
                    <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="id_form_registra">
                        <input type="hidden" name="metodo" value="registra">
                        <div class="row mb-3">
                            <label for="id_reg_nombre"
                                class="col-md-3 col-form-label">Nombre</label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre"
                                    type="text" maxlength="100" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_proteinaPlato"
                                class="col-md-3 col-form-label">Proteína</label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_reg_proteinaPlato" name="proteinaPlato" placeholder="Ingrese la Proteína"
                                    type="text" maxlength="100" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_categoria"
                                class="col-md-3 col-form-label">Categoría</label>
                            <div class="col-md-9">
                                <select class="form-select"
                                    id="id_reg_categoria"
                                    name="idCategoria" required>
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_tiempoPreparacion"
                                class="col-md-3 col-form-label">
                                Tiempo de Preparación
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_reg_tiempoPreparacion" name="tiempoPreparacion" placeholder="Ingrese el tiempo en minutos" 
                                	type="number" min="1" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_disponibilidad" class="col-md-3 col-form-label">
                                Disponibilidad
                            </label>
                            <div class="col-md-9">
                                <select class="form-select" id="id_reg_disponibilidad" name="disponibilidad" required>
                                    <option value="">[Seleccione]</option>
                                    <option value="1">Disponible</option>
                                    <option value="0">No disponible</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_popularidad"
                                class="col-md-3 col-form-label">
                                Popularidad
                            </label>
                            <div class="col-md-9">
                                <select class="form-select"
                                    id="id_reg_popularidad"
                                    name="popularidad" required>
                                    <option value="">[Seleccione]</option>
                                    <option value="Alta">Alta</option>
                                    <option value="Media">Media</option>
                                    <option value="Baja">Baja</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_reg_precio"
                                class="col-md-3 col-form-label">Precio</label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_reg_precio" name="precio" placeholder="Ingrese el precio"
                                    type="number" min="0" step="0.01" required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="button" id="id_btn_registra" class="btn btn-primary me-2">
                                Registrar
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL DE REGISTRO -->

    <!-- INICIO MODAL DE ACTUALIZACIÓN -->
    <div class="modal fade" id="id_div_modal_actualiza" tabindex="-1"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Actualiza Plato</h5>
                    <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="id_form_actualiza">
                        <input type="hidden" name="metodo" value="actualiza">
                        <input type="hidden" name="idPlato" id="idPlato">
                        <div class="row mb-3">
                            <label for="id_act_nombre"
                                class="col-md-3 col-form-label">Nombre</label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre"
                                    type="text" maxlength="100" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_act_proteinaPlato"
                                class="col-md-3 col-form-label">Proteína</label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_act_proteinaPlato" name="proteinaPlato" placeholder="Ingrese la Proteína"
                                    type="text" maxlength="100" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_act_categoria"
                                class="col-md-3 col-form-label">Categoría</label>
                            <div class="col-md-9">
                                <select class="form-select"
                                    id="id_act_categoria"
                                    name="idCategoria" required>
                                    <option value="">[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_act_tiempoPreparacion"
                                class="col-md-3 col-form-label">
                                Tiempo de Preparación
                            </label>
                            <div class="col-md-9">
                                <input class="form-control" id="id_act_tiempoPreparacion" name="tiempoPreparacion" placeholder="Ingrese el tiempo en minutos"
                                    type="number" min="1" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_act_disponibilidad" class="col-md-3 col-form-label">
                                Disponibilidad
                            </label>
                            <div class="col-md-9">
                                <select class="form-select"
                                    id="id_act_disponibilidad"
                                    name="disponibilidad" required>
                                    <option value="">[Seleccione]</option>
                                    <option value="1">Disponible</option>
                                    <option value="0">No disponible</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="id_act_popularidad" class="col-md-3 col-form-label">
                                Popularidad
                            </label>
                            <div class="col-md-9">
                                <select class="form-select"
                                    id="id_act_popularidad"
                                    name="popularidad" required>
                                    <option value="">[Seleccione]</option>
                                    <option value="Alta">Alta</option>
                                    <option value="Media">Media</option>
                                    <option value="Baja">Baja</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="id_act_precio"
                                class="col-md-3 col-form-label">Precio</label>
                            <div class="col-md-9">
                                <input class="form-control"
                                    id="id_act_precio"
                                    name="precio"
                                    placeholder="Ingrese el precio"
                                    type="number" min="0" step="0.01" required>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="button" id="id_btn_actualiza" class="btn btn-primary me-2">
                                Actualizar
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL DE ACTUALIZACIÓN -->
    <script type="text/javascript">

        $(document).ready(function () {

            // Cargar categorías en los combos de registro y actualización
            $.ajax({
                url: 'cargaComboCategoria',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    console.log('Categorías cargadas:', data);
                    var comboBox = $('#id_reg_categoria');
                    var comboBox2 = $('#id_act_categoria');
                    data.forEach(function (obj) {
                        comboBox.append(
                            '<option value="' + obj.idCategoria + '">' +
                            obj.descripcion + '</option>'
                        );
                        comboBox2.append(
                            '<option value="' + obj.idCategoria + '">' +
                            obj.descripcion + '</option>'
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.error('Error al cargar categorías:', error);
                }
            });

            // Cargar la grilla al ingresar a la página
            $.ajax({
                url: "listaPlatoPorNombre",
                type: "GET",
                data: {
                    metodo: "listaPorNombre",
                    nombre: ""
                },
                success: function (response) {
                    console.log(">>> response: ", response);
                    agregarGrilla(response);
                },
                error: function () {
                    alert("Error al listar platos.");
                }
            });

            // Buscar platos por nombre
            $("#btnBuscar").click(function () {
                var nombre = $("#nombre").val();

                $.ajax({
                    url: "listaPlatoPorNombre",
                    type: "GET",
                    data: {
                        metodo: "listaPorNombre",
                        nombre: nombre
                    },
                    success: function (response) {
                        console.log(">>> response: ", response);
                        agregarGrilla(response);
                    },
                    error: function () {
                        alert("Error al buscar platos por nombre.");
                    }
                });
            });

            // Registrar plato
			$("#id_btn_registra").click(function () {
			    console.log("click en registrar");
			
			    if (!$("#id_form_registra")[0].checkValidity()) {
			        $("#id_form_registra")[0].reportValidity();
			        return;
			    }
			
			    $.ajax({
			        url: 'crudPlatoAlias',
			        type: 'POST',
			        data: $('#id_form_registra').serialize(),
			
			        success: function (data) {
			            // Actualizar la tabla
			            agregarGrilla(data);
			
			            // Cerrar el modal
			            const modal = bootstrap.Modal.getInstance(
			                document.getElementById('id_div_modal_registra')
			            );
			
			            if (modal) {
			                modal.hide();
			            }
			
			            // Limpiar el formulario
			            $("#id_form_registra")[0].reset();
			
			            // Alerta de registro exitoso
			            Swal.fire({
			                title: '¡Registro exitoso!',
			                text: 'El plato se registró correctamente.',
			                icon: 'success',
			                confirmButtonText: 'Aceptar'
			            });
			        },
			
			        error: function (xhr, status, error) {
			            console.error('Error al registrar:', error);
			            console.error('Respuesta:', xhr.responseText);
			
			            Swal.fire({
			                title: 'Error',
			                text: 'No se pudo registrar el plato.',
			                icon: 'error',
			                confirmButtonText: 'Aceptar'
			            });
			        }
			    });
			});

            // Actualizar plato
            $("#id_btn_actualiza").click(function () {
                console.log("click en actualizar");

                if (!$("#id_form_actualiza")[0].checkValidity()) {
                    $("#id_form_actualiza")[0].reportValidity();
                    return;
                }
                $.ajax({
                    url: 'crudPlatoAlias',
                    type: 'POST',
                    data: $('#id_form_actualiza').serialize(),
                    success: function (data) {
                        agregarGrilla(data);

                        const modal = bootstrap.Modal.getInstance(
                            document.getElementById('id_div_modal_actualiza')
                        );

                        if (modal) {
                            modal.hide();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al actualizar:', error);

                        Swal.fire({
                            title: 'Error',
                            text: 'Error al actualizar el plato',
                            icon: 'error'
                        });
                    }
                });
            });

        });

        // Configuración de DataTables
        function agregarGrilla(lista) {

            if ($.fn.DataTable.isDataTable('#id_table')) {
                $('#id_table').DataTable().clear();
                $('#id_table').DataTable().destroy();
            }
            $('#id_table').DataTable({
                data: lista,
                language: IDIOMA,
                searching: true,
                ordering: true,
                processing: true,
                pageLength: 10,
                lengthChange: true,
                info: true,
                scrollY: 305,
                scroller: {
                    loadingIndicator: true
                },
                columns: [
                    {
                        data: "idPlato",
                        className: 'text-center'
                    },
                    {
                        data: "nombre",
                        className: 'text-center'
                    },
                    {
                        data: "proteinaPlato",
                        className: 'text-center'
                    },
                    {
                        data: function (row) {
                            if (row.categoria != null &&
                                typeof row.categoria === "object") {
                                return row.categoria.descripcion;
                            }
                            return row.categoria != null
                                ? row.categoria
                                : row.idCategoria;
                        },
                        className: 'text-center'
                    },
                    {
                        data: "tiempoPreparacion",
                        className: 'text-center'
                    },

                    {
                        data: function (row) {
                            if (row.disponibilidad == 1) {
                                return '<span class="estado-disponible">' +
                                       'Disponible</span>';
                            }

                            if (row.disponibilidad == 0) {
                                return '<span class="estado-no-disponible">' +
                                       'No disponible</span>';
                            }

                            return '<span class="text-secondary">Sin definir</span>';
                        },
                        className: 'text-center align-middle'
                    },
                    {
                        data: "popularidad",
                        className: 'text-center'
                    },
                    {
                        data: "precio",
                        className: 'text-center'
                    },
                    {
                        data: function (row, type, val, meta) {
                            return '<button type="button" ' +
                                'class="btn btn-info btn-sm" ' +
                                'onClick="verFormularioActualiza(' +
                                meta.row + ');">Editar</button>';
                        },
                        className: 'text-center'
                    },
                    {
                        data: function (row) {
                            return '<button type="button" ' +
                                'class="btn btn-warning btn-sm" ' +
                                'onClick="eliminacionLogica(\'' +
                                row.idPlato + '\');">E.Lógica</button>';
                        },
                        className: 'text-center'
                    },
                    {
                        data: function (row) {
                            return '<button type="button" ' +
                                'class="btn btn-danger btn-sm" ' +
                                'onClick="eliminacionFisica(\'' +
                                row.idPlato + '\');">E.Física</button>';
                        },
                        className: 'text-center'
                    }
                ]
            });
        }

        // Idioma español de DataTables
        var IDIOMA = {
            processing: "procesando...",
            lengthMenu: "_MENU_ Registros por página",
            zeroRecords: "No existen registros",
            info: "Página _PAGE_ de _PAGES_",
            infoEmpty: "Sin registros",
            infoFiltered: "(Filtro de _MAX_ registros)",
            search: "Buscar:",
            paginate: {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        };

        // Eliminación lógica
       function eliminacionLogica(id) {
           console.log("eliminacionLogica ==> ", id);

           Swal.fire({
               title: "¿Estás seguro?",
               text: "El plato quedará como No disponible.",
               icon: "warning",
               showCancelButton: true,
               confirmButtonText: "Sí, continuar",
               cancelButtonText: "Cancelar"
           }).then((result) => {
               if (result.isConfirmed) {
                   $.ajax({
                       type: "POST",
                       url: "crudPlatoAlias",
                       data: {
                           metodo: "eliminacionLogica",
                           idPlato: id
                       },
                       dataType: "json",
                       success: function (data) {
                           console.log("Lista actualizada:", data);

                           agregarGrilla(data);

                           Swal.fire({
                               title: "Operación exitosa",
                               text: "El plato ahora está marcado como No disponible.",
                               icon: "success"
                           });
                       },
                       error: function (xhr, status, error) {
                           console.error("Error:", error);
                           console.error("Respuesta:", xhr.responseText);

                           Swal.fire({
                               title: "Error",
                               text: "No se pudo actualizar la disponibilidad del plato.",
                               icon: "error"
                           });
                       }
                   });
               }
           });
       }


        // Eliminación física
        function eliminacionFisica(id) {
            Swal.fire({
                title: '¿Está seguro?',
                text: 'El plato será eliminado permanentemente.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {

                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "crudPlatoAlias",
                        data: {
                            metodo: "eliminacionFisica",
                            idPlato: id
                        },
                        success: function (data) {
                            agregarGrilla(data);
                        },
                        error: function () {
                            Swal.fire({
                                title: 'Error',
                                text: 'Error al procesar la eliminación física',
                                icon: 'error'
                            });
                        }
                    });
                }
            });
        }

        // Abrir modal de registro
        function abrirModal() {
            $("#id_form_registra")[0].reset();

            const modal = new bootstrap.Modal(
                document.getElementById('id_div_modal_registra')
            );

            modal.show();
        }


        // Cargar datos del plato seleccionado en el modal de actualización
        function verFormularioActualiza(indiceGrilla) {

            // Obtener la fila seleccionada
            const objGrilla = $('#id_table')
                .DataTable()
                .row(indiceGrilla)
                .data();

            console.log(objGrilla);

            // Cargar datos en el formulario
            $("#idPlato").val(objGrilla.idPlato);
            $("#id_act_nombre").val(objGrilla.nombre);
            $("#id_act_proteinaPlato").val(objGrilla.proteinaPlato);

            var idCategoria = objGrilla.idCategoria;

            if (objGrilla.categoria != null &&
                typeof objGrilla.categoria === "object") {
                idCategoria = objGrilla.categoria.idCategoria;
            }

            $("#id_act_categoria").val(idCategoria);
            $("#id_act_tiempoPreparacion").val(
                objGrilla.tiempoPreparacion
            );
            $("#id_act_disponibilidad").val(
                objGrilla.disponibilidad
            );

            // Seleccionar la popularidad guardada
            $("#id_act_popularidad").val(objGrilla.popularidad);

            $("#id_act_precio").val(objGrilla.precio);

            const modal = new bootstrap.Modal(
                document.getElementById('id_div_modal_actualiza')
            );

            modal.show();
        }

    </script>
</body>
</html>