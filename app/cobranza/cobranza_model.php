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
    $sql = "SELECT A.id, A.cliente, A.nodo, B.costo, B.detalle 
              FROM tabla_contrato_data AS A 
              INNER JOIN tabla_contrato_plan AS B ON B.id=A.plan
              WHERE estatus =2";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
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

  public function guardarDatosCobranza($contrato, $cliente, $plan, $hoy, $monto, $detalle, $estatus, $nuevo)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_cobranza_data(contrato, cliente, nodo, fecha_creacion, monto, detalle, estatus, orden) VALUES (?,?,?,?,?,?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $contrato);
    $sql->bindValue(2, $cliente);
    $sql->bindValue(3, $plan);
    $sql->bindValue(4, $hoy);
    $sql->bindValue(5, $monto);
    $sql->bindValue(6, $detalle);
    $sql->bindValue(7, $estatus);
    $sql->bindValue(8, $nuevo);
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
            WHERE A.estatus!=4 ORDER BY A.id DESC";
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
    $sql = "SELECT A.id, fecha_creacion, A.orden, B.contrato, D.nodo, C.nombre_apel, C.documento, C.correo, C.telefono, B.direccion, A.detalle AS detalle, (A.monto-A.abono) AS monto, E.estatus, A.estatus AS condicion
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
            WHERE contrato=? AND YEAR(fecha_creacion)=YEAR(NOW()) AND MONTH(fecha_creacion)=MONTH(NOW())";
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

  public function cargarCxcCliente2($dato)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT * FROM tabla_cobranza_data WHERE cliente=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $dato);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

}