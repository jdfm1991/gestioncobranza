<?php
date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("pago_model.php");
require_once("../cliente/cliente_model.php");

$pago = new Pago();
$cliente = new Cliente();

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
                  <h2 class="text-center2">RELACION DE PAGOS</h2>
                </div>
                ';



  $body .= '
            <table style="text-align:center;" width="100%">
                <thead>
                    <tr style="border: 1px solid black;
              border-collapse: collapse;">
                      <th width="15%">Fecha de Registro</th>
                      <th width="15%">Nota de Entrega</th>
                      <th width="15%">Fecha de Pago</th>
                      <th width="15%">Contrato</th>
                      <th width="15%">Referencia</th>
                      <th width="15%">Monto $ </th>
                      <th width="15%">Tasa</th>
                      <th width="15%">Saldo </th>
                    </tr>
                </thead>
                <tbody>';
  $infopago = $pago->cargarDatosPago($id);
  foreach ($infopago as $infopago) {
    $pagocambio = 0;

    if ($infopago['forma_pago'] == 2 && $infopago['detalle_pago'] == 4) {
      $pagocambio = $infopago['monto_pago'];
    } else {
      $pagocambio = $infopago['monto_pago'] / $infopago['tasa'];
    }

    $body .= '   
             <tr>
                <td>' . $infopago['fecha_registro'] . '</td>
                <td>' . $infopago['nota'] . '</td>
                <td>' . $infopago['fecha_pago'] . '</td>
                <td>' . $infopago['contrato'] . '</td>
                <td>' . $infopago['referencia'] . '</td>
                <td>' . number_format($infopago['monto_dolar'], 2)  . ' $</td>
                <td>' . number_format($infopago['tasa'], 4) . ' Bs</td>
                <td>' . number_format($infopago['monto_dolar'], 2) . ' $</td>
              </tr>';
    $contador1++;
    $total = $total + $pagocambio;
  }
  if ($infopago['saldo']>0) {
      $body .= '   
             <tr>
                <td>' . $infopago['fecha_registro'] . '</td>
                <td> Saldo A Favor </td>
                <td> N/A </td>
                <td>' . $infopago['contrato'] . '</td>
                <td> N/A </td>
                <td>' . number_format($infopago['saldo'], 2)  . ' $</td>
                <td>' . number_format($infopago['tasa'], 4) . ' Bs</td>
                <td>' . number_format($infopago['saldo'], 2) . ' $</td>
              </tr>';
    }
  $body .= '
            </tbody>
        </table><br>';
  $body .= '<p class="text-box-right border-text"><b>CANTIDAD DE PAGO REALIZADOS: ' . $contador1 . ' / TOTAL PAGADO: ' . number_format($total, 2) . ' $</b></p><br>';
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
