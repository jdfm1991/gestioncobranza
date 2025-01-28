<?php
date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cobranza_model.php");

$id = (isset($_GET['id'])) ? $_GET['id'] : '';

$cobranza = new Cobranza();

$data = $cobranza->cargarDatosCobro($id);

foreach ($data as $data) {
  $id = $data['id'];
  $fecha_creacion = $data['fecha_creacion'];
  $orden = $data['orden'];

  $contrato = $data['contrato'];
  $plan = $data['nodo'];

  $nombre_apel = $data['nombre_apel'];
  $documento = $data['documento'];
  $direccion = $data['direccion'];
  $correo = $data['correo'];
  $telefono = $data['telefono'];

  $detalle = $data['detalle'];
  $monto = number_format($data['monto'], 2);
  $estatus = $data['estatus'];
  $condicion = $data['condicion'];
}

$logo = '../../assets/img/logo.png';
$name = 'tecnologiacharity2020';
$stylesheet = file_get_contents(URL_ASSETS.'/css/style.css');
$body = "";

$body .= '
<div class="box-left">
  <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
  <h5 class="text-box-left">RIF: J-50032264-0</h5>
  <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
</div>

<div class="box-right">
  <h4 class="text-box-right">Orden de Cobro</h4>
  <p class="text-box-right"><b>Numero: </b>' . $orden . '</p>
  <p class="text-box-right"><b>Fecha: </b>' . $fecha_creacion . '</p>
  <br>
  <h2 class="text-box-right">Estatus: <b>' . $estatus . '</b></h2>';
if ($condicion != 1) {
  $nota = $cobranza->cargarNotaEntrega($id);
  $body .= '<p class="text-box-right"><b>' . $estatus . ' Con Nota de Entrega: </b>';
  foreach ($nota as $nota) {
    $body .= '<a href="../pago/pdf.php?id=' . $nota['id'] . '" target="_blank">' . $nota['nota'] . '</a><br>';
  }
  $body .= '</p>';
}
$body .= '</div>
<br>
<div >
  <h3 class="text-box-left">Emitida A</h3>
  <h4 class="text-box-left"><b>Clente: </b>' . $nombre_apel . '</h4>
  <p class="text-box-left"><b>Numero de Cedula o R.I.F.: </b>' . $documento . '</p>
  <p class="text-box-left"><b>Numero de Contacto : </b>' . $telefono . '</p>
  <p class="text-box-left"><b>Correo Electronico: </b>' . $correo . '</p>
  <p class="text-box-left"><b>Direccion: </b>' . $direccion . '</p>
</div>
';

$body .= '
<table style="text-align:center;" width="100%">
    <thead>
        <tr>
          <th width="15%">Contrato</th>
          <th width="30%">Nodo</th>
          <th width="45%">Detalles de Cobro</th>
          <th width="10%">Monto</th>
        </tr>
    </thead>
    <tbody>  
        <tr>
          <td>' . $contrato . '</td>
          <td>' . $plan . '</td>
          <td>' . $detalle . '</td>
          <td>' . number_format($monto, 2) . '</td>
        </tr>';


$body .= '
    </tbody>
</table>';





$mpdf = new \Mpdf\Mpdf([
  'mode' => 'utf-8',
  'format' => [215, 139],
  'orientation' => 'P',
  'setAutoTopMargin' => 'stretch',
  'setAutoBottomMargin' => 'stretch',
]);

$mpdf->SetHeader('<img src="' . $logo . '" style="width: 80px;">||<b>Fecha de Cobro</b><br>' . $fecha_creacion);
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

