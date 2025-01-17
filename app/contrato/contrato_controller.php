<?php
date_default_timezone_set('america/caracas');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("contrato_model.php");

$contrato = new Contrato();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$cliente = (isset($_POST['cliente'])) ? $_POST['cliente'] : '';
$plan = (isset($_POST['plan'])) ? $_POST['plan'] : '';
$estatus = (isset($_POST['estatus'])) ? $_POST['estatus'] : '1';
$nodo = (isset($_POST['nodo'])) ? $_POST['nodo'] : '';
$direccion = (isset($_POST['direccion'])) ? $_POST['direccion'] : '';
$fecha_apertura = (isset($_POST['fecha_apertura'])) ? $_POST['fecha_apertura'] : '';
$hoy = date('Y-m-d');

switch ($_GET["op"]) {
  case 'contratos':
    $dato = array();
    $data = $contrato->cargarDatosContratos();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['fecha_apertura'] = $data['fecha_apertura'];
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['plan'] = $data['plan'];
      $sub_array['costo'] = number_format($data['costo'], 2);
      $sub_array['nodo'] = $data['nodo'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'contrato':
    $dato = array();
    $data = $contrato->cargarDatosContrato($id);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['fecha_apertura'] = $data['fecha_apertura'];
      $sub_array['cliente'] = $data['cliente'];
      $sub_array['documento'] = $data['documento'];
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['nodo'] = $data['nodo'];
      $sub_array['plan'] = $data['plan'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['costo'] = $data['costo'];
      $sub_array['direccion'] = $data['direccion'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'contratoData':
    $dato = array();
    if (empty($id)) {
      $id = uniqid();
      $nuevo = $contrato->cargarSiguienteContrato($fecha_apertura);
      $data = $contrato->guardarDatosContrato($id, $fecha_apertura, $cliente, $nuevo, $plan, $nodo, $direccion, $estatus);
      if ($data) {
        $dato['status']  = true;
        $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Guardar La Infomacion';
      }
    } else {
      $data = $contrato->actualizarDatosContrato($id, $plan, $nodo, $direccion, $fecha_apertura);
      if ($data) {
        $dato['status']  = true;
        $dato['message'] = 'Se Actualizo La Infomacion de Manera Satisfactoria';
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Actualizar La Infomacion';
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cliente':
    $dato = array();
    $data = $contrato->verDatosContratoCliente($cliente);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['fecha_apertura'] = $data['fecha_apertura'];
      $sub_array['plan'] = $data['plan'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'anular':
    $dato = array();
    $estatus = 3;
    $cobranza = $contrato->buscarCobranzaActiva($id);
    if ($cobranza == 0) {
      $data = $contrato->anularContrato($id, $estatus);
      if ($data) {
        $dato['status']  = true;
        $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Elimino La Infomacion';
      }
    } else {
      $dato['status']  = false;
      $dato['message'] = 'No Se Puede Eliminar Usuario Debido A Que Posee '.$cobranza.' Notas de Cobro Pendientes';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}
