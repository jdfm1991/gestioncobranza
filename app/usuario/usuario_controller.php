<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("usuario_model.php");

$usuario = new Usuario();

//---- Variables Para Registro de Usuario---//
$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$user = (isset($_POST['usuario'])) ? $_POST['usuario'] : 'jfranco';
$nom_usuario = (isset($_POST['nom_usuario'])) ? $_POST['nom_usuario'] : 'jovanni franco';
$contrasena = (isset($_POST['contrasenna'])) ? $_POST['contrasenna'] : '20975144';
$hoy = date('Y-m-d');

switch ($_GET["op"]) {

  case 'usuarioData':
    $dato = array();
    if ($id) {
      if ($contrasena) {
        $contrasenna = password_hash($contrasena, PASSWORD_BCRYPT);
        $data = $usuario->updateUserData($id, $nom_usuario, $user, $contrasenna);
        if ($data) {
          $dato['status']  = true;
          $dato['message'] = 'Se Actualizo La Infomacion de Manera Satisfactoria';
        } else {
          $dato['status']  = false;
          $dato['message'] = 'Error al Actualizar La Infomacion';
        }
      } else {
        $data = $usuario->updateUserData1($id, $nom_usuario, $user);
        if ($data) {
          $dato['status']  = true;
          $dato['message'] = 'Se Actualizo La Infomacion de Manera Satisfactoria';
        } else {
          $dato['status']  = false;
          $dato['message'] = 'Error al Actualizar La Infomacion';
        }
      }
    } else {
      $userexist = $usuario->getUserDataByUser($user);
      if (!$userexist) {
        $contrasenna = password_hash($contrasena, PASSWORD_BCRYPT);
        $data = $usuario->NewUserData($nom_usuario, $user, $contrasenna, $hoy);
        if ($data) {
          $dato['status']  = true;
          $dato['message'] = 'Se Guardo La Infomacion de Manera Satisfactoria';
        } else {
          $dato['status']  = false;
          $dato['message'] = 'Error al  Guardar La Infomacion';
        }
      } else {
        $dato['status']  = false;
        $dato['message'] = 'Este Usuario ya se Encuentra en Uso';
      }
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'usuarios':
    $dato = array();
    $data = $usuario->showDataUsers();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nombre'] = $data['nombre'];
      $sub_array['usuario'] = $data['usuario'];
      $sub_array['fecha_registro'] = $data['fecha_registro'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'usuario':
    $dato = array();
    $data = $usuario->showDataUsersById($id);
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['nombre'] = $data['nombre'];
      $sub_array['usuario'] = $data['usuario'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'eliminar':
    $dato = array();

    $data = $usuario->deleteUserData($id);
    if ($data) {
      $dato['status']  = true;
      $dato['message'] = 'Se Elimino La Infomacion de Manera Satisfactoria';
    } else {
      $dato['status']  = false;
      $dato['message'] = 'Error al Elimino La Infomacion';
    }

    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;

  case 'login':
    $dato = array();
    $data = $usuario->getLoginUser($user);
    if (is_array($data) and count($data) > 0) {
      foreach ($data as $data) {
        if (password_verify($contrasena, $data['contrasenna'])) {
          //sesion
          $_SESSION['id'] = $data['id'];
          //para js
          $dato['status']  = true;
          $dato['nombre'] = $data['nombre'];
          $dato['message'] = 'Ingreso de Manera Exitosa, Sea Bienvenido!';
        } else {
          $dato['status']  = false;
          $dato['message'] = 'La Contraseña es incorrecto';
        }
      }
    } else {
      $dato['status']  = false;
      $dato['message'] = 'El Usuario es incorrecto';
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;




















  case 'showdataroles':
    $dato = array();
    if ($_SESSION['rol'] == 1) {
      $data = $usuario->showDataRoles();
    } else {
      $data = $usuario->showDataRoles1();
    }
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['rol'] = $data['user_rol'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;
  case 'showdatastatus':
    $dato = array();
    $data = $usuario->showDataStatus();
    foreach ($data as $data) {
      $sub_array = array();
      $sub_array['id'] = $data['id'];
      $sub_array['estatus'] = $data['user_status'];
      $dato[] = $sub_array;
    }
    echo json_encode($dato, JSON_UNESCAPED_UNICODE);
    break;





  default:
    header("Location: ../../");
    die();
    break;
}