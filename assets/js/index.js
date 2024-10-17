const URI_APP = $("#app").val();
const USUARIO = $("#sesion").val();

$(document).ready(function () {
  const URI_SETTING = $("#setting").val();
  if (USUARIO !== undefined) {
    //************************************************/
    //*******Funcion cargar los opciones del**********/
    //**********menu al iniciar la sesion*************/
    cargarMenu()
    //************************************************/
    //*******Funcion para validar solo si el**********/
    //****usuario tiene acceso a departamento*********/
    validarAcceso();
  }

  
 
  
  //************************************************/
  //***********Evento para Mostrar modal************/
  //**************de inicio de sesion***************/
  $("#btnlogin").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Inicio de Sesion");
    $("#messegel").hide();
    $("#loginModal").modal("show");
  });
  //************************************************/
  //***********Evento para enviar infor*************/
  //**************para iniciar sesion***************/
  $("#formLogin").submit(function (e) {
    e.preventDefault();
    usuario = $.trim($("#usuario").val());
    contrasenna = $.trim($("#contrasenna").val());
    $.ajax({
      url: "usuario/usuario_controller.php?op=login",
      type: "POST",
      dataType: "json",
      data: { usuario: usuario, contrasenna: contrasenna },
      success: function (data) {
        if (data["status"] == true) {
          $("#loginModal").modal("hide");
          Swal.fire({
            icon: "success",
            title: "Bienvenido...",
            html:
              "<h2>¡Estimado " +
              data["nombre"] +
              "!</h2><br><h4>Usted " +
              data["message"] +
              "</h4>",
            showConfirmButton: false,
            timer: 2000,
          });
          setTimeout(() => {
            location.reload();
          }, 2000);
        } else {
          $("#errorl").text(data["message"]);
          $("#messegel").show();
          setTimeout(() => {
            $("#errorl").text("");
            $("#messegel").hide();
          }, 3000);
        }
      },
    });
  });
  //************************************************/
  //***********Evento para cerrar sesion************/
  //************************************************/
  $(document).on("click", "#btnlogout", function () {
    Swal.fire({
      title: "¿Está seguro Cerrar Sesion?",
      showCancelButton: true,
      confirmButtonText: "Si",
    }).then((result) => {
      if (result.isConfirmed) {
        $(location).attr("href", URI_SETTING + "logout.php");
      }
    });
  });
  //************************************************/
  //**********Evento para cargar los valores********/
  //**************de indicador de clientes**********/
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=clientecount",
    dataType: "json",
    success: function (data) {
      $("#cliente_cont").empty();
      $.each(data, function (idx, opt) {
        $("#cliente_cont").append(
          '<div class="col-6">' +
            '<span class="fw-bold fs-5">' +
            opt.n_clientes +
            "</span>" +
            '<p class="fw-bold fs-6">' +
            opt.estatus +
            "</p>" +
            "</div>"
        );
      });
      $("#cliente_cont").append('<p class="fw-bold fs-4">Clientes</p>');
    },
  });
  //************************************************/
  //**********Evento para cargar los valores********/
  //*************de indicador de contratos**********/
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=contratocount",
    dataType: "json",
    success: function (data) {
      $("#contrato_cont").empty();
      $.each(data, function (idx, opt) {
        $("#contrato_cont").append(
          '<div class="col-4">' +
            '<span class="fw-bold fs-5">' +
            opt.n_contratos +
            "</span>" +
            '<p class="fw-bold fs-6">' +
            opt.estatus +
            "</p>" +
            "</div>"
        );
      });
      $("#contrato_cont").append('<p class="fw-bold fs-4">Contratos</p>');
    },
  });
  //************************************************/
  //**********Evento para cargar los valores********/
  //*************de indicador de contratos 2********/
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=cobrocontratocount",
    dataType: "json",
    success: function (data) {
      $("#cobro_nodo").empty();
      $.each(data, function (idx, opt) {
        $("#cobro_nodo").append(
          '<div class="col-3 rounded-5 ' +
            opt.bg +
            ' bg-gradient m-2">' +
            '<span class="fw-bold fs-5">' +
            opt.costo +
            " $</span>" +
            '<p class="fw-bold fs-6">' +
            opt.cant +
            " Contrato <br> En El " +
            opt.nodo +
            "</p>" +
            "</div>"
        );
      });
    },
  });
  //************************************************/
  //**********Evento para cargar los valores********/
  //*************de indicador de contratos 2********/
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=nodos",
    dataType: "JSON",
    success: function (data) {
      $("#cobro_detalle").empty();
      $.each(data, function (idx, opt) {
        $("#cobro_detalle").append(
          '<div class="col-10 rounded-5 bg-light bg-gradient m-2"><span class="fw-bold fs-5">' +
            opt.nodo +
            "</span>" +
            '<div id="nodo' +
            opt.id +
            '" class="row justify-content-center mt-2">' +
            "</div>" +
            "</div>"
        );

        cargarEstados(opt.id);
      });
    },
  });
   //************************************************/
  //**********Evento para cambiar estatus de*********/
  //************los contratos registrados************/
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=cambiarestatus",
    dataType: "JSON",
    success: function (data) {
      //console.log(data);
      
    },
  });
});

function validarAcceso() {
  let link = location.href
  arr = link.split("/");
  let departamento = arr[5];
  if (departamento) {
    $.ajax({
      type: "POST",
      url: URI_APP+"herramientas/herramientas_controller.php?op=permisos",
      dataType: "html",
      data: { usuario: USUARIO, departamento: departamento},
      success: function (data) {
        console.log(data);
        
        if (data == 'true') {
          $('#nopermitido').removeClass('d-flex');
          $('#nopermitido').hide();
          $('#permitido').show();
        }else{
          $('#permitido').hide();
          $('#nopermitido').addClass('d-flex');
          $('#nopermitido').show();
        }
        
        
      },
    });  
  }
}

function cargarMenu() {
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=menu",
    dataType: "html",
    data: { usuario: USUARIO},
    success: function (data) {
      $("#menu").empty();
      $("#menu").append(data);
    },
  });  
}

function cargarEstados(id) {
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=estadocobro",
    dataType: "JSON",
    success: function (data) {
      $("#nodo" + id).empty();
      $.each(data, function (idx, opt) {
        $("#nodo" + id).append(
          '<div class="col-5 rounded-5 bg-primary bg-gradient m-2"><span class="fw-bold fs-5">' +
            opt.estatus +
            "</span>" +
            '<div id="estatus' +
            opt.id +
            "_" +
            id +
            '" class="row justify-content-center mt-2">' +
            "</div>" +
            "</div>"
        );

        cargarEstadosCobros(id, opt.id);
      });
    },
  });
}

function cargarEstadosCobros(nodo, estatus) {
  $.ajax({
    type: "POST",
    url: URI_APP+"herramientas/herramientas_controller.php?op=cobrosdetalle",
    dataType: "JSON",
    data: { nodo: nodo, estatus: estatus },
    success: function (data) {
      $("#estatus" + estatus + "_" + nodo).empty();
      $.each(data, function (idx, opt) {
        if (opt.estatus == 1) {
          $("#estatus" + estatus + "_" + nodo).append(
            '<div class="row col justify-content-center text-center text-white bg-light bg-gradient mb-4">' +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.monto +
              "<br>Monto Acumulado</b></p>" +
              "</div>" +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.numero +
              "<br>Cobros Acumulado</b></p>" +
              "</div>" +
              "</div>"
          );
        }
        if (opt.estatus == 2) {
          $("#estatus" + estatus + "_" + nodo).append(
            '<div class="row col justify-content-center text-center text-white bg-light bg-gradient mb-4">' +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.monto +
              "<br>Monto Acumulado</b></p>" +
              "</div>" +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.numero +
              "<br>Cobros Acumulado</b></p>" +
              "</div>" +
              "</div>"
          );
        }
        if (opt.estatus == 3) {
          $("#estatus" + estatus + "_" + nodo).append(
            '<div class="row col justify-content-center text-center text-white bg-light bg-gradient mb-4">' +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.monto +
              "<br>Monto Acumulado</b></p>" +
              "</div>" +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.numero +
              "<br>Cobros Acumulado</b></p>" +
              "</div>" +
              "</div>"
          );
        }
        if (opt.estatus == 4) {
          $("#estatus" + estatus + "_" + nodo).append(
            '<div class="row col justify-content-center text-center text-white bg-light bg-gradient mb-4">' +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.monto +
              "<br>Monto Acumulado</b></p>" +
              "</div>" +
              '<div class="col-6 border border-primary rounded-2 bg-dark bg-gradient">' +
              "<p><b>" +
              opt.numero +
              "<br>Cobros Acumulado</b></p>" +
              "</div>" +
              "</div>"
          );
        }
      });
    },
  });
}
