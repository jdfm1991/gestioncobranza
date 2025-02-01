<?php
require_once("../../config/conexion.php");

class Contrato extends Conectar
{

  public function verDatosContratoCliente($cliente)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, B.plan, fecha_apertura,contrato, C.estatus  FROM tabla_contrato_data AS A
              INNER JOIN tabla_contrato_plan AS B ON A.plan=B.id
              INNER JOIN tabla_contrato_estatus AS C ON A.estatus=C.id
              WHERE A.cliente=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $cliente);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarEstatusContrato()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_contrato_estatus WHERE id!=1";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarSiguienteContrato($fecha_apertura)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT CONCAT('C-',LPAD(COUNT(*) + 1, 3, '0'), '/', YEAR(?)) AS contrato
            FROM tabla_contrato_data
            WHERE year(fecha_apertura) = YEAR(?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $fecha_apertura);
    $sql->bindValue(2, $fecha_apertura);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['contrato']);
  }

  public function guardarDatosContrato($id, $hoy, $cliente, $nuevo, $plan, $nodo, $direccion, $estatus)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_contrato_data(id, fecha_apertura, cliente, contrato, plan, nodo, direccion, estatus) VALUES (?,?,?,?,?,?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->bindValue(2, $hoy);
    $sql->bindValue(3, $cliente);
    $sql->bindValue(4, $nuevo);
    $sql->bindValue(5, $plan);
    $sql->bindValue(6, $nodo);
    $sql->bindValue(7, $direccion);
    $sql->bindValue(8, $estatus);
    return $sql->execute();
  }

  public function cargarDatosContratos()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, A.plan AS p_id, A.nodo AS n_id, fecha_apertura, B.nombre_apel, contrato, C.plan, C.costo, direccion, D.nodo, E.estatus 
              FROM tabla_contrato_data AS A 
              INNER JOIN tabla_cliente_data AS B ON B.id=A.cliente
              INNER JOIN tabla_contrato_plan AS C ON C.id=A.plan
              INNER JOIN tabla_contrato_nodo AS D ON D.id=A.nodo
              INNER JOIN tabla_contrato_estatus AS E ON E.id=A.estatus
              WHERE A.estatus!=3";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarDatosContrato($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, A.fecha_apertura, A.cliente, B.documento, B.nombre_apel, contrato, A.nodo, A.plan AS plan, c.plan AS plan2, C.detalle, C.costo, A.direccion 
              FROM tabla_contrato_data AS A 
              INNER JOIN tabla_cliente_data AS B ON B.id=A.cliente
              INNER JOIN tabla_contrato_plan AS C ON C.id=A.plan 
              WHERE A.id=? OR A.cliente=? OR A.nodo=? AND A.estatus!=3";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->bindValue(2, $id);
    $sql->bindValue(3, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function actualizarDatosContrato($id, $plan, $nodo, $direccion, $fecha_apertura)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_contrato_data SET plan=?, nodo=?, direccion=?, fecha_apertura=? WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $plan);
    $sql->bindValue(2, $nodo);
    $sql->bindValue(3, $direccion);
    $sql->bindValue(4, $fecha_apertura);
    $sql->bindValue(5, $id);
    return $sql->execute();
  }

  public function buscarCobranzaActiva($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT COUNT(*) AS N FROM tabla_cobranza_data WHERE contrato=? AND estatus=1";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['N']);
  }

  public function anularContrato($id, $estatus)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_contrato_data SET estatus=? WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $estatus);
    $sql->bindValue(2, $id);
    return $sql->execute();
  }

}
