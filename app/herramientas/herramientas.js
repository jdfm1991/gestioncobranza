$(document).ready(function () {
  //************************************************/
  //*******Se Oculta los elementos iniciales********/
  //*****************de modulo**********************/
  $("#contenedor_departamento").hide();
  $("#contenedor_modulo").hide();
  $("#contenedor_tres").hide();
  //************************************************/
  //***********Funcion para Validar solo************/
  //*********Entrada de Numeros telefonicos*********/
  $(function () {
    $("input[name='tasa']").on("input", function (e) {
      $(this).val(
        $(this)
          .val()
          .replace(/[^0-9.]/g, "")
      );
    });
  });
  //************************************************/
  //************Accion para el boton ver************/
  //**************las tasa registrados**************/
  $("#btn_reg_tasa").click(function (e) {
    e.preventDefault();
    $("button").removeClass("active");
    $("#btn_reg_tasa").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_tres").hide();
    $("#contenedor_modulo").hide();
    $("#contenedor_departamento").show();
    cargarDatosTasa();
  });
  //************************************************/
  //***********Accion para Mostrar modal************/
  //************registrar departamento**************/
  $("#btntasa").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Registro de Nueva Tasa");
    $("#messeged").hide();
    $("#modaltasa").modal("show");
  });
  //************************************************/
  //**********Accion para guardar info**************/
  //***********del nuevo departamento***************/
  $("#r_tasa_form").submit(function (e) {
    e.preventDefault();
    fecha = $("#fecha_tasa").val();
    tasa = $("#tasa_camb").val();
    $.ajax({
      url: "herramientas_controller.php?op=tasaData",
      type: "POST",
      dataType: "json",
      data: {
        fecha: fecha,
        tasa: tasa,
      },
      success: function (data) {
        if (data.status == true) {
          Swal.fire({
            icon: "success",
            html: "<h2>¡" + data.message + "!</h2>",
            showConfirmButton: false,
            timer: 2000,
          });
          $("#modaltasa").modal("hide");
          setTimeout(() => {
            listatasa.ajax.reload(null, false);
          }, 1500);
          limpiarFormulario()() 
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
  //*********Accion para el boton ver  los**********/
  //***************modulos registrados**************/
  $("#btn_reg_plan").click(function (e) {
    e.preventDefault();
    $("button").removeClass("active");
    $("#btn_reg_plan").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_tres").hide();
    $("#contenedor_departamento").hide();
    $("#contenedor_modulo").show();
    cargarListaPlanes();
  });
  //************************************************/
  //***********Accion para Mostrar modal************/
  //************modulos departamento**************/
  $("#btnmodulo").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Registro de Plan");
    $("#messegem").hide();
    $("#modalplan").modal("show");
  });
  //************************************************/
  //**********Accion para guardar info**************/
  //***************del nuevo Modulo*****************/
  $("#r_plan_form").submit(function (e) {
    e.preventDefault();
    id = $.trim($("#id_plan").val());
    plan = $.trim($("#nom_plan").val());
    costo = $.trim($("#costo_plan").val());
    descripcion = $.trim($("#descripcion_plan").val());
    $.ajax({
      url: "herramientas_controller.php?op=planData",
      type: "POST",
      dataType: "json",
      data: { id: id, plan: plan, costo: costo, descripcion: descripcion  },
      success: function (data) {
        if (data.status == true) {
          Swal.fire({
            icon: "success",
            html: "<h2>¡" + data.message + "!</h2>",
            showConfirmButton: false,
            timer: 2000,
          });
          $("#modalplan").modal("hide");
          setTimeout(() => {
            listaplanes.ajax.reload(null, false);
          }, 1500);
          limpiarFormulario()() 
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
  //************Accion para el boton ver************/
  //*************las nodos registrados**************/
  $("#btn_reg_nodo").click(function (e) {
    e.preventDefault();
    $("button").removeClass("active");
    $("#btn_reg_nodo").addClass("active");
    $("#contenedor_default").hide();
    $("#contenedor_departamento").hide();
    $("#contenedor_modulo").hide();
    $("#contenedor_tres").show();
    cargarDatosNodos();
  });
  //************************************************/
  //***********Accion para Mostrar modal************/
  //************registrar departamento**************/
  $("#btnnodo").click(function (e) {
    e.preventDefault();
    $(".modal-title").text("Registro de Nueva Nodo");
    $("#messegen").hide();
    $("#modalnodo").modal("show");
  });
  //************************************************/
  //**********Accion para guardar info**************/
  //***********del nuevo departamento***************/
  $("#r_nodo_form").submit(function (e) {
    e.preventDefault();
    id = $("#id_nodo").val();
    nodo = $("#nom_nodo").val();
    $.ajax({
      url: "herramientas_controller.php?op=nodoData",
      type: "POST",
      dataType: "json",
      data: { id: id, nodo: nodo },
      success: function (data) {
        if (data.status == true) {
          Swal.fire({
            icon: "success",
            html: "<h2>¡" + data.message + "!</h2>",
            showConfirmButton: false,
            timer: 2000,
          });
          $("#modalnodo").modal("hide");
          setTimeout(() => {
            listanodos.ajax.reload(null, false);
          }, 1500);
          limpiarFormulario()() 
        } else {
          $("#messegen").addClass("alert-danger");
          $("#messegen").show();
          $("#errorn").text(data.message);
          setTimeout(() => {
            $("#errorn").text("");
            $("#messegen").hide();
          }, 3000);
        }
      },
    });
  });
});
//************************************************/
//**********Funcion para cargar la lista**********/
//*************de departamento creados************/
function cargarDatosTasa() {
  $("#listatasa").DataTable().destroy();
  listatasa = $("#listatasa").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "herramientas_controller.php?op=tasas",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "fecha" },
      { data: "tasa" },
    ],
  });
}
//************************************************/
//**********Funcion para cargar la lista**********/
//****************de modulos creados**************/
function cargarListaPlanes() {
  $("#listaplanes").DataTable().destroy();
  listaplanes = $("#listaplanes").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "herramientas_controller.php?op=plan",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "plan" },
      { data: "detalle" },
      { data: "costo" },
      { data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button name='editar' onclick='editarData(`" +
            data +
            "`)' class='btn btn-outline-info d-none' title='Actializar'><i class='bi bi-pencil-square'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
  $("#listaplanes").DataTable().on("draw", function () {
    verBotonesAccion()
  })
  
}
//************************************************/
//********Opcion para cargar informacion**********/
//**********de un plan selecionado************/
function editarData(id) {
  $("#modalcontrato").modal("hide");
  $.ajax({
    url: "herramientas_controller.php?op=plan1",
    method: "POST",
    dataType: "json",
    data: { id: id },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_plan").val(opt.id);
        $("#nom_plan").val(opt.plan);
        $("#costo_plan").val(opt.costo);
        $("#descripcion_plan").val(opt.detalle);
      });
      $(".modal-title").text("Editar de Plan");
      $("#messegem").hide();
      $("#modalplan").modal("show");
    },
  });
}
//************************************************/
//**********Funcion para cargar la lista**********/
//*************de departamento creados************/
function cargarDatosNodos() {
  $("#listanodos").DataTable().destroy();
  listanodos = $("#listanodos").DataTable({
    responsive: true,
    pageLength: 10,
    ajax: {
      url: "herramientas_controller.php?op=nodos",
      method: "POST",
      dataSrc: "",
    },
    columns: [
      { data: "nodo" },
      { data: "id",
        render: function (data, type, row) {
          return (
            "<div class='text-center'><div class='btn-group'>" +
            "<button name='editar' onclick='editarNodo(`" +
            data +
            "`)' class='btn btn-outline-info' title='Actializar'><i class='bi bi-pencil-square'></i></button>" +
            "</div></div>"
          );
        },
      },
    ],
  });
  $("#listanodos").DataTable().on("draw", function () {
    verBotonesAccion()
  })
}
//************************************************/
//********Opcion para cargar informacion**********/
//**********de un plan selecionado************/
function editarNodo(id) {
  $("#modalcontrato").modal("hide");
  $.ajax({
    url: "herramientas_controller.php?op=nodo",
    method: "POST",
    dataType: "json",
    data: { id: id },
    success: function (data) {
      $.each(data, function (idx, opt) {
        $("#id_nodo").val(opt.id);
        $("#nom_nodo").val(opt.nodo);
      });
      $(".modal-title").text("Editar de Nodo");
      $("#messegen").hide();
      $("#modalnodo").modal("show");
    },
  });
}

function limpiarFormulario() {
  $("#id_nodo").val("");
  $("#id_plan").val("");
  $("#fecha_tasa").val("");
  $("#tasa_camb").val("");
  $("#nom_plan").val("");
  $("#costo_plan").val("");
  $("#descripcion_plan").val("");
  $("#nom_nodo").val("");  
}
