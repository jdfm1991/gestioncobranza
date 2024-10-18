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
    <h1 class="text-center">Modulo de Contratos</h1>
    <hr>
    <div id="contenedor_botones" class="col-sm-3">
      <div class="card">
        <div class="card-header text-center">
          <b><span>Menu de Opciones</span></b>
        </div>
        <div class="card-body">
          <!-- Hover added -->
          <div class="list-group">
            <button type="button" id="btn_reg" class="list-group-item list-group-item-action">
              Registrar Nuevo Contratos
            </button>
            <button type="button" id="btn_ver" class="list-group-item list-group-item-action">
              Ver Contratos
            </button>
            <button type="button" id="btn_report" class="list-group-item list-group-item-action">
              Reporte Contratos
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
              <h2 id="titulo_cliente">Registro Nuevo Contrato</h2>
            </div>
          </div>
        </div>
        <div class="card-body">
          <form id="r_contrato_form">
            <div class="row mb-3">
              <div class="col-3">
                <label for="documento_cliente" class="form-label">N° D.N.I - Cedula - R.I.F</label>
                <input type="text" class="form-control" id="documento_cliente" required disabled>
              </div>
              <div class="col-1">
                <button id="btnbuscar" class="btn btn-outline-success top-50" type="button"><i class="bi bi-search"></i></button>
              </div>
              <div class="col">
                <label for="nombre_cliente" class="form-label">Nombre y Apellido</label>
                <input type="text" class="form-control" id="nombre_cliente" required disabled>
              </div>
              <div class="col mt-2">
                <div class="form-floating">
                  <select id="nodo_cliente" class="form-control" required>
                    <--Carga Mediante Ajax
                      </select>
                      <label for="nodo_cliente" class="form-label">Nodo Asignado</label>
                </div>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-3">
                <label for="fecha_cliente" class="form-label">Fecha de Registro</label>
                <input type="date" class="form-control" id="fecha_cliente" required>
              </div>
              <div class="col-3 mt-3">
                <div class="form-floating">
                  <select id="plan" class="form-control" required>
                    <!--Carga Mediante Ajax-->
                  </select>
                  <label for="plan" class="form-label">Plan a Asignar</label>
                </div>
              </div>
              <div class="col">
                <label for="plan_detalle" class="form-label">Detalle de Plan</label>
                <input type="text" class="form-control" id="plan_detalle" required disabled>
              </div>
              <div class="col-2">
                <label for="plan_costo" class="form-label">Costo de Plan</label>
                <input type="text" class="form-control" id="plan_costo" required disabled>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col">
                <label for="direccion_cliente" class="form-label">Direccion</label>
                <textarea class="form-control" id="direccion_cliente" rows="3"></textarea>
              </div>
            </div>
            <div id="plan_cliente" class="row">
              <!--Carga Mediante Ajax-->
            </div>
            <div id="messege" class="text-center alert" role="alert">
              <p id="error" class="mb-0"></p>
            </div>
            <div class="card-footer text-muted">
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-outline-danger back" type="button"><i class="bi bi-x-octagon"></i>Cancelar</button>
                <button class="btn btn-outline-primary" type="submit"><i class="bi bi-hdd"></i>Registrar Nuevo contrato</button>
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
              <h2> Contratos Registrados </h2>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-outline-danger btn-light back">
                <i class="bi bi-backspace"></i><span class="">Volver</span>
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="tablacontrato" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Fecha de Apertura</th>
                <th scope="col">Cliente</th>
                <th scope="col">Contrato</th>
                <th scope="col">Plan</th>
                <th scope="col">Costo</th>
                <th scope="col">Nodo</th>
                <th scope="col">Estatus</th>
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
            <div class="row mb-3">
              <div class="col-3 mt-3">
                <div class="form-floating">
                  <select id="detalle_cxc" class="form-control" required>
                    <option value="">------</option>
                    <option value="general">General</option>
                    <option value="especifico">Especifico</option>
                  </select>
                  <label for="detalle_cxc" class="form-label">Detalle del Reporte</label>
                </div>
              </div>
              <div id="box_nodo" class="col mt-3">
                <div class="form-floating">
                  <select id="nodo_cxc" class="form-control">
                    <!-- cargar mediante ajax-->
                  </select>
                  <label for="forma_cxc" class="form-label">Forma Reporte</label>
                </div>
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
<script src="contrato.js"></script>
<?php
require_once('../../config/modals.php');
require_once('../foot.php');
?>