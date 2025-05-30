<?php

use Mpdf\Tag\Div;
use Mpdf\Tag\P;

date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("../contrato/contrato_model.php");
require_once("../herramientas/herramientas_model.php");

$contrato = new Contrato();
$herramientas = new Herramientas();

$id = (isset($_GET['id'])) ? $_GET['id'] : '';

$contador1 = 0;
$contador2 = 0;

$logo = '../../assets/img/logo.png';
$name = 'tecnologiacharity2020';
$stylesheet = file_get_contents('../../assets/css/style.css');
$body = "";

if (!$id) {
  $infonodo = $herramientas->cargarNodos();
  $body .= '<div>
          <div class="box-left">
            <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
            <h5 class="text-box-left">RIF: J-50032264-0</h5>
            <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
          </div>
          </div>
          <div>
            <h2 class="text-center2">RELACION DE CONTRATOS</h2>
          </div>
          ';
  foreach ($infonodo as $infonodo) {
    $idnodo = $infonodo['id'];
    $body .= '<p class="text-box-right border-text"><b>' . $infonodo['nodo'] . '</b></p>';
    $body .= '
                <table style="text-align:center;" width="100%">
                    <thead>
                        <tr style="border: 1px solid black;
                  border-collapse: collapse;">
                          <th width="10%">Fecha de Apertura</th>
                          <th width="30%">Nombre de Cliente de Cobro</th>
                          <th width="15%">Contrato </th>
                          <th width="15%">Plan </th>
                        </tr>
                    </thead>
                    <tbody>';
    $ordenes = $contrato->cargarDatosContrato($idnodo);
    foreach ($ordenes as $ordenes) {
      $contador1++;
      $body .= '   
                  <tr>
                    <td>' . $ordenes['fecha_apertura'] . '</td>
                    <td>' . $ordenes['nombre_apel'] . '</td>
                    <td>' . $ordenes['contrato'] . '</td>
                    <td>' . $ordenes['plan2'] . '</td>
                  </tr>';
    }
    $body .= '
                </tbody>
            </table><br>';
    $contador2 = $contador2 + $contador1;
    $body .= '<p class="text-box-right border-text"><b>TOTAL DE CONTRATOS ' . $contador1 . '</b></p><br>';
    $contador1 = 0;
  }
  $body .= '<p class="text-box-right border-text"><b>TOTAL DE CONTRATOS GENERAL ' . $contador2 . '</b></p><br>';
} else {
  $body .= '<div>
      <div class="box-left">
        <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
        <h5 class="text-box-left">RIF: J-50032264-0</h5>
        <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
      </div>
      </div>
      <div>
        <h2 class="text-center2">RELACION DE CONTRATOS</h2>
      </div>
      ';
  $infonodo = $herramientas->cargarNodo($id);
  foreach ($infonodo as $infonodo) {
    $body .= '<p class="text-box-right border-text"><b>' . $infonodo['nodo'] . '</b></p>';
    $body .= '
            <table style="text-align:center;" width="100%">
                <thead>
                    <tr>
                      <th width="10%">Fecha de Apertura</th>
                      <th width="30%">Nombre de Cliente de Cobro</th>
                      <th width="15%">Contrato </th>
                      <th width="15%">Plan </th>
                    </tr>
                </thead>
                <tbody>';
    $ordenes = $contrato->cargarDatosContrato($id);
    foreach ($ordenes as $ordenes) {
      $contador1++;
      $body .= '   
             <tr>
                <td>' . $ordenes['fecha_apertura'] . '</td>
                <td>' . $ordenes['nombre_apel'] . '</td>
                <td>' . $ordenes['contrato'] . '</td>
                <td>' . $ordenes['plan2'] . '</td>
              </tr>';
    }
    $body .= '
            </tbody>
        </table><br>';
    $body .= '<p class="text-box-right border-text"><b>TOTAL DE CONTRATOS ' . $contador1 . '</b></p><br>';
  }
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
