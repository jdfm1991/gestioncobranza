<?php
date_default_timezone_set('america/caracas');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("herramientas_model.php");

$herramientas = new Herramientas();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$nodo = (isset($_POST['nodo'])) ? $_POST['nodo'] : '';
$estatus = (isset($_POST['estatus'])) ? $_POST['estatus'] : '';
$plan = (isset($_POST['plan'])) ? $_POST['plan'] : '';
$tasa = (isset($_POST['tasa'])) ? $_POST['tasa'] : '';
$forma = (isset($_POST['forma'])) ? $_POST['forma'] : '';
$fecha = (isset($_POST['fecha'])) ? $_POST['fecha'] : '';
$costo = (isset($_POST['costo'])) ? $_POST['costo'] : '';
$detalle = (isset($_POST['detalle'])) ? $_POST['detalle'] : '';
$descripcion = (isset($_POST['descripcion'])) ? $_POST['descripcion'] : '';

switch ($_GET["op"]) {

  case 'nodos':
    $dato = array();
    $data = $herramientas->cargarNodos();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nodo'] = $data['nodo'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'nodo':
    $dato = array();
    $data = $herramientas->cargarNodo($id);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nodo'] = $data['nodo'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'plan':
    $dato = array();
    $data = $herramientas->cargaPlanes();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['plan'] = $data['plan'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['costo'] = number_format($data['costo'], 2);;
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'estadocobro':
    $dato = array();
    $data = $herramientas->cargaEstatusCobros();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'plan1':
    $dato = array();
    $data = $herramientas->cargaPlan($id);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['plan'] = $data['plan'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['costo'] = number_format($data['costo'], 2);;
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'plan_d':
    $dato = array();
    $data = $herramientas->cargaPlanDetelle($plan);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['costo'] = number_format($data['costo'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'forma_pago':
    $dato = array();
    $data = $herramientas->cargarFormaPago();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['forma'] = $data['forma'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'forma_pago_detalle':
    $dato = array();
    $data = $herramientas->cargarFormaPagoDetalle($forma);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['detalle'] = $data['detalle'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'tasa':
    $dato = array();
    $data = $herramientas->cargarTasaDia($fecha);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['tasa'] = $data['tasa'];
      $dato[] = $sub_array;
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'tasas':
    $dato = array();
    $data = $herramientas->cargarTasasDias();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['fecha'] = $data['fecha'];
      $sub_array['tasa'] = $data['tasa'];
      $dato[] = $sub_array;
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'tasaData':
    $dato = array();
    $tasareg = $herramientas->buscarTasa($fecha);
    if ($tasareg) {
      $data = $herramientas->actualizarDatostasa($fecha, $tasa);
    } else {
      $data = $herramientas->guardarDatostasa($fecha, $tasa);
    }

    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Guardar La Infomacion';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'planData':
    $dato = array();
    if ($id) {
      $data = $herramientas->actualizarDatosPlan($id, $plan, $costo, $descripcion);
    } else {
      $data = $herramientas->guardarDatosPlan($plan, $costo, $descripcion);
    }

    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Guardar La Infomacion';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'nodoData':
    $dato = array();
    if ($id) {
      $data = $herramientas->actualizarDatosNodo($id, $nodo);
    } else {
      $data = $herramientas->guardarDatosNodo($nodo);
    }

    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Guardar La Infomacion';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'clientecount':
    $dato = array();
    $data = $herramientas->cargaEstatusCliente();
    foreach ($data as $data) {
      $sub_array = array();
      $id = $data['id'];
      $sub_array['estatus'] = $data['estatus'];
      $datacount = $herramientas->contadorClienteEstatus($id);
      $sub_array['n_clientes'] = $datacount;
      $dato[] = $sub_array;
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'clientecount':
    $dato = array();
    $data = $herramientas->cargaEstatusCliente();
    foreach ($data as $data) {
      $sub_array = array();
      $id = $data['id'];
      $sub_array['estatus'] = $data['estatus'];
      $datacount = $herramientas->contadorClienteEstatus($id);
      $sub_array['n_clientes'] = $datacount;
      $dato[] = $sub_array;
    }

  case 'contratocount':
    $dato = array();
    $data = $herramientas->cargaEstatusContrato();
    foreach ($data as $data) {
      $sub_array = array();
      $id = $data['id'];
      $sub_array['estatus'] = $data['estatus'];
      $datacount = $herramientas->contadorContratoEstatus($id);
      $sub_array['n_contratos'] = $datacount;
      $dato[] = $sub_array;
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cobrocontratocount':
    $dato = array();
    $data = $herramientas->cargarNodos();
    foreach ($data as $data) {
      $sub_array = array();
      $id = $data['id'];
      switch ($data['id']) {
        case 1:
          $sub_array['bg'] = 'bg-primary';
          break;

        case 2:
          $sub_array['bg'] = 'bg-info';
          break;

        case 3:
          $sub_array['bg'] = 'bg-success';
          break;

        case 4:
          $sub_array['bg'] = 'bg-light';
          break;

        default:
          $sub_array['bg'] = 'bg-white';
          break;
      }
      $sub_array['nodo'] = $data['nodo'];
      $data1 = $herramientas->contadorContratoNodos($id);
      foreach ($data1 as $data1) {
        $sub_array['costo'] = number_format($data1['costo'], 2);;
        $sub_array['cant'] = $data1['cant'];
      }
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cobrosdetalle':
    $dato = array();

    if ($estatus == 1) {
      $item2 = $herramientas->contadorCobrosEstatus($nodo, $estatus);
      foreach ($item2 as $item2) {
        $sub_array = array();
        $sub_array['estatus'] = $item2['estatus'];
        $sub_array['monto'] = number_format(($item2['monto'] - $item2['abono']), 2);
        $sub_array['numero'] = $item2['numero'];
        $dato[] = $sub_array;
      }
    }
    if ($estatus == 2) {
      $item2 = $herramientas->contadorCobrosEstatus($nodo, $estatus);
      foreach ($item2 as $item2) {
        $sub_array = array();
        $sub_array['estatus'] = $item2['estatus'];
        $sub_array['monto'] = number_format($item2['abono'], 2);
        $sub_array['numero'] = $item2['numero'];
        $dato[] = $sub_array;
      }
    }
    if ($estatus == 3) {
      $item2 = $herramientas->contadorCobrosEstatus($nodo, $estatus);
      foreach ($item2 as $item2) {
        $sub_array = array();
        $sub_array['estatus'] = $item2['estatus'];
        $sub_array['monto'] = number_format($item2['abono'], 2);
        $sub_array['numero'] = $item2['numero'];
        $dato[] = $sub_array;
      }
    }
    if ($estatus == 4) {
      $item2 = $herramientas->contadorCobrosEstatus($nodo, $estatus);
      foreach ($item2 as $item2) {
        $sub_array = array();
        $sub_array['estatus'] = $item2['estatus'];
        $sub_array['monto'] = number_format($item2['monto'], 2);
        $sub_array['numero'] = $item2['numero'];
        $dato[] = $sub_array;
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cambiarestatus':
    $dato = array();
    $data = $herramientas->cambiarEstatusContrato();
    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Actualizo el estatus de los contratos';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Guardar La Infomacion';
    }


    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}