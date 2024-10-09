$(document).ready(function () {
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
          $("#contrasenna").prop("required", false);
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
    contrasenna = $("#contrasenna").val();
    $.ajax({
      url: "usuario_controller.php?op=usuarioData",
      type: "POST",
      dataType: "json",
      data: {
        id: id,
        usuario: usuario,
        nom_usuario: nom_usuario,
        contrasenna: contrasenna,
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
                console.log(id);
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
});

function tomarId(id) {
  $("#idusuario").val(id);
}
function limpiarFormulario() {
  $("#idusuario").val("");
  $("#login_usuario").val("");
  $("#nom_usuario").val("");
  $("#ape_usuario").val("");
  $("#contrasenna").val("");
  $("#correo").val("");
  $("#telefono").val("");
  $("#roles").val("");
  $("#estatus").val("");
}
