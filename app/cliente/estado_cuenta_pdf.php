<?php
date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../pago/pago_model.php");
require_once("../cobranza/cobranza_model.php");
require_once("cliente_model.php");

$cliente = new Cliente();
$cobranza = new Cobranza();
$pago = new Pago();

$id = (isset($_GET['id'])) ? $_GET['id'] : '';

$contador1 = 0;
$total = 0;

$logo = '../../assets/img/logo.png';
$name = 'tecnologiacharity2020';
$stylesheet = file_get_contents('../../assets/css/style.css');
$body = "";

if (!$id) {
  $body .= '<p class="text-center2 border-text"><b>DEBE DE SELECCIONAR UN CLIENTE</b></p>';
} else {
  $body .= '<div>
      <div class="box-left">
        <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
        <h5 class="text-box-left">RIF: J-50032264-0</h5>
        <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
      </div>
     ';

  $infocliente = $cliente->verDatosCliente($id);
  foreach ($infocliente as $infocliente) {
    $body .= '
                <div class="box-right" >
                  <h2 class="text-box-right">Emitida A</h2>
                  <h3 class="text-box-right"><b>Clente: </b>' . $infocliente['nombre_apel']  . '</h3>
                  <p class="text-box-right"><b>Numero de Cedula o R.I.F.: </b>' . $infocliente['documento'] . '</p>
                </div></div>
              ';
  }
  $body .= '<div>
                  <h2 class="text-center2">ESTADO DE CUENTA</h2>
                </div>
                ';



  $body .= '
            <table style="text-align:center;" width="100%" border="1">
                <thead>
                    <tr class="titulo">
                      <th class="text-titulo" width="10%">Fecha</th>
                      <th class="text-titulo" width="20%">Concepto</th>
                      <th class="text-titulo" width="20%">Documento</th>
                      <th class="text-titulo" width="12%">Debe</th>
                      <th class="text-titulo" width="12%">Haber</th>
                      <th class="text-titulo" width="12%">Saldo $</th>
                    </tr>
                </thead>
                <tbody>';
  $cobros = $cobranza->cargarCxcCliente2($id);
  foreach ($cobros as $cobros) {
    $contador1++;
    $total = $total + $cobros['monto'];
    $cobroid = $cobros['id'];
    $class = ($total == 0) ? 'pago' : 'deuda' ;
    $body .= '   
             <tr class="'.$class.'">
                <td class="text-table">' . $cobros['fecha_creacion'] . '</td>
                <td class="text-table">' . $cobros['detalle'] . '</td>
                <td class="text-table">' . $cobros['orden'] . '</td>
                <td class="text-table">' . number_format($cobros['monto'], 2)  . ' </td>
                <td class="text-table">' . number_format(0, 2) . ' </td>
                <td class="text-table">' . number_format($total, 2) . ' </td>
              </tr>';
    $pagos = $pago->cargarDatosPagoDetalle($cobroid);
    foreach ($pagos as $pagos) {
      $contador1++;
      $total = $total - $pagos['monto_cambio'];
      $class = ($total == 0) ? 'pago' : 'deuda' ;
      $body .= '   
             <tr class="'.$class.'">
                <td class="text-table">' . $pagos['fecha_registro'] . '</td>
                <td class="text-table">' . $pagos['detalle'] . '</td>
                <td class="text-table">' . $pagos['nota'] . '</td>
                <td class="text-table">' . number_format(0, 2)  . ' </td>
                <td class="text-table">' . number_format($pagos['monto_cambio'], 2) . ' </td>
                <td class="text-table">' . number_format($total, 2) . ' </td>
              </tr>';
    }
  }
  $body .= '
            </tbody>
        </table><br>';
  $body .= '<p class="text-box-right border-text"><b>A Realizado ' . $contador1 . ' Operacion y Posee En Saldo De : ' . number_format($total, 2) . ' $</b></p><br>';
}

$mpdf = new \Mpdf\Mpdf([
  'mode' => 'utf-8',
  'orientation' => 'P',
  'setAutoTopMargin' => 'stretch',
  'setAutoBottomMargin' => 'stretch',
]);

$mpdf->SetHeader('<img src="' . $logo . '" style="width: 80px;">||<b>Fecha de Emision</b><br>' . date('d-m-Y'));
$mpdf->SetFooter('|<strong><span>Teléfono: 0414-1850548</span></strong><br></strong><span>Correo Electrónico: tecnologiacharity2020@gmail.com</span></strong>
| Fecha de Impresion: {DATE j-m-Y}');

$mpdf->defaultheaderfontsize = 10;
$mpdf->defaultheaderfontstyle = 'B';
$mpdf->defaultheaderline = 0;
$mpdf->defaultfooterfontsize = 10;
$mpdf->defaultfooterfontstyle = 'BI';
$mpdf->defaultfooterline = 0;


$mpdf->SetWatermarkImage($logo);
$mpdf->showWatermarkImage = true;
$mpdf->watermarkImageAlpha = 0.1;

$mpdf->SetWatermarkText($name);
$mpdf->showWatermarkText = true;
$mpdf->watermarkTextAlpha = 0.1;

$mpdf->WriteHTML($stylesheet, \Mpdf\HTMLParserMode::HEADER_CSS);
$mpdf->WriteHTML($body, \Mpdf\HTMLParserMode::HTML_BODY);

// Output a PDF file directly to the browser
$mpdf->Output($nota . '.pdf', \Mpdf\Output\Destination::INLINE);