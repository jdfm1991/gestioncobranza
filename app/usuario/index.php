<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../../config/sesion_activa.php");
require_once('../head.php');
require_once('../menu.php');
?>
<div class="container mt-5">
  <div class="row justify-content-center g-2 mt-3">
    <hr>
    <h1>Modulo de Usuario</h1>
    <hr>
    <div id="contenedor_fomulario" class="col">
      <div class="card">
        <div class="card-header">
          <h3> Formulario de Registro </h3>
        </div>
        <div class="card-body">
          <form id="formulariodeusuario">
            <input type="hidden" id="idusuario">
            <div class="row mb-3">
              <div class="col">
                <label for="nom_usuario" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nom_usuario" required>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col">
                <label for="login_usuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="login_usuario" required>
              </div>
              <div class="col">
                <label for="contrasenna" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="contrasenna" required>
              </div>
            </div>
            <div id="messege" class="text-center alert" role="alert">
              <p id="error" class="mb-0"></p>
            </div>
            <button type="submit" class="btn btn-primary">Registrar</button>
            <button id="cancelar" type="button" class="btn btn-danger">Cancelar</button>
          </form>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>
    <div id="contenedor_tabla" class="col">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Listado de Ususario </h2>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="usuariotabla" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Usuario</th>
                <th scope="col">Fecha de Registro</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>

            </tbody>
          </table>
        </div>
        <div class="card-footer text-muted"></div>
      </div>

    </div>
  </div>
</div>
<br>
<script src="usuario.js"></script>
<?php
require_once('../../config/modals.php');
require_once('../foot.php')
?>