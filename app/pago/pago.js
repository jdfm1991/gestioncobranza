$(document).ready(function () {
  corte = document.getElementById("corte");
  //*********************************************/
  //******Se Oculta los elementos iniciales******/
  //**************de modulo**********************/
  $("#contenedor_r_cliente").hide();
  $("#contenedor_v_cliente").hide();
  $("#contenedor_cxc").hide();
  $("#f_detalle").hide();
  $("#p_c_cambio").hide();
  //*********************************************/
  //********Accion para el boton volver**********/
  //*******restablecer la vista del menu*********/
  $(".back").click(function (e) {
    e.preventDefault();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_v_cliente_d").hide();
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
    $("#titulo_cliente").text("Generar Nota de Entrega");
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
    dataPagoCarga();
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
  //*********************************************/
  //********Funcion para Validar solo************/
  //************Entrada de Numeros***************/
  $(function () {
    $("input[name='monto']").on("input", function (e) {
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
    dataContratoCarga();
    $(".modal-title").text("Lista de Contratos");
    $("#modalcontrato").modal("show");
  });
  //*********************************************/
  //********Evento para Mostrar modal************/
  //**********de Lista de Contrato***************/
  $("#btnbusca").click(function (e) {
    e.preventDefault();
    dataClienteCarga();
    $(".modal-title").text("Lista de Cliente");
    $("#modalcliente").modal("show");
  });
  //*********************************************/
  //**********Accion para abril modal para*******/
  //**************registrar pago deuda***********/
  $("#r_cobranza_form").submit(function (e) {
    e.preventDefault();
    contrato = $("#id_contrato").val();
    plan_arr = document.querySelectorAll("input[name='plan[]']:checked");
    if (contrato) {
      if (plan_arr.length) {
        $(".modal-title").text("Datos de Pago");
        $("#modalpago").modal("show");
        plan = [];
        monto = [];
        total = 0;
        for (var i = 0; i < plan_arr.length; i++) {
          plan[i] = plan_arr[i].value;
        }
        for (var i = 0; i < plan.length; i++) {
          monto[i] = parseFloat($("#monto" + plan[i]).text());
          total += parseFloat(monto[i]);
        }
        $("#pago_cobro").val(total.toFixed(2));
      } else {
        Swal.fire({
          icon: "info",
          html: "<h2>¡Debe Selecionar Una Nota de Cobro Para Continuar!</h2>",
          showConfirmButton: false,
          timer: 2000,
        });
      }
    } else {
      Swal.fire({
        icon: "info",
        html: "<h2>¡Debe Selecionar un Contrato Para Continuar!</h2>",
        showConfirmButton: false,
        timer: 2000,
      });
    }
  });
  //*********************************************/
  //*******Accion para cargar la informacion*****/
  //*********al selector de formas de pago*******/
  $.ajax({
    url: "../herramientas/herramientas_controller.php?op=forma_pago",
    method: "POST",
    dataType: "json",
    success: function (data) {
      $("#forma_pago").append('<option value="">_-_Seleccione_-_</option>');
      $.each(data, function (idx, opt) {
        $("#forma_pago").append(
          '<option value="' + opt.id + '">' + opt.forma + "</option>"
        );
      });
    },
  });
  //*********************************************/
  //*******Accion para cargar la informacion*****/
  //*********de la forma de pago detallado*******/
  $("#forma_pago").change(function (e) {
    e.preventDefault();
    forma = $("#forma_pago").val();
    if (forma == 1) {
      $("#p_c_cambio").show();
    } else {
      $("#p_c_cambio").hide();
    }
    $.ajax({
      url: "../herramientas/herramientas_controller.php?op=forma_pago_detalle",
      method: "POST",
      dataType: "json",
      data: { forma: forma },
      success: function (data) {
        $("#f_detalle").show();
        $("#forma_pago_detalle").empty();
        $("#forma_pago_detalle").append(
          '<option value="">_-_Seleccione_-_</option>'
        );
        $.each(data, function (idx, opt) {
          $("#forma_pago_detalle").append(
            '<option value="' + opt.id + '">' + opt.detalle + "</option>"
          );
        });
      },
    });
  });
  //*********************************************/
  //*******Accion para cargar la informacion*****/
  //*********de la forma de pago detallado*******/
  $("#forma_pago_detalle").change(function (e) {
    e.preventDefault();
    forma = $("#forma_pago_detalle").val();
    if (forma == 1 || forma == 2 || forma == 3) {
      $("#p_c_cambio").show();
    } else {
      $("#p_c_cambio").hide();    }
  });
  //*********************************************/
  //*******Accion para calculos el monto en******/
  //*********bolivares al cambiar la tasa********/
  $("#tasa_pago").keyup(function (e) {
    let monto = 0;
    cobro = parseFloat($("#pago_cobro").val());
    tasa = parseFloat($("#tasa_pago").val());
    if (isNaN(tasa)) {
      tasa = 0;
      monto = parseFloat(cobro * tasa);
      $("#pago_cobro_cambio").val(monto);
    } else {
      monto = parseFloat(cobro * tasa);
      $("#pago_cobro_cambio").val(monto);
    }
  });
  //*********************************************/
  $("#fecha_pago").change(function (e) {
    e.preventDefault();
    fecha = $("#fecha_pago").val();
    $.ajax({
      url: "../herramientas/herramientas_controller.php?op=tasa",
      method: "POST",
      dataType: "json",
      data: { fecha: fecha },
      success: function (data) {
        cobro = parseFloat($("#pago_cobro").val());
        if (data.length > 0) {
          $.each(data, function (idx, opt) {
            $("#tasa_pago").val(opt.tasa);
            monto = parseFloat(cobro * opt.tasa);
          });
          $("#pago_cobro_cambio").val(monto);
        } else {
          $("#tasa_pago").val("");
          $("#pago_cobro_cambio").val(0);
        }
      },
    });
  });
  //*********************************************/
  $("#abono").change(function() {
    if ($(this).is(":checked")) {
      $("#abono").prop('checked', true);
    } else {
      $("#abono").prop('checked', false);
    }
});
  //*********************************************/
  //**********Accion para abril modal para*******/
  //**************registrar pago deuda***********/
  $("#r_pago_form").submit(function (e) {
    e.preventDefault();
    contrato = $("#id_contrato").val();
    cliente = $("#id_cliente").val();
    forma_pago = $("#forma_pago").val();
    fp_detalle = $("#forma_pago_detalle").val();
    p_cobro = $("#pago_cobro").val();
    fecha_pago = $("#fecha_pago").val();
    tasa = $("#tasa_pago").val();
    referencia = $("#referencia_cobro").val();
    p_cambio = $("#pago_cobro_cambio").val();
    p_pago = $("#pago_pago").val();
    abono = $('#abono').is(':checked');

    plan_arr = document.querySelectorAll("input[name='plan[]']:checked");
    plan = [];
    for (var i = 0; i < plan_arr.length; i++) {
      plan[i] = plan_arr[i].value;
    }    
    $.ajax({
      url: "pago_controller.php?op=pagoData",
      type: "POST",
      dataType: "json",
      data: {
        contrato: contrato,
        cliente: cliente,
        forma_pago: forma_pago,
        fp_detalle: fp_detalle,
        p_cobro: p_cobro,
        fecha_pago: fecha_pago,
        tasa: tasa,
        referencia: referencia,
        p_cambio: p_cambio,
        p_pago: p_pago,
        plan: plan,
        abono: abono,
      },
      success: function (data) {        
        if (data.status == true) {
          $("#modalpago").modal("hide");
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
            dataPagoCarga()
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
    id_cliente = $("#id_cliente").val();

    window.open("reporte_pdf.php?id=" + id_cliente, "_blank");
  });
});
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
            "<button onclick='buscarContrato(`" +
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
//********Opcion para cargar informacion**********/
//**********de un contrato selecionado************/
function buscarContrato(id) { 
  $("#modalcontrato").modal("hide");
  $("#modalcliente").modal("hide");
  $.ajax({
    url: "../contrato/contrato_controller.php?op=contrato",
    method: "POST",
    dataType: "json",
    data: { id: id },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_contrato").val(opt.id);
        $("#id_cliente").val(opt.cliente);
        $("#contrato_cliente").val(opt.contrato);
        $("#nombre_cliente").val(opt.nombre_apel);
        $("#cliente_id").val(opt.contrato);
        $("#cliente_nom").val(opt.nombre_apel);
        cargarDetallePago(opt.id);
      });
    },
  });
}
//************************************************/
//********Opcion para cargar informacion**********/
//**********Notas de Cobro de contrato************/
function cargarDetallePago(contrato) {
  $.ajax({
    url: "pago_controller.php?op=nota_cobro",
    method: "POST",
    dataType: "json",
    data: { contrato: contrato },
    success: function (data) {
      $("#cobro_contrato").empty();
      $.each(data, function (idx, opt) {
        $("#cobro_contrato").append(
          '<div class="col mb-3 text-center">' +
            '  <div class="card">' +
            '    <div class="card-header">' +
            '     <div class="form-check">' +
            opt.nodo +
            '       <input class="form-check-input" type="checkbox" value="' +
            opt.id +
            '" name="plan[]">' +
            "      </div>" +
            "    </div>" +
            '    <ul class="list-group list-group-flush">' +
            '      <li class="list-group-item">' +
            opt.fecha_creacion +
            "</li>" +
            '      <li class="list-group-item">' +
            opt.detalle +
            "</li>" +
            '      <li class="list-group-item" id="monto' +
            opt.id +
            '">' +
            opt.monto +
            " $</li>" +
            "    </ul>" +
            "  </div>" +
            "</div>"
        );
      });
    },
  });
}
//************************************************/
//********Opcion para cargar informacion**********/
//**********de las cobranzas generadas************/
function dataPagoCarga() {
  //************************************************/
  //********Accion para cargar la informacion*******/
  //******el Datatable de los usuario***************/
  $("#tablapagos").DataTable().destroy();
  usuariotabla = $("#tablapagos").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "pago_controller.php?op=pagos",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "nota" },
      { data: "n_cliente" },
      { data: "n_contrato" },
      { data: "detalle" },
      { data: "fecha_pago" },
      { data: "monto_cambio" },
      { data: "tasa" },
      { data: "monto_pago" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick='anularNota(`" +
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
//********Accion para limpiar los campor *********/
//*************del formulario actual**************/
function limpiarFormulario() {
  $("#cobro_contrato").empty();
  $("#id_cliente").val("");
  $("#id_contrato").val("");
  $("#nombre_cliente").val("");
  $("#contrato_cliente").val("");
  $("#forma_pago").val("");
  $("#forma_pago_detalle").val("");
  $("#pago_cobro").val("");
  $("#fecha_pago").val(1);
  $("#tasa_pago").val("");
  $("#referencia_cobro").val("");
  $("#pago_cobro_cambio").val("");
  $("#pago_pago").val("");
  $("#abono").prop('checked', false);
}
//************************************************/
//********Accion para generar PDF de los**********/
//***************pagos registrados****************/
function verPDFNota(nota) {
  window.open("pdf.php?id=" + nota, "_blank");
}

function anularNota(nota) {

  Swal.fire({
    title: "¿Está seguro de borrar esta informacion?",
    showCancelButton: true,
    confirmButtonText: "Si",
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        url: "pago_controller.php?op=anular",
        type: "POST",
        dataType: "json",
        data: { id: nota },
        success: function (data) {
          if (data.status == true) {
            Swal.fire({
              icon: "success",
              title: data.message,
              showConfirmButton: false,
              timer: 2000,
            });
            setTimeout(() => {
              $("#tablapagos").DataTable().ajax.reload();
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