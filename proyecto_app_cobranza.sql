-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2025 a las 15:04:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_app_cobranza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cliente_data`
--

CREATE TABLE `tabla_cliente_data` (
  `id` varchar(50) NOT NULL,
  `nombre_apel` varchar(200) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cliente_data`
--

INSERT INTO `tabla_cliente_data` (`id`, `nombre_apel`, `documento`, `correo`, `telefono`, `estatus`) VALUES
('671fd6035a4e4', 'ABBY SHADAM', '.', '', '04241494286', 1),
('671fd6338ede0', 'ALEXIS SIFONTES', '', '', '0', 1),
('671fd658a34d4', 'ANTONIO BASTARDO SCHENA', '', '', '0', 1),
('671fd68841cb1', 'ASESORES GUAYANA SUR C.A', '', '', '0', 1),
('671fd6a831411', 'CICPC REDI 1ERO CARONOCO ', '', '', '0', 1),
('671fd6e51c10c', 'CICPC REDI 2DO CARONOCO ', '', '', '0', 1),
('671fd6fdcc7b8', 'EDUARDO HERNANDEZ', '', '', '04244033824', 1),
('671fd71723433', 'ENDER NAVARRO', '', '', '0', 1),
('671fd7383caf9', 'FRANCISCO LOPEZ', '', '', '04148673717', 1),
('671fd75818447', 'GERMAN TOTH', '', '', '04129702861', 1),
('671fd76ce9531', 'LUZ VERGARA', '', '', '0', 1),
('671fd78bbf5cc', 'JOSE PIÑA', '', '', '0', 1),
('671fd7a7ba0c3', 'LOTOMARKET C.A', '', '', '0', 1),
('671fd7bdbcf6b', 'YOLI LACLE', '', '', '0', 1),
('671fd7d8c344a', 'MAORAN YARBOUH', '', '', '04143887918', 1),
('671fd7ebee989', 'MARIA MENDEZ', '', '', '0', 1),
('671fd80d4ed80', 'MARIA JOSE RODRIGUEZ', '', '', '04145969608', 1),
('671fd82a30875', 'MARIO GIAMBRA - CASA', '', '', '04140965535', 1),
('671fd848a936f', 'PEDRO BARROS', '', '', '04148924152', 1),
('671fd85b1c25e', 'PEDRO PEREZ', '', '', '0', 1),
('671fd8819976b', 'RESIDENCIAS 2028 (DAVID WAIMARE)', '', '', '0', 1),
('671fd89618825', 'SKY MALL', '', '', '04244325533', 1),
('671fd8bfc1176', 'BIODEXIS GONZALEZ', '', '', '+559591424938', 1),
('671fd8e70d4a6', 'YENNY TOVAR', '', '', '04148609917', 1),
('671fd904322bb', 'NELSON JOSE GUTIERREZ (CVM)', '', '', '0', 1),
('671fd91d0f46c', 'KASSEM SHADAM', '', '', '0', 1),
('671fd931c2191', 'ROSENDO CAMARGO', '', '', '0', 1),
('671fd94565361', 'HENRI GASPAR', '', '', '0', 1),
('671fd95e058e2', 'ZEGA GAS C.A ARIVANA', '', '', '0', 1),
('671fd97ec13b4', 'ROBERTO RIVAS (RIO ARO)', '', '', '0', 1),
('671fd99842111', 'CLAUDIA CUELLAR', '', '', '04124812315', 1),
('671fd9ae640b7', 'ENTRE DIVAS 2', '', '', '04121941821', 1),
('671fd9c9588da', 'GERMAN FARIAS LOCAL 97 FOCUS', '', '', '0', 1),
('671fd9e91c4f2', 'DRA MICHELINA', '', '', '04143279120', 1),
('671fda0c28c1f', 'ADRIANNYS CARABALLO', '', '', '04249156916', 1),
('671fda3219276', 'DIVISION CONTRADROGAS PNB', '', '', '0', 1),
('671fda4ef0e06', 'PAULO DE BRITO', '', '', '04140962820', 1),
('671fda678cdac', 'DAVID DE PONTE LIRA', '', '', '04143860650', 1),
('671fda7dedf80', 'SABAS MARIN', '', '', '0', 1),
('671fda9b1a08b', 'CHRYSTIANS JAIMES', '', '', '04148569820', 1),
('671fdc7b0ec53', 'REINALDO VASQUEZ', '', '', '04143859820', 1),
('671fdc9bf2682', 'CARLOS PACHECO', '', '', '04148922615', 1),
('671fdcb7802b2', 'NOEL YEMEZ', '', '', '04249346642', 1),
('671fdccea5a61', 'BISERCA LOCAL 49', '', '', '04146744649', 1),
('671fdce27a357', 'YSHOP', '', '', '04242478643', 1),
('671fdcf9eb829', 'LUIS VELASCO', '', '', '04249541280', 1),
('671fdd0bebe05', 'NELSON CALLEJA', '', '', '0', 1),
('671fdd314f32e', 'CIUDAD MINERO', '', '', '04241824265', 1),
('671fdd4eae976', 'ASHLEY MARTINEZ', '', '', '04249597930', 1),
('671fdd767a678', 'SUNAIDA ABBOU', '', '', '0', 1),
('671fdd91f2a70', 'CESAR BRAVO', '', '', '04249411151', 1),
('671fddaaac4a6', 'BISERCA LOCAL 107', '', '', '0', 1),
('671fddba88388', 'ALBERTO VALERA', '', '', '0', 1),
('671fde22d68d2', 'TIENDAS CAMO', '', '', '04120939636', 1),
('671fde3a91fbd', 'CLAUDIA GUERRA', '', '', '04144400415', 1),
('671fde54cf46d', 'COPOEZ OFICINA PRINCIPAL', '', '', '0', 1),
('671fdebeeae8a', 'CRISLIAN MEZA', '', '', '04249192157', 1),
('671fdf232b412', 'GONZALO MORO', '', '', '04249227399', 1),
('671fdf3e04306', 'EDUARDO ALEMAN', '', '', '04143864813', 1),
('671fdf588ff66', 'NOMAR VARGAS', '', '', '04249312733', 1),
('671fdf997bd34', 'ASTRIC AVARUYO', '', '', '04149988192', 1),
('671fdfaf5a695', 'OCAR HAYEK', '', '', '04148798513', 1),
('671fdffcc86e1', 'ROSEMARIE DENT', '', '', '04148759204', 1),
('671fe01c9886f', 'ZEGAS GAS LOCAL 63', '', '', '0', 1),
('671fe03925dbf', 'WILLIANS BASABTA', '', '', '04121571853', 1),
('671fe0e5a2813', 'JHON SAMPSON', '', '', '0', 1),
('671fe10071660', 'CHINO CAO VILLA ALIANZA', '', '', '04121858175', 1),
('671fe1660a1f9', 'MARCOS ANTONIO PRADA', '', '', '04249470869', 1),
('671fe18477626', 'PAOLA HERNANDEZ', '', '', '04122154707', 1),
('671fe1b1f18b3', 'CATHERINE RIVAS', '', '', '04149916171', 1),
('671fe1cf6ecc9', 'JORGE LUZARDO', '', '', '51950714925', 1),
('671fe1e9ae255', 'MARIOLIS TIAPA', '', '', '04249030844', 1),
('671fe20a60be6', 'YELITZA CARDENAS', '', '', '0', 1),
('671fe22c51750', 'LUCITANO CAFE', '', '', '0', 1),
('671fe279c25d6', 'MIGUEL MARTINEZ', '', '', '0', 1),
('671fe298833fe', 'SEBASTIAN PAREDES ', '', '', '04141597576', 1),
('671fe2e9c9785', 'BOMBEROS UNEXPO', '', '', '0', 1),
('671fe31edc4b6', 'SAID PULIDO ', '', '', '04249263537', 1),
('671fe3375f176', 'BETZABETH BRITO', '', '', '0', 1),
('671fe35065075', 'MEIHUA FENG', '', '', '04120812527', 1),
('671fe365a674d', 'CARLOS MORENO', '', '', '04249504490', 1),
('671fe3a35e653', 'TRABSPORTE CAPELLA', '', '', '0', 1),
('671fe3c18cdbf', 'RUBEN AMAIZ', '', '', '0', 1),
('671fe3de85bf2', 'DAILINIS MARCO', '', '', '0', 1),
('671fe3efc5cd9', 'MIRNA TORRES', '', '', '0', 1),
('671fe4048ff92', 'NELIDA MARTINEZ', '', '', '0', 1),
('671fe41ee8c65', 'ZEGA GAS C.A PISO 6', '', '', '0', 1),
('671fe43a31533', 'ELVIRA OCANDO', '', '', '04248194724', 1),
('671fe44e1c92b', 'ANTONIO GOMEZ', '', '', '0', 1),
('671fe47ce5e16', 'EVER URDANETA', '', '', '0', 1),
('671fe490e62b7', 'JAVIER TINEDO', '', '', '0', 1),
('671fe4a4980a7', 'JESUS GONZALEZ', '', '', '0', 1),
('671fe4b75c41a', 'RUTH BAUTE', '', '', '0', 1),
('671fe4cf6044d', 'ANA DI BERARDINI', '', '', '0', 1),
('671fe4e27557e', 'ADRIAN CHINO', '', '', '0', 1),
('671fe4fc14d70', 'FIAO EXPRESS', '', '', '0', 1),
('671fe50ed2543', 'CICPS UNES', '', '', '0', 1),
('671ff0c3922e2', 'ADRIANA CERRADA', '', '', '0', 1),
('671ff0d986369', 'DECANATO UNES', '', '', '0', 1),
('672142cba78ed', 'MINERA  VOLCAN', 'J-09509480-4', '', '04148674970', 1),
('672142ef7ceb5', 'WILIAM GARCIA', '', '', '04148604023', 1),
('6721430fa7a5b', 'KELLY GONZALEZ', '', '', '04249247838', 1),
('6721432838133', 'MARIA RIVERAS', '', '', '04249238877', 1),
('67214346c8dbd', 'NORIS CARDOZO', '', '', '04167914231', 1),
('6721435e02bfa', 'GINA VASQUEZ', '', '', '04249183522', 1),
('672143772adb1', 'LUSMARI CORREA', '', '', '04128627173', 1),
('6721438ee8539', 'FATIMA LAYA', '', '', '04126897681', 1),
('672143a60f9d1', 'DANIEL GONZALEZ', '', '', '04267941750', 1),
('672143bf583aa', 'ROSANNI RODRIGUEZ', '', '', '04121092797', 1),
('672143d71e9f7', 'MARIA VASQUEZ', '', '', '04128875648', 1),
('672143ec6e4ad', 'ANAIS GOMEZ', '', '', '04167333639', 1),
('67214402e11e5', 'YADIRA VASQUEZ', '', '', '04127845822', 1),
('6721441aad37b', 'OSCAR FUENTES', '', '', '04148768447', 1),
('6721443413d54', 'JULIO ALIBERTO', '', '', '04249485205', 1),
('6721445042170', 'MARICELA PINO', '', '', '04121132220', 1),
('672144689251c', 'JENNY MALPICA', '', '', '04261009436', 1),
('6721448d5a608', 'ELIO ALVINO', 'V-27077889', '', '04249563235', 1),
('672144a43efeb', 'RODOLFO UGA', '', '', '04249153220', 1),
('672144bbb47a7', 'ALBERTO MARIÑA', '', '', '04164202028', 1),
('672144e4aa48c', 'EUKARIS VASQUEZ- MIGUEL MORA', '', '', '04121092771', 1),
('672144fd730d3', 'SAMUEL ASAIN', '', '', '04121141727', 1),
('672145160bc4a', 'AURYS VASQUEZ', '', '', '04249724555', 1),
('6721452fdacdd', 'DENNYS ASTUDILLO', '', '', '04249469109', 1),
('6721454b4f956', 'GREGORI CARDOZO', '', '', '04144717750', 1),
('67214561c82b4', 'ELIAS AGUILARTE', '', '', '04249505082', 1),
('67214577f3821', 'LILIANA SALAZAR', '', '', '04249270758', 1),
('6721458dd8cf5', 'HECTOR NAVARRO', '', '', '04148695111', 1),
('672145aa50859', 'JOSELENNYS RAMOS', '', '', '5926248847', 1),
('672145cccb540', 'YUBIRI ARCIA', '15521895', '', '04263885861', 1),
('672145f1a887c', 'DAMARIS GONZALEZ', '', '', '04164934799', 1),
('672241b25752b', 'ELVIS CASTILLO', '', '', '04148506715', 1),
('672241cb2413b', 'PATRICIA CERRANO', '', '', '04169918567', 1),
('672241df5d79f', 'JOSE MORENO', '', '', '04121837264', 1),
('672241fee3a16', 'MINERVA MALPICA', 'V-10385641', '', '04162819091', 1),
('67224214d256e', 'KATTY MARIÑA', '', '', '04260395789', 1),
('6722422e9f482', 'YUSMEIDIS MORA', '', '', '04148599776', 1),
('6722424e36a3f', 'ROSIBEL MORENO', 'V-16711654', '', '04269952730', 1),
('6722426252f35', 'MAURIS RINCONES', '', '', '0', 1),
('67224273df0b9', 'FRANK BECERRA', '', '', '0', 1),
('6722428e35c33', 'YENIRED ODREMAN', '', '', '0', 1),
('6722429d4ac29', 'CESAR LOZADA', '', '', '0', 1),
('672242b282bda', 'ASDRIBEL MUÑOZ', '', '', '0', 1),
('672242c4eabd7', 'DAYENIS COPLAN', '', '', '0', 1),
('672242d528249', 'MARLY GOMEZ', '', '', '0', 1),
('672242e417446', 'LIZARDO PEREZ', '', '', '0', 1),
('672242f50fde1', 'CARLOS CHOURIO', '', '', '0', 1),
('6722430831445', 'EDUARDO MARINA', '', '', '0', 1),
('672243179b40a', 'AURA LAYA', '', '', '0', 1),
('67224324efe2e', 'RICARDO MAESTRE', '', '', '0', 1),
('67224336bace7', 'VICTORIA HERRERA', '', '', '0', 1),
('6722434a67b16', 'KAREN MARCANO', '', '', '0', 1),
('672243620de3b', 'JHORBET CUARES', '', '', '0', 1),
('6751b7ab9fd19', 'ALBA LAREZ', '', '', '04249041292', 1),
('6751b7c3b6d31', 'ALEJANDRA RUIZ', '', '', '04249075256', 1),
('6751b7da4b0f5', 'ALFONZO CHEN', '', '', '04148306317', 1),
('6751b7f18e675', 'ANNY MORALES', '', '', '0', 1),
('6751b806d9386', 'CASA 5', '', '', '04126991443', 3),
('6751b806ee741', 'CASA 5', '', '', '04126991443', 1),
('6751b82064d99', 'CICPC-RESEÑA', '', '', '04249447483', 1),
('6751b850e6615', 'COMANDO FLUVIAL GNB FERROMINERA', '', '', '04249094235', 1),
('6751b8726181e', 'COMERCIAL EL CENTRO 168 C.A', '', '', '04120229828', 1),
('6751b88c2c720', 'COMERCIAL PROVISTO', '', '', '04249069620', 1),
('6751b8b58d453', 'CONFIAMERICA', '', '', '0', 1),
('6751b8cb8d609', 'DAILENNYS CALVO', '', '', '04129881442', 1),
('6751b8e175e2b', 'DARWIN AMAYA', '', '', '04261931390', 1),
('6751b90944022', 'DISTRIBUIDORA 3S CA CLAVOS GUAYANA', '', '', '04148609337', 1),
('6751b91e70d90', 'DISTRIBUIDORA NUEVO AMANECER', '', '', '0', 1),
('6751b93bc13e2', 'DISTRIBUIDORA CLASICO', '', '', '04128888878', 1),
('6751b95ede187', 'EDUARDO TORRES- PATRULLEROS APY', '', '', '0', 1),
('6751b978394d5', 'ERICK GIL', '', '', '04149801533', 1),
('6751b993ab8c0', 'ESTRUCTURA FITNESS', '', '', '04249513703', 1),
('6751b9af818ab', 'FERRETERIA HERCULES', '', '', '04148889574', 1),
('6751b9ccc7464', 'CRUZ VIANNEY ALFONZO', '', '', '04124991274', 1),
('6751b9e417ab9', 'GIMETAL HIERRO', '', '', '04148583287', 1),
('6751ba049cecc', 'GLADYS BAES', '', '', '04148503375', 1),
('6751ba2596258', 'GLIRALYZ BONIFAZ', '', '', '04121838853', 1),
('6751ba3f74a3e', 'INVERSIONES HERMOSA ORIENTAL', '', '', '0', 1),
('6751ba55d9842', 'INVERSIONES LA CANDELARIA', '', '', '0', 1),
('6751ba73067d8', 'KELVEN HE CAI', '', '', '50683331208', 1),
('6751bc0cb8f4a', 'LENNYS RODIGUEZ', '', '', '04149986933', 1),
('6751bc38b076b', 'LEONARDO VERA', '', '', '04262914381', 1),
('6751bc4e09288', 'LICOR GUAYANA', '', '', '04148750323', 1),
('6751bc6535153', 'LINDA LEE', '', '', '50683331208', 1),
('6751bca628440', 'MADERERA TROPICAL', '', '', '04140961730', 1),
('6751bd15bd7f8', 'MARKETPLUS /J-500875835', '', '', '04249007237', 1),
('6751bd627b629', 'MARLON MAESTRE', '', '', '04249648901', 1),
('6751bdc076b43', 'MAXIM GUAYANA C.A (JESSICA)', '', '', '04128757713', 1),
('6751bde7a6abd', 'METALES FUNDICION GIAMBRA ( MARIO GIAMBRA)', '', '', '0', 1),
('6751bdff71d50', 'NORIZA NERY', '', '', '04143868344', 1),
('6751be2ce20fa', 'PANADERIA H&M/ J-413197480', '', '', '04249530608', 1),
('6751bec5c6fec', 'PDVSA GAS-PLANTA CHIRICA', '', '', '04128773726', 1),
('6751beeb9add7', 'PNB COMANDO GUAIPARO', '', '', '04249123710', 1),
('6751bf08ab997', 'RACHEL FUENTES', '', '', '04249083900', 1),
('6751bf2356b5f', 'RIGOLUIS ROA', '', '', '0', 1),
('6751bf447947d', 'RONDON HURTADO OSVALDO', '', '', '04148927062', 1),
('6751bf7a0e339', 'SEBIN-COMANDO (APY)', '', '', '0', 1),
('6751bfab71e6f', 'SERVICIOS Y SUMINISTROS T&A', '', '', '0', 1),
('6751bff40c58b', 'SUPERMERCADOS GIRASOL', '', '', '04128890807', 1),
('6751c082983ae', 'SHASAM KASEN', '', '', '04249316783', 1),
('6751c0b4d1912', 'TRANSCARGA RORAIMA ( MARIO GIAMBRA)', '', '', '0', 1),
('6751c0b4e2e0a', 'TRANSCARGA RORAIMA ( MARIO GIAMBRA)', '', '', '0', 1),
('6751c0dbf2d15', 'WU YONGLANG', '', '', '50683331208', 1),
('6751c0f93d181', 'YANITZA SANCHEZ', '', '', '04140912809', 1),
('6751c1167005f', 'YELITZA MO', '', '', '04128799999', 1),
('6751c14050a3e', 'YENISER MALAVE', '', '', '04121146375', 1),
('6751c16cb23fb', 'CARNICERIA PADRE E HIJO ', '', '', '04149801533', 1),
('6751c1ad82fba', 'DARQUIS LEITANO (BRISAS DEL PARAISO) POSADA', '', '', '04121190016', 1),
('6751c1e5ac76c', 'VENTA DE RESPUESTO ( AV MANUEL PIAR) DIESEL ', '', '', '04249350935', 1),
('6751c21c8775f', 'AUTOS JADI ( LAS BATALLAS)', '', '', '04121946716', 1),
('6751c21c9ed1b', 'AUTOS JADI ( LAS BATALLAS)', '', '', '04121946716', 1),
('6751c24787c3b', 'DISTRUIBUIDORA JADI', '', '', '04121946716', 1),
('6751c2610ef44', 'FARMACIA EL FORTIN', '', '', '04148746002', 1),
('6751c279a2a60', 'PANADERIA CORAZON DE TRIGO', '', '', '04148746002', 1),
('6751c291279c3', 'PNB REDOMA DEL DORADO', '', '', '04242228245', 1),
('6751c2b9c2cf3', 'AGROPECUARIA MANUEL PIAR', '', '', '04128888878', 1),
('6751c557252d0', 'LUIS SALAZAR', '', '', '04121072762', 1),
('6751c59302087', 'JEAN CARLOS REVELO', '', '', '04167258524', 1),
('6751c5ab7503e', 'PDVSA GAS ADMINISTRATIVA', '', '', '0', 1),
('6751c5c7da5e8', 'DEIVI ALCALA', '', '', '04249311532', 1),
('6751c608ac2ae', 'ROSMERY SOLORZANO', '', '', '04264148147', 1),
('6751c6c442286', 'AGROPECUARIA GOUBEY', '', '', '04121888889', 1),
('6751c6eb1bcbf', 'GOUWEI HE', '', '', '04121888889', 1),
('6751c6fdae8a6', 'EDGAR COLINA', '', '', '0', 1),
('6751c718a02c3', 'COMERCIAL VISTA ALEGRE', '', '', '0', 1),
('6751c73f71d22', 'ELIASIS ALCALA', '', '', '04126998339', 1),
('6751c7524e9f5', 'MADERA EL ROBLE', '', '', '0', 1),
('6751c7bfbfa2b', 'YOILIVER MIRANDA', '', '', '0', 1),
('6751c7de527c5', 'YURIDI RODRIGUEZ', '', '', '04128693899', 1),
('6751c801209f7', 'VIPLACA', '', '', '04148968610', 1),
('6751c83dae7f9', 'ENRIQUE MATA', '', '', '04121844927', 1),
('6751c8642685b', 'AGROPECUARIA LA FORTUNA ', '', '', '04128616106', 1),
('6751c87e3fdbd', 'FRANNY CARVAJAL', '', '', '04249410061', 1),
('6751c89aee3c1', 'CHISTHOFER GRANADOS', '', '', '04129250826', 1),
('6751c8af1b165', 'JOSELIN GRADO', '', '', '04121014151', 1),
('6751c8c66f0ed', 'GLOBAL MOTORS', '', '', '04129691382', 1),
('6751c8e3e7fb0', 'COMANDO MACAGUA ', '', '', '04242664989', 1),
('6751c8f77ee62', 'ROSA ROJAS', '', '', '04120817512', 1),
('6751c90f40cf1', 'DESTACAMENTO GBN625', '', '', '0', 1),
('6751c929b3540', 'ANDREINA ALCANTARA', '', '', '04262975465', 1),
('6751c944c1c78', 'YENEIRA HERNANDEZ', '', '', '04127965545', 1),
('6751c95974a52', 'ANGEL BERMUDEZ', '', '', '04249699536', 1),
('6751c978236df', 'BASANTA GUAIPARO', '', '', '04121571853', 1),
('6751c99589229', 'CAÑA EXPRESS', '', '', '04249686896', 1),
('6751c9ac77c7e', 'MANUEL PIAR MOTORS', '', '', '0', 1),
('6751c9c1bac29', 'PLASTIC EMPAQUEZ', '', '', '0', 1),
('6751c9d90fecc', 'ELIZABETH GRANADO', '', '', '04249437655', 1),
('6751c9f065cd1', 'DINALBA CONTRERAS', '', '', '04128334309', 1),
('6751ca034219d', 'HAFEZ ASAAD', '', '', '0', 1),
('6751ca17843c8', 'CAUCHOS VIDA GUAYANA', '', '', '0', 1),
('6751ca2806e00', 'EDGAR YEPEZ', '', '', '0', 3),
('6751ca281c9d8', 'EDGAR YEPEZ', '', '', '0', 1),
('6751ca4098f5b', 'MAURO PARQUE LOS MAGOS', '', '', '0', 1),
('6751ca55ab49c', 'RESPUESTOS AMAMARK', '', '', '0', 1),
('678577c7f0522', 'ADONAI ARZOLAY', '', '', '04249590027', 1),
('678577ee251d6', 'ALEJANDRA GALVAN', '', '', '04143884952', 1),
('678578176b6df', 'ALI QUINCASIA', '', '', '04127231711', 1),
('678578503d7f1', 'ANIUSKA MEDINA', '', '', '04121188702', 1),
('6785787003235', 'BALNEARIO EL FARO', '', '', '04249209586', 1),
('678578c11dc48', 'BALNEARIO RIO GRANDE', '', '', '04126954450', 1),
('678578d660fbc', 'CARLOS HERNANDEZ', '', '', '04249070468', 1),
('678578f027186', 'COMANDO CARUACHI', '', '', '04140522642', 3),
('678578f03cbdc', 'COMANDO CARUACHI', '', '', '04140522642', 1),
('6785790d2059d', 'COMANDO GN 625 SIDOR', '', '', '04249089834', 1),
('6785792bbb8e4', 'COMANDO GN ANTIDROGAS', '', '', '04122019877', 1),
('6785794fd0e72', 'COMISARIA ALTO CARONI', '', '', '0', 1),
('6785796992e26', 'DEYANIRA BOLIVAR', '', '', '0', 1),
('67857989c797d', 'EMPRESAS ELOHIN', '', '', '04148935961', 1),
('678579977e547', 'FAES', '', '', '0', 1),
('678579ad10ba1', 'FRANK GUEDEZ', '', '', '04265942098', 1),
('678579c28f2f6', 'FUNDICION GOMETAL', '', '', '0', 1),
('678579e0ca04a', 'HIPERMERCADO 5 ESTRELLAS', '', '', '04126681542', 1),
('678579fb9209d', 'HIPERMERCADO LAS VILLAS', '', '', '04148920013', 1),
('67857a11aaeb4', 'HIERROS MAN', '', '', '04147653698', 1),
('67857a3ee1ff3', 'INVERSIONES CARIBE IMPOT', 'J-313499610', '', '04148712722', 1),
('67857a58ae6b1', 'INV FRAN DUART', '', '', '0', 1),
('67857a6f36e27', 'INV CARIDAD MATRIZ', '', '', '0', 1),
('67857a876a7e9', 'JAVIER MORENO', '', '', '04249524302', 1),
('67857aab5568d', 'JOSE ESCOROHUELA', '', '', '04140522642', 1),
('67857ada01faf', 'JOSE FRANCISCO BERMUDEZ', 'V-26.073.329', '', '04249289557', 1),
('67857afe6cc1f', 'JOSE HERNANDEZ', 'V-5.553.711', '', '04267952025', 1),
('67857b132878c', 'JOSE VERA', '', '', '04249617330', 1),
('67857b29247f7', 'JOYMER FAJARDO', '', '', '04148675898', 1),
('67857b5d41db8', 'KENDY MO', '', '', '04249069620', 1),
('67857b72ebb2c', 'LA CARIDAD 335', '', '', '0', 1),
('67857b8718d29', 'LIONEL GOMEZ', '', '', '04148641495', 1),
('67857ba8a5712', 'LORENNYS BERMUDEZ', '', '', '04249559625', 1),
('67857bbeb4f95', 'MAGDA TORRES', '', '', '04249684675', 1),
('67857bd9b7966', 'MARIA BERMUDEZ (MIMA)', '', '', '04148577283', 1),
('67857bed819b3', 'MIRNA BOLIVAR', '', '', '0', 1),
('67857c0a74c91', 'MONICA GONZALEZ', '', '', '04148682684', 1),
('67857c26a51e0', 'NIDIA BOLIVAR', '', '', '0', 1),
('67857c3e16604', 'OLIKA DAVILA', '', '', '04128339371', 1),
('67857c53e1c1f', 'POSADA SAN PAULO', '', '', '04148766131', 1),
('67857c63ce79b', 'RAFAEL QUINTANA', '', '', '0', 1),
('67857c79a192b', 'RESTAURANTE KAMA', '', '', '04121583518', 1),
('67857c9f1ad38', 'SERV Y SUMIN MF ZI 321', '', '', '04249239149', 1),
('67857cb6ac27e', 'SERGIO DE ALMEIDA', '', '', '04148770065', 1),
('67857ccf44daa', 'SMITH SANCGEZ', '', '', '04249050565', 1),
('67857ce24ecba', 'VALERIA RODRIGUEZ', '', '', '0', 1),
('67857d10ccee5', 'VICTORTRACTORS C.A', '', '', '04145469792', 1),
('67857d2d5691a', 'WENDY GARCIA ', '', '', '04148651219', 1),
('67857d456dd82', 'ZHENWEN YU', '', '', '04249339733', 1),
('67857d76a4f63', 'MAQUINARIA KOPPERN C. A (UD 321)', '', '', '04249469751', 1),
('67857d9a01842', 'CARONI SEALS C.A (UD 321)', '', '', '04148825526', 1),
('67857dbe1537f', 'RECUPERADORA GIAMBRA C.A (CORE 8)', '', '', '0', 1),
('67857dd55d623', 'YARZAN SAMARA', '', '', '04128902222', 1),
('67857e08cdbca', 'KELYANNIS SIFONTES', '', '', '04148176312', 1),
('67857e25a9509', 'QUINCASIA 3 VILLAS DEL VALLE', '', '', '04127231711', 1),
('67857e4deca98', 'CARLOS RINCONES (ANABELL GARCIA)', '', '', '04148801065', 1),
('67857e634e652', 'INVERSIONES JPM', '', '', '04148974353', 1),
('6786615b86418', 'TONY CURAGUA', '', '', '04121932932', 1),
('6786622841f12', 'ANTONIO LARA', '', '', '04269210811', 1),
('678662434aa2c', 'CAROL VELASQUEZ', '', '', '04121165771', 1),
('67866504c4b91', 'ARACELIS MATAMOROS', '', '', '04148722399', 1),
('6786652723aea', 'EMILIO GARCIA', '', '', '04124642336', 1),
('6786657e57979', 'CORPOEZ PEAJE', '', '', '0', 1),
('678665977fad7', 'MILAGROS RODRIGUEZ', '', '', '04249236820', 1),
('678665b5d3dcf', 'VEMBRAZ C.A 321', '', '', '04129661440', 1),
('678665ce8b77d', 'GENESIS FERNANDEZ', '', '', '04120238149', 1),
('678665eb06958', 'ROSIBEL MUÑOZ', '', '', '04148884023', 1),
('678666412d46d', 'YUSMELIS URDANETA (MAMA DANIEL CEDEÑO)', '', '', '04165659901', 1),
('67866663abb4e', 'JHOANA BELLO ', '', '', '04128353200', 1),
('67866678e4b7e', 'NATALIA GOITE', '', '', '04249159680', 1),
('678666914721d', 'MORELLA CARVAJAL', '', '', '04128688737', 1),
('678666a33a80a', 'ZULIMAR MAIZ', '', '', '0', 1),
('678666b252090', 'FUNDACION LALA', '', '', '0', 1),
('678666e37dddc', 'REINALDO DIAZ', 'V-13646663', '', '0', 1),
('6786671434e87', 'DRUSCAR', '', '', '0', 1),
('678667289da1f', 'ELIANNIS RIVAS', '', '', '0', 1),
('6786673b9bd8e', 'INDUSTRIA ANTONELY', '', '', '0', 1),
('6786675127d6a', 'RITA QUERO', '', '', '0', 1),
('67866763ceb54', 'FERIA EL BULULU', '', '', '0', 1),
('6786677f3762b', 'ANDREINA FUNDORA', '', '', '0', 1),
('678667928e474', 'RENZO PERDOMO', '', '', '04146224233', 1),
('678667a6895de', 'PAOLA VASQUEZ', '', '', '0', 1),
('678667b4560ab', 'ROBERTO MO', '', '', '0', 1),
('678667cd26b70', 'MARIO GIAMBRA', '', '', '04148936419', 1),
('678667ea2eb42', 'HERNAN ESPARRAGOZA', '', '', '04249166995', 1),
('678667fceeffa', 'AGUSTIN LARA', '', '', '04249107103', 1),
('6786680db2802', 'NEYMAR FIGUERA', '', '', '0', 1),
('6786681e9b965', 'EDUARDO MATANZAS', '', '', '0', 1),
('6786682f486c1', 'ELBA GONZALEZ', '', '', '0', 1),
('67866845638bc', 'VIVERO RIO GRANDE', '', '', '0', 1),
('6786685cbd467', 'JHOANDRIS CASTILLO', '', '', '04127223740', 1),
('6786687a26c1b', 'RAOUZAN FAYSAL', '', '', '0', 1),
('6786688f82ee4', 'ROSBIANNY RODRIGUEZ', '', '', '0', 1),
('678668a0efe43', 'FRANCIS GUANARE', '', '', '0', 1),
('678668b1dcaea', 'LIVIS PORT', '', '', '0', 1),
('678668c196b65', 'MAXIN GUAYANA', '', '', '0', 1),
('678668d53b619', 'GERALDINE ROBERTO', '', '', '0', 1),
('678668fe4e856', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668fe645e8', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668fe864ee', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668feb0908', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668fec9296', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668fedbcaa', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668ff37b29', 'ENRIQUE SUAZO ', '', '', '0', 3),
('678668ff49605', 'ENRIQUE SUAZO ', '', '', '0', 1),
('6786693e17382', 'ROBERSY ', '', '', '0', 1),
('678669e8a55e7', 'ZORIELIS PEREZ', '', '', '0', 1),
('678669fc0db33', 'YOSBERT GUZMAN', '', '', '0', 1),
('67866a160cb9b', 'ALEXANDER MENDEZ', '', '', '0', 1),
('67866bdd59e9e', 'VINDA ALBARRAN', '', '', '0', 1),
('67866bfa7c355', 'BELKIS CHARAMAS', '', '', '0', 1),
('67866c117ed54', 'DIMEGLIS MARTINEZ', '', '', '0', 1),
('67866c3d02ad8', 'WILMARYS SALAZAR', '', '', '0', 3),
('67866c3d2f82f', 'WILMARYS SALAZAR', '', '', '0', 3),
('67866c3d478f8', 'WILMARYS SALAZAR', '', '', '0', 1),
('67866d1bb9e9c', 'ALBA LAREZ ( FERIA EL GUARO)', '', '', '04249041292', 1),
('678676a58f1ef', 'DISTRIBUIDORA JADI', '', '', '04121946716', 1),
('67867869f1fb7', 'FARMADOS', '', '', '0', 1),
('67894d9a22ce8', 'JOVANNI FRANCO', '20975144', 'JOVANNIFRANCO@GMAIL.COM', '04249265304', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cliente_estatus`
--

CREATE TABLE `tabla_cliente_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cliente_estatus`
--

INSERT INTO `tabla_cliente_estatus` (`id`, `estatus`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Borrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_data`
--

CREATE TABLE `tabla_cobranza_data` (
  `id` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `orden` varchar(20) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `nodo` varchar(20) NOT NULL,
  `plan` int(11) DEFAULT NULL,
  `monto` decimal(28,4) NOT NULL,
  `abono` decimal(28,4) DEFAULT 0.0000,
  `detalle` varchar(300) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_estatus`
--

CREATE TABLE `tabla_cobranza_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_estatus`
--

INSERT INTO `tabla_cobranza_estatus` (`id`, `estatus`) VALUES
(1, 'Cobro Pendiente'),
(2, 'Cobro Liquidado'),
(3, 'Cobro Abonado'),
(4, 'Cobro Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_pago`
--

CREATE TABLE `tabla_cobranza_pago` (
  `id` int(11) NOT NULL,
  `orden` varchar(20) NOT NULL,
  `nota` varchar(20) NOT NULL,
  `pago` decimal(28,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_data`
--

CREATE TABLE `tabla_contrato_data` (
  `id` varchar(20) NOT NULL,
  `fecha_apertura` date NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `plan` int(11) NOT NULL,
  `nodo` int(11) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `estatus` int(11) NOT NULL,
  `saldo` decimal(28,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_data`
--

INSERT INTO `tabla_contrato_data` (`id`, `fecha_apertura`, `cliente`, `contrato`, `plan`, `nodo`, `direccion`, `estatus`, `saldo`) VALUES
('678e3b8d2f075', '2025-01-01', '67894d9a22ce8', 'C-001/2025', 1, 1, 'mi casa', 1, 0.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_estatus`
--

CREATE TABLE `tabla_contrato_estatus` (
  `id` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_estatus`
--

INSERT INTO `tabla_contrato_estatus` (`id`, `estatus`) VALUES
(1, 'Nuevo'),
(2, 'Antiguo'),
(3, 'Anulado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_nodo`
--

CREATE TABLE `tabla_contrato_nodo` (
  `id` int(11) NOT NULL,
  `nodo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_nodo`
--

INSERT INTO `tabla_contrato_nodo` (`id`, `nodo`) VALUES
(1, 'NODO SAN FELIX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_plan`
--

CREATE TABLE `tabla_contrato_plan` (
  `id` int(11) NOT NULL,
  `plan` varchar(50) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `costo` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_plan`
--

INSERT INTO `tabla_contrato_plan` (`id`, `plan`, `detalle`, `costo`) VALUES
(1, 'PLAN BASICO', 'Servicio de 40 MB de Velocidad de Internet', 25.0000),
(5, 'Contrato Servicio', 'cosas de servicio', 0.0000),
(7, 'PLAN 50', 'PLAN DE 50 MB', 50.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_departamento_data`
--

CREATE TABLE `tabla_departamento_data` (
  `id` int(11) NOT NULL,
  `link` varchar(20) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_departamento_data`
--

INSERT INTO `tabla_departamento_data` (`id`, `link`, `departamento`, `modulo`) VALUES
(1, 'contrato', 'Gestion De Contratos', 1),
(2, 'cliente', 'Gestion De Cliente', 1),
(3, 'cobranza', 'Gestion De Cobranza', 2),
(4, 'pago', 'Gestion De Pagos', 2),
(5, 'herramientas', 'Herramientas De Sistema', 3),
(6, 'usuario', 'Gestion de Usuario', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_accion_data`
--

CREATE TABLE `tabla_depart_accion_data` (
  `id` int(11) NOT NULL,
  `accion` varchar(10) NOT NULL,
  `departamento` int(11) NOT NULL,
  `opcion` varchar(15) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_boton_data`
--

CREATE TABLE `tabla_depart_boton_data` (
  `id` int(11) NOT NULL,
  `boton` varchar(20) NOT NULL,
  `usuario` int(11) NOT NULL,
  `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_depart_boton_data`
--

INSERT INTO `tabla_depart_boton_data` (`id`, `boton`, `usuario`, `departamento`) VALUES
(1, '#btn_ver', 2, 3),
(2, '#btn_auto', 2, 3),
(3, '#btn_reg', 2, 2),
(4, '#btn_reg', 2, 4),
(5, '#btn_ver', 2, 4),
(6, '#btn_report', 2, 4),
(7, '#btn_reg', 2, 2),
(8, '#btn_ver', 2, 2),
(9, '#btn_report', 2, 2),
(13, '#btn_reg', 2, 2),
(14, '#btn_ver', 2, 2),
(15, '#btn_report', 2, 2),
(16, '#btn_reg', 2, 3),
(17, '#btn_ver', 2, 3),
(18, '#btn_report', 2, 3),
(19, '#btn_auto', 2, 3),
(23, '#btn_report', 2, 2),
(24, '#btn_ver', 2, 2),
(25, '#btn_report', 2, 4),
(26, '#btn_ver', 2, 4),
(27, '#btn_report', 2, 2),
(28, '#btn_ver', 2, 2),
(41, '#btn_ver', 2, 2),
(42, '#btn_ver', 2, 2),
(43, '#btn_reg', 2, 1),
(44, '#btn_ver', 2, 1),
(45, '#btn_report', 2, 1),
(46, '#btn_reg_nodo', 2, 5),
(48, '#btn_reg_tasa', 2, 5),
(49, '#btn_reg_plan', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_usuario_data`
--

CREATE TABLE `tabla_depart_usuario_data` (
  `id` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_depart_usuario_data`
--

INSERT INTO `tabla_depart_usuario_data` (`id`, `departamento`, `usuario`) VALUES
(48, 6, 2),
(56, 2, 2),
(57, 3, 2),
(63, 4, 2),
(69, 1, 2),
(72, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_empresa_data`
--

CREATE TABLE `tabla_empresa_data` (
  `id` int(11) NOT NULL,
  `empresa` varchar(200) NOT NULL,
  `rif` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_modulo_data`
--

CREATE TABLE `tabla_modulo_data` (
  `id` int(11) NOT NULL,
  `modulo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_modulo_data`
--

INSERT INTO `tabla_modulo_data` (`id`, `modulo`) VALUES
(1, 'Modulo Administrativo'),
(2, 'Modulo de Ventas'),
(3, 'Ajuste de Sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_modulo_usuario_data`
--

CREATE TABLE `tabla_modulo_usuario_data` (
  `id` int(11) NOT NULL,
  `modulo` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_modulo_usuario_data`
--

INSERT INTO `tabla_modulo_usuario_data` (`id`, `modulo`, `usuario`) VALUES
(77, 2, 2),
(78, 3, 2),
(80, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_data`
--

CREATE TABLE `tabla_pago_data` (
  `id` varchar(20) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `nota` varchar(20) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `forma_pago` int(11) NOT NULL,
  `detalle_pago` int(11) NOT NULL,
  `monto_dolar` decimal(28,4) NOT NULL,
  `fecha_pago` date NOT NULL,
  `tasa` decimal(28,4) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `monto_cambio` decimal(28,4) DEFAULT NULL,
  `monto_pago` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_forma`
--

CREATE TABLE `tabla_pago_forma` (
  `id` int(11) NOT NULL,
  `forma` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_forma`
--

INSERT INTO `tabla_pago_forma` (`id`, `forma`) VALUES
(1, 'Banco'),
(2, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_forma_detalle`
--

CREATE TABLE `tabla_pago_forma_detalle` (
  `id` int(11) NOT NULL,
  `detalle` varchar(30) NOT NULL,
  `forma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_forma_detalle`
--

INSERT INTO `tabla_pago_forma_detalle` (`id`, `detalle`, `forma`) VALUES
(1, 'Transferencia', 1),
(2, 'Pago movil', 1),
(3, 'Efectivo Bs', 2),
(4, 'Efectivo $', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_tasa_data`
--

CREATE TABLE `tabla_tasa_data` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tasa` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_usuario_data`
--

CREATE TABLE `tabla_usuario_data` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasenna` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_usuario_data`
--

INSERT INTO `tabla_usuario_data` (`id`, `nombre`, `usuario`, `contrasenna`, `fecha_registro`) VALUES
(2, 'jovanni Franco', 'jfranco', '$2y$10$HDqEXRehVxbDO5ppzOmtMONTGOGDHC./j/N7YV05SMBSX1Sup8X5.', '2024-10-19'),
(4, 'Cloris Carvajal', 'Tecchar1', '$2y$10$bTkmIad9FQbemV4RxrTFJeX0M3eRLs9ma0lzIoo68S/LYXQKX.rca', '2024-10-03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tabla_cliente_data`
--
ALTER TABLE `tabla_cliente_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estatus_fk_c` (`estatus`);

--
-- Indices de la tabla `tabla_cliente_estatus`
--
ALTER TABLE `tabla_cliente_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_data`
--
ALTER TABLE `tabla_cobranza_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_data`
--
ALTER TABLE `tabla_contrato_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_fk_c` (`plan`),
  ADD KEY `cliente_fk_c` (`cliente`),
  ADD KEY `estado_fk_c` (`estatus`);

--
-- Indices de la tabla `tabla_contrato_estatus`
--
ALTER TABLE `tabla_contrato_estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_nodo`
--
ALTER TABLE `tabla_contrato_nodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_contrato_plan`
--
ALTER TABLE `tabla_contrato_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_departamento_data`
--
ALTER TABLE `tabla_departamento_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_accion_data`
--
ALTER TABLE `tabla_depart_accion_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_boton_data`
--
ALTER TABLE `tabla_depart_boton_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_depart_usuario_data`
--
ALTER TABLE `tabla_depart_usuario_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_modulo_data`
--
ALTER TABLE `tabla_modulo_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_modulo_usuario_data`
--
ALTER TABLE `tabla_modulo_usuario_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_data`
--
ALTER TABLE `tabla_pago_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_forma`
--
ALTER TABLE `tabla_pago_forma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_pago_forma_detalle`
--
ALTER TABLE `tabla_pago_forma_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_tasa_data`
--
ALTER TABLE `tabla_tasa_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tabla_usuario_data`
--
ALTER TABLE `tabla_usuario_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tabla_cliente_estatus`
--
ALTER TABLE `tabla_cliente_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_estatus`
--
ALTER TABLE `tabla_contrato_estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_nodo`
--
ALTER TABLE `tabla_contrato_nodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_plan`
--
ALTER TABLE `tabla_contrato_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tabla_departamento_data`
--
ALTER TABLE `tabla_departamento_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_accion_data`
--
ALTER TABLE `tabla_depart_accion_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_boton_data`
--
ALTER TABLE `tabla_depart_boton_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_usuario_data`
--
ALTER TABLE `tabla_depart_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_data`
--
ALTER TABLE `tabla_modulo_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_usuario_data`
--
ALTER TABLE `tabla_modulo_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma`
--
ALTER TABLE `tabla_pago_forma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma_detalle`
--
ALTER TABLE `tabla_pago_forma_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_tasa_data`
--
ALTER TABLE `tabla_tasa_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_usuario_data`
--
ALTER TABLE `tabla_usuario_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
