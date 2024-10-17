<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../../config/sesion_activa.php");
require_once('../head.php');
require_once('../menu.php');
?>
<input type="hidden" id="id_cliente">
<div class="container-md">
  <div id="permitido" class="row justify-content-center g-2 mt-5">
    <h1 class="text-center">Modulo de Cliente</h1>
    <hr>
    <div id="contenedor_botones" class="col-sm-3">
      <div class="card">
        <div class="card-header">
          <b><span class="text-center">Opciones de Modulo de Cliente</span></b>
        </div>
        <div class="card-body">
          <!-- Hover added -->
          <div class="list-group">
            <button type="button" id="r_cliente" class="list-group-item list-group-item-action">
              Registrar Cliente
            </button>
            <button type="button" id="v_cliente" class="list-group-item list-group-item-action">
              Ver Cliente
            </button>
            <button type="button" id="cliente_cxc" class="list-group-item list-group-item-action">
              Estado de Cuenta
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
              <h2 id="titulo_cliente">Registro Nuevo Cliente</h2>
            </div>
          </div>
        </div>
        <div class="card-body">
          <form id="r_cliente_form">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
              <label id="situacion_cliente" for="nombre_cliente" class="form-label"></label>
            </div>
            <div class="row mb-3">
              <div class="col">
                <label for="nombre_cliente" class="form-label">Nombre y Apellido</label>
                <input type="text" class="form-control" id="nombre_cliente" required>
              </div>
              <div class="col">
                <label for="documento_cliente" class="form-label">N° D.N.I - Cedula - R.I.F</label>
                <input type="text" class="form-control" id="documento_cliente" required>
              </div>
              <div class="col">
                <label for="correo_cliente" class="form-label">Correo</label>
                <input type="email" class="form-control" id="correo_cliente" required>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col">
                <label for="telefono_cliente" class="form-label">Telefono</label>
                <input type="tel" class="form-control" id="telefono_cliente" name="telefono_cliente" required>
              </div>
              <div class="col mt-2">
                <div class="form-floating">
                  <select id="estatus_cliente" class="form-control" required>
                    <!--Carga Mediante Ajax-->
                  </select>
                  <label for="estatus_cliente" class="form-label">Estatus</label>
                </div>
              </div>
            </div>
            <div id="messege" class="text-center alert" role="alert">
              <p id="error" class="mb-0"></p>
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
              <h2> Clientes Registrados </h2>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-outline-danger btn-light back">
                <i class="bi bi-backspace"></i><span class="">Volver</span>
              </button>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table id="tablacliente" class="table table-striped" style="width:100%">
            <thead>
              <tr>
                <th scope="col">Nombre Cliente</th>
                <th scope="col">Identificacion</th>
                <th scope="col">Telefono cliente</th>
                <th scope="col">Correo Cliente</th>
                <th scope="col">Estatus</th>
                <th scope="col">Accion</th>
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
<script src="cliente.js"></script>
<?php
require_once('../../config/modals.php');
require_once('../foot.php');
?>