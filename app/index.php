<?php
require_once("../config/abrir_sesion.php");
require_once("../config/conexion.php");
require_once("../config/sesion_activa.php");
require_once('head.php');
require_once('menu.php');
?>
<div class="container-fluid mt-5">
  <hr>
  <h1 class="display-5 fw-bold lh-1 text-body-emphasis text-center mb-3">Indicadores de Gestion</h1>
  <div class="row pb-0 pe-lg-0 pt-lg-0 justify-content-center rounded-3 border shadow-lg m-2">
    <div class="col-lg-8">
      <div class="row justify-content-center text-center rounded-3 border shadow-lg">
        <div class="col-4 rounded-5 bg-primary bg-gradient m-2">
          <div id="cliente_cont" class="row mt-2">
            <!-- Carga Mediante Ajax -->
          </div>
        </div>
        <div class="col-7 rounded-5 bg-info bg-gradient m-2">
          <div id="contrato_cont" class="row mt-2">
            <!-- Carga Mediante Ajax -->
          </div>
        </div>
        <div class="col-11 rounded-5 bg-dark bg-gradient m-2">
          <p class="fw-bold fs-4 text-white">Cobranzas</p>
          <div id="cobro_nodo" class="row justify-content-center mt-2">
            <!-- Carga Mediante Ajax -->
          </div>
          <div id="cobro_detalle" class="row justify-content-center mt-2">
           
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 overflow-hidden shadow-lg">
      <img class="rounded-lg-3" src="<?php echo  URL_ASSETS; ?>img/logo.png" alt="" width="480">
    </div>
  </div>
</div>
<?php
require_once('../config/modals.php');
require_once('foot.php')
?>