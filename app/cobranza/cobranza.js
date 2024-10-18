$(document).ready(function () {
  corte = document.getElementById("corte");
  //*********************************************/
  //******Se Oculta los elementos iniciales******/
  //**************de modulo**********************/
  $("#contenedor_r_cliente").hide();
  $("#contenedor_v_cliente").hide();
  $("#contenedor_cxc").hide();
  $("#box_cliente").hide();
  $("#box_nodo").hide();
  //*********************************************/
  //********Accion para el boton volver**********/
  //*******restablecer la vista del menu*********/
  $(".back").click(function (e) {
    e.preventDefault();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_cxc").hide();
    $("button").removeClass("active");
    $("#contenedor_default").show();
    $("#contenedor_botones").show();
  });
  //*********************************************/
  //********Funcion de Accion para usar**********/
  //*******menu interno de modulo cliente********/
  $("#btn_reg").click(function (e) {
    e.preventDefault();
    limpiarFormulario();
    $("#btnbuscar").prop("disabled", false);
    $("#titulo_cliente").text("Registro Cobranza");
    $("#contenedor_r_cliente").show();
    $("button").removeClass("active");
    $("#btn_reg").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_cxc").hide();
  });
  /**********************************************/
  $("#btn_ver").click(function (e) {
    e.preventDefault();
    $("#contenedor_v_cliente").show();
    $("button").removeClass("active");
    $("#btn_ver").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_cxc").hide();
    dataCobroCarga();
    limpiarFormulario();
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
    limpiarFormulario();
  });
  /**********************************************/
  $("#btn_auto").click(function (e) {
    e.preventDefault();
    $.ajax({
      url: "cobranza_controller.php?op=generacion_automatica",
      type: "POST",
      dataType: "json",
      success: function (data) {
        if (data.status == true) {
          Swal.fire({
            icon: "success",
            title: data.message,
            showConfirmButton: false,
            timer: 2000,
          });
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
  });
  $("#forma_cxc").change(function (e) {
    e.preventDefault();
    $("#id_cliente").val("");
    $("#nodo_cxc").val("");
    $("#detalle_cxc").val("");
    $("#box_nodo").hide();
    $("#box_cliente").hide();
  });
  $("#detalle_cxc").change(function (e) {
    e.preventDefault();
    forma_cxc = $("#forma_cxc").val();
    detalle_cxc = $("#detalle_cxc").val();
    if (forma_cxc == "nodo" && detalle_cxc == "especifico") {
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
      $("#box_cliente").hide();
    }
    if (forma_cxc == "cliente" && detalle_cxc == "especifico") {
      $("#box_cliente").show();
      $("#box_nodo").hide();
    }
    if (detalle_cxc == "general") {
      $("#box_cliente").hide();
      $("#box_nodo").hide();
    }
  });
  //*********************************************/
  //********Funcion para Validar solo************/
  //************Entrada de Numeros***************/
  $(function () {
    $("input[name='monto_cobro']").on("input", function (e) {
      $(this).val(
        $(this)
          .val()
          .replace(/[^0-9.]/g, "")
      );
    });
  });
  //*********************************************/
  //********Evento para Mostrar modal************/
  //**********de Lista de Contrato***************/
  $("#btnbuscar").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Lista de Contratos");
    $("#modalcontrato").modal("show");
    dataContratoCarga();
  });
  //************************************************/
  //***********Evento para Mostrar modal************/
  //**************de Lista de Cliente***************/
  $("#btnbuscarcxc").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Lista de Cliente");
    $("#modalcliente").modal("show");
    dataClienteCarga();
  });
  //*********************************************/
  //*****Accion para registrar la informacion****/
  //**************de la base de datos************/
  $("#r_cobranza_form").submit(function (e) {
    e.preventDefault();
    id_contrato = $("#id_contrato").val();
    id_cliente = $("#id_cliente").val();
    nodo = $("#nodo").val();
    contrato = $("#contrato").val();
    concepto = $("#concepto_cobro").val();
    monto = $("#monto_cobro").val();
    $.ajax({
      url: "cobranza_controller.php?op=cobranzaData",
      type: "POST",
      dataType: "json",
      data: {
        id_contrato: id_contrato,
        id_cliente: id_cliente,
        contrato: contrato,
        concepto: concepto,
        monto: monto,
        nodo: nodo,
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
            dataCobroCarga();
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
    forma_cxc = $("#forma_cxc").val();
    id_cliente = $("#id_cliente").val();
    nodo_cxc = $("#nodo_cxc").val();
    id = (id_cliente) ? id_cliente : nodo_cxc;
    if (id) {
      window.open("cxc_pdf.php?op=" + forma_cxc + "&id=" + id, "_blank");
    } else {
      window.open("cxc_pdf.php?op=" + forma_cxc, "_blank");
    }
    
  });
});
//************************************************/
//********Opcion para cargar informacion**********/
//**********de las cobranzas generadas************/
function dataCobroCarga() {
  //************************************************/
  //********Accion para cargar la informacion*******/
  //******el Datatable de los usuario***************/
  $("#tablacobros").DataTable().destroy();
  usuariotabla = $("#tablacobros").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "cobranza_controller.php?op=cobranzas",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "fecha_creacion" },
      { data: "contrato" },
      { data: "nombre_apel" },
      { data: "orden" },
      { data: "telefono" },
      { data: "monto" },
      { data: "estatus" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick='anularCobro(`" +
            data +
            "`)' class='btn btn-outline-secondary btn-sm' title='Eliminar'><i class='bi bi-x-octagon'></i></button>" +
            "<button onclick='verPDFNota(`" +
            data +
            "`)' class='btn btn-outline-success btn-sm'><i class='bi bi-printer'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
    order: {
      name: "id",
      dir: "desc",
    },
  });
}
//************************************************/
//*********Opcion para anular un cobro************/
//**************de la base de datos***************/
function anularCobro(id) {
  Swal.fire({
    title: "¿Está seguro de borrar esta informacion?",
    showCancelButton: true,
    confirmButtonText: "Si",
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: "cobranza_controller.php?op=anular",
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
              $("#tablacobros").DataTable().ajax.reload();
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
}
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
            "<button onclick='cargarCliente(`" +
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
//*******Accion para cargar la informacion********/
//**********de los contratos registrados**********/
function dataContratoCarga() {
  $("#listacontrato").DataTable().destroy();
  usuariotabla = $("#listacontrato").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "../contrato/contrato_controller.php?op=contratos",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "contrato" },
      { data: "nombre_apel" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick=' cargarContratoCliente(`" +
            data +
            "`)' class='btn btn-outline-primary btn-sm '>Selecionar</button>" +
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
function cargarCliente(id) {
  $("#modalcliente").modal("hide");
  $.ajax({
    url: "../cliente/cliente_controller.php?op=cliente",
    method: "POST",
    dataType: "json",
    data: { id: id },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_cliente").val(cliente);
        $("#cxc_cliente_nom").val(opt.nombre_apel);
        $("#cxc_cliente_id").val(opt.documento);
      });
    },
  });
}
//************************************************/
//********Opcion para cargar informacion**********/
//**********de un contrato selecionado************/
function cargarContratoCliente(id) {  
  $("#modalcontrato").modal("hide");  
  $.ajax({
    url: "../contrato/contrato_controller.php?op=contrato",
    method: "POST",
    dataType: "json",
    data: { id: id },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_cliente").val(opt.cliente);
        $("#id_contrato").val(opt.id);
        $("#nodo").val(opt.nodo);
        $("#contrato_cliente").val(opt.contrato);
        $("#nombre_cliente").val(opt.nombre_apel);
      });
    },
  });
}
//************************************************/
//********Accion para limpiar los campor *********/
//*************del formulario actual**************/
function limpiarFormulario() {
  $("#id_cliente").val("");
  $("#id_contrato").val("");
  $("#contrato_cliente").val("");
  $("#nombre_cliente").val("");
  $("#concepto_cobro").val("");
  $("#monto_cobro").val("");
  $("#forma_cxc").val("");
  $("#detalle_cxc").val("");
  $("#cxc_cliente_nom").val("");
  $("#cxc_cliente_id").val("");
  $("#box_cliente").hide();
  $("#box_nodo").hide();
}

function verPDFNota(nota) {
  window.open("pdf.php?id=" + nota, "_blank");
}
