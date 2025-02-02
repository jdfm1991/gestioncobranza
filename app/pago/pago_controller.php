<?php
date_default_timezone_set("America/Caracas");
setlocale(LC_TIME, 'es_VE.UTF-8', 'esp');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("pago_model.php");

$pago = new Pago();

$id = (isset($_POST['id'])) ? $_POST['id'] : '679bc66a64c14';
$contrato = (isset($_POST['contrato'])) ? $_POST['contrato'] : '';
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
$saldo = 0;


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

    $bono = $p_pago / $tasa;

    if ($forma_pago==2 && $fp_detalle==4) {
      $bono = $p_pago;
      $p_pago = 0;
    } 
    
    $data = $pago->guardarDatosPago($id, $hoy, $contrato, $cliente, $forma_pago, $fp_detalle, $p_cobro, $fecha_pago, $tasa, $referencia, $bono, $p_pago, $nota);
    if ($data) {
      $saldo = $bono;
      foreach ($plan as $cobranza) {
        $cobranza;
        $monto = $pago->cargarMontoOrden($cobranza);
        $estatus = ($abono == 'false') ? 2 : 3;
        if ($saldo > $monto) {
          $estatus = 2;
          $saldo = $saldo - $monto;
          $cob_pag = $pago->guardarDatosCobroPago($cobranza, $id, $monto, $saldo);       
          $cobro = $pago->actualizarCobranza($cobranza, $estatus, $monto);
          $contra = $pago->actualizarContrato($contrato, $saldo);
        }else {
          $estatus = 3;
          $saldo = 0;
          $cob_pag = $pago->guardarDatosCobroPago($cobranza, $id, $bono, $saldo);       
          $cobro = $pago->actualizarCobranza($cobranza, $estatus, $bono);
          $contra = $pago->actualizarContrato($contrato, $saldo);
        } 
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
      $sub_array['tasa'] = number_format($data['tasa'], 2);
      $sub_array['referencia'] = $data['referencia'];
      $sub_array['monto_cambio'] = number_format($data['monto_cambio'], 2);
      $sub_array['monto_pago'] = number_format($data['monto_pago'], 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'anular':
    $dato = array();
    $est_nota = 2;
    $est_cobro = 1;
    $saldo = 0;
    $data = $pago->buscarCobros($id);
    foreach ($data as $data) {
      $cobro = $pago->actualizarCobranza($data['orden'], $est_cobro, -$data['pago']);
      if ($cobro) {
        $id_contra = $pago->buscarContrato($data['orden']);
        $contra = $pago->actualizarContrato($id_contra, $saldo);
        if ($contra) {
          $anularpago = $pago->anularPago($id, $est_nota);
          if ($anularpago) {
            $dato['status']  = true;
            $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
          } else {
            $dato['status']  = false;
            $dato['message'] = 'Error al Elimino La Infomacion';
          }
        } else {
          $dato['status']  = false;
          $dato['message'] = 'Error al Actualizar Saldo de Contrato';
        }
        
      }else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Actualizar Orden de Cobro';
      }
      
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}
