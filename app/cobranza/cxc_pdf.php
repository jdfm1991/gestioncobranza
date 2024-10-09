<?php

use Mpdf\Tag\Div;
use Mpdf\Tag\P;

date_default_timezone_set('America/Caracas');
require_once("../../config/const.php");
require_once("../../assets/pdf/autoload.php");
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("cobranza_model.php");
require_once("../cliente/cliente_model.php");
require_once("../contrato/contrato_model.php");
require_once("../herramientas/herramientas_model.php");

$cobranza = new Cobranza();
$cliente = new Cliente();
$contrato = new Contrato();
$herramientas = new Herramientas();

$id = (isset($_GET['id'])) ? $_GET['id'] : '';

$total = 0;
$totalg = 0;
$totalgg = 0;

$logo = '../../assets/img/logo.png';
$name = 'tecnologiacharity2020';
$stylesheet = file_get_contents('../../assets/css/style.css');
$body = "";

switch ($_GET["op"]) {
  case 'nodo':
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
            <h2 class="text-center2">REPORTE DE CUENTAS POR COBRAR</h2>
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
                          <th width="15%">Fecha de Cobro</th>
                          <th width="15%">Orden de Cobro</th>
                          <th width="10%">Monto $</th>
                          <th width="10%">total $</th>
                        </tr>
                    </thead>
                    <tbody>';
        $ordenes = $cobranza->cargarCxcCliente($idnodo);
        foreach ($ordenes as $ordenes) {
          $total = $total + $ordenes['monto'];
          $body .= '   
                  <tr>
                    <td>' . $ordenes['fecha_creacion'] . '</td>
                    <td>' . $ordenes['orden'] . '</td>
                    <td>' . number_format($ordenes['monto'], 2)  . '</td>
                    <td>' . number_format($total, 2) . '</td>
                  </tr>';
        }
        $body .= '
                </tbody>
            </table><br>';
        $totalg = $totalg + $total;
        $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR ' . number_format($total, 2) . '$</b></p><br>';
        $total = 0;
      }
      $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR GENERAL ' . number_format($totalg, 2) . '$</b></p><br>';
    } else {
      $body .= '<div>
      <div class="box-left">
        <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
        <h5 class="text-box-left">RIF: J-50032264-0</h5>
        <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
      </div>
      </div>
      <div>
        <h2 class="text-center2">REPORTE DE CUENTAS POR COBRAR</h2>
      </div>
      ';
      $infonodo = $herramientas->cargarNodo($id);
      foreach ($infonodo as $infonodo) {
        $body .= '<p class="text-box-right border-text"><b>' . $infonodo['nodo'] . '</b></p>';
        $body .= '
            <table style="text-align:center;" width="100%">
                <thead>
                    <tr style="border: 1px solid black;
              border-collapse: collapse;">
                      <th width="15%">Fecha de Cobro</th>
                      <th width="15%">Orden de Cobro</th>
                      <th width="10%">Monto $</th>
                      <th width="10%">total $</th>
                    </tr>
                </thead>
                <tbody>';
        $ordenes = $cobranza->cargarCxcCliente($id);
        foreach ($ordenes as $ordenes) {
          $total = $total + $ordenes['monto'];
          $body .= '   
              <tr>
                <td>' . $ordenes['fecha_creacion'] . '</td>
                <td>' . $ordenes['orden'] . '</td>
                <td>' . number_format($ordenes['monto'], 2)  . '</td>
                <td>' . number_format($total, 2) . '</td>
              </tr>';
        }
        $body .= '
            </tbody>
        </table><br>';
        $totalg = $totalg + $total;
        $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR ' . number_format($total, 2) . '$</b></p><br>';
        $total = 0;
      }
      $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR GENERAL ' . number_format($totalg, 2) . '$</b></p><br>';
    }


    break;

  case 'cliente':
    if (!$id) {
      $infocliente = $cliente->verDatosClientes();
      $body .= '<div>
              <div class="box-left">
                <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
                <h5 class="text-box-left">RIF: J-50032264-0</h5>
                <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
              </div>
              </div>
              <div>
                <h1 class="text-center2">REPORTE DE CUENTAS POR COBRAR</h1>
              </div>
              ';
      foreach ($infocliente as $infocliente) {
        $idcliente = $infocliente['id'];
        $body .= '<p class="text-box-right border-text"><b><label for="nombre">' . $infocliente['nombre_apel'] . ': </label> ' . $infocliente['documento'] . '</b></p>';
        $infocontrato = $contrato->cargarDatosContrato($idcliente);
        foreach ($infocontrato as $infocontrato) {
          $idcontrato = $infocontrato['id'];
          $body .= '<p class="text-contrato">Fecha de Apertura:<b> ' . $infocontrato['fecha_apertura'] . '</b> N° de contrato:<b> ' . $infocontrato['contrato'] . '</b> Plan:<b> ' . $infocontrato['plan2'] . '</b></p>';
          $body .= '
                    <table style="text-align:center;" width="100%">
                        <thead>
                            <tr style="border: 1px solid black;
                      border-collapse: collapse;">
                              <th width="15%">Fecha de Cobro</th>
                              <th width="15%">Orden de Cobro</th>
                              <th width="10%">Monto $</th>
                              <th width="10%">total $</th>
                            </tr>
                        </thead>
                        <tbody>';
          $ordenes = $cobranza->cargarCxcCliente($idcontrato);
          foreach ($ordenes as $ordenes) {
            $total = $total + $ordenes['monto'];
            $body .= '   
                      <tr>
                        <td>' . $ordenes['fecha_creacion'] . '</td>
                        <td>' . $ordenes['orden'] . '</td>
                        <td>' . number_format($ordenes['monto'], 2)  . '</td>
                        <td>' . number_format($total, 2) . '</td>
                      </tr>';
          }
          
          $body .= '
                    </tbody>
                </table><br>';
        }
        $totalg = $totalg + $total;
        $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR ' . number_format($total, 2) . '$</b></p><br>';
        $total = 0;
      }
      $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR GENERAL ' . number_format($totalg, 2) . '$</b></p><br>';
    } else {
      $infocliente = $cliente->verDatosCliente($id);
      $body .= '<div>
              <div class="box-left">
                <h4 class="text-box-left">TECNOLOGIA CHARITY C.A</h4>
                <h5 class="text-box-left">RIF: J-50032264-0</h5>
                <p class="text-box-left"><b>Dirección:</b> Puerto Ordaz, Edo. Bolivar</p>
              </div>
              ';

      foreach ($infocliente as $infocliente) {
        $body .= '
                <div class="box-right" >
                  <h2 class="text-box-right">Emitida A</h2>
                  <h3 class="text-box-right"><b>Clente: </b>' . $infocliente['nombre_apel']  . '</h3>
                  <p class="text-box-right"><b>Numero de Cedula o R.I.F.: </b>' . $infocliente['documento'] . '</p>
                </div></div>
                <div>
                  <h1 class="text-center2">REPORTE DE CUENTAS POR COBRAR</h1>
                </div>
              ';
      }
      $body .= '<p class="text-box-right border-text"></p>';
      $body .= '
                <table style="text-align:center;" width="100%">
                    <thead>
                        <tr style="border: 1px solid black;
                  border-collapse: collapse;">
                          <th width="15%">Fecha de Cobro</th>
                          <th width="15%">Orden de Cobro</th>
                          <th width="10%">Monto $</th>
                          <th width="10%">total $</th>
                        </tr>
                    </thead>
                    <tbody>';
      $ordenes = $cobranza->cargarCxcCliente($id);
      foreach ($ordenes as $ordenes) {
        $total = $total + $ordenes['monto'];
        $totalg = $totalg + $ordenes['monto'];
        $body .= '   
                  <tr>
                    <td>' . $ordenes['fecha_creacion'] . '</td>
                    <td>' . $ordenes['orden'] . '</td>
                    <td>' . number_format($ordenes['monto'], 2)  . '</td>
                    <td>' . number_format($total, 2) . '</td>
                  </tr>';
      }
      $total = 0;
      $body .= '
                </tbody>
            </table><br>';

      $totalgg = $totalgg + $totalg;
      $body .= '<p class="text-box-right border-text"><b>TOTAL POR COBRAR ' . number_format($totalg, 2) . '$</b></p><br>';
    }
    break;

  default:
    # code...
    break;
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
