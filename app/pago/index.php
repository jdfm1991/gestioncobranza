<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../../config/sesion_activa.php");
require_once('../head.php');
require_once('../menu.php');
?>
<input type="hidden" id="id_cliente">
<input type="hidden" id="id_contrato">
<div class="container-lg mt-5">
  <div id="permitido" class="row justify-content-center g-2 mt-5">
    <h1 class="text-center">Modulo de Nota de Entrega</h1>
    <hr>
    <div id="contenedor_botones" class="col-sm-3">
      <div class="card">
        <div class="card-header">
          <b><span class="text-center">Opciones</span></b>
        </div>
        <div class="card-body">
          <!-- Hover added -->
          <div class="list-group">
            <button type="button" id="r_cliente" class="list-group-item list-group-item-action">
              Nueva Nota de Entrega
            </button>
            <button type="button" id="v_cliente" class="list-group-item list-group-item-action">
              Lista de Nota de Entrega
            </button>
            <button type="button" id="cliente_cxc" class="list-group-item list-group-item-action">
              Reporte Relacion de Pagos
            </button>
          </div>
        </div>
        <div class="card-footer text-muted"></div>
      </div>
    </div>
    <div id="contenedor_r_cliente" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm text-center">
              <h2 id="titulo_cliente">Registro Cobro</h2>
            </div>
          </div>
        </div>
        <div class="card-body">
          <form id="r_cobranza_form">
            <div class="row mb-3">
              <div class="col-3">
                <label for="contrato_cliente" class="form-label">N° Contrato</label>
                <input type="text" class="form-control" id="contrato_cliente" required disabled>
              </div>
              <div class="col-1">
                <button id="btnbuscar" class="btn btn-outline-success top-50" type="button"><i class="bi bi-search"></i></button>
              </div>
              <div class="col">
                <label for="nombre_cliente" class="form-label">Nombre Cliente</label>
                <input type="text" class="form-control" id="nombre_cliente" required disabled>
              </div>
            </div>
            <div id="cobro_contrato" class="row">
              <!--Carga Mediante Ajax-->
            </div>
            <div class="card-footer text-muted">
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-outline-danger back" type="button"><i class="bi bi-x-octagon"></i>Cancelar</button>
                <button class="btn btn-outline-primary" type="submit"><i class="bi bi-hdd"></i>Registrar</button>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>
    <div id="contenedor_v_cliente" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Nota de Entrega Registrados </h2>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-outline-danger btn-light back">
                <i class="bi bi-backspace"></i><span class="">Volver</span>
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="tablapagos" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Nota de Entrega</th>
                <th scope="col">Cliente</th>
                <th scope="col">Contrato</th>
                <th scope="col">Forma de Pago</th>
                <th scope="col">Fecha de Pago</th>
                <th scope="col">Monto $</th>
                <th scope="col">Tasa</th>
                <th scope="col">Monto Bs</th>
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
    <div id="contenedor_cxc" class="col-sm-9">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-sm-8 text-center">
              <h2> Cuentas Por Cobrar </h2>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-outline-danger btn-light back">
                <i class="bi bi-backspace"></i><span class="">Volver</span>
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <form id="r_cxc_form">
            <div class="row">
              <div class="col-4">
                <label for="cliente_id" class="form-label">Identificacion</label>
                <input type="text" class="form-control" id="cliente_id" required disabled>
              </div>
              <div class="col">
                <button id="btnbusca" class="btn btn-outline-success top-50" type="button"><i class="bi bi-search"></i></button>
              </div>
              <div class="col-6">
                <label for="cliente_nom" class="form-label">Nombre Cliente</label>
                <input type="text" class="form-control" id="cliente_nom" required disabled>
              </div>
            </div>
            <div id="messegec" class="text-center alert" role="alert">
              <p id="errorc" class="mb-0"></p>
            </div>
            <div class="card-footer text-muted">
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-outline-success" type="submit"><i class="bi bi-hdd"></i>Generar</button>
              </div>
            </div>
          </form>
        </div>
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
  <div id="nopermitido" class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="container">
      <div class="alert alert-danger" role="alert">
        <p class="text-center">Acceso no permitido.</p>
        <div class="col-lg overflow-hidden shadow-lg">
          <img class="rounded rounded-lg-3 mx-auto d-block" src="<?php echo  URL_ASSETS; ?>img/error-403-forbidden.png" alt="">
        </div>
      </div>
    </div>
  </div>
</div>
<script src="pago.js"></script>
<?php
require_once('../../config/modals.php');
require_once('../foot.php');
?>