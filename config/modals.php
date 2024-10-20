<?php
$today = date('Y-m-d');
$newday = strtotime('+1 day', strtotime($today));
$tomorrow = date('Y-m-d', $newday);
?>
<!--
  *************************************************
  Modal Para Registro de Usuario e Inicio de Sesion
  *************************************************
-->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Login - Modulo Admin</h1>
        <button type="button" id="closeLogin" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <form id="formLogin">
            <div class="modal-body">
              <div class="mb-3">
                <label for="usuario" class="form-label">usuario</label>
                <input type="text" class="form-control" id="usuario" placeholder="usuario" required>
              </div>
              <div class="mb-3">
                <label for="pass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="contrasenna" placeholder="Contraseña" required>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
              <button type="submit" class="btn btn-outline-primary btn-light">Entrar</button>
            </div>
            <div id="messegel" class="alert alert-warning" role="alert">
              <p id="errorl" class="mb-0">Alert Description</p>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los Clientes
  *************************************************
-->
<div class="modal fade mt-4" id="modalcliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Clientes</h1>
        </div>
        <button type="button" id="closeLogin" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

      </div>
      <div class="modal-body">
        <table id="listacliente" style="width:100%;">
          <thead>
            <tr>
              <th>Nombre y Apellido</th>
              <th>N° Cedula / R.I.F</th>
              <th></th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los Contratos
  *************************************************
-->
<div class="modal fade mt-4" id="modalcontrato" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Contrato</h1>
        </div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table id="listacontrato" style="width:100%;">
          <thead>
            <tr>
              <th>Contrato</th>
              <th>Cliente</th>
              <th></th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los pago
  *************************************************
-->
<div class="modal fade mt-4" id="modalpago" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">cobro</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="r_pago_form">
          <div class="modal-body">
            <div class="row mb-3">
              <div class="col mt-3">
                <div class="form-floating">
                  <select id="forma_pago" class="form-control" required>
                    <!--Carga Mediante Ajax-->
                  </select>
                  <label for="forma_pago" class="form-label">Forma de Pago</label>
                </div>
              </div>
              <div class="col mt-3">
                <div id="f_detalle" class="form-floating">
                  <select id="forma_pago_detalle" class="form-control" required>
                    <!--Carga Mediante Ajax-->
                  </select>
                  <label for="forma_pago_detalle" class="form-label">Opcion de Pago</label>
                </div>
              </div>
              <div class="col">
                <label for="pago_cobro" class="form-label">Deuda $</label>
                <input type="text" class="form-control" name="monto" id="pago_cobro" disabled>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col-4">
                <label for="fecha_pago" class="form-label">Fecha Pago</label>
                <input type="date" class="form-control" id="fecha_pago" required>
              </div>
              <div id="t_pago" class="col-3">
                <label for="tasa_pago" class="form-label">Tasa</label>
                <input type="text" class="form-control" name="monto" id="tasa_pago" required>
              </div>
              <div class="col">
                <label for="referencia_cobro" class="form-label">Referancia</label>
                <input type="text" class="form-control" name="monto" id="referencia_cobro">
              </div>
            </div>
            <div class="row mb-3">
              <div id="p_c_cambio" class="col">
                <label for="pago_cobro_cambio" class="form-label">Monto Cambio</label>
                <input type="text" class="form-control" id="pago_cobro_cambio" disabled>
              </div>
              <div class="col">
                <label for="pago_pago" class="form-label">Monto Pagado</label>
                <input type="text" class="form-control" name="monto" id="pago_pago" required>
              </div>
              <div class="col">
                <div class="form-check">
                  <input id="abono" class="form-check-input" type="checkbox" id="flexCheckDefault">
                  <label class="form-check-label" for="flexCheckDefault">
                    Abono
                  </label>
                </div>
              </div>

            </div>
          </div>
          <div id="messege" class="text-center alert" role="alert">
            <p id="error" class="mb-0"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Registar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los tasa de cambio
  *************************************************
-->
<div class="modal fade mt-4" id="modaltasa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">cobro</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="r_tasa_form">
          <div class="modal-body">
            <div class="row mb-3">
              <div class="col">
                <label for="fecha_tasa" class="form-label">Fecha de Tasa</label>
                <input type="date" class="form-control" id="fecha_tasa" required>
              </div>
              <div class="col">
                <label for="tasa_camb" class="form-label">Tasa de Cambio</label>
                <input type="text" class="form-control" name="tasa" id="tasa_camb" required>
              </div>
            </div>
          </div>
          <div id="messeged" class="alert alert-warning" role="alert">
            <p id="errord" class="mb-0"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Entrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los planes de servicio
  *************************************************
-->
<div class="modal fade mt-4" id="modalplan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">cobro</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="r_plan_form">
          <div class="modal-body">
            <div class="row mb-3">
              <div class="col">
                <label for="nom_plan" class="form-label">Plan</label>
                <input type="text" class="form-control" id="nom_plan" required>
              </div>
              <div class="col">
                <label for="costo_plan" class="form-label">Costo</label>
                <input type="text" class="form-control" name="tasa" id="costo_plan" required>
              </div>
            </div>
            <div class="row mb-3">
              <div class="col">
                <label for="descripcion_plan" class="form-label">Descripcion del Plan</label>
                <input type="text" class="form-control" id="descripcion_plan" required>
              </div>
            </div>
          </div>
          <div id="messegem" class="alert alert-warning" role="alert">
            <p id="errorm" class="mb-0"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Entrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los planes de servicio
  *************************************************
-->
<div class="modal fade mt-4" id="modalnodo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">cobro</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="r_nodo_form">
          <div class="modal-body">
            <div class="row mb-3">
              <div class="col">
                <label for="nom_nodo" class="form-label">Nodo</label>
                <input type="text" class="form-control" id="nom_nodo" required>
              </div>
            </div>
          </div>
          <div id="messegen" class="alert alert-warning" role="alert">
            <p id="errorn" class="mb-0"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-danger btn-light" data-bs-dismiss="modal" aria-label="Close">Cancelar</button>
            <button type="submit" class="btn btn-outline-primary btn-light">Entrar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--
  *************************************************
  notificacion Para visualizar proceso terminado
  *************************************************
-->
<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="notificar" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <!--<img src="..." class="rounded me-2" alt="...">-->
      <strong class="me-auto">Bootstrap</strong>
      <!--<small>11 mins ago</small>-->
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
      <p id="notificacion" class="mb-0"></p>
    </div>
  </div>
</div>
<!--
  *************************************************
  Modal Para visualizar los botones de menu
  *************************************************
-->
<div class="modal fade mt-4" id="modalbotones" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h1 class="modal-title fs-5" id="exampleModalLabel">cobro</h1>
        <button type="button" id="closeb" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modal-body">
          <div class="row justify-content-center align-items-center g-2">
            <div class="col regular">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_reg" id="check_btn_1">
                <label class="form-check-label" for="check_btn_1">
                  Registrar Infomacion
                </label>
              </div>
            </div>
            <div class="col regular">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_ver" id="check_btn_2">
                <label class="form-check-label" for="check_btn_2">
                  Visualizar Infomacion
                </label>
              </div>
            </div>
            <div class="col regular">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_report" id="check_btn_3">
                <label class="form-check-label" for="check_btn_3">
                  Generar Reporte
                </label>
              </div>
            </div>
            <div id="auto_btn" class="col d-none">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_auto" id="check_btn_4">
                <label class="form-check-label" for="check_btn_4">
                  Acciones Automaticas
                </label>
              </div>
            </div>
            <div class="col d-none sistema">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_reg_tasa" id="check_btn_5">
                <label class="form-check-label" for="check_btn_5">
                  Registrar Tasa
                </label>
              </div>
            </div>
            <div class="col d-none sistema">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_reg_plan" id="check_btn_6">
                <label class="form-check-label" for="check_btn_6">
                  Registrar Plan
                </label>
              </div>
            </div>
            <div class="col d-none sistema">
              <div class="form-check">
                <input class="form-check-input boton" type="checkbox" value="#btn_reg_nodo" id="check_btn_7">
                <label class="form-check-label" for="check_btn_7">
                  Registrar Nodo
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>