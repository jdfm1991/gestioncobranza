$(document).ready(function () {
  //************************************************/
  //*******Se Oculta los elementos iniciales********/
  //*****************de modulo**********************/
  $("#contenedor_r_cliente").hide();
  $("#contenedor_v_cliente").hide();
  $("#contenedor_cxc").hide();
  $("#box_nodo").hide();
  $("#panel").hide();
  //************************************************/
  //***********Accion para el boton volver**********/
  //**********restablecer la vista del menu*********/
  $(".back").click(function (e) {
    e.preventDefault();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_cxc").hide();
    $("button").removeClass("active");
    $("#contenedor_default").show();
    $("#contenedor_botones").show();
  });
  //************************************************/
  //***********Funcion de Accion para usar**********/
  //*********menu interno de modulo cliente*********/
  $("#btn_reg").click(function (e) {
    e.preventDefault();
    limpiarFormulario();
    $("#btnbuscar").prop("disabled", false);
    $("#titulo_cliente").text("Registro Nuevo Contrato");
    $("#contenedor_r_cliente").show();
    $("button").removeClass("active");
    $("#btn_reg").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_cxc").hide();
  });
  /*************************************************/
  $("#btn_ver").click(function (e) {
    e.preventDefault();
    $("#contenedor_v_cliente").show();
    $("button").removeClass("active");
    $("#btn_ver").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_cxc").hide();
    dataContratoCarga();
  });
  /**********************************************/
  $("#btn_report").click(function (e) {
    e.preventDefault();
    $("#contenedor_cxc").show();
    $("button").removeClass("active");
    $("#btn_report").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_v_cliente").hide();
  });
  //************************************************/
  //***********Funcion para Validar solo************/
  //*********Entrada de Numeros telefonicos*********/
  $(function () {
    $("input[name='telefono_cliente']").on("input", function (e) {
      $(this).val(
        $(this)
          .val()
          .replace(/[^0-9+-]/g, "")
      );
    });
  });
  //************************************************/
  //***********Evento para Mostrar modal************/
  //**************de Lista de Cliente***************/
  $("#btnbuscar").click(function (e) {
    e.preventDefault();
    dataClienteCarga();
    $(".modal-title").text("Lista de Cliente");
    $("#modalcliente").modal("show");
  });
  //*************************************************/
  //********Accion para cargar la informacion********/
  //********al selector de planes Registrados********/
  $.ajax({
    url: "../herramientas/herramientas_controller.php?op=plan",
    method: "POST",
    dataType: "json",
    success: function (data) {
      $("#plan").append('<option value="">_-_Seleccione_-_</option>');
      $.each(data, function (idx, opt) {
        $("#plan").append(
          '<option value="' + opt.id + '">' + opt.plan + "</option>"
        );
      });
    },
  });
  //*************************************************/
  //********Accion para cargar la informacion********/
  //*********el selector el nodos registrados********/
  $.ajax({
    url: "../herramientas/herramientas_controller.php?op=nodos",
    method: "POST",
    dataType: "json",
    success: function (data) {
      $("#nodo_cliente").append('<option value="">_-_Seleccione_-_</option>');
      $.each(data, function (idx, opt) {
        $("#nodo_cliente").append(
          '<option value="' + opt.id + '">' + opt.nodo + "</option>"
        );
      });
    },
  });
  //*************************************************/
  //********Accion para cargar la informacion********/
  //*******detalla de de los planes registrado*******/
  $("#plan").change(function (e) {
    e.preventDefault();
    plan = $("#plan").val();
    $.ajax({
      url: "../herramientas/herramientas_controller.php?op=plan_d",
      method: "POST",
      dataType: "json",
      data: { plan: plan },
      success: function (data) {
        $.each(data, function (idx, opt) {
          $("#plan_detalle").val(opt.detalle);
          $("#plan_costo").val(opt.costo);
        });
      },
    });
  });

  $("#detalle_cxc").change(function (e) {
    e.preventDefault();
    detalle_cxc = $("#detalle_cxc").val();
    if (detalle_cxc == "especifico") {
      $.ajax({
        url: "../herramientas/herramientas_controller.php?op=nodos",
        method: "POST",
        dataType: "json",
        success: function (data) {
          $("#nodo_cxc").empty();
          $("#nodo_cxc").append('<option value="">_-_Seleccione_-_</option>');
          $.each(data, function (idx, opt) {
            $("#nodo_cxc").append(
              '<option value="' + opt.id + '">' + opt.nodo + "</option>"
            );
          });
        },
      });
      $("#box_nodo").show();
    }
  
    if (detalle_cxc == "general") {
      $("#box_nodo").hide();
    }
  });
  //************************************************/
  //*********Opcion para editar un producto*******/
  //*****************de la base de datos************/
  $(document).on("click", ".btneditar", function () {
    id = $("#id_contrato").val();
    $("#contenedor_r_cliente").show();
    $("#contenedor_v_cliente").hide();
    $("#titulo_cliente").text("Editar Registro Contrato");
    $("#plan_cliente").empty();
    $.ajax({
      url: "contrato_controller.php?op=contrato",
      method: "POST",
      dataType: "json",
      data: { id: id },
      success: function (data) {       
        $.each(data, function (idx, opt) {
          $("#id_contrato").val(opt.id);
          $("#documento_cliente").val(opt.documento);
          $("#nombre_cliente").val(opt.nombre_apel);
          $("#nodo_cliente").val(opt.nodo);
          $("#plan").val(opt.plan);
          $("#plan_detalle").val(opt.detalle);
          $("#plan_costo").val(opt.costo);
          $("#direccion_cliente").val(opt.direccion);
          $("#fecha_cliente").val(opt.fecha_apertura);
          $("#btnbuscar").prop("disabled", true);
        });
      },
    });
  });
  //************************************************/
  //********Accion para Enviar y guardar la*********/
  //*********informacion de los clientes************/
  $("#r_contrato_form").submit(function (e) {
    e.preventDefault();
    id = $("#id_contrato").val();
    cliente = $("#id_cliente").val();
    nodo = $("#nodo_cliente").val();
    plan = $("#plan").val();
    direccion = $("#direccion_cliente").val();
    fecha_apertura = $("#fecha_cliente").val();
    $.ajax({
      url: "contrato_controller.php?op=contratoData",
      type: "POST",
      dataType: "json",
      data: {
        id: id,
        cliente: cliente,
        plan: plan,
        nodo: nodo,
        direccion: direccion,
        fecha_apertura: fecha_apertura,
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
            $("button").removeClass("active");
            $("#btn_ver").addClass("active");
            $("#contenedor_r_cliente").hide();
            $("#contenedor_v_cliente").show();
            limpiarFormulario();
            dataContratoCarga() 
          }, 1000);
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


  $("#r_cxc_form").submit(function (e) {
    e.preventDefault();
    nodo_cxc = $("#nodo_cxc").val();
    if (nodo_cxc) {
      window.open("reporte_pdf.php?id=" + nodo_cxc, "_blank");
    } else {
      window.open("reporte_pdf.php", "_blank");
    }
    
  });
  //************************************************/
  //*********Opcion para Eliminar un usuario********/
  //*****************de la base de datos************/
  $(document).on("click", ".btneliminar", function () {
    id = $("#id_contrato").val();
    Swal.fire({
      title: "¿Está seguro de borrar esta informacion?",
      showCancelButton: true,
      confirmButtonText: "Si",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "contrato_controller.php?op=anular",
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
              setTimeout(() => {
                $("#tablacontrato").DataTable().ajax.reload();
              }, 1000);
            } else {
              Swal.fire({
                icon: "error",
                title: data.message,
                showConfirmButton: false,
                timer: 2000,
              });
            }
          },
        });
      }
    });
  });
});
//**************************************************/
//********Accion para cargar la informacion*********/
//******el Datatable de los clientes****************/
function dataClienteCarga() {
  $("#listacliente").DataTable().destroy();
  usuariotabla = $("#listacliente").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "../cliente/cliente_controller.php?op=clientes",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "nombre_apel" },
      { data: "documento" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick='buscarContrato(`" +
            data +
            "`)' class='btn btn-outline-primary btn-sm'>Selecionar</button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
}
//************************************************/
//********Accion para cargar la informacion*******/
//******el Datatable de los contratos*************/
function dataContratoCarga() {
  $("#tablacontrato").DataTable().destroy();
  tablacontrato = $("#tablacontrato").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "contrato_controller.php?op=contratos",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "fecha_apertura" },
      { data: "nombre_apel" },
      { data: "contrato" },
      { data: "plan" },
      { data: "costo" },
      { data: "nodo" },
      { data: "estatus" },
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
            "`)' class='btn btn-outline-secondary btn-sm btneliminar' title='Eliminar'><i class='bi bi-x-octagon'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
}
//************************************************/
//********Accion para cargar la informacion*******/
//*************del cliente selecconado************/
function buscarContrato(cliente) {
  $("#modalcliente").modal("hide"); 
  $.ajax({
    url: "../cliente/cliente_controller.php?op=cliente",
    method: "POST",
    dataType: "json",
    data: { id: cliente },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_cliente").val(opt.id);
        $("#nombre_cliente").val(opt.nombre_apel);
        $("#documento_cliente").val(opt.documento);
        $("#panel").show();
        cargarDetallecontrato(cliente);
      });
    },
  });
}
//************************************************/
//********Accion para cargar la informacion*******/
//*******los contrato existentes del ciente*******/
function cargarDetallecontrato(cliente) {
  $.ajax({
    url: "contrato_controller.php?op=cliente",
    method: "POST",
    dataType: "json",
    data: { cliente: cliente },
    success: function (data) {
      $("#plan_cliente").empty();
      $.each(data, function (idx, opt) {
        $("#plan_cliente").append(
          '<div class="col mb-3 text-center">' +
            '  <div class="card" style="width: 18rem;">' +
            '    <div class="card-header">' +
            opt.contrato +
            "    </div>" +
            '    <ul class="list-group list-group-flush">' +
            '      <li class="list-group-item">' +
            opt.fecha_apertura +
            "</li>" +
            '      <li class="list-group-item">' +
            opt.plan +
            "</li>" +
            '      <li class="list-group-item">' +
            opt.estatus +
            "</li>" +
            "    </ul>" +
            "  </div>" +
            "</div>"
        );
      });
    },
  });
}

function tomarId(id) {
  $("#id_contrato").val(id);
}

function limpiarFormulario() {
  $("#id_contrato").val("");
  $("#id_cliente").val("");
  $("#nombre_cliente").val("");
  $("#documento_cliente").val("");
  $("#plan").val("");
  $("#plan_detalle").val("");
  $("#plan_costo").val("");
  $("#nodo_cliente").val("");
  $("#direccion_cliente").val("");
  
}
