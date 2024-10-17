$(document).ready(function () {
  
  //************************************************/
  //*******Se Oculta los elementos iniciales********/
  //*****************de modulo**********************/
  $("#contenedor_r_cliente").hide();
  $("#contenedor_v_cliente").hide();
  $("#contenedor_cxc").hide();
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
  $("#r_cliente").click(function (e) {
    e.preventDefault();
    limpiarFormulario();
    $("#titulo_cliente").text("Registro Nuevo Cliente");
    $("#contenedor_r_cliente").show();
    $("button").removeClass("active");
    $("#r_cliente").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_v_cliente").hide();
    $("#contenedor_cxc").hide();
  });
  /*************************************************/
  $("#v_cliente").click(function (e) {
    e.preventDefault();
    $("#contenedor_v_cliente").show();
    $("button").removeClass("active");
    $("#v_cliente").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_r_cliente").hide();
    $("#contenedor_cxc").hide();
    dataClienteCarga();
  });
   /**********************************************/
   $("#cliente_cxc").click(function (e) {
    e.preventDefault();
    $("#contenedor_cxc").show();
    $("button").removeClass("active");
    $("#cliente_cxc").addClass("active");
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
  //*********************************************/
  //********Evento para Mostrar modal************/
  //**********de Lista de Contrato***************/
  $("#btnbusca").click(function (e) {
    e.preventDefault();
    dataClienteCxc();
    $(".modal-title").text("Lista de Cliente");
    $("#modalcliente").modal("show");
  });
  //*************************************************/
  //********Accion para cargar la informacion********/
  //********al selector de estatus de cliente********/
  $.ajax({
    url: "cliente_controller.php?op=estatus",
    method: "POST",
    dataType: "json",
    success: function (data) {
      $("#estatus_cliente").append(
        '<option value="">_-_Seleccione_-_</option>'
      );
      $.each(data, function (idx, opt) {
        $("#estatus_cliente").append(
          '<option value="' + opt.id + '">' + opt.estatus + "</option>"
        );
      });
    },
  });
  //************************************************/
  //*********Opcion para editar un producto*******/
  //*****************de la base de datos************/
  $(document).on("click", ".btneditar", function () {
    id = $("#id_cliente").val();    
    $("#contenedor_r_cliente").show();
    $("#contenedor_v_cliente").hide();
    $("#titulo_cliente").text("Editar Registro Cliente");
    $.ajax({
      url: "cliente_controller.php?op=cliente",
      method: "POST",
      dataType: "json",
      data: { id: id },
      success: function (data) {
        $.each(data, function (idx, opt) {
          $("#id_cliente").val(opt.id);
          $("#nombre_cliente").val(opt.nombre_apel);
          $("#documento_cliente").val(opt.documento);
          $("#correo_cliente").val(opt.correo);
          $("#telefono_cliente").val(opt.telefono);
          $("#estatus_cliente").val(opt.estatus);
        });
      },
    });
  });
  //************************************************/
  //********Accion para Enviar y guardar la*********/
  //*********informacion del usuario************/
  $("#r_cliente_form").submit(function (e) {
    e.preventDefault();
    id = $("#id_cliente").val();
    nombre = $("#nombre_cliente").val();
    documento = $("#documento_cliente").val();
    correo = $("#correo_cliente").val();
    telefono = $("#telefono_cliente").val();
    estatus = $("#estatus_cliente").val();   
    $.ajax({
      url: "cliente_controller.php?op=clienteData",
      type: "POST",
      dataType: "json",
      data: {
        id: id,
        nombre: nombre,
        documento: documento,
        correo: correo,
        telefono: telefono,
        estatus: estatus,
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
            $("#v_cliente").addClass("active");
            $("#contenedor_r_cliente").hide();
            $("#contenedor_v_cliente").show();
            limpiarFormulario();
            dataClienteCarga()
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

    window.open("estado_cuenta_pdf.php?id=" + id_cliente, "_blank");
  });
  //************************************************/
  //*********Opcion para Eliminar un usuario*******/
  //*****************de la base de datos************/
  $(document).on("click", ".btneliminar", function () {
    id = $("#id_cliente").val();
    Swal.fire({
      title: "¿Está seguro de borrar esta informacion?",
      showCancelButton: true,
      confirmButtonText: "Si",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "cliente_controller.php?op=eliminar",
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
                $("#tablacliente").DataTable().ajax.reload();
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



function dataClienteCarga() {
  //************************************************/
  //********Accion para cargar la informacion*******/
  //******el Datatable de los usuario***************/
  $("#tablacliente").DataTable().destroy();
  tablacliente = $("#tablacliente").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "cliente_controller.php?op=clientes",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "nombre_apel" },
      { data: "documento" },
      { data: "telefono" },
      { data: "correo" },
      { data: "estatus" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button onclick='tomarId(`" +
            data +
            "`)' class='btn btn-outline-info btn-sm btneditar'><i class='bi bi-pencil-square'></i></button>" +
            "<button onclick='tomarId(`" +
            data +
            "`)' class='btn btn-outline-danger btn-sm btneliminar' title='Eliminar'><i class='bi bi-x-octagon'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
}

//**************************************************/
//********Accion para cargar la informacion*********/
//******el Datatable de los clientes****************/
function dataClienteCxc() {
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
        $("#id_cliente").val(opt.cliente);
        $("#cliente_id").val(opt.contrato);
        $("#cliente_nom").val(opt.nombre_apel);
      });
    },
  });
}

function tomarId(id) {
  $("#id_cliente").val(id);
}
function limpiarFormulario() {
  $("#id_cliente").val("");
  $("#nombre_cliente").val("");
  $("#documento_cliente").val("");
  $("#correo_cliente").val("");
  $("#telefono_cliente").val("");
  $("#estatus_cliente").val("");
  $("#situacion_cliente").text("");
}
