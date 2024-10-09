<?php

use Mpdf\Tag\P;

date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("pago_model.php");

$id = (isset($_GET['id'])) ? $_GET['id'] : '';

$pago = new Pago();

$data = $pago->cargarDatosPago($id);
$item = $pago->cargarDatosPagoDetalle($id);

foreach ($data as $data) {
  $id = $data['id'];
  $fecha_registro = $data['fecha_registro'];
  
  $nota = $data['nota'];
  $fecha_pago = $data['fecha_pago'];
  $contrato = $data['contrato'];
  $plan = $data['plan'];
  $costo = number_format($data['costo'], 2);

  $nombre_apel = $data['nombre_apel'];
  $documento = $data['documento'];
  $direccion = $data['direccion'];
  $correo = $data['correo'];
  $telefono = $data['telefono'];

  $forma = $data['forma'];
  $detalle = $data['detalle'];
  $detalle_pago = $data['detalle_pago'];
  $referencia = $data['referencia'];
  $tasa = $data['tasa'];
  $monto_dolar = number_format($data['monto_dolar'], 2);
  $monto_cambio = number_format($data['monto_cambio'], 2);
  $monto_pago = number_format($data['monto_pago'], 2);
}

$logo = '../../assets/img/logo.png';
$name = 'tecnologiacharity2020';
$stylesheet = file_get_contents('../../assets/css/style.css');
$body = "";



$body .= '
<div class="box-left">
  <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
  <h5 class="text-box-left">RIF: J-50032264-0</h5>
  <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
</div>

<div class="box-right">
  <h2 class="text-box-right">Nota de Entrega</h2>
  <p class="text-box-right"><b>Numero: </b>' . $nota . '</p>
  <p class="text-box-right"><b>Fecha de Pago: </b>' . $fecha_pago . '</p>
  <p class="text-box-right"><b>Numero de Contrato: </b>' . $contrato . '</p>
  <p class="text-box-right"><b>Plan: </b>' . $plan . '</p>
  <p class="text-box-right"><b>Costo Actual: </b>' . $costo. ' $</p>
</div>
<br>
<div class="box-left">
  <h2 class="text-box-left">Emitida A</h2>
  <h3 class="text-box-left"><b>Clente: </b>' . $nombre_apel . '</h3>
  <p class="text-box-left"><b>Numero de Cedula o R.I.F.: </b>' . $documento . '</p>
  <p class="text-box-left"><b>Numero de Contacto : </b>' . $telefono . '</p>
  <p class="text-box-left"><b>Correo Electronico: </b>' . $correo . '</p>
  <p class="text-box-left"><b>Direccion: </b>' . $direccion . '</p>
</div>
<br>
<div class="box-right">
<h2 class="text-box-right">Metodo de Pago: <b>'.$forma.'</b></h2>
</div>
<br>
<br>
';

$body .= '
<table style="text-align:center;" width="100%">
    <thead>
        <tr style="border: 1px solid black;
  border-collapse: collapse;">
          <th width="15%">Fecha de Cobro</th>
          <th width="15%">Orden de Cobro</th>
          <th width="15%">Fecha de pago</th>
          <th width="45%">Detalles de Pago</th>
          <th width="10%">Monto</th>
        </tr>
    </thead>
    <tbody>';
foreach ($item as $item) {
  $body .= '   
        <tr>
          <td>' . $item['fecha_creacion'] . '</td>
          <td>' . $item['orden'] . '</td>
          <td>' . $item['fecha_registro'] . '</td>
          <td>' . $item['detalle'] . '</td>
          <td>' . number_format($item['monto_cambio'], 2) . '</td>
        </tr>';
}
$body .= '
        <tr>
          <td colspan="5"></td>
        </tr>
        <tr>
          <td colspan="5"></td>
        </tr>
        <tr>
          <td style="text-align:right;" colspan="4"><b> SUB-TOTAL USD: </b></td>
          <td><b>' . number_format($monto_cambio, 2) . ' </b></td>
        </tr>
        <tr>
          <td style="text-align:right;" colspan="4"><b> IMPUESTO USD: </b></td>
          <td><b>00,00</b></td>
        </tr> 
        <tr>
          <td style="text-align:right;" colspan="4"><b> TOTAL USD: </b></td>
          <td><b>' . number_format($monto_cambio, 2) . ' </b></td>
        </tr>';

$body .= '
    </tbody>
</table>';

if ($detalle_pago==3) {
  $body .= '<br><br><p style="text-align:center;">FORMA DE PAGO: <b>'.$detalle.'</b> por <b>'.number_format($monto_pago, 2).'</b> Bs al <b>'.$fecha_pago.'</b>, Equivalente a  <b>'.$monto_cambio.'</b> $ (TASA <b>'.$tasa.'</b> BS. POR $)</p>';
} else {
  if ($detalle_pago==4) {
    $body .= '<br><br><p style="text-align:center;">FORMA DE PAGO: <b>'.$detalle.'</b> por <b>'.number_format($monto_cambio, 2).'</b> Bs al <b>'.$fecha_pago.'</b>, (TASA <b>'.$tasa.'</b> BS. POR $)</p>';
  } else {
    $body .= '<br><br><p style="text-align:center;">FORMA DE PAGO: <b>'.$detalle.'</b> a <b>BANESCO</b>, Bajo El Numero de Referecia <b>'.$referencia.'</b> por <b>'.number_format($monto_pago, 2).'</b> Bs al <b>'.$fecha_pago.'</b>, Equivalente a  <b>'.number_format($monto_cambio, 2).'</b> $ (TASA <b>'.$tasa.'</b> BS. POR $)</p>';
  }
  
}




$mpdf = new \Mpdf\Mpdf([
  'mode' => 'utf-8',
  //'format' => [215, 139],
  'orientation' => 'P',
  'setAutoTopMargin' => 'stretch',
  'setAutoBottomMargin' => 'stretch',
]);

$mpdf->SetHeader('<img src="' . $logo . '" style="width: 150px;">||<b>Fecha de Registro del Pago</b><br>' . $fecha_registro);
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
$mpdf->Output($nota.'.pdf',\Mpdf\Output\Destination::INLINE);

