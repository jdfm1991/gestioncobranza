<div class="container">
  <header class="navbar fixed-top  navbar-expand-lg bg-primary bg-gradient rounded px-5">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample11" aria-controls="navbarsExample11" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
        <div class="col-md-2">
          <a href="./" class="">
            <img src="<?php echo  URL_ASSETS; ?>img/logo.png" alt="" width="40">
          </a>
        </div>
        <ul class="nav nav-pills navbar-nav col-md-8 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="<?php echo  URL_APP; ?>" id="home" class="nav-link px-2">Home</a></li>
          <?php if ($_SESSION) { ?>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle px-2" href="#" data-bs-toggle="dropdown" aria-expanded="false">Gestion Administrativa</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/cliente">Clientes</a></li>
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/contrato">Contratos</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle px-2" href="#" data-bs-toggle="dropdown" aria-expanded="false">Gestion de Cobranza</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/cobranza">Notas de Cobro</a></li>
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/pago">Notas de Entrega</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle px-2" href="#" data-bs-toggle="dropdown" aria-expanded="false">Ajuste de Sistemas</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/herramientas">Herramientas</a></li>
                <li><a class="dropdown-item" href="<?php echo  URL_APP; ?>/usuario">usuario</a></li>
              </ul>
            </li>
          <?php } ?>
        </ul>
        <div class="col-md-2 text-end">
          <?php
          if ($_SESSION) { ?>
            <button id="btnlogout" type="button" class="btn btn-ligtn me-2">
              <i class="bi bi-person-fill-slash"></i>Log Out
            </button>
          <?php
          } else { ?>
            <button id="btnlogin" type="button" class="btn btn-ligtn me-2">
              <i class="bi bi-person-fill"></i>Login
            </button>
          <?php
          } ?>
        </div>
      </div>
    </div>
  </header>
</div>