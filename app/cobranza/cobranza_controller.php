<?php
date_default_timezone_set("America/Caracas");
setlocale(LC_TIME, 'es_VE.UTF-8', 'esp');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../pago/pago_model.php");
require_once("cobranza_model.php");

$cobranza = new Cobranza();
$pago = new Pago();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$id_contrato = (isset($_POST['id_contrato'])) ? $_POST['id_contrato'] : '';
$id_cliente = (isset($_POST['id_cliente'])) ? $_POST['id_cliente'] : '';
$cobro_tipo = (isset($_POST['cobro_tipo'])) ? $_POST['cobro_tipo'] : '1';
$fecha = (isset($_POST['fecha'])) ? $_POST['fecha'] : '';
$nodo = (isset($_POST['nodo'])) ? $_POST['nodo'] : '';
$contrato = (isset($_POST['contrato'])) ? $_POST['contrato'] : '';
$concepto = (isset($_POST['concepto'])) ? $_POST['concepto'] : '';
$monto = (isset($_POST['monto'])) ? $_POST['monto'] : '';
$estatus = (isset($_POST['estatus'])) ? $_POST['estatus'] : '';

$hoy = date('Y-m-d');
$total = 0;

$periodo_actual = ucwords(strftime('%B')) . '-' . date('Y', strtotime($hoy));

switch ($_GET["op"]) {
  case 'generacion_automatica':
    $dato = array();
    $contador = 0;
    $estatus = 1;
    $detalle = ucwords("Cobro de Servicio Del Mes De " . $periodo_actual);
    $mes = date('F', strtotime($hoy));
    $data = $cobranza->cargarDatosContratos();
    $n_contrato = count($data);
    if ($n_contrato > 0) {
      foreach ($data as $data) {
        $contrato = $data['id'];
        $cliente = $data['cliente'];
        $nodo = $data['nodo'];
        $plan = $data['plan'];
        $monto = $data['costo'];

        $verificar = $cobranza->buscarDatosCobranza($contrato);
        if (!$verificar) {
          $id = uniqid();
          $nuevo = $cobranza->cargarSiguienteOrden();

          $regcobranza = $cobranza->guardarDatosCobranza($hoy, $nuevo, $contrato, $cliente, $nodo, $plan, $monto, $detalle, $estatus, $id);
          if ($data['saldo'] > 0) {
            $nota_id = uniqid();
            $nota = $pago->cargarSiguienteNota();
            $forma_pago = 2;
            $fp_detalle = 4;
            $p_pago = 0.00;
            $tasa = 0.00;
            $referencia = 'Capital a Favor Abono';

            $datap = $pago->guardarDatosPago($nota_id, $hoy, $contrato, $cliente, $forma_pago, $fp_detalle, $data['costo'], $hoy, $tasa, $referencia, $data['saldo'], $p_pago, $nota);
            if ($datap) {
              $estatus = 3;
              
              $cob_pag = $pago->guardarDatosCobroPago($id, $nota_id,$saldo);
              $cobro = $pago->actualizarCobranza($id, $estatus, $data['saldo']);
              $saldo = 0;
              $contra = $pago->actualizarContrato($contrato, $saldo);
            }
          }
          if ($regcobranza) {
            $contador++;
            $dato['status']  = true;
            $dato['message'] = 'De ' . $n_contrato . ' Contratos extistentes <br> Se Generaron de Manera Exitosa ' . $contador . ' Notas de Cobro';
          } else {
            $dato['status']  = false;
            $dato['message'] = 'Error al Guardar La Infomacion';
          }
        } else {
          $dato['status']  = true;
          $dato['message'] = 'Ya Se Registraron Todas las Notas De Cobro Del Periodo ' . $periodo_actual;
        }
      }
    } else {
      $dato['status']  = true;
      $dato['message'] = 'No Existe Contratos De Cobro Del Periodo ' . $periodo_actual;
    }


    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cobranzas':
    $dato = array();
    $data = $cobranza->cargarDatosCobros();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['fecha_creacion'] = $data['fecha_creacion'];
      $sub_array['orden'] = $data['orden'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['nodo'] = $data['nodo'];
      $sub_array['detalle'] = $data['detalle'];
      $sub_array['telefono'] = $data['telefono'];
      $sub_array['monto'] = number_format($data['monto'], 2);
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cobranzaData':
    $dato = array();
    $id = uniqid();

    $saldo = $cobranza->cargarDatosContrato($id_contrato);

    if ($cobro_tipo == 2) {
      $plan = 5;
    } else {
      $dataplan = $cobranza->buscarPlanOrden($id_contrato);
      $plan = $dataplan;
    }
    $estatus = 1;
    $nuevo = $cobranza->cargarSiguienteOrden();

    $data = $cobranza->guardarDatosCobranza($fecha, $nuevo, $id_contrato, $id_cliente, $nodo, $plan, $monto, $concepto, $estatus, $id);
    if ($saldo > 0) {
      $nota_id = uniqid();
      $nota = $pago->cargarSiguienteNota();
      $forma_pago = 2;
      $fp_detalle = 4;
      $p_pago = 0.00;
      $tasa = 0.00;
      $referencia = 'Capital a Favor Abono';

      $datap = $pago->guardarDatosPago($nota_id, $hoy, $id_contrato, $id_cliente, $forma_pago, $fp_detalle, $saldo, $hoy, $tasa, $referencia, $saldo, $p_pago, $nota);
      if ($datap) {
        $estatus = 3;
        $cob_pag = $pago->guardarDatosCobroPago($id, $nota_id,$saldo);
        $cobro = $pago->actualizarCobranza($id, $estatus, $saldo);
        $saldo = 0;
        $contra = $pago->actualizarContrato($id_contrato, $saldo);
      }
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

  case 'anular':
    $dato = array();
    $verificar = $cobranza->verificarEstatusCobro($id);
    if ($verificar == 2 || $verificar == 3) {
      $dato['status']  = false;
      $dato['message'] = 'No Se Puede Eliminar Una Orden de Cobro ya que posee pagos Cargado';
    } else {
      $estatus = 4;
      $data = $cobranza->anularCobranza($id, $estatus);
      if ($data) {
        $dato['status']  = true;
        $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Elimino La Infomacion';
      }
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cxccliente':
    $dato = array();
    $data = $cobranza->cargarCxcCliente($id_cliente);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['contrato'] = $data['contrato'];
      $sub_array['orden'] = $data['orden'];
      $sub_array['fecha_creacion'] = $data['fecha_creacion'];
      $sub_array['monto'] = number_format($data['monto'], 2);
      $total = $total + $data['monto'];
      $sub_array['total'] = number_format($total, 2);
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}
