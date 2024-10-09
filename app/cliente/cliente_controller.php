<?php
date_default_timezone_set('america/caracas');
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cliente_model.php");

$cliente = new Cliente();

$id = (isset($_POST['id'])) ? $_POST['id'] : '66fb12b9b4202';
$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$documento = (isset($_POST['documento'])) ? $_POST['documento'] : '';
$correo = (isset($_POST['correo'])) ? $_POST['correo'] : '';
$telefono = (isset($_POST['telefono'])) ? $_POST['telefono'] : '';
$estatus = (isset($_POST['estatus'])) ? $_POST['estatus'] : '';

switch ($_GET["op"]) {
  case 'clientes':
    $dato = array();
    $data = $cliente->verDatosClientes();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['documento'] = $data['documento'];
      $sub_array['telefono'] = $data['telefono'];
      $sub_array['correo'] = $data['correo'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'cliente':
    $dato = array();
    $value = ($id) ? $id : $documento;
    $data = $cliente->verDatosCliente($value);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nombre_apel'] = $data['nombre_apel'];
      $sub_array['documento'] = $data['documento'];
      $sub_array['telefono'] = $data['telefono'];
      $sub_array['correo'] = $data['correo'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'clienteData':
    $dato = array();
    if (empty($id)) {
      $verificar = $cliente->verificarDatosCliente($documento);
      if ($verificar) {
        $dato['status']  = false;
        $dato['message'] = 'Ya Existe Un Cliente Registrado con Este N° D.N.I - Cedula - R.I.F';
      } else {
        $id = uniqid();
        $data = $cliente->guardarDatosCliente($id, $nombre, $documento, $correo, $telefono, $estatus);
        if ($data) {
          $dato['status']  = true;
          $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
        } else {
          $dato['status']  = false;
          $dato['message'] = 'Error al Guardar La Infomacion';
        }
      }
    } else {
      $data = $cliente->actualizarDatosCliente($id, $nombre, $documento, $correo, $telefono, $estatus);
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

  case 'estatus':
    $dato = array();
    $data = $cliente->cargarEstatusCiente();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['estatus'] = $data['estatus'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'eliminar':
    $dato = array();
    $estatus = 3;
    $contrato = $cliente->buscarContratoActivo($id);
    if ($contrato == 0) {
      $data = $cliente->eliminarCliente($id, $estatus);
      if ($data) {
        $dato['status']  = true;
        $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Error al Elimino La Infomacion';
      }
    } else {
      $dato['status']  = false;
      $dato['message'] = 'No Se Puede Eliminar Usuario Debido A Que Posee '.$contrato.' Contratos Activos o Con Deudas';
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  default:
    header("Location: ../../");
    die();
    break;
}
