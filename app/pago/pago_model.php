<?php
require_once("../../config/conexion.php");

class Pago extends Conectar
{

  public function cargarDatosCobros($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, fecha_creacion, B.nodo, (monto-abono) AS monto, A.detalle FROM tabla_cobranza_data AS A 
              INNER JOIN tabla_contrato_nodo AS B ON B.id=A.nodo
              WHERE contrato=? AND A.estatus IN (1,3)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarSiguienteNota()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT CONCAT('NE-',LPAD(COUNT(*) + 1, 3, '0'), '/', YEAR(NOW())) AS nota
            FROM tabla_pago_data
            WHERE YEAR(fecha_registro) = YEAR(NOW())";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return ($sql->fetch(PDO::FETCH_ASSOC)['nota']);
  }

  public function guardarDatosPago($id, $hoy, $contrato, $cliente, $forma_pago, $fp_detalle, $p_cobro, $fecha_pago, $tasa, $referencia, $p_cambio, $p_pago, $nota)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_pago_data(id, fecha_registro, cliente, contrato, forma_pago, detalle_pago, monto_dolar, fecha_pago, tasa, referencia, monto_cambio, monto_pago, nota)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->bindValue(2, $hoy);
    $sql->bindValue(3, $cliente);
    $sql->bindValue(4, $contrato);
    $sql->bindValue(5, $forma_pago);
    $sql->bindValue(6, $fp_detalle);
    $sql->bindValue(7, $p_cobro);
    $sql->bindValue(8, $fecha_pago);
    $sql->bindValue(9, $tasa);
    $sql->bindValue(10, $referencia);
    $sql->bindValue(11, $p_cambio);
    $sql->bindValue(12, $p_pago);
    $sql->bindValue(13, $nota);
    return $sql->execute();
  }

  public function guardarDatosCobroPago($orden, $pago)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $data = NULL;
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "INSERT INTO tabla_cobranza_pago( orden, nota)  VALUES (?,?)";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $orden);
    $sql->bindValue(2, $pago);
    return $sql->execute();
  }

  public function actualizarCobranza($cobranza, $estatus, $p_pago)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    ///QUERY
    $sql = "UPDATE tabla_cobranza_data SET estatus=?, abono = abono + ? WHERE id=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $estatus);
    $sql->bindValue(2, $p_pago);
    $sql->bindValue(3, $cobranza);
    return $sql->execute();
  }

  public function cargarDatosPagos()
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id, fecha_registro, nota, A.cliente, B.nombre_apel AS n_cliente, A.contrato, C.contrato AS n_contrato, forma_pago, D.forma, E.detalle, detalle_pago, monto_dolar, fecha_pago, tasa, referencia, monto_cambio, monto_pago
            FROM tabla_pago_data AS A 
            INNER JOIN tabla_cliente_data AS B ON B.id=A.cliente
            INNER JOIN tabla_contrato_data AS C ON C.id=A.contrato
            INNER JOIN tabla_pago_forma AS D ON D.id=A.forma_pago
            INNER JOIN tabla_pago_forma_detalle AS E ON E.id=A.detalle_pago
            ORDER BY fecha_registro DESC";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarDatosPago($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT A.id,A.fecha_registro,nota,A.fecha_pago,C.contrato,D.plan,D.costo, B.nombre_apel,B.documento,C.direccion,B.correo,B.telefono,E.forma,F.detalle,A.referencia,A.tasa,A.monto_dolar,A.monto_cambio,A.monto_pago,A.forma_pago,A.detalle_pago  
            FROM tabla_pago_data AS A 
            INNER JOIN tabla_cliente_data AS B ON B.id=A.cliente
            INNER JOIN tabla_contrato_data AS C ON C.id=A.contrato
            INNER JOIN tabla_contrato_plan AS D ON D.id=C.plan
            INNER JOIN tabla_pago_forma AS E ON E.id=A.forma_pago
            INNER JOIN tabla_pago_forma_detalle AS F ON F.id=A.detalle_pago
            WHERE A.id=? OR A.cliente=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->bindValue(2, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }

  public function cargarDatosPagoDetalle($id)
  {
    //LLAMAMOS A LA CONEXION QUE CORRESPONDA CUANDO ES SAINT: CONEXION2
    //CUANDO ES APPWEB ES CONEXION.
    $conectar = parent::conexion();
    parent::set_names();
    //QUERY
    $sql = "SELECT B.fecha_creacion, B.orden, B.detalle,C.fecha_registro ,C.monto_cambio, C.nota
              FROM tabla_cobranza_pago AS A 
              INNER JOIN tabla_cobranza_data AS B ON B.id=A.orden
              INNER JOIN tabla_pago_data AS C ON C.id=A.nota
              WHERE A.nota = ? OR A.orden=?";
    //PREPARACION DE LA CONSULTA PARA EJECUTARLA.
    $sql = $conectar->prepare($sql);
    $sql->bindValue(1, $id);
    $sql->bindValue(2, $id);
    $sql->execute();
    return $sql->fetchAll(PDO::FETCH_ASSOC);
  }
  
}
