<?php
date_default_timezone_set("America/Caracas");
setlocale(LC_TIME, 'es_VE.UTF-8', 'esp');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("pago_model.php");

$pago = new Pago();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$contrato = (isset($_POST['contrato'])) ? $_POST['contrato'] : '66fb165dd504e';
$cliente = (isset($_POST['cliente'])) ? $_POST['cliente'] : '';
$forma_pago = (isset($_POST['forma_pago'])) ? $_POST['forma_pago'] : '';
$fp_detalle = (isset($_POST['fp_detalle'])) ? $_POST['fp_detalle'] : '';
$p_cobro = (isset($_POST['p_cobro'])) ? $_POST['p_cobro'] : '';
$fecha_pago = (isset($_POST['fecha_pago'])) ? $_POST['fecha_pago'] : '';
$tasa = (isset($_POST['tasa'])) ? $_POST['tasa'] : '';
$referencia = (isset($_POST['referencia'])) ? $_POST['referencia'] : '';
$p_cambio = (isset($_POST['p_cambio'])) ? $_POST['p_cambio'] : '';
$p_pago = (isset($_POST['p_pago'])) ? $_POST['p_pago'] : '';
$abono = (isset($_POST['abono'])) ? $_POST['abono'] : '';
$plan = (isset($_POST['plan'])) ? $_POST['plan'] : '';
$hoy = date('Y-m-d H:m:s');


switch ($_GET["op"]) {
  case 'nota_cobro':
    $dato = array();
    $data = $pago->cargarDatosCobros($contrato);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['fecha_creacion'] = $data['fecha_creacion'];
      $sub_array['nodo'] = $data['nodo'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['monto'] = number_format($data['monto'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'pagoData':
    $dato = array();
    $id = uniqid();
    $nota = $pago->cargarSiguienteNota();
    if ($forma_pago==2 && $fp_detalle==4) {
      $bono = $p_pago;
      $p_pago = 0;
    } else {
      $bono = $p_pago/$tasa;
    }
    
    $data = $pago->guardarDatosPago($id, $hoy, $contrato, $cliente, $forma_pago, $fp_detalle, $p_cobro, $fecha_pago, $tasa, $referencia, $bono, $p_pago, $nota);
    if ($data) {
      foreach ($plan as $cobranza) {
        $estatus = ($abono == 'false') ? 2 : 3;
        $cobranza;
        $cob_pag = $pago->guardarDatosCobroPago($cobranza, $id);       
        $cobro = $pago->actualizarCobranza($cobranza, $estatus, $bono);
      }
      $dato['status']  = true;
      $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Guardar La Infomacion';
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'pagos':
    $dato = array();
    $data = $pago->cargarDatosPagos();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nota'] = $data['nota'];
      $sub_array['cliente'] = $data['cliente'];
      $sub_array['n_cliente'] = $data['n_cliente'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['n_contrato'] = $data['n_contrato'];
      $sub_array['forma_pago'] = $data['forma_pago'];
      $sub_array['forma'] = $data['forma'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['monto_dolar'] = number_format($data['monto_dolar'], 2);
      $sub_array['fecha_pago'] = $data['fecha_pago'];
      $sub_array['tasa'] = $data['tasa'];
      $sub_array['referencia'] = $data['referencia'];
      $sub_array['monto_cambio'] = number_format($data['monto_cambio'], 2);
      $sub_array['monto_pago'] = number_format($data['monto_pago'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'anular':
    $dato = array();
    $estatus = 4;
    $data = $cobranza->anularCobranza($id, $estatus);
    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Elimino La Infomacion';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}
