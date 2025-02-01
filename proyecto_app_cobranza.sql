-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-02-2025 a las 12:41:04
-- Versión del servidor: 8.0.19
-- Versión de PHP: 7.4.4

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
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_apel` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `documento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estatus` int NOT NULL DEFAULT '1'
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
('671fd904322bb', 'NELSON JOSE GUTIERREZ ', 'V-20.030.472', '', '0424-9492590', 1),
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
('671fe10071660', 'CHINO CAO VILLA ALIANZA', '', '', '04121858175', 3),
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
('671fe3a35e653', 'TRANSPORTE CAPELLA', '', '', '0', 1),
('671fe3c18cdbf', 'RUBEN AMAIZ', '', '', '0', 1),
('671fe3de85bf2', 'DAILINIS MARCO', '', '', '0', 1),
('671fe3efc5cd9', 'MIRNA TORRES', '', '', '0', 1),
('671fe4048ff92', 'NELIDA MARTINEZ', '', '', '0', 1),
('671fe41ee8c65', 'ZEGA GAS C.A PISO 6', '', '', '0', 1),
('671fe43a31533', 'ELVIRA OCANDO', '', '', '04248194724', 1),
('671fe44e1c92b', 'ANTONIO GOMEZ', '', '', '0', 1),
('671fe47ce5e16', 'EVERGITO URDANETA', 'V-4.592.147', 'EVERTOPCA@GMAIL.COM', '0414-8775757', 1),
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
('67214346c8dbd', 'NORIS CARDOZO', 'V-12.360.481', '', '0416-7914231', 1),
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
('678578503d7f1', 'ANIUSKA MEDINA', 'V-10.934.736', '', '0412-1188702', 1),
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
('67857a876a7e9', 'JAVIER MORENO', 'V-17.429.345', '', '0424-9524302', 1),
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
('67857ccf44daa', 'SMITH SANCHEZ', '', '', '04249050565', 1),
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
('67857e634e652', 'INVERSIONES JPG', '', '', '04148974353', 1),
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
('678666e37dddc', 'REINALDO DIAZ', 'V-13.646.683', 'REINALDO.DFLORES@GMAIL.COM', '0', 1),
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
('67894d9a22ce8', 'JOVANNI FRANCO', '20975144', 'JOVANNIFRANCO@GMAIL.COM', '04249265304', 1),
('679110cf8550e', 'SUMINISTRO MYF C.A', '', '', '0', 1),
('679112a26f872', 'INV. FRANDUAR C.A', '', '', '0', 1),
('6791407e5a886', 'LORENNYS BASTARDO', '', '', '0', 1),
('679141719ace7', 'LEONEL GOMEZ', '', '', '0', 1),
('679141d618847', 'MIRNA MONTEVERDE', '', '', '0', 1),
('67914769744c6', 'CARLOS VELAZQUEZ', '', '', '0', 1),
('679148e45dcb7', 'ROXIBEL MUÑOZ', 'V-19.094.697', '', '0414-8884023', 1),
('67914a1d2b73a', 'ALEXANDER TOVAR', '', '', '0', 1),
('67914b97cacb0', 'LORISBEL  CORTEZ', '', '', '0', 1),
('67914df19ad9d', 'PAOLA VELASQUEZ', '', '', '0', 1),
('67914e70e9245', 'CANTERA URIACO', '', '', '0', 1),
('67914f05bd6cf', 'MG MATANZAS', '', '', '0', 1),
('67914fb6e718f', 'JOHANDRYS CASTILLO', '', '', '0', 1),
('679150e9dea0f', 'YOSERT GUZMAN', '', '', '0', 1),
('67915159214a9', 'ROSELIS GUTIERREZ', '', '', '0', 1),
('679152656efbe', 'BELKIS CHARAMAS', '', '', '0', 1),
('6791552808cbe', 'YDALMY GUEDEZ', '', '', '0', 1),
('6791556ff1e02', 'JOSE RODRIGUEZ', '', '', '0', 1),
('679155c397243', 'JUSSEM EL BAROUKI', '', '', '0', 1),
('679155d6390b8', 'FAES', '', '', '0', 1),
('679155ed65c77', 'MAMA JOSE', '', '', '0', 1),
('67915c0591696', 'MARIA JOSE ZEREZ', 'J-50090296-4', '', '0424-9164550', 1),
('679387a8902af', 'FRANCISCO BERMUDEZ', '', '', '0', 1),
('6793a4eb83f72', 'MARIA MARIN ( MAYOR MENDEZ)', '', '', '0', 1),
('6793a6bdb6362', 'ERNETO RIVERO', '', '', '0', 1),
('6793cefabc73e', 'KAROL CONTRERAS', 'V-14.510.499', 'KIANXOC@GMAIL.COM', '04148922643', 1),
('6793dd37afeeb', 'CARLOS ALVAREZ', '', '', '0', 1),
('6793e01ea83a6', 'CHRYSTIANS JAIMES', '', '', '0', 1),
('6793e1388bf77', 'ESUNAIDA ABBOUDE', '', '', '0', 1),
('6793e1c173192', 'CORPOEZ OFICINA', '', '', '0', 1),
('6793e2237576b', 'ISIS PAMPHIL', '', '', '0', 1),
('6793e28674bb4', 'OSCAR HAYEK', '', '', '0', 1),
('6793e3c70b3d6', 'CARLOS ALVAREZ LOCAL 63', '', '', '0', 1),
('6793e410717bd', 'ROSSENARIET DENT', '', '', '0', 1),
('6793f4a158196', 'CAO ZHIMING', 'E-84.415.792', '', '0412-1858175', 1),
('6793f692146c4', 'NELLYDA MARTIN', '', '', '0', 3),
('6793f69260add', 'NELLYDA MARTIN', '', '', '0', 3),
('6793f69284b40', 'NELLYDA MARTIN', '', '', '0', 1),
('6793f6f51cd47', 'YENNY OCANDO', '', '', '0', 1),
('6793f7d3b3e5d', 'ADRIAN HE HEXIE', '', '', '0', 1),
('6793f83c57b76', 'RICARDO LIZARRAGA', '', '', '0', 1),
('6793f83c639da', 'RICARDO LIZARRAGA', '', '', '0', 3),
('6793f8d3b9c81', 'COMANDATE CARONOCO', '', '', '0', 1),
('6793f936811db', 'HASSAN RMAITY', '', '', '0', 1),
('6793f982a9483', 'ISNOBEL BALBA', '', '', '0', 1),
('6793f9c2b2ffb', 'JOHANNA CASADO HERNANDEZ', 'V-13.336.543', 'JOCAHER18@GMAIL.COM', '+56948190306-04249339556', 1),
('6793fa0e81dd0', 'NAYELIS ASCANIO', '', '', '0', 1),
('6793fa4a11d26', 'BYCLAU', '', '', '0', 1),
('6793fa8bdde8c', 'ELIAS NAJUL', '', '', '0', 1),
('6793fb0a9dc74', 'WHITNEY PEREZ', '', '', '0', 1),
('6793fb480b69a', 'MARCOS DAMA', '', '', '0', 1),
('6793fb901a606', 'DIRECCION DE OPERACIONES', '', '', '0', 1),
('6793fc5bc2f49', 'EDMIR MILANO', 'V-13.911.776', 'DIMACUS5@GMAIL.COM', '04149983446', 1),
('6797c80bc98f6', 'ANA DUERTO', 'V-14.804.556', 'ADUERTO150580@GMAIL.COM', '04249505974', 1),
('67993626515a0', 'KALIAR GUILLEN', 'V-13.611.002', 'GUILLENKALIAR@GMAIL.COM', '0424-9348409', 1),
('6799370c3acd2', 'CESARE C.A', 'J-30569399-4', 'JORGEARIASH@HOTMAIL.COM', '0414-3866517', 1),
('679a248bdec88', 'JORGE JIMENEZ', 'V-14.960.974', 'JORGEJIMENEZ81@GMAIL.COM', '0424-9327952', 1),
('679a25fd83bdb', 'MARIANA VILLEGAS', 'V-15.185.219', 'MARIANAVILLEOS21@GMAIL.COM', '0414-8970731', 1),
('679b9a9745df1', 'SIGMAURIS MARTINEZ', '', '', '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cliente_estatus`
--

CREATE TABLE `tabla_cliente_estatus` (
  `id` int NOT NULL,
  `estatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `orden` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrato` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nodo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plan` int DEFAULT NULL,
  `monto` decimal(28,4) NOT NULL,
  `abono` decimal(28,4) DEFAULT '0.0000',
  `detalle` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_data`
--

INSERT INTO `tabla_cobranza_data` (`id`, `fecha_creacion`, `orden`, `contrato`, `cliente`, `nodo`, `plan`, `monto`, `abono`, `detalle`, `estatus`) VALUES
('67938efaa68b0', '2025-01-24', 'OC-001/2025', '67913b8504aa6', '678578c11dc48', '2', 7, '50.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efadce02', '2025-01-24', 'OC-002/2025', '67913ba6771fa', '67857d10ccee5', '2', 7, '50.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efb16efa', '2025-01-24', 'OC-003/2025', '6791451734358', '67857989c797d', '2', 7, '50.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efb6151a', '2025-01-24', 'OC-004/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('67938efbb540a', '2025-01-24', 'OC-005/2025', '6791153101dd1', '67857b132878c', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efbd20d4', '2025-01-24', 'OC-006/2025', '67913ad111ff2', '678577ee251d6', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efbf00b5', '2025-01-24', 'OC-007/2025', '67913d042cac4', '67857c3e16604', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efc1c5a6', '2025-01-24', 'OC-008/2025', '67913e99b9155', '6785787003235', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efc43752', '2025-01-24', 'OC-009/2025', '67913ee377279', '67857a876a7e9', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efc6c14f', '2025-01-24', 'OC-010/2025', '67913fe496100', '67857c79a192b', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efc8103a', '2025-01-24', 'OC-011/2025', '679140339033f', '678578d660fbc', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efcaed36', '2025-01-24', 'OC-012/2025', '67914147e90c7', '6791407e5a886', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efcc7275', '2025-01-24', 'OC-013/2025', '6791423ec8e28', '67857aab5568d', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efce7bc2', '2025-01-24', 'OC-014/2025', '679144a2096df', '67857ada01faf', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efd20382', '2025-01-24', 'OC-015/2025', '6791453692145', '67857b5d41db8', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efd57dc9', '2025-01-24', 'OC-016/2025', '679145fd4bda9', '6751bde7a6abd', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efd875d5', '2025-01-24', 'OC-017/2025', '6791464c80956', '67857e08cdbca', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efdb2b99', '2025-01-24', 'OC-018/2025', '6791472022193', '67857e634e652', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efdd7856', '2025-01-24', 'OC-019/2025', '6791494653d81', '67857dd55d623', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efdeff21', '2025-01-24', 'OC-020/2025', '6791496c42c69', '678666412d46d', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efe1c759', '2025-01-24', 'OC-021/2025', '679149c20f358', '6786657e57979', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efe4d0d6', '2025-01-24', 'OC-022/2025', '67914d3a85057', '67866763ceb54', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efe75dac', '2025-01-24', 'OC-023/2025', '67914e2281bca', '67914df19ad9d', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efe8e1d2', '2025-01-24', 'OC-024/2025', '67914e4552144', '678667b4560ab', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efea92d6', '2025-01-24', 'OC-025/2025', '679112db37556', '679112a26f872', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efec9d93', '2025-01-24', 'OC-026/2025', '679114b0f1162', '6785794fd0e72', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938efedf83e', '2025-01-24', 'OC-027/2025', '679114d5e90f4', '67857b72ebb2c', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff03cb4', '2025-01-24', 'OC-028/2025', '67913dc324ab3', '6785790d2059d', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff19790', '2025-01-24', 'OC-029/2025', '6791447844ba3', '67857a3ee1ff3', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff3f614', '2025-01-24', 'OC-030/2025', '6791459e414b2', '678578176b6df', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff55385', '2025-01-24', 'OC-031/2025', '6791467a0f57a', '67857e25a9509', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff6ad8e', '2025-01-24', 'OC-032/2025', '6791562a0ffd3', '678579977e547', '2', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938eff90d78', '2025-01-24', 'OC-033/2025', '6791133cddcb5', '67857a6f36e27', '2', 10, '150.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938effa67b2', '2025-01-24', 'OC-034/2025', '679113990ec51', '67857bbeb4f95', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938effbdfd3', '2025-01-24', 'OC-035/2025', '679113d93987f', '678577c7f0522', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938effcf375', '2025-01-24', 'OC-036/2025', '67911404c7815', '67857c0a74c91', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938effea693', '2025-01-24', 'OC-037/2025', '6791143458954', '678579ad10ba1', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0017ef6', '2025-01-24', 'OC-038/2025', '67913e768a4e3', '67857ccf44daa', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f003494e', '2025-01-24', 'OC-039/2025', '679144da3e46d', '67857afe6cc1f', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f005268e', '2025-01-24', 'OC-040/2025', '6791473f6b0ee', '6786615b86418', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0062b15', '2025-01-24', 'OC-041/2025', '6791503cd1004', '678668c196b65', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f007b1c6', '2025-01-24', 'OC-042/2025', '67911486185c8', '67857b29247f7', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0096437', '2025-01-24', 'OC-043/2025', '67911553df491', '67857bd9b7966', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f00b4a59', '2025-01-24', 'OC-044/2025', '67913d2ce018f', '678578503d7f1', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f00da151', '2025-01-24', 'OC-045/2025', '6791456e63d09', '67857c53e1c1f', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f00f276a', '2025-01-24', 'OC-046/2025', '679145c3baa26', '67857cb6ac27e', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f01115b3', '2025-01-24', 'OC-047/2025', '67914696d7abc', '67857e4deca98', '2', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f013c14f', '2025-01-24', 'OC-048/2025', '679115a61ffc6', '678578f03cbdc', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f016690f', '2025-01-24', 'OC-049/2025', '67913b5cb75c4', '6785796992e26', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f018346c', '2025-01-24', 'OC-050/2025', '67913c28c3eed', '67857bed819b3', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f01a141d', '2025-01-24', 'OC-051/2025', '67913cb1d52b4', '67857c26a51e0', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f01b5f24', '2025-01-24', 'OC-052/2025', '679141fbcdbd5', '679141d618847', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f01d1ba2', '2025-01-24', 'OC-053/2025', '679144170451f', '678579fb9209d', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f01e7247', '2025-01-24', 'OC-054/2025', '679145de559da', '67857c63ce79b', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0210e71', '2025-01-24', 'OC-055/2025', '679146333855a', '67857d9a01842', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0239893', '2025-01-24', 'OC-056/2025', '679147ea8191d', '67866504c4b91', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f025da6f', '2025-01-24', 'OC-057/2025', '679148a4ba931', '678665b5d3dcf', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f027b21b', '2025-01-24', 'OC-058/2025', '679149ea8b2e9', '678666b252090', '2', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f02963a5', '2025-01-24', 'OC-059/2025', '67913b39f1bda', '6785792bbb8e4', '2', 14, '90.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f02abfd2', '2025-01-24', 'OC-060/2025', '679142ef80916', '678579c28f2f6', '2', 14, '90.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f02c1c23', '2025-01-24', 'OC-061/2025', '67913c054d1db', '67857ce24ecba', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f02dce87', '2025-01-24', 'OC-062/2025', '6791443932706', '678579e0ca04a', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0303d1b', '2025-01-24', 'OC-063/2025', '67914554a98f4', '67857a11aaeb4', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f031ee66', '2025-01-24', 'OC-064/2025', '6791461678e55', '67857d76a4f63', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f034792e', '2025-01-24', 'OC-065/2025', '6791480b1717a', '6786622841f12', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f035d2ce', '2025-01-24', 'OC-066/2025', '67914857d415c', '678665977fad7', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f037b3a5', '2025-01-24', 'OC-067/2025', '679149055813b', '679148e45dcb7', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f03a120b', '2025-01-24', 'OC-068/2025', '679149953728b', '67866663abb4e', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f03b6c6b', '2025-01-24', 'OC-069/2025', '67914bbe9c3ab', '67914b97cacb0', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f03cc70d', '2025-01-24', 'OC-070/2025', '67914be345339', '678666914721d', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f03e4283', '2025-01-24', 'OC-071/2025', '67914be354858', '678666914721d', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('67938f04067dd', '2025-01-24', 'OC-072/2025', '67914bfc06356', '678666a33a80a', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f041c41d', '2025-01-24', 'OC-073/2025', '67914c366f460', '6786671434e87', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0444c79', '2025-01-24', 'OC-074/2025', '67914c5a9e257', '678666e37dddc', '2', 15, '25.0000', '-125.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f045a90c', '2025-01-24', 'OC-075/2025', '67914c89105e6', '678667289da1f', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f047058f', '2025-01-24', 'OC-076/2025', '67914cc9e47c0', '6786673b9bd8e', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0488c58', '2025-01-24', 'OC-077/2025', '67914d0bd0372', '6786675127d6a', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f049e69e', '2025-01-24', 'OC-078/2025', '67914d6101eab', '6786677f3762b', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f04b98e2', '2025-01-24', 'OC-079/2025', '67914dcd82b03', '678667928e474', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f04d1e24', '2025-01-24', 'OC-080/2025', '67914ea8e0a65', '67914e70e9245', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f04ed107', '2025-01-24', 'OC-081/2025', '67914eee53fcd', '678667fceeffa', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f052337a', '2025-01-24', 'OC-082/2025', '67914f22d6e24', '67914f05bd6cf', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f054a592', '2025-01-24', 'OC-083/2025', '67914f929c14f', '67866845638bc', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f055d4e7', '2025-01-24', 'OC-084/2025', '67914fde3e8a8', '67914fb6e718f', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0573105', '2025-01-24', 'OC-085/2025', '6791508bc2d36', '678668ff49605', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0585e93', '2025-01-24', 'OC-086/2025', '679150a834b74', '678669e8a55e7', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f05a1185', '2025-01-24', 'OC-087/2025', '679151b1b6611', '67915159214a9', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f05b978d', '2025-01-24', 'OC-088/2025', '6791534a9cdde', '67866bfa7c355', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f05cc84d', '2025-01-24', 'OC-089/2025', '6791540fc3fc3', '67866c117ed54', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0603e4a', '2025-01-24', 'OC-090/2025', '679155044c485', '67866c3d478f8', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f062b44b', '2025-01-24', 'OC-091/2025', '679156450c0a5', '679155ed65c77', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0650ca6', '2025-01-24', 'OC-092/2025', '67915c3a873be', '67915c0591696', '2', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f066acf8', '2025-01-24', 'OC-093/2025', '67913d93e6ad4', '6786652723aea', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0685ee2', '2025-01-24', 'OC-094/2025', '679141b5037fc', '679141719ace7', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f06a1252', '2025-01-24', 'OC-095/2025', '67914f70c5628', '6786680db2802', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f06b6ca2', '2025-01-24', 'OC-096/2025', '67915001a99e3', '6786687a26c1b', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f06c9d07', '2025-01-24', 'OC-097/2025', '6791501be0892', '678668b1dcaea', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f06e220f', '2025-01-24', 'OC-098/2025', '6791511368715', '679150e9dea0f', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0703c92', '2025-01-24', 'OC-099/2025', '67915548811ee', '6791552808cbe', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0716ec7', '2025-01-24', 'OC-100/2025', '679155922d8ff', '6791556ff1e02', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f074d136', '2025-01-24', 'OC-101/2025', '67915610776f0', '679155c397243', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f076d78d', '2025-01-24', 'OC-102/2025', '6791429e51c3c', '67857d456dd82', '2', 17, '75.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f0783487', '2025-01-24', 'OC-103/2025', '6791505adeca2', '678668a0efe43', '2', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f079b938', '2025-01-24', 'OC-104/2025', '679150c2ca0cc', '678668d53b619', '2', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('67938f07b1a2d', '2025-01-24', 'OC-105/2025', '679151313f36f', '67866a160cb9b', '2', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793902235773', '2025-01-24', 'OC-106/2025', '6791143458954', '678579ad10ba1', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero Del 2025', 4),
('6793a9e60ef6f', '2025-01-24', 'OC-107/2025', '6791143458954', '678579ad10ba1', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero Del 2025', 4),
('6793aa2986f91', '2025-01-24', 'OC-108/2025', '6791143458954', '678579ad10ba1', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero Del 2025', 4),
('6793aa299e847', '2025-01-24', 'OC-109/2025', '6791143458954', '678579ad10ba1', '2', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero Del 2025', 4),
('6793ab294e4f2', '2025-01-24', 'OC-110/2025', '67939d60d0114', '671fd82a30875', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab296e2b9', '2025-01-24', 'OC-111/2025', '6793a5c637dad', '671fd7d8c344a', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab298ad9c', '2025-01-24', 'OC-112/2025', '6793a688a589d', '671fd89618825', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab29b5353', '2025-01-24', 'OC-113/2025', '6793a512d40ca', '6793a4eb83f72', '3', 9, '60.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab29e42ac', '2025-01-24', 'OC-114/2025', '6793a55156f9d', '671fd848a936f', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab29f0be0', '2025-01-24', 'OC-115/2025', '6793a5516d998', '671fd848a936f', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793ab2a14859', '2025-01-24', 'OC-116/2025', '6793a60e08dce', '671fd78bbf5cc', '3', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2a2c487', '2025-01-24', 'OC-117/2025', '67939d8704276', '671fd8e70d4a6', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2a3c1be', '2025-01-24', 'OC-118/2025', '6793a576ddc74', '671fd6a831411', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2a62906', '2025-01-24', 'OC-119/2025', '6793a59b5d13e', '671fd6e51c10c', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2a77ab4', '2025-01-24', 'OC-120/2025', '6793a5e3364ef', '671fd85b1c25e', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2a8d713', '2025-01-24', 'OC-121/2025', '6793a5e34b6da', '671fd85b1c25e', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793ab2aa5daf', '2025-01-24', 'OC-122/2025', '6793a6312620d', '671fd8bfc1176', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2adc347', '2025-01-24', 'OC-123/2025', '6793a651efc6c', '671fd6035a4e4', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2aef305', '2025-01-24', 'OC-124/2025', '6793ab165cdc0', '6793a6bdb6362', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2b48b83', '2025-01-24', 'OC-125/2025', '6793a534ca27b', '671fd658a34d4', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ab2b772ff', '2025-01-24', 'OC-126/2025', '67939dad8c3c3', '671fe279c25d6', '3', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793ac92194ea', '2025-01-24', 'OC-127/2025', '6793a55156f9d', '671fd848a936f', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793ac9244a4e', '2025-01-24', 'OC-128/2025', '6793a576ddc74', '671fd6a831411', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793ac925bc5d', '2025-01-24', 'OC-129/2025', '6793a5e3364ef', '671fd85b1c25e', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793ac92b82e8', '2025-01-24', 'OC-130/2025', '6791511368715', '679150e9dea0f', '2', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793b5c6b1450', '2025-01-24', 'OC-131/2025', '6793a5516d998', '671fd848a936f', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793b5c6e8999', '2025-01-24', 'OC-132/2025', '6793a5e34b6da', '671fd85b1c25e', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793b5c712e4b', '2025-01-24', 'OC-133/2025', '6793af4b5b657', '671fd7a7ba0c3', '3', 14, '90.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6793b6b5c6347', '2025-01-24', 'OC-134/2025', '6793a5516d998', '671fd848a936f', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6793b6b5df65c', '2025-01-24', 'OC-135/2025', '6793a5e34b6da', '671fd85b1c25e', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('6798efe21ccf5', '2025-01-28', 'OC-136/2025', '6793d6faef56a', '671fd80d4ed80', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2313ce', '2025-01-28', 'OC-137/2025', '6793d7db40a38', '671fd91d0f46c', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2607e8', '2025-01-28', 'OC-138/2025', '6793dda1cc641', '671fd99842111', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe270c6d', '2025-01-28', 'OC-139/2025', '6793de111c576', '671fda3219276', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe27e3a8', '2025-01-28', 'OC-140/2025', '6793def2bd522', '671fd9ae640b7', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe291246', '2025-01-28', 'OC-141/2025', '6793df92538da', '671fda7dedf80', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2a1790', '2025-01-28', 'OC-142/2025', '6793e0502698a', '6793e01ea83a6', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2af10d', '2025-01-28', 'OC-143/2025', '6793e0b237c6a', '671fdcf9eb829', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2bf642', '2025-01-28', 'OC-144/2025', '6793e0d545e38', '671fdd4eae976', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2cce89', '2025-01-28', 'OC-145/2025', '6793e169cbf00', '6793e1388bf77', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe2ed98e', '2025-01-28', 'OC-146/2025', '6793e1e0ba6e1', '6793e1c173192', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe3099ef', '2025-01-28', 'OC-147/2025', '6793e3ec0b757', '6793e3c70b3d6', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe319d42', '2025-01-28', 'OC-148/2025', '6793f78e613c6', '671fe4b75c41a', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe3350bb', '2025-01-28', 'OC-149/2025', '6793f813033a9', '671fd6338ede0', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe370ce6', '2025-01-28', 'OC-150/2025', '6793f90c8d070', '671fdce27a357', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe381386', '2025-01-28', 'OC-151/2025', '6793f965d96df', '6793f936811db', '3', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe3ba9cf', '2025-01-28', 'OC-152/2025', '6793d1666eb03', '671fd68841cb1', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe3cc72f', '2025-01-28', 'OC-153/2025', '6793daa53813f', '671fd94565361', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe416bc1', '2025-01-28', 'OC-154/2025', '6793dd60674be', '6793dd37afeeb', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe4308cc', '2025-01-28', 'OC-155/2025', '6793df585773d', '671fd9e91c4f2', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe43e1ae', '2025-01-28', 'OC-156/2025', '6793f5d2b4e80', '671fe41ee8c65', '3', 11, '35.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe47ab0c', '2025-01-28', 'OC-157/2025', '6793d8814fbc8', '671fd904322bb', '3', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe485c14', '2025-01-28', 'OC-158/2025', '6793f4c53102e', '6793f4a158196', '3', 12, '40.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe4e1476', '2025-01-28', 'OC-159/2025', '6793d6afd9f56', '671fd7bdbcf6b', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe540954', '2025-01-28', 'OC-160/2025', '6793d6d858223', '671fd75818447', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe5595e1', '2025-01-28', 'OC-161/2025', '6793d73be722f', '671fd8819976b', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe567ef0', '2025-01-28', 'OC-162/2025', '6793da7d32f0e', '671fd931c2191', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe5b0386', '2025-01-28', 'OC-163/2025', '6793dd7c40026', '671fd97ec13b4', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe5c16a9', '2025-01-28', 'OC-164/2025', '6793df757e5d5', '671fda0c28c1f', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe5f14fe', '2025-01-28', 'OC-165/2025', '6793e195088a0', '671fda678cdac', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe6271b6', '2025-01-28', 'OC-166/2025', '6793e43446827', '6793e410717bd', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe63c4e4', '2025-01-28', 'OC-167/2025', '6793f58f02271', '671fe1cf6ecc9', '3', 13, '45.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe6a3733', '2025-01-28', 'OC-168/2025', '6793dff3a2d8d', '671fdc7b0ec53', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe6d4f4f', '2025-01-28', 'OC-169/2025', '6793e070e9fca', '671fdccea5a61', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe6e1fb8', '2025-01-28', 'OC-170/2025', '6793e08a14bee', '671fddaaac4a6', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe6eceb6', '2025-01-28', 'OC-171/2025', '6793e0efac851', '671fe4fc14d70', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe7389c3', '2025-01-28', 'OC-172/2025', '6793e200608a8', '671fde3a91fbd', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe75acea', '2025-01-28', 'OC-173/2025', '6793e24b1d05b', '6793e2237576b', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe773dea', '2025-01-28', 'OC-174/2025', '6793e26a1b929', '671fddba88388', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe789c12', '2025-01-28', 'OC-175/2025', '6793e3548d037', '6793e28674bb4', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe7a56ec', '2025-01-28', 'OC-176/2025', '6793e37b7bede', '671fdf997bd34', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe7c85e3', '2025-01-28', 'OC-177/2025', '6793e453a20d8', '671fde22d68d2', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe7e35df', '2025-01-28', 'OC-178/2025', '6793e470f14a5', '671fdf588ff66', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe7f0dbf', '2025-01-28', 'OC-179/2025', '6793f43e4e5c9', '671fe0e5a2813', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe80d363', '2025-01-28', 'OC-180/2025', '6793f4ee5f9e4', '671fe1660a1f9', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe81a923', '2025-01-28', 'OC-181/2025', '6793f52d7b624', '671fe35065075', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe82aa2a', '2025-01-28', 'OC-182/2025', '6793f575c38cc', '671fe18477626', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe838850', '2025-01-28', 'OC-183/2025', '6793f5b5d83f8', '671fe1e9ae255', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe848c60', '2025-01-28', 'OC-184/2025', '6793f5eae5824', '671fe31edc4b6', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe879970', '2025-01-28', 'OC-185/2025', '6793f606776da', '671fe365a674d', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe88cf52', '2025-01-28', 'OC-186/2025', '6793f635e6e0e', '671fe3a35e653', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe89ff17', '2025-01-28', 'OC-187/2025', '6793f64d28902', '671fe3efc5cd9', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe8b339f', '2025-01-28', 'OC-188/2025', '6793f667ad57c', '671fe298833fe', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe8cb46c', '2025-01-28', 'OC-189/2025', '6793f6da26245', '6793f69284b40', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe8de65a', '2025-01-28', 'OC-190/2025', '6793f717cd817', '6793f6f51cd47', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe909930', '2025-01-28', 'OC-191/2025', '6793f735e834e', '671fe44e1c92b', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe930e0e', '2025-01-28', 'OC-192/2025', '6793f74f3f05f', '671fe47ce5e16', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe943be7', '2025-01-28', 'OC-193/2025', '6793f76f747b3', '671fe490e62b7', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe95b950', '2025-01-28', 'OC-194/2025', '6793f7abb6156', '671fe4cf6044d', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe99593b', '2025-01-28', 'OC-195/2025', '6793f7f399f8b', '6793f7d3b3e5d', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe9a7356', '2025-01-28', 'OC-196/2025', '6793f86584de5', '6793f83c57b76', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe9b77dc', '2025-01-28', 'OC-197/2025', '6793f8a329cbf', '671fe50ed2543', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe9c50b1', '2025-01-28', 'OC-198/2025', '6793f8f051c56', '6793f8d3b9c81', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe9d9022', '2025-01-28', 'OC-199/2025', '6793f9a5a9c45', '6793f982a9483', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efe9eb8ab', '2025-01-28', 'OC-200/2025', '6793f9edd90a1', '6793f9c2b2ffb', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea0848e', '2025-01-28', 'OC-201/2025', '6793fa6d1bbf3', '6793fa4a11d26', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea1de0a', '2025-01-28', 'OC-202/2025', '6793faafede3e', '6793fa8bdde8c', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea30f52', '2025-01-28', 'OC-203/2025', '6793face82866', '67857d2d5691a', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea49425', '2025-01-28', 'OC-204/2025', '6793faeee084b', '671ff0d986369', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea6f35a', '2025-01-28', 'OC-205/2025', '6793fb2ec3a30', '6793fb0a9dc74', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efea9292b', '2025-01-28', 'OC-206/2025', '6793fbb2b1400', '6793fb901a606', '3', 15, '25.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efeac377a', '2025-01-28', 'OC-207/2025', '6793df21e7325', '671fd9c9588da', '3', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efead2d3d', '2025-01-28', 'OC-208/2025', '6793fa30c7c79', '6793fa0e81dd0', '3', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efeae6d63', '2025-01-28', 'OC-209/2025', '6793fb684289e', '6793fb480b69a', '3', 16, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efeb0df90', '2025-01-28', 'OC-210/2025', '6793d983d42b1', '671fe20a60be6', '3', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('6798efeb1d48d', '2025-01-28', 'OC-211/2025', '6793f46405de1', '671fe2e9c9785', '3', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 4),
('679d685773f29', '2025-02-02', 'OC-212/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De February Del 2025', 4),
('679d685ecd580', '2025-02-02', 'OC-213/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '0.0000', 'Cobro De Servicio Del Mes De February Del 2025', 4),
('679d68c4be437', '2025-01-01', 'OC-214/2025', '678e3b8d2f075', '', '', NULL, '0.0000', '0.0000', '', 1),
('679d69ab4823e', '2025-01-01', 'OC-216/2025', '679111d8a6d31', '679110cf8550e', '1', 8, '0.0000', '0.0000', 'prueba', 4),
('679d6b8a41eea', '2025-01-01', 'OC-217/2025', '679111d8a6d31', '679110cf8550e', '1', 8, '0.0000', '0.0000', 'prueba', 4),
('679d6fd1d21ae', '2025-01-31', 'OC-217/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '30.0000', 'Cobro De Servicio Del Mes De Enero-2025', 2),
('679d701549fa7', '2025-01-31', 'OC-218/2025', '6793f46405de1', '671fe2e9c9785', '3', 18, '15.0000', '0.0000', 'Cobro De Servicio Del Mes De Enero-2025', 1),
('679d7085e5348', '2025-02-10', 'OC-219/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '30.0000', 'Cobro De Servicio Del Mes De February Del 2025', 2),
('679d727bde786', '2025-02-01', 'OC-220/2025', '679111d8a6d31', '679110cf8550e', '2', 5, '10.0000', '10.0000', 'SERVICIO DE INSTALACION', 2),
('679d74f2206ad', '2025-03-02', 'OC-221/2025', '679111d8a6d31', '679110cf8550e', '2', 8, '30.0000', '15.7718', 'Cobro De Servicio Del Mes De March Del 2025', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_cobranza_estatus`
--

CREATE TABLE `tabla_cobranza_estatus` (
  `id` int NOT NULL,
  `estatus` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `id` int NOT NULL,
  `orden` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pago` decimal(28,4) NOT NULL DEFAULT '0.0000',
  `favor` decimal(28,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_cobranza_pago`
--

INSERT INTO `tabla_cobranza_pago` (`id`, `orden`, `nota`, `pago`, `favor`) VALUES
(1, '67938effea693', '6798ee3cba8b5', '35.0000', '0.0000'),
(2, '6798efe930e0e', '6798f0632b50a', '25.0000', '0.0000'),
(3, '67938f037b3a5', '6798f0db9e8d2', '24.9811', '0.0000'),
(4, '6798efe9eb8ab', '6798f2037b98e', '25.0000', '0.0000'),
(5, '6798efe370ce6', '679b9c4856c86', '30.0000', '0.0000'),
(6, '6798efe81a923', '679bc2aae3a3d', '25.0000', '0.0000'),
(7, '67938f0444c79', '679bc66a64c14', '25.0000', '0.0000'),
(8, '6798efe485c14', '679bc7e0deebc', '40.0000', '0.0000'),
(9, '67938f00b4a59', '679bc9cc2e072', '40.0000', '0.0000'),
(10, '6798efe47ab0c', '679bcbfcabdfc', '40.0000', '0.0000'),
(11, '67938f0650ca6', '679bcdbd4a077', '25.0000', '0.0000'),
(16, '67938efc43752', '679cd18faffa0', '30.0000', '0.0000'),
(18, '67938efb6151a', '679d62e91bab4', '30.0000', '0.0000'),
(19, '67938efb6151a', '679d659e30b51', '30.0000', '20.0000'),
(20, '679d6b8a41eea', '679d6b8a4606f', '0.0000', '20.0000'),
(21, '679d6fd1d21ae', '679d7051ec996', '30.0000', '20.0000'),
(22, '679d7085e5348', '679d7085e854c', '30.0000', '0.0000'),
(23, '679d6fd1d21ae', '679d72456e8f2', '30.0000', '5.7718'),
(24, '679d727bde786', '679d727be1810', '5.7718', '0.0000'),
(25, '679d7085e5348', '679d74a319803', '30.0000', '20.0000'),
(26, '679d727bde786', '679d74a319803', '4.2282', '15.7718'),
(27, '679d74f2206ad', '679d74f22374b', '15.7718', '0.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_data`
--

CREATE TABLE `tabla_contrato_data` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_apertura` date NOT NULL,
  `cliente` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrato` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `plan` int NOT NULL,
  `nodo` int NOT NULL,
  `direccion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estatus` int NOT NULL,
  `saldo` decimal(28,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_data`
--

INSERT INTO `tabla_contrato_data` (`id`, `fecha_apertura`, `cliente`, `contrato`, `plan`, `nodo`, `direccion`, `estatus`, `saldo`) VALUES
('679111d8a6d31', '2024-12-20', '679110cf8550e', 'C-001/2024', 8, 2, 'ZONA 321', 2, '0.0000'),
('679112db37556', '2024-12-20', '679112a26f872', 'C-002/2024', 9, 2, 'CORE 8', 2, '0.0000'),
('6791133cddcb5', '2024-12-20', '67857a6f36e27', 'C-003/2024', 10, 2, 'CORE 8 ', 2, '0.0000'),
('679113990ec51', '2024-12-20', '67857bbeb4f95', 'C-004/2024', 11, 2, 'CORE 8', 2, '0.0000'),
('679113d93987f', '2024-12-20', '678577c7f0522', 'C-005/2024', 11, 2, 'SECTOR VILLA BETANIA', 2, '0.0000'),
('67911404c7815', '2024-12-20', '67857c0a74c91', 'C-006/2024', 11, 2, 'SECTOR RIO NEGRO', 2, '0.0000'),
('6791143458954', '2024-12-20', '678579ad10ba1', 'C-007/2024', 11, 2, 'SECTOR VILLA BETANIA', 2, '0.0000'),
('67911486185c8', '2024-12-20', '67857b29247f7', 'C-008/2024', 12, 2, 'SECTOR LAS PIONIAS', 2, '0.0000'),
('679114b0f1162', '2024-12-20', '6785794fd0e72', 'C-009/2024', 9, 2, 'SECTOR LA PARAGUA ', 2, '0.0000'),
('679114d5e90f4', '2024-12-20', '67857b72ebb2c', 'C-010/2024', 9, 2, 'SECTOR 335', 2, '0.0000'),
('6791153101dd1', '2024-12-20', '67857b132878c', 'C-011/2024', 8, 2, 'SECTOR ORQUIDEAS', 2, '0.0000'),
('67911553df491', '2024-12-20', '67857bd9b7966', 'C-012/2024', 12, 2, 'SECTOR UNARE', 2, '0.0000'),
('679115a61ffc6', '2024-12-20', '678578f03cbdc', 'C-013/2024', 13, 2, 'SECTOR CARUACHI', 2, '0.0000'),
('67913ad111ff2', '2024-12-20', '678577ee251d6', 'C-014/2024', 8, 2, 'SECTOR AV ATLANTICO', 2, '0.0000'),
('67913b39f1bda', '2024-12-20', '6785792bbb8e4', 'C-015/2024', 14, 2, 'SECTOR SIDOR', 2, '0.0000'),
('67913b5cb75c4', '2024-12-20', '6785796992e26', 'C-016/2024', 13, 2, 'SECTOR LOMA LINDA', 2, '0.0000'),
('67913b8504aa6', '2024-12-20', '678578c11dc48', 'C-017/2024', 7, 2, 'SECTOR SANTA ROSA', 2, '0.0000'),
('67913ba6771fa', '2024-12-20', '67857d10ccee5', 'C-018/2024', 7, 2, 'SECTOR 335', 2, '0.0000'),
('67913c054d1db', '2024-12-20', '67857ce24ecba', 'C-019/2024', 15, 2, 'SECTOR LA PARAGUA', 2, '0.0000'),
('67913c28c3eed', '2024-12-20', '67857bed819b3', 'C-020/2024', 13, 2, 'SECTOR LOMA LINDA', 2, '0.0000'),
('67913cb1d52b4', '2024-12-20', '67857c26a51e0', 'C-021/2024', 13, 2, 'SECTOR LOMA LINDA', 2, '0.0000'),
('67913d042cac4', '2024-12-20', '67857c3e16604', 'C-022/2024', 8, 2, 'SECTOR VILLA CARONI', 2, '0.0000'),
('67913d2ce018f', '2024-12-20', '678578503d7f1', 'C-023/2024', 12, 2, 'SECTOR EL LLANITO II, CALLE JOSE TADEO MONAGAS CASA #02-55 ', 2, '0.0000'),
('67913d93e6ad4', '2024-12-20', '6786652723aea', 'C-024/2024', 16, 2, 'SECTOR LA PARAGUA', 2, '0.0000'),
('67913dc324ab3', '2024-12-20', '6785790d2059d', 'C-025/2024', 9, 2, 'SECTOR SIDOR', 2, '0.0000'),
('67913e768a4e3', '2024-12-20', '67857ccf44daa', 'C-026/2024', 11, 2, 'SECTOR VILLA LA PARAGUA', 2, '0.0000'),
('67913e99b9155', '2024-12-20', '6785787003235', 'C-027/2024', 8, 2, 'SECTOR SANTA ROSA', 2, '0.0000'),
('67913ee377279', '2024-12-20', '67857a876a7e9', 'C-028/2024', 8, 2, 'SECTOR SANTA ROSA, RESD LAS ORQUIDEAS, TORRE 1 PISO 8', 2, '40.0000'),
('67913fe496100', '2024-12-20', '67857c79a192b', 'C-029/2024', 8, 2, 'SECTOR PEAJE', 2, '0.0000'),
('679140339033f', '2024-12-20', '678578d660fbc', 'C-030/2024', 8, 2, 'SECTOR VILLA ICARU', 2, '0.0000'),
('67914147e90c7', '2024-12-20', '6791407e5a886', 'C-031/2024', 8, 2, 'SECTOR RIO ARO', 2, '0.0000'),
('679141b5037fc', '2024-12-20', '679141719ace7', 'C-032/2024', 16, 2, 'SECTOR VILLA ICABARU', 2, '0.0000'),
('679141fbcdbd5', '2024-12-20', '679141d618847', 'C-033/2024', 13, 2, 'SECTOR YARA YARA', 2, '0.0000'),
('6791423ec8e28', '2024-12-20', '67857aab5568d', 'C-034/2024', 8, 2, 'SECTOR EL GUAMO', 2, '0.0000'),
('6791429e51c3c', '2024-12-20', '67857d456dd82', 'C-035/2024', 17, 2, 'SECTOR YARA YARA 2', 2, '0.0000'),
('679142ef80916', '2024-12-20', '678579c28f2f6', 'C-036/2024', 14, 2, 'SECTOR MATANZAS', 2, '0.0000'),
('679144170451f', '2024-12-20', '678579fb9209d', 'C-037/2024', 13, 2, 'SECTOR VILLA BAHIA', 2, '0.0000'),
('6791443932706', '2024-12-20', '678579e0ca04a', 'C-038/2024', 15, 2, 'SECTOR CORE 8', 2, '0.0000'),
('6791447844ba3', '2024-12-20', '67857a3ee1ff3', 'C-039/2024', 9, 2, 'SECTOR MATANZAS', 2, '0.0000'),
('679144a2096df', '2024-12-20', '67857ada01faf', 'C-040/2024', 8, 2, 'SECTOR SIERRA PARIMA', 2, '0.0000'),
('679144da3e46d', '2024-12-20', '67857afe6cc1f', 'C-041/2024', 11, 2, 'SECTOR RIBIERAS DEL CARONI', 2, '0.0000'),
('6791451734358', '2024-12-20', '67857989c797d', 'C-042/2024', 7, 2, 'SECTOR LOS PINOS', 2, '0.0000'),
('6791453692145', '2024-12-20', '67857b5d41db8', 'C-043/2024', 8, 2, 'SECTOR CURAGUA', 2, '0.0000'),
('67914554a98f4', '2024-12-20', '67857a11aaeb4', 'C-044/2024', 15, 2, 'SECTOR CORE 8', 2, '0.0000'),
('6791456e63d09', '2024-12-20', '67857c53e1c1f', 'C-045/2024', 12, 2, 'SECTOR 321', 2, '0.0000'),
('6791459e414b2', '2024-12-20', '678578176b6df', 'C-046/2024', 9, 2, 'SECTOR TERRAZAS DE ATLANTICO', 2, '0.0000'),
('679145c3baa26', '2024-12-20', '67857cb6ac27e', 'C-047/2024', 12, 2, 'SECTOR SANTA ROSA', 2, '0.0000'),
('679145de559da', '2024-12-20', '67857c63ce79b', 'C-048/2024', 13, 2, 'SECTOR YARA YARA', 2, '0.0000'),
('679145fd4bda9', '2024-12-20', '6751bde7a6abd', 'C-049/2024', 8, 2, 'SECTOR CORE 8', 2, '0.0000'),
('6791461678e55', '2024-12-20', '67857d76a4f63', 'C-050/2024', 15, 2, 'SECTOR 321', 2, '0.0000'),
('679146333855a', '2024-12-20', '67857d9a01842', 'C-051/2024', 13, 2, 'SECTOR 321', 2, '0.0000'),
('6791464c80956', '2024-12-20', '67857e08cdbca', 'C-052/2024', 8, 2, 'SECTOR CAIMITO', 2, '0.0000'),
('6791467a0f57a', '2024-12-20', '67857e25a9509', 'C-053/2024', 9, 2, 'SECTOR VILLAS DEL VALLE', 2, '0.0000'),
('67914696d7abc', '2024-12-20', '67857e4deca98', 'C-054/2024', 12, 2, 'SECTOR CAIMITO', 2, '0.0000'),
('6791472022193', '2024-12-20', '67857e634e652', 'C-055/2024', 8, 2, 'SECTOR 321', 2, '0.0000'),
('6791473f6b0ee', '2024-12-20', '6786615b86418', 'C-056/2024', 11, 2, 'SECTOR CURAGUA', 2, '0.0000'),
('679147ea8191d', '2024-12-20', '67866504c4b91', 'C-057/2024', 13, 2, 'SECTOR TERRAZAS DEL ATLANTICO', 2, '0.0000'),
('6791480b1717a', '2024-12-20', '6786622841f12', 'C-058/2024', 15, 2, 'SECTOR YARA YARA', 2, '0.0000'),
('67914857d415c', '2024-12-20', '678665977fad7', 'C-059/2024', 15, 2, 'SECTOR LOMA LINDA', 2, '0.0000'),
('679148a4ba931', '2024-12-20', '678665b5d3dcf', 'C-060/2024', 13, 2, 'SECTOR 321', 2, '0.0000'),
('679149055813b', '2024-12-23', '679148e45dcb7', 'C-061/2024', 15, 2, 'SECTOR CORE 8, SABANA LINDA', 2, '0.0000'),
('6791494653d81', '2024-12-20', '67857dd55d623', 'C-062/2024', 8, 2, 'SECTOR CURAGUA', 2, '0.0000'),
('6791496c42c69', '2024-12-20', '678666412d46d', 'C-063/2024', 8, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('679149953728b', '2024-12-20', '67866663abb4e', 'C-064/2024', 15, 2, 'SECTOR RIO ARO', 2, '0.0000'),
('679149c20f358', '2024-12-20', '6786657e57979', 'C-065/2024', 8, 2, 'SECTOR PEAJE', 2, '0.0000'),
('679149ea8b2e9', '2024-12-20', '678666b252090', 'C-066/2024', 13, 2, 'SECTOR LOS PINOS', 2, '0.0000'),
('67914bbe9c3ab', '2024-12-20', '67914b97cacb0', 'C-067/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('67914be345339', '2024-12-20', '678666914721d', 'C-068/2024', 15, 2, 'SECTOR LOMA LINDA', 2, '0.0000'),
('67914be354858', '2024-12-20', '678666914721d', 'C-069/2024', 15, 2, 'SECTOR LOMA LINDA', 3, '0.0000'),
('67914bfc06356', '2024-12-20', '678666a33a80a', 'C-070/2024', 15, 2, 'SECTOR CORE 8', 2, '0.0000'),
('67914c366f460', '2024-12-20', '6786671434e87', 'C-071/2024', 15, 2, 'SECTOR 321', 2, '0.0000'),
('67914c5a9e257', '2024-12-20', '678666e37dddc', 'C-072/2024', 15, 2, 'SECTOR ISLA DORADA, MANZANA 14, CASA #04', 2, '0.0000'),
('67914c89105e6', '2024-12-20', '678667289da1f', 'C-073/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('67914cc9e47c0', '2024-12-20', '6786673b9bd8e', 'C-074/2024', 15, 2, 'SECTOR MATANZAS', 2, '0.0000'),
('67914d0bd0372', '2024-12-20', '6786675127d6a', 'C-075/2024', 15, 2, 'SECTOR ICABARU', 2, '0.0000'),
('67914d3a85057', '2024-12-20', '67866763ceb54', 'C-076/2024', 8, 2, 'SECTOR PASEO CARONI', 2, '0.0000'),
('67914d6101eab', '2024-12-20', '6786677f3762b', 'C-077/2024', 15, 2, 'SECTOR RIO CAURA', 2, '0.0000'),
('67914dcd82b03', '2024-12-20', '678667928e474', 'C-078/2024', 15, 2, 'SECTOR TERRAZAS DEL ATLANTICO', 2, '0.0000'),
('67914e2281bca', '2024-12-20', '67914df19ad9d', 'C-079/2024', 8, 2, 'SECTOR YENISHA', 2, '0.0000'),
('67914e4552144', '2024-12-20', '678667b4560ab', 'C-080/2024', 8, 2, 'SECTOR CURAGUA', 2, '0.0000'),
('67914ea8e0a65', '2024-12-20', '67914e70e9245', 'C-081/2024', 15, 2, 'SECTOR MATANZAS', 2, '0.0000'),
('67914eee53fcd', '2024-12-20', '678667fceeffa', 'C-082/2024', 15, 2, 'SECTOR ICABARU', 2, '0.0000'),
('67914f22d6e24', '2024-12-20', '67914f05bd6cf', 'C-083/2024', 15, 2, 'SECTOR MANTANZAS', 2, '0.0000'),
('67914f70c5628', '2024-12-20', '6786680db2802', 'C-084/2024', 16, 2, 'SECTOR RIO ARO', 2, '0.0000'),
('67914f929c14f', '2024-12-20', '67866845638bc', 'C-085/2024', 15, 2, 'SECTOR UNARE', 2, '0.0000'),
('67914fde3e8a8', '2024-12-20', '67914fb6e718f', 'C-086/2024', 15, 2, 'SECTOR TERRAZAS DEL ATLANTICO', 2, '0.0000'),
('67915001a99e3', '2024-12-20', '6786687a26c1b', 'C-087/2024', 16, 2, 'SECTOR ISLA CORAL', 2, '0.0000'),
('6791501be0892', '2024-12-20', '678668b1dcaea', 'C-088/2024', 16, 2, 'SECTOR LA PIÑA', 2, '0.0000'),
('6791503cd1004', '2024-12-20', '678668c196b65', 'C-089/2024', 11, 2, 'SECTOR CORE 8', 2, '0.0000'),
('6791505adeca2', '2024-12-20', '678668a0efe43', 'C-090/2024', 18, 2, 'SECTOR VILLA BETANIA', 2, '0.0000'),
('6791508bc2d36', '2024-12-20', '678668ff49605', 'C-091/2024', 15, 2, 'SECTOR ISLA CORAL', 2, '0.0000'),
('679150a834b74', '2024-12-20', '678669e8a55e7', 'C-092/2024', 15, 2, 'SECTOR PARATEPUY', 2, '0.0000'),
('679150c2ca0cc', '2024-12-20', '678668d53b619', 'C-093/2024', 18, 2, 'SECTOR EL GUAMO', 2, '0.0000'),
('6791511368715', '2024-12-20', '679150e9dea0f', 'C-094/2024', 16, 2, 'SECTOR CAUJARO', 2, '0.0000'),
('679151313f36f', '2024-12-20', '67866a160cb9b', 'C-095/2024', 18, 2, 'SECTOR PARATEPUY', 2, '0.0000'),
('679151b1b6611', '2024-12-20', '67915159214a9', 'C-096/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('6791534a9cdde', '2024-12-20', '67866bfa7c355', 'C-097/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('6791540fc3fc3', '2024-12-20', '67866c117ed54', 'C-098/2024', 15, 2, 'SECTOR VILLA BETANIA', 2, '0.0000'),
('679155044c485', '2024-12-20', '67866c3d478f8', 'C-099/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('67915548811ee', '2024-12-20', '6791552808cbe', 'C-100/2024', 16, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('679155922d8ff', '2024-12-20', '6791556ff1e02', 'C-101/2024', 16, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('67915610776f0', '2024-12-20', '679155c397243', 'C-102/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('6791562a0ffd3', '2024-12-20', '678579977e547', 'C-103/2024', 9, 2, 'SECTOR LOS PINOS', 2, '0.0000'),
('679156450c0a5', '2024-12-20', '679155ed65c77', 'C-104/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('67915c3a873be', '2024-12-20', '67915c0591696', 'C-105/2024', 15, 2, 'SECTOR ISLA DORADA', 2, '0.0000'),
('679387fb4c7b4', '2025-01-23', '679387a8902af', 'C-001/2025', 18, 2, 'SECTOR ISLA DORADA MANZ-10 CASA #24', 1, '0.0000'),
('67939d60d0114', '2024-12-23', '671fd82a30875', 'C-106/2024', 8, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('67939d8704276', '2024-12-23', '671fd8e70d4a6', 'C-107/2024', 13, 3, 'SECTOR VILLA AFRICANA', 2, '0.0000'),
('67939dad8c3c3', '2024-12-23', '671fe279c25d6', 'C-108/2024', 18, 3, 'SECTOR VILLA AURORA', 2, '0.0000'),
('6793a512d40ca', '2024-12-23', '6793a4eb83f72', 'C-109/2024', 9, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793a534ca27b', '2024-12-23', '671fd658a34d4', 'C-110/2024', 15, 3, 'SECTOR VILLA ALIANZA', 2, '0.0000'),
('6793a55156f9d', '2024-12-23', '671fd848a936f', 'C-111/2024', 11, 3, 'SECTOR NAUTICA', 2, '0.0000'),
('6793a5516d998', '2024-12-23', '671fd848a936f', 'C-112/2024', 11, 3, 'SECTOR NAUTICA', 3, '0.0000'),
('6793a576ddc74', '2024-12-23', '671fd6a831411', 'C-113/2024', 13, 3, 'SECTOR CAMPO C', 2, '0.0000'),
('6793a59b5d13e', '2024-12-23', '671fd6e51c10c', 'C-114/2024', 13, 3, 'SECTOR CAMPO C', 2, '0.0000'),
('6793a5c637dad', '2024-12-23', '671fd7d8c344a', 'C-115/2024', 8, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793a5e3364ef', '2024-12-23', '671fd85b1c25e', 'C-116/2024', 13, 3, 'SECTOR AV GUAYANA', 2, '0.0000'),
('6793a5e34b6da', '2024-12-23', '671fd85b1c25e', 'C-117/2024', 13, 3, 'SECTOR AV GUAYANA', 3, '0.0000'),
('6793a60e08dce', '2024-12-23', '671fd78bbf5cc', 'C-118/2024', 12, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793a6312620d', '2024-12-23', '671fd8bfc1176', 'C-119/2024', 13, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793a651efc6c', '2024-12-23', '671fd6035a4e4', 'C-120/2024', 13, 3, 'SECTOR VILLA ALIANZA', 2, '0.0000'),
('6793a688a589d', '2024-12-23', '671fd89618825', 'C-121/2024', 8, 3, 'SECTOR RIO ARO', 2, '0.0000'),
('6793ab165cdc0', '2024-12-23', '6793a6bdb6362', 'C-122/2024', 13, 3, 'SECTOR EL PASEO', 2, '0.0000'),
('6793af4b5b657', '2024-12-23', '671fd7a7ba0c3', 'C-123/2024', 14, 3, 'SECTOR VILLA BRASIL', 2, '0.0000'),
('6793cf3f3f1aa', '2025-01-24', '6793cefabc73e', 'C-002/2025', 16, 3, 'SECTOR VILLA ANTILLANA CONJ RESD LAS BAHAMAS', 1, '0.0000'),
('6793d0df74bd6', '2025-01-24', '671fd7383caf9', 'C-003/2025', 8, 3, 'SECTOR LOS SALTOS', 1, '0.0000'),
('6793d1666eb03', '2024-12-23', '671fd68841cb1', 'C-124/2024', 11, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793d6afd9f56', '2024-12-23', '671fd7bdbcf6b', 'C-125/2024', 13, 3, 'SECTOR VILLA AFRICANA', 2, '0.0000'),
('6793d6d858223', '2024-12-23', '671fd75818447', 'C-126/2024', 13, 3, 'SECTOR VILLA NAUTICA', 2, '0.0000'),
('6793d6d86eb6c', '2024-12-23', '671fd75818447', 'C-127/2024', 13, 3, 'SECTOR VILLA NAUTICA', 3, '0.0000'),
('6793d6faef56a', '2024-12-23', '671fd80d4ed80', 'C-128/2024', 8, 3, 'SECTOR MINI FINCA', 2, '0.0000'),
('6793d73be722f', '2024-12-23', '671fd8819976b', 'C-129/2024', 13, 3, 'SECTOR LOS ALTOS', 2, '0.0000'),
('6793d7db40a38', '2024-12-23', '671fd91d0f46c', 'C-130/2024', 8, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793d8814fbc8', '2024-12-23', '671fd904322bb', 'C-131/2024', 12, 3, 'SECTOR CARONOCO', 2, '5.0029'),
('6793d983d42b1', '2024-12-23', '671fe20a60be6', 'C-132/2024', 18, 3, 'SECTOR LA CHURUATA', 2, '0.0000'),
('6793da7d32f0e', '2024-12-23', '671fd931c2191', 'C-133/2024', 13, 3, 'SECTOR EL PASEO', 2, '0.0000'),
('6793daa53813f', '2024-12-23', '671fd94565361', 'C-134/2024', 11, 3, 'SECTOR LAS CORNIZAS', 2, '0.0000'),
('6793dd60674be', '2024-12-23', '6793dd37afeeb', 'C-135/2024', 11, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793dd7c40026', '2024-12-23', '671fd97ec13b4', 'C-136/2024', 13, 3, 'SECTOR RIO ARO', 2, '0.0000'),
('6793dda1cc641', '2024-12-23', '671fd99842111', 'C-137/2024', 8, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793de111c576', '2024-12-23', '671fda3219276', 'C-138/2024', 8, 3, 'SECTOR CASTILLITO', 2, '0.0000'),
('6793def2bd522', '2024-12-23', '671fd9ae640b7', 'C-139/2024', 8, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793df21e7325', '2024-12-23', '671fd9c9588da', 'C-140/2024', 16, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793df585773d', '2024-12-23', '671fd9e91c4f2', 'C-141/2024', 11, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793df757e5d5', '2024-12-23', '671fda0c28c1f', 'C-142/2024', 13, 3, 'SECTOR VILLA CENTRAL', 2, '0.0000'),
('6793df92538da', '2024-12-23', '671fda7dedf80', 'C-143/2024', 8, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793dff3a2d8d', '2024-12-23', '671fdc7b0ec53', 'C-144/2024', 15, 3, 'SECTOR CC CARONI PLAZA', 2, '0.0000'),
('6793e0502698a', '2024-12-23', '6793e01ea83a6', 'C-145/2024', 8, 3, 'SECTOR TORRE GUAYANA', 2, '0.0000'),
('6793e070e9fca', '2024-12-23', '671fdccea5a61', 'C-146/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e08a14bee', '2024-12-23', '671fddaaac4a6', 'C-147/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e0b237c6a', '2024-12-23', '671fdcf9eb829', 'C-148/2024', 8, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793e0d545e38', '2024-12-23', '671fdd4eae976', 'C-149/2024', 8, 3, 'SECTOR VILLA ANTILLANA', 2, '0.0000'),
('6793e0efac851', '2024-12-23', '671fe4fc14d70', 'C-150/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e169cbf00', '2024-12-23', '6793e1388bf77', 'C-151/2024', 8, 3, 'SECTOR VILLA LATINA', 2, '0.0000'),
('6793e195088a0', '2024-12-23', '671fda678cdac', 'C-152/2024', 13, 3, 'SECTOR EL PASEO', 2, '0.0000'),
('6793e1e0ba6e1', '2024-12-23', '6793e1c173192', 'C-153/2024', 8, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e200608a8', '2024-12-23', '671fde3a91fbd', 'C-154/2024', 15, 3, 'SECTOR CARONOCO', 2, '0.0000'),
('6793e24b1d05b', '2024-12-23', '6793e2237576b', 'C-155/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793e26a1b929', '2024-12-23', '671fddba88388', 'C-156/2024', 15, 3, 'SECTOR ALTA VISTA', 2, '0.0000'),
('6793e3548d037', '2024-12-23', '6793e28674bb4', 'C-157/2024', 15, 3, 'SECTOR VILLA LATINA', 2, '0.0000'),
('6793e37b7bede', '2024-12-23', '671fdf997bd34', 'C-158/2024', 15, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793e3ec0b757', '2024-12-23', '6793e3c70b3d6', 'C-159/2024', 8, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e43446827', '2024-12-23', '6793e410717bd', 'C-160/2024', 13, 3, 'SECTOR EL PASEO', 2, '0.0000'),
('6793e453a20d8', '2024-12-23', '671fde22d68d2', 'C-161/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793e470f14a5', '2024-12-23', '671fdf588ff66', 'C-162/2024', 15, 3, 'SECTOR VILLA ANTILLANA', 2, '0.0000'),
('6793f43e4e5c9', '2024-12-23', '671fe0e5a2813', 'C-163/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793f46405de1', '2024-12-23', '671fe2e9c9785', 'C-164/2024', 18, 3, 'SECTOR UNEXPO', 2, '0.0000'),
('6793f4c53102e', '2024-12-23', '6793f4a158196', 'C-165/2024', 12, 3, 'SECTOR VILLA ALIANZA', 2, '0.0000'),
('6793f4ee5f9e4', '2024-12-23', '671fe1660a1f9', 'C-166/2024', 15, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793f52d7b624', '2024-12-23', '671fe35065075', 'C-167/2024', 15, 3, 'SECTOR RIO ARO', 2, '0.0000'),
('6793f575c38cc', '2024-12-23', '671fe18477626', 'C-168/2024', 15, 3, 'SECTOR RIO ARO', 2, '0.0000'),
('6793f58f02271', '2024-12-23', '671fe1cf6ecc9', 'C-169/2024', 13, 3, 'SECTOR EL PASEO', 2, '0.0000'),
('6793f5b5d83f8', '2024-12-23', '671fe1e9ae255', 'C-170/2024', 15, 3, 'SECTOR CARONOCO', 2, '0.0000'),
('6793f5d2b4e80', '2024-12-23', '671fe41ee8c65', 'C-171/2024', 11, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793f5eae5824', '2024-12-23', '671fe31edc4b6', 'C-172/2024', 15, 3, 'SECTOR CORONOCO', 2, '0.0000'),
('6793f606776da', '2024-12-23', '671fe365a674d', 'C-173/2024', 15, 3, 'SECTOR VILLA NAUTICA', 2, '0.0000'),
('6793f635e6e0e', '2024-12-23', '671fe3a35e653', 'C-174/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793f64d28902', '2024-12-23', '671fe3efc5cd9', 'C-175/2024', 15, 3, 'SECTOR LOS SALTOS', 2, '0.0000'),
('6793f667ad57c', '2024-12-23', '671fe298833fe', 'C-176/2024', 15, 3, 'SECTOR CORONOCO', 2, '0.0000'),
('6793f6da26245', '2024-12-23', '6793f69284b40', 'C-177/2024', 15, 3, 'SECTOR LOS ALTOS', 2, '0.0000'),
('6793f717cd817', '2024-12-23', '6793f6f51cd47', 'C-178/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793f735e834e', '2024-12-23', '671fe44e1c92b', 'C-179/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793f74f3f05f', '2024-12-23', '671fe47ce5e16', 'C-180/2024', 15, 3, 'SECTOR LOS SALTOS', 2, '0.0000'),
('6793f76f747b3', '2024-12-23', '671fe490e62b7', 'C-181/2024', 15, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793f78e613c6', '2024-12-23', '671fe4b75c41a', 'C-182/2024', 8, 3, 'SECTOR ALTA VISTA', 2, '0.0000'),
('6793f7abb6156', '2024-12-23', '671fe4cf6044d', 'C-183/2024', 15, 3, 'SECTOR VILLA GRANADA', 2, '0.0000'),
('6793f7f399f8b', '2024-12-23', '6793f7d3b3e5d', 'C-184/2024', 15, 3, 'SECTOR MINIFINCA', 2, '0.0000'),
('6793f813033a9', '2024-12-23', '671fd6338ede0', 'C-185/2024', 8, 3, 'SECTOR CORONOCO', 2, '0.0000'),
('6793f86584de5', '2024-12-23', '6793f83c57b76', 'C-186/2024', 15, 3, 'SECTOR ARIVANA', 2, '0.0000'),
('6793f8a329cbf', '2024-12-23', '671fe50ed2543', 'C-187/2024', 15, 3, 'SECTOR AV ATLANTICO', 2, '0.0000'),
('6793f8f051c56', '2024-12-23', '6793f8d3b9c81', 'C-188/2024', 15, 3, 'SECTOR CARONOCO', 2, '0.0000'),
('6793f90c8d070', '2024-12-23', '671fdce27a357', 'C-189/2024', 8, 3, 'SECTOR CC NARAYA', 3, '0.0000'),
('6793f965d96df', '2024-12-23', '6793f936811db', 'C-190/2024', 8, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793f9a5a9c45', '2024-12-23', '6793f982a9483', 'C-191/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793f9edd90a1', '2024-12-23', '6793f9c2b2ffb', 'C-192/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793fa30c7c79', '2024-12-23', '6793fa0e81dd0', 'C-193/2024', 16, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793fa6d1bbf3', '2024-12-23', '6793fa4a11d26', 'C-194/2024', 15, 3, 'SECTOR CC NARAYA', 2, '0.0000'),
('6793faafede3e', '2024-12-23', '6793fa8bdde8c', 'C-195/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793face82866', '2024-12-23', '67857d2d5691a', 'C-196/2024', 15, 3, 'SECTOR VILLA ALIANZA', 2, '0.0000'),
('6793faeee084b', '2024-12-23', '671ff0d986369', 'C-197/2024', 15, 3, 'SECTOR AV ATLANTICO', 2, '0.0000'),
('6793fb2ec3a30', '2024-12-23', '6793fb0a9dc74', 'C-198/2024', 15, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793fb684289e', '2024-12-23', '6793fb480b69a', 'C-199/2024', 16, 3, 'SECTOR TERRAZAS DEL CARONI', 2, '0.0000'),
('6793fbb2b1400', '2024-12-23', '6793fb901a606', 'C-200/2024', 15, 3, 'SECTOR REDI AEROPUERTO', 2, '0.0000'),
('6793fcb0ef41d', '2025-01-24', '6793fc5bc2f49', 'C-004/2025', 16, 3, 'SECTOR LOS MANGOS RESD. DONA LAMIA 1, CASA #3', 1, '0.0000'),
('6797c871bc3e6', '2025-01-27', '6797c80bc98f6', 'C-005/2025', 15, 2, 'SECTOR ISLA DORADA MANZ-4 CASA #6', 1, '0.0000'),
('679936c915a06', '2025-01-28', '67993626515a0', 'C-006/2025', 15, 2, 'SECTOR  CONJUNTO RESIDENCIAL ISLA DORADA MANZ-3 CASA#06', 1, '0.0000'),
('6799375b60b6b', '2025-01-28', '6799370c3acd2', 'C-007/2025', 16, 3, 'SECTOR CC NARAYA, PISO 1, LOCAL 131', 1, '0.0000'),
('679a24edc0da7', '2025-01-27', '679a248bdec88', 'C-008/2025', 15, 2, 'SECTOR CONJENTO RESIDENCIAL ISLA DORADA MANZANA 10, CASA #8', 1, '0.0000'),
('679a264f3b4a8', '2025-01-28', '679a25fd83bdb', 'C-009/2025', 15, 2, 'SECTOR URB. LAS PIONIAS RESIDENCIA LAS ORQUIDEAS, TORRE 2, APTO 2PB-B2', 1, '0.0000'),
('679b9ac27103e', '2025-01-27', '679b9a9745df1', 'C-010/2025', 15, 3, 'SECTOR ALTA VISTA', 1, '0.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_estatus`
--

CREATE TABLE `tabla_contrato_estatus` (
  `id` int NOT NULL,
  `estatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `id` int NOT NULL,
  `nodo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_nodo`
--

INSERT INTO `tabla_contrato_nodo` (`id`, `nodo`) VALUES
(1, 'NODO SAN FELIX'),
(2, 'NODO CERRO QUEMAO'),
(3, 'NODO ALTA VISTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_contrato_plan`
--

CREATE TABLE `tabla_contrato_plan` (
  `id` int NOT NULL,
  `plan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detalle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `costo` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_contrato_plan`
--

INSERT INTO `tabla_contrato_plan` (`id`, `plan`, `detalle`, `costo`) VALUES
(1, 'PLAN BASICO', 'Servicio de 40 MB de Velocidad de Internet', '25.0000'),
(5, 'Contrato Servicio', 'cosas de servicio', '0.0000'),
(7, 'PLAN 50', 'PLAN DE 50 MB', '50.0000'),
(8, 'PLAN 30', 'PLAN DE 30$', '30.0000'),
(9, 'PLAN 60', 'PLAN DE 60$', '60.0000'),
(10, 'PLAN 150', 'PLAN DE 150$', '150.0000'),
(11, 'PLAN 35', 'PLAN DE 35$', '35.0000'),
(12, 'PLAN 40', 'PLAN DE 40$', '40.0000'),
(13, 'PLAN 45', 'PLAN DE 45$', '45.0000'),
(14, 'PLAN 90', 'PLAN DE 90$', '90.0000'),
(15, 'PLAN 25', 'PLAN DE 25$', '25.0000'),
(16, 'PLAN 15', 'PLAN DE 15$', '15.0000'),
(17, 'PLAN 75', 'PLAN DE 75$', '75.0000'),
(18, 'PLAN 15', 'PLAN DE 15$', '15.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_departamento_data`
--

CREATE TABLE `tabla_departamento_data` (
  `id` int NOT NULL,
  `link` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `departamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modulo` int NOT NULL
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
  `id` int NOT NULL,
  `accion` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `departamento` int NOT NULL,
  `opcion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_boton_data`
--

CREATE TABLE `tabla_depart_boton_data` (
  `id` int NOT NULL,
  `boton` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` int NOT NULL,
  `departamento` int NOT NULL
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
(50, '#btn_reg', 4, 1),
(51, '#btn_ver', 4, 1),
(52, '#btn_report', 4, 1),
(53, '#btn_reg', 4, 3),
(54, '#btn_ver', 4, 3),
(55, '#btn_report', 4, 3),
(56, '#btn_auto', 4, 3),
(57, '#btn_reg', 4, 2),
(58, '#btn_ver', 4, 2),
(59, '#btn_report', 4, 2),
(60, '#btn_reg', 4, 4),
(61, '#btn_ver', 4, 4),
(62, '#btn_report', 4, 4),
(63, '#btn_reg_tasa', 4, 5),
(64, '#btn_reg_plan', 4, 5),
(65, '#btn_reg_nodo', 4, 5),
(66, '#btn_reg_plan', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_depart_usuario_data`
--

CREATE TABLE `tabla_depart_usuario_data` (
  `id` int NOT NULL,
  `departamento` int NOT NULL,
  `usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_depart_usuario_data`
--

INSERT INTO `tabla_depart_usuario_data` (`id`, `departamento`, `usuario`) VALUES
(56, 2, 2),
(57, 3, 2),
(69, 1, 2),
(73, 1, 4),
(74, 3, 4),
(75, 2, 4),
(76, 4, 4),
(77, 5, 4),
(78, 6, 4),
(79, 6, 2),
(80, 5, 2),
(81, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_empresa_data`
--

CREATE TABLE `tabla_empresa_data` (
  `id` int NOT NULL,
  `empresa` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rif` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_modulo_data`
--

CREATE TABLE `tabla_modulo_data` (
  `id` int NOT NULL,
  `modulo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `id` int NOT NULL,
  `modulo` int NOT NULL,
  `usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_modulo_usuario_data`
--

INSERT INTO `tabla_modulo_usuario_data` (`id`, `modulo`, `usuario`) VALUES
(77, 2, 2),
(78, 3, 2),
(80, 1, 2),
(81, 1, 4),
(82, 2, 4),
(83, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_data`
--

CREATE TABLE `tabla_pago_data` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `nota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cliente` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrato` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `forma_pago` int NOT NULL,
  `detalle_pago` int NOT NULL,
  `monto_dolar` decimal(28,4) NOT NULL,
  `fecha_pago` date NOT NULL,
  `tasa` decimal(28,4) DEFAULT NULL,
  `referencia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `monto_cambio` decimal(28,4) DEFAULT NULL,
  `monto_pago` decimal(28,4) NOT NULL,
  `estatus` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_pago_data`
--

INSERT INTO `tabla_pago_data` (`id`, `fecha_registro`, `nota`, `cliente`, `contrato`, `forma_pago`, `detalle_pago`, `monto_dolar`, `fecha_pago`, `tasa`, `referencia`, `monto_cambio`, `monto_pago`, `estatus`) VALUES
('678fb5a3e6438', '2025-01-21 10:01:35', 'NE-001/2025', '67894d9a22ce8', '678e3b8d2f075', 1, 1, '25.0000', '2025-01-21', '54.9800', '15478', '27.2826', '1500.0000', 2),
('678fb7bd3d0fd', '2025-01-21 11:01:33', 'NE-002/2025', '67894d9a22ce8', '678e3b8d2f075', 1, 2, '25.0000', '2024-12-03', '55.8000', '2500', '44.8029', '2500.0000', 2),
('6798ee3cba8b5', '2025-01-28 10:01:28', 'NE-003/2025', '678579ad10ba1', '6791143458954', 1, 2, '35.0000', '2025-01-04', '58.5900', '9777', '35.0026', '2050.8000', 2),
('6798f0632b50a', '2025-01-28 10:01:39', 'NE-004/2025', '671fe47ce5e16', '6793f74f3f05f', 1, 2, '25.0000', '2025-01-06', '53.0400', '0825', '25.0000', '1326.0000', 2),
('6798f0db9e8d2', '2025-01-28 10:01:39', 'NE-005/2025', '679148e45dcb7', '679149055813b', 1, 2, '25.0000', '2025-01-06', '53.0400', '9409', '24.9811', '1325.0000', 2),
('6798f2037b98e', '2025-01-28 11:01:35', 'NE-006/2025', '6793f9c2b2ffb', '6793f9edd90a1', 1, 2, '25.0000', '2025-01-07', '52.5700', '3819', '25.0000', '1314.2500', 2),
('679b9c4856c86', '2025-01-30 11:01:36', 'NE-007/2025', '671fdce27a357', '6793f90c8d070', 1, 1, '30.0000', '2025-01-29', '57.2900', '9330', '30.0000', '1718.7000', 2),
('679bc2aae3a3d', '2025-01-30 14:01:22', 'NE-008/2025', '671fe35065075', '6793f52d7b624', 1, 2, '25.0000', '2025-01-06', '53.0400', '8556', '25.0000', '1326.0000', 2),
('679bc66a64c14', '2025-01-30 14:01:22', 'NE-009/2025', '678666e37dddc', '67914c5a9e257', 1, 2, '25.0000', '2025-01-06', '53.0100', '7571', '25.0000', '1325.2500', 2),
('679bc7e0deebc', '2025-01-30 14:01:36', 'NE-010/2025', '6793f4a158196', '6793f4c53102e', 1, 2, '40.0000', '2025-01-04', '53.0120', '7076', '40.0000', '2120.4800', 2),
('679bc9cc2e072', '2025-01-30 14:01:48', 'NE-011/2025', '678578503d7f1', '67913d2ce018f', 1, 2, '40.0000', '2025-01-09', '53.2800', '1832', '45.0000', '2397.6000', 2),
('679bcbfcabdfc', '2025-01-30 14:01:08', 'NE-012/2025', '671fd904322bb', '6793d8814fbc8', 1, 2, '40.0000', '2024-12-31', '51.9300', '9771', '45.0029', '2337.0000', 2),
('679bcdbd4a077', '2025-01-30 15:01:37', 'NE-013/2025', '67915c0591696', '67915c3a873be', 1, 2, '25.0000', '2025-01-14', '53.8000', '3348', '25.0000', '1345.0000', 2),
('679cd18faffa0', '2025-01-31 09:01:11', 'NE-014/2025', '67857a876a7e9', '67913ee377279', 2, 4, '30.0000', '2025-01-15', '53.9600', '', '70.0000', '0.0000', 2),
('679d62e91bab4', '2025-01-31 19:01:21', 'NE-015/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '30.0000', '2025-01-17', '50.0000', '', '50.0000', '0.0000', 2),
('679d659e30b51', '2025-01-31 20:01:54', 'NE-016/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '30.0000', '2025-01-10', '50.0000', '', '50.0000', '0.0000', 2),
('679d6857786f9', '2025-01-31 00:00:00', 'NE-017/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-212/2025', '20.0000', '0.0000', 2),
('679d685ed3d7a', '2025-01-31 00:00:00', 'NE-018/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-213/2025', '20.0000', '0.0000', 2),
('679d68fba1b6f', '2025-01-31 00:00:00', 'NE-019/2025', '', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-215/2025', '20.0000', '0.0000', 2),
('679d69ab4bf3b', '2025-01-31 00:00:00', 'NE-020/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-216/2025', '20.0000', '0.0000', 2),
('679d6b8a4606f', '2025-01-31 00:00:00', 'NE-021/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-217/2025', '20.0000', '0.0000', 2),
('679d7051ec996', '2025-01-31 20:01:33', 'NE-022/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '30.0000', '2025-01-30', '30.0000', '', '50.0000', '0.0000', 2),
('679d7085e854c', '2025-01-31 00:00:00', 'NE-023/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '20.0000', '2025-01-31', '0.0000', 'Abono OC-219/2025', '20.0000', '0.0000', 2),
('679d72456e8f2', '2025-01-31 21:01:53', 'NE-024/2025', '679110cf8550e', '679111d8a6d31', 2, 3, '30.0000', '2025-01-17', '55.9100', '', '35.7718', '2000.0000', 1),
('679d727be1810', '2025-01-31 00:00:00', 'NE-025/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '5.7718', '2025-01-31', '0.0000', 'Abono OC-220/2025', '5.7718', '0.0000', 1),
('679d74a319803', '2025-01-31 21:01:59', 'NE-026/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '34.2300', '2025-01-16', '45.0000', '', '50.0000', '0.0000', 1),
('679d74f22374b', '2025-01-31 00:00:00', 'NE-027/2025', '679110cf8550e', '679111d8a6d31', 2, 4, '15.7718', '2025-01-31', '0.0000', 'Abono OC-221/2025', '15.7718', '0.0000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_pago_forma`
--

CREATE TABLE `tabla_pago_forma` (
  `id` int NOT NULL,
  `forma` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
  `id` int NOT NULL,
  `detalle` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `forma` int NOT NULL
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
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `tasa` decimal(28,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_tasa_data`
--

INSERT INTO `tabla_tasa_data` (`id`, `fecha`, `tasa`) VALUES
(1, '2025-01-31', '30.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_usuario_data`
--

CREATE TABLE `tabla_usuario_data` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrasenna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_estatus`
--
ALTER TABLE `tabla_cobranza_estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tabla_cobranza_pago`
--
ALTER TABLE `tabla_cobranza_pago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_estatus`
--
ALTER TABLE `tabla_contrato_estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_nodo`
--
ALTER TABLE `tabla_contrato_nodo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_contrato_plan`
--
ALTER TABLE `tabla_contrato_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tabla_departamento_data`
--
ALTER TABLE `tabla_departamento_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_accion_data`
--
ALTER TABLE `tabla_depart_accion_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_boton_data`
--
ALTER TABLE `tabla_depart_boton_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `tabla_depart_usuario_data`
--
ALTER TABLE `tabla_depart_usuario_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `tabla_empresa_data`
--
ALTER TABLE `tabla_empresa_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_data`
--
ALTER TABLE `tabla_modulo_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tabla_modulo_usuario_data`
--
ALTER TABLE `tabla_modulo_usuario_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma`
--
ALTER TABLE `tabla_pago_forma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tabla_pago_forma_detalle`
--
ALTER TABLE `tabla_pago_forma_detalle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tabla_tasa_data`
--
ALTER TABLE `tabla_tasa_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tabla_usuario_data`
--
ALTER TABLE `tabla_usuario_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
