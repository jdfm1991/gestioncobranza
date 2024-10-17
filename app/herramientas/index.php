<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../../config/sesion_activa.php");
require_once('../head.php');
require_once('../menu.php');
$today = date('Y-m-d');
?>
<div class="container-md mt-5">
  <input type="hidden" id="id_nodo">
  <input type="hidden" id="id_plan">
  <div class="row justify-content-center g-2 mt-5">
    <h1 class="text-center">Modulo de Herramientas</h1>
    <hr>
    <div id="contenedor_botones" class="col-sm-3">
      <div class="card">
        <div class="card-header">
          <b><span>Opciones</span></b>
        </div>
        <div class="card-body">
          <!-- Hover added -->
          <div class="list-group">
            <button type="button" id="departamento" class="list-group-item list-group-item-action">
              Registrar Tasa
            </button>
            <button type="button" id="modulo" class="list-group-item list-group-item-action">
              Registrar Plan
            </button>
            <button type="button" id="nodos" class="list-group-item list-group-item-action">
              Registrar Nodo
            </button>
          </div>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>

    <div id="contenedor_departamento" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Lista de Tasas de Cambio Registradas </h2>
            </div>
            <div class="col-sm-4">
              <button id="btntasa" type="button" class="btn btn-outline-success me-2">
                <i class="bi bi-arrows-fullscreen"></i>Nuevo Tasa
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="listatasa" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Dia</th>
                <th scope="col">Tasa de Cambio</th>
              </tr>
            </thead>
            <tbody>
              <!--Carga Mediante Ajax-->
            </tbody>
          </table>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>

    <div id="contenedor_modulo" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Lista de Planes Registrados </h2>
            </div>
            <div class="col-sm-4">
              <button id="btnmodulo" type="button" class="btn btn-outline-success me-2">
                <i class="bi bi-columns-gap"></i>Nuevo Plan
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="listaplanes" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Plan</th>
                <th scope="col">Detalle</th>
                <th scope="col">Costo</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <!--Carga Mediante Ajax-->
            </tbody>
          </table>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>

    <div id="contenedor_tres" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Lista de Nodos Registrados </h2>
            </div>
            <div class="col-sm-4">
              <button id="btnnodo" type="button" class="btn btn-outline-success me-2">
                <i class="bi bi-columns-gap"></i>Nuevo Nodo
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="listanodos" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Nodo</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <!--Carga Mediante Ajax-->
            </tbody>
          </table>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>

    <div id="contenedor_default" class="col-sm-9">
      <div class="row text-center">
        <div class="col-lg offset-lg-1 p-0 overflow-hidden shadow-lg">
          <img class="rounded rounded-lg-3 mx-auto d-block" src="<?php echo  URL_ASSETS; ?>img/logo.png" alt="" width="480">
        </div>
      </div>
    </div>
  </div>
</div>
<script src="herramientas.js"></script>
<?php
require_once('../../config/modals.php');
require_once('../foot.php');
?>