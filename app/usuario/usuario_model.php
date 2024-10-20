<?php
require_once("../../config/conexion.php");

class Usuario extends Conectar
{

  public function getUserDataByUser($user)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_usuario_data 
            WHERE usuario=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $user);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function NewUserData($nom_usuario, $user, $contrasenna, $hoy)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_usuario_data(nombre, usuario, contrasenna, fecha_registro) VALUES (?,?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $nom_usuario);
    $sql->bindValue(2, $user);
    $sql->bindValue(3, $contrasenna);
    $sql->bindValue(4, $hoy);
    return $sql->execute();
  }

  public function updateUserData($id, $nom_usuario, $user, $contrasenna)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_usuario_data SET nombre=?,usuario=?,contrasenna=? WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $nom_usuario);
    $sql->bindValue(2, $user);
    $sql->bindValue(3, $contrasenna);
    $sql->bindValue(4, $id);
    return $sql->execute();
  }

  public function updateUserData1($id, $nom_usuario, $user)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_usuario_data SET nombre=?,usuario=?  WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $nom_usuario);
    $sql->bindValue(2, $user);
    $sql->bindValue(3, $id);; 
    return $sql->execute();
  }

  public function showDataUsers()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_usuario_data";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function showDataUsersById($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_usuario_data  WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function deleteUserData($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "DELETE FROM tabla_usuario_data WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return $sql;
  }

  public function getLoginUser($user)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_usuario_data WHERE usuario=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $user);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function darPermisosModuloUsuario($user,$modulo)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_modulo_usuario_data(modulo, usuario) VALUES (?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $modulo);
    $sql->bindValue(2, $user);
    return $sql->execute();
  }

  public function quitarPermisosModuloUsuario($user,$modulo)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "DELETE FROM tabla_modulo_usuario_data WHERE modulo=? AND usuario=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $modulo);
    $sql->bindValue(2, $user);
    $sql->execute();
    return $sql;
  }

  public function darPermisosDepartamentoUsuario($user,$departamento)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_depart_usuario_data(departamento, usuario) VALUES (?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $departamento);
    $sql->bindValue(2, $user);
    return $sql->execute();
  }

  public function quitarPermisosDepartamentoUsuario($user,$departamento)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "DELETE FROM tabla_depart_usuario_data WHERE departamento=? AND usuario=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $departamento);
    $sql->bindValue(2, $user);
    $sql->execute();
    return $sql;
  }

  public function verAccionUsuarioDepartemento($user, $departamento)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_depart_boton_data WHERE usuario=? AND departamento=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $user);
    $sql->bindValue(2, $departamento);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function darAccionDepartamentoUsuario($user, $departamento, $boton)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_depart_boton_data(boton, departamento, usuario) VALUES (?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $boton);
    $sql->bindValue(2, $departamento);
    $sql->bindValue(3, $user);
    return $sql->execute();
  }

  public function quitarAccionDepartamentoUsuario($user, $departamento, $boton)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "DELETE FROM tabla_depart_boton_data WHERE departamento=? AND usuario=? AND boton=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $departamento);
    $sql->bindValue(2, $user);
    $sql->bindValue(3, $boton);
    $sql->execute();
    return $sql;
  }
  
}
