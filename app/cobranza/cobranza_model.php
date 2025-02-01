<?php
require_once("../../config/conexion.php");

class Cobranza extends Conectar
{

  public function cargarDatosContratos()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, A.cliente, A.nodo, A.plan, B.costo, B.detalle, A.saldo 
              FROM tabla_contrato_data AS A 
              INNER JOIN tabla_contrato_plan AS B ON B.id=A.plan
              WHERE estatus =2";
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
    $sql = "SELECT saldo FROM tabla_contrato_data WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['saldo']);
  }

  public function cargarSiguienteOrden()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT CONCAT('OC-',LPAD(COUNT(*) + 1, 3, '0'), '/', YEAR(NOW())) AS orden
            FROM tabla_cobranza_data
            WHERE YEAR(fecha_creacion) = YEAR(NOW())";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['orden']);
  }

  public function buscarPlanOrden($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT plan FROM tabla_contrato_data WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['plan']);
  }

  public function cargarNotaEntrega($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.nota AS id, B.nota 
            FROM tabla_cobranza_pago AS A
            INNER JOIN tabla_pago_data AS B ON B.id=A.nota 
            WHERE orden=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function guardarDatosCobranza($hoy, $nuevo, $contrato, $cliente, $nodo, $plan, $monto, $detalle, $estatus, $id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_cobranza_data(fecha_creacion, orden, contrato, cliente, nodo, plan, monto, detalle, estatus, id) VALUES (?,?,?,?,?,?,?,?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $hoy);
    $sql->bindValue(2, $nuevo);
    $sql->bindValue(3, $contrato);
    $sql->bindValue(4, $cliente);
    $sql->bindValue(5, $nodo);
    $sql->bindValue(6, $plan);
    $sql->bindValue(7, $monto);
    $sql->bindValue(8, $detalle);
    $sql->bindValue(9, $estatus);
    $sql->bindValue(10, $id);
    return $sql->execute();
  }

  public function cargarDatosCobros()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, A.fecha_creacion, A.orden, B.contrato, C.nombre_apel, D.nodo, A.detalle, C.telefono, (A.monto-A.abono) AS monto, E.estatus 
            FROM tabla_cobranza_data AS A 
            INNER JOIN tabla_contrato_data B ON A.contrato=B.id
            INNER JOIN tabla_cliente_data AS C ON A.cliente=C.id
            INNER JOIN tabla_contrato_nodo AS D ON A.nodo=D.id
            INNER JOIN tabla_cobranza_estatus AS E ON A.estatus=E.id
            WHERE A.estatus!=4 ORDER BY A.orden DESC";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarDatosCobro($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, fecha_creacion, A.orden, B.contrato, D.nodo, C.nombre_apel, C.documento, C.correo, C.telefono, B.direccion, A.detalle AS detalle, (A.monto) AS monto, E.estatus, A.estatus AS condicion
            FROM tabla_cobranza_data AS A 
            INNER JOIN tabla_contrato_data AS B ON B.id=A.contrato
            INNER JOIN tabla_cliente_data AS C ON C.id=A.cliente
            INNER JOIN tabla_contrato_nodo AS D ON D.id=A.nodo
            INNER JOIN tabla_cobranza_estatus E ON E.id=A.estatus
            WHERE A.id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }
  
  public function anularCobranza($id, $estatus)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_cobranza_data SET estatus=? WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $estatus);
    $sql->bindValue(2, $id);
    return $sql->execute();
  }

  public function buscarDatosCobranza($contrato)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_cobranza_data 
            WHERE contrato=? AND YEAR(fecha_creacion)=YEAR(NOW()) AND MONTH(fecha_creacion)=MONTH(NOW()) AND plan!=5 AND estatus!=4";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $contrato);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }
  
  public function verificarEstatusCobro($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT estatus FROM tabla_cobranza_data WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['estatus']);
  }

  public function cargarCxcCliente($dato)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT B.nombre_apel, C.contrato, orden, fecha_creacion, (monto-abono) AS monto, D.nodo
            FROM tabla_cobranza_data AS A 
            INNER JOIN tabla_cliente_data AS B ON B.id=A.cliente
            INNER JOIN tabla_contrato_data AS C ON C.id=A.contrato
            INNER JOIN tabla_contrato_nodo AS D ON D.id=A.nodo
            WHERE (A.cliente=? OR A.contrato=? OR A.nodo=?) AND A.estatus IN (1,3)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $dato);
    $sql->bindValue(2, $dato);
    $sql->bindValue(3, $dato);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarCxcCliente2($cliente)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.contrato, B.fecha_creacion,B.orden, B.detalle, B.monto,B.abono 
              FROM tabla_contrato_data AS A 
              INNER JOIN tabla_cobranza_data AS B ON A.cliente=B.cliente AND A.id=B.contrato
              WHERE A.cliente=? AND A.estatus!=4";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $cliente);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }
  public function cargarSaldoContrato($cliente)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT contrato, saldo FROM tabla_contrato_data WHERE cliente=? OR id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $cliente);
    $sql->bindValue(2, $cliente);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

}
