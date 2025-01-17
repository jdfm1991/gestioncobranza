$(document).ready(function () {
  $("#contenedor_permisos").hide();
  //************************************************/
  //********Accion para cargar la informacion*******/
  //***********el Datatable de los usuario**********/
  usuariotabla = $("#usuariotabla").DataTable({
    responsive: false,
    pageLength: 10,
    ajax: {
      url: "usuario_controller.php?op=usuarios",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "nombre" },
      { data: "usuario" },
      { data: "fecha_registro" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick='tomarId(`" +
            data +
            "`)' class='btn btn-outline-info btn-sm btneditar' title='Actializar'><i class='bi bi-pencil-square'></i></button>" +
            "<button onclick='tomarId(`" +
            data +
            "`)' class='btn btn-outline-success btn-sm verpermisos' title='ver permisos'><i class='bi bi-lock'></i></button>" +
            "<button onclick='tomarId(`" +
            data +
            "`)' class='btn btn-outline-danger btn-sm btneliminar' title='Eliminar'><i class='bi bi-x-octagon'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
  //************************************************/
  //********Accion para cargar la informacion*******/
  //*************del usuario seleccionado***********/
  $(document).on("click", ".btneditar", function () {
    id = $("#idusuario").val();
    $.ajax({
      url: "usuario_controller.php?op=usuario",
      method: "POST",
      dataType: "json",
      data: { id: id },
      success: function (data) {
        $.each(data, function (idx, opt) {
          $("#nom_usuario").val(opt.nombre);
          $("#login_usuario").val(opt.usuario);
          $("#contrasena").prop("required", false);
        });
      },
    });
  });
  //************************************************/
  //********Accion para Enviar y guardar la*********/
  //*********informacion del usuario************/
  $("#formulariodeusuario").submit(function (e) {
    e.preventDefault();
    id = $("#idusuario").val();
    usuario = $("#login_usuario").val();
    nom_usuario = $("#nom_usuario").val();
    contrasena = $("#contrasena").val();
    $.ajax({
      url: "usuario_controller.php?op=usuarioData",
      type: "POST",
      dataType: "json",
      data: {
        id: id,
        usuario: usuario,
        nom_usuario: nom_usuario,
        contrasenna: contrasena,
      },
      success: function (data) {
        if (data.status == true) {
          Swal.fire({
            icon: "success",
            html: "<h2>¡" + data.message + "!</h2>",
            showConfirmButton: false,
            timer: 2000,
          });
          setTimeout(() => {
            limpiarFormulario();
          }, 1000);
          setTimeout(() => {
            usuariotabla.ajax.reload(null, false);
          }, 1500);
        } else {
          $("#messege").addClass("alert-danger");
          $("#messege").show();
          $("#error").text(data.message);
          setTimeout(() => {
            $("#error").text("");
            $("#messege").hide();
          }, 3000);
        }
      },
    });
  });
  //************************************************/
  //*********Opcion para Eliminar un usuario*******/
  //*****************de la base de datos************/
  $(document).on("click", ".btneliminar", function () {
    id = $("#idusuario").val();
    Swal.fire({
      title: "¿Está seguro de borrar esta informacion?",
      showCancelButton: true,
      confirmButtonText: "Si",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "usuario_controller.php?op=eliminar",
          type: "POST",
          dataType: "json",
          data: { id: id },
          success: function (data) {
            if (data.status == true) {
              Swal.fire({
                icon: "success",
                title: data.message,
                showConfirmButton: false,
                timer: 2000,
              });
              limpiarFormulario();
              setTimeout(() => {
                usuariotabla.ajax.reload(null, false);
              }, 1000);
            } else {
              Swal.fire({
                icon: "error",
                title: data.message,
                showConfirmButton: false,
                timer: 2000,
              });
              limpiarFormulario();
            }
          },
        });
      }
    });
  });
  //************************************************/
  //*********Opcion para Eliminar un usuario*******/
  //*****************de la base de datos************/
  $(document).on("click", ".verpermisos", function () {
    $("#contenedor_fomulario").hide();
    $("#contenedor_permisos").show();
    id = $("#idusuario").val();
    $.ajax({
      url: URI_APP + "herramientas/herramientas_controller.php?op=modulos",
      type: "POST",
      dataType: "json",
      data: { usuario: id },
      success: function (data) {
        $("#list_modulo").empty();
        $.each(data, function (idx, opt) {
          $("#list_modulo").append(
            "<div>" +
              '<div class="form-check">' +
              '<input class="form-check-input permodulo" type="checkbox" value="' +
              opt.id +
              '" id="' +
              opt.id +
              '" ' +
              opt.checked +
              ">" +
              '<label class="form-check-label text-center" for="' +
              opt.id +
              '">' +
              opt.modulo +
              "</label>" +
              '<div id="modulo_dep' +
              opt.id +
              '" class="row justify-content-between align-items-center g-2 pt-3"></div>' +
              "</div>" +
              "</div>"
          );
          cargarDeportamentoModulo(opt.id);
        });
      },
    });
  });
  //*********************************************/
  //********Accion para Validar checkbox*********/
  //***********asignarmermisod de modulo*********/
  $(document).on("change", ".permodulo", function (e) {
    if ($(this).is(":checked")) {
      modulo = $(this).val();
      darPermisoModuloUsuario(modulo);
      cargarDeportamentoModulo(modulo);
    } else {
      modulo = $(this).val();
      quitarPermisoModuloUsuario(modulo);
    }
  });
  //*********************************************/
  //********Accion para Validar checkbox*********/
  //******asignarmermisod de departamento********/
  $(document).on("change", ".perdepartamento", function (e) {
    if ($(this).is(":checked")) {
      departamento = $(this).val()      
      darPermisoDepartamentoUsuario(departamento)
    } else {
      departamento = $(this).val()
      quitarPermisoDepartamentoUsuario(departamento)
    }
  });

  $(".boton").change(function (e) { 
    e.preventDefault();
    if ($(this).is(":checked")) {
      boton = $(this).val()     
      permitirAccionDepartamento(boton)
    } else {
      boton = $(this).val()
      quitarAccionDepartamento(boton)
    }
  });

  $("#closeb").click(function (e) {
    e.preventDefault();
    $( "#check_btn_1" ).prop( "checked", false )
    $( "#check_btn_2" ).prop( "checked", false )
    $( "#check_btn_3" ).prop( "checked", false )
    $( "#check_btn_4" ).prop( "checked", false ) 
    $( "#check_btn_5" ).prop( "checked", false )
    $( "#check_btn_6" ).prop( "checked", false )
    $( "#check_btn_7" ).prop( "checked", false )
  });

  $("#salir").click(function (e) { 
    e.preventDefault();
    $("#contenedor_fomulario").show();
    $("#contenedor_permisos").hide();
  });
});

function tomarId(id) {
  $("#idusuario").val(id);
}

function darPermisoModuloUsuario(modulo) {
  id = $("#idusuario").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=darpermidomulo",
    type: "POST",
    dataType: "json",
    data: { usuario: id, modulo: modulo },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(29 255 34 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      toastBootstrap.show();
    },
  });
}

function quitarPermisoModuloUsuario(modulo) {
  id = $("#idusuario").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=quitarpermidomulo",
    type: "POST",
    dataType: "json",
    data: { usuario: id, modulo: modulo },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      toastBootstrap.show();
    },
  });
}

function cargarDeportamentoModulo(modulo) {
  id = $("#idusuario").val();
  $.ajax({
    type: "POST",
    url: URI_APP + "herramientas/herramientas_controller.php?op=departamentos",
    dataType: "json",
    data: { usuario: id, modulo: modulo },
    success: function (data) {
      $("#modulo_dep" + modulo).empty();
      $.each(data, function (idx, opt) {
        $("#modulo_dep" + modulo).append(
          '<div class="col-sm-6">' +
            '<div class="form-check">' +
            '<input class="form-check-input perdepartamento" type="checkbox" value="' +
            opt.id +
            '" id="' +
            opt.id +
            '" ' +
            opt.checked +
            ">" +
            '<label class="form-check-label text-center" for="' +
            opt.id +
            '">' +
            opt.departamento +
            "</label>" +
            "</div>" +
            "</div>"
        );
      });
    },
  });
}

function darPermisoDepartamentoUsuario(departamento) {
  usuario = $("#idusuario").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=darpermdep",
    type: "POST",
    dataType: "json",
    data: { usuario: usuario, departamento: departamento },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(29 255 34 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      $("#iddep").val(departamento);
      toastBootstrap.show();
      verificarAccion(departamento,usuario)
      if (departamento==3) {
        $("#auto_btn").removeClass('d-none');
      } else {
        $("#auto_btn").addClass('d-none');
      }
      if (departamento!=6) {
        $(".modal-title").text("Acciones Permitidas");
        $("#modalbotones").modal("show");
      }
      if (departamento==5) {
        $(".regular").addClass('d-none');
        $(".sistema").removeClass('d-none');
      }else{
        $(".regular").removeClass('d-none');
        $(".sistema").addClass('d-none');
      }     
    },
  });
}

function quitarPermisoDepartamentoUsuario(departamento) {
  id = $("#idusuario").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=quitarpermdep",
    type: "POST",
    dataType: "json",
    data: { usuario: id, departamento: departamento },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      toastBootstrap.show();
    },
  });
}

function permitirAccionDepartamento(boton) {
  usuario = $("#idusuario").val();
  departamento = $("#iddep").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=daracciondep",
    type: "POST",
    dataType: "json",
    data: { usuario: usuario, departamento: departamento, boton:boton },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(29 255 34 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      toastBootstrap.show();
    },
  });
}

function quitarAccionDepartamento(boton) {
  usuario = $("#idusuario").val();
  departamento = $("#iddep").val();
  const toastLiveExample = document.getElementById("notificar");
  const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
  $.ajax({
    url: "usuario_controller.php?op=quitaracciondep",
    type: "POST",
    dataType: "json",
    data: { usuario: usuario, departamento: departamento, boton:boton },
    success: function (data) {
      $(".me-auto").text("Procesos Exitoso");
      $(".toast").css("background-color", "rgb(255 80 80 / 85%)");
      $(".toast").css("color", "white");
      $(".toast").attr("background-color", "");
      $("#notificacion").text(data.message);
      toastBootstrap.show();
    },
  });
}

function limpiarFormulario() {
  $("#idusuario").val("");
  $("#login_usuario").val("");
  $("#nom_usuario").val("");
  $("#ape_usuario").val("");
  $("#contrasena").val("");
  $("#correo").val("");
  $("#telefono").val("");
  $("#roles").val("");
  $("#estatus").val("");
}

function verificarAccion(departamento,usuario) {
  $.ajax({
    url: "usuario_controller.php?op=veraccion",
    type: "POST",
    dataType: "json",
    data: { usuario: usuario, departamento: departamento },
    success: function (data) {
      const boton = document.getElementsByClassName('boton')
      $.each(data, function (idx, opt) {
        for (let i = 0; i < boton.length; i++) {
          if (boton[i].value==opt.boton) {
            $("#"+boton[i].id).prop( "checked", true )
          }
        }
      });
    },
  });
}
