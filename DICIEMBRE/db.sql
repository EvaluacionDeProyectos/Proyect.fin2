-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.26 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para sgea
CREATE DATABASE IF NOT EXISTS `sgea` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sgea`;


-- Volcando estructura para tabla sgea.aprendiz
CREATE TABLE IF NOT EXISTS `aprendiz` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` int(11) NOT NULL,
  `tipo` enum('C.C.','T.I.','C.E.','PASS','NIT') COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `inicioLectiva` date NOT NULL,
  `FinLectiva` date NOT NULL,
  `inicioProductiva` date NOT NULL,
  `finProductiva` date NOT NULL,
  `FK_ficha` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aprendiz_fk_ficha_foreign` (`FK_ficha`),
  CONSTRAINT `aprendiz_fk_ficha_foreign` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.aprendiz: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
INSERT INTO `aprendiz` (`id`, `documento`, `tipo`, `nombres`, `apellidos`, `fecha_nacimiento`, `email`, `direccion`, `telefono`, `inicioLectiva`, `FinLectiva`, `inicioProductiva`, `finProductiva`, `FK_ficha`) VALUES
	(1, 2147483647, 'T.I.', 'andrés', 'quintero', '1997-10-16', 'and.quin@gmail.com', 'calle 13', '25 15 4', '2015-02-18', '2015-12-11', '2015-12-14', '0000-00-00', 1);
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.centro
CREATE TABLE IF NOT EXISTS `centro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FK_regional` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `centro_fk_regional_foreign` (`FK_regional`),
  CONSTRAINT `centro_fk_regional_foreign` FOREIGN KEY (`FK_regional`) REFERENCES `regional` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.centro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` (`id`, `descripcion`, `direccion`, `FK_regional`) VALUES
	(1, 'gestion de mercados', '-', 1);
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.coordinacion
CREATE TABLE IF NOT EXISTS `coordinacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_centro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coordinacion_fk_centro_foreign` (`FK_centro`),
  CONSTRAINT `coordinacion_fk_centro_foreign` FOREIGN KEY (`FK_centro`) REFERENCES `centro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.coordinacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `coordinacion` DISABLE KEYS */;
INSERT INTO `coordinacion` (`id`, `nombre`, `FK_centro`) VALUES
	(1, 'articulacion con la media tecnica', 1);
/*!40000 ALTER TABLE `coordinacion` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.cuestionario
CREATE TABLE IF NOT EXISTS `cuestionario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.cuestionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Cuestionario ADSI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.detalle_cuestionario
CREATE TABLE IF NOT EXISTS `detalle_cuestionario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_cuestionario` int(10) unsigned NOT NULL,
  `FK_ficha` int(10) unsigned NOT NULL,
  `FK_instructor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_cuestionario_fk_cuestionario_foreign` (`FK_cuestionario`),
  KEY `detalle_cuestionario_fk_ficha_foreign` (`FK_ficha`),
  KEY `detalle_cuestionario_fk_instructor_foreign` (`FK_instructor`),
  CONSTRAINT `detalle_cuestionario_fk_cuestionario_foreign` FOREIGN KEY (`FK_cuestionario`) REFERENCES `cuestionario` (`id`),
  CONSTRAINT `detalle_cuestionario_fk_ficha_foreign` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`id`),
  CONSTRAINT `detalle_cuestionario_fk_instructor_foreign` FOREIGN KEY (`FK_instructor`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.detalle_cuestionario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_cuestionario` DISABLE KEYS */;
INSERT INTO `detalle_cuestionario` (`id`, `estado`, `FK_cuestionario`, `FK_ficha`, `FK_instructor`) VALUES
	(1, 'activo', 1, 1, 1),
	(2, 'activo', 1, 1, 2),
	(3, 'activo', 1, 1, 3);
/*!40000 ALTER TABLE `detalle_cuestionario` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.detalle_ficha
CREATE TABLE IF NOT EXISTS `detalle_ficha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_ficha` int(10) unsigned NOT NULL,
  `FK_instructor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_ficha_fk_ficha_foreign` (`FK_ficha`),
  KEY `detalle_ficha_fk_instructor_foreign` (`FK_instructor`),
  CONSTRAINT `detalle_ficha_fk_ficha_foreign` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`id`),
  CONSTRAINT `detalle_ficha_fk_instructor_foreign` FOREIGN KEY (`FK_instructor`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.detalle_ficha: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ficha` DISABLE KEYS */;
INSERT INTO `detalle_ficha` (`id`, `FK_ficha`, `FK_instructor`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `detalle_ficha` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.detalle_pregunta
CREATE TABLE IF NOT EXISTS `detalle_pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_pregunta` int(10) unsigned NOT NULL,
  `FK_cuestionario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_pregunta_fk_pregunta_foreign` (`FK_pregunta`),
  KEY `detalle_pregunta_fk_cuestionario_foreign` (`FK_cuestionario`),
  CONSTRAINT `detalle_pregunta_fk_cuestionario_foreign` FOREIGN KEY (`FK_cuestionario`) REFERENCES `cuestionario` (`id`),
  CONSTRAINT `detalle_pregunta_fk_pregunta_foreign` FOREIGN KEY (`FK_pregunta`) REFERENCES `pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.detalle_pregunta: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pregunta` DISABLE KEYS */;
INSERT INTO `detalle_pregunta` (`id`, `FK_pregunta`, `FK_cuestionario`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 1),
	(7, 7, 1),
	(8, 8, 1),
	(9, 9, 1),
	(10, 10, 1);
/*!40000 ALTER TABLE `detalle_pregunta` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.detalle_respuesta
CREATE TABLE IF NOT EXISTS `detalle_respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_aprendiz` int(10) unsigned NOT NULL,
  `FK_respuesta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_respuesta_fk_aprendiz_foreign` (`FK_aprendiz`),
  KEY `detalle_respuesta_fk_respuesta_foreign` (`FK_respuesta`),
  CONSTRAINT `detalle_respuesta_fk_aprendiz_foreign` FOREIGN KEY (`FK_aprendiz`) REFERENCES `aprendiz` (`id`),
  CONSTRAINT `detalle_respuesta_fk_respuesta_foreign` FOREIGN KEY (`FK_respuesta`) REFERENCES `respuesta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.detalle_respuesta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_respuesta` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.detalle_saber
CREATE TABLE IF NOT EXISTS `detalle_saber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_saber` int(10) unsigned NOT NULL,
  `FK_pregunta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_saber_fk_saber_foreign` (`FK_saber`),
  KEY `detalle_saber_fk_pregunta_foreign` (`FK_pregunta`),
  CONSTRAINT `detalle_saber_fk_pregunta_foreign` FOREIGN KEY (`FK_pregunta`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `detalle_saber_fk_saber_foreign` FOREIGN KEY (`FK_saber`) REFERENCES `saber` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.detalle_saber: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_saber` DISABLE KEYS */;
INSERT INTO `detalle_saber` (`id`, `FK_saber`, `FK_pregunta`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 2, 2),
	(4, 3, 3),
	(5, 2, 4),
	(6, 3, 4),
	(7, 2, 5),
	(8, 2, 6),
	(9, 2, 7),
	(10, 1, 7),
	(11, 1, 8),
	(12, 2, 8),
	(13, 1, 9),
	(14, 1, 10),
	(15, 2, 10),
	(16, 3, 10);
/*!40000 ALTER TABLE `detalle_saber` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.ficha
CREATE TABLE IF NOT EXISTS `ficha` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `FK_coordinacion` int(10) unsigned NOT NULL,
  `FK_programa` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_fk_coordinacion_foreign` (`FK_coordinacion`),
  KEY `ficha_fk_programa_foreign` (`FK_programa`),
  CONSTRAINT `ficha_fk_coordinacion_foreign` FOREIGN KEY (`FK_coordinacion`) REFERENCES `coordinacion` (`id`),
  CONSTRAINT `ficha_fk_programa_foreign` FOREIGN KEY (`FK_programa`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.ficha: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` (`id`, `codigo`, `FK_coordinacion`, `FK_programa`) VALUES
	(1, 912296, 1, 1);
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` int(11) NOT NULL,
  `tipo` enum('C.C.','T.I.','C.E.','PASS','NIT') COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipoInstructor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.instructor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` (`id`, `documento`, `tipo`, `nombres`, `apellidos`, `email`, `tipoInstructor`, `foto`) VALUES
	(1, 1044789644, 'C.C.', 'Diego Alejando', 'Boada', 'diegobom29@gmail.com', 'Tecnico', '-'),
	(2, 2147483647, 'C.C.', 'Olga Judith', 'Salas', 'oljudith64@hotmail.com', 'Transversal', '-'),
	(3, 1058788456, 'C.C.', 'Jaime Alonso', 'Ortiz', 'jaortiz288@misena.edu.co', 'Transversal', '-');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.migrations: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2015_12_03_200001_create_sabers_table', 1),
	('2015_12_03_200002_create_regionals_table', 1),
	('2015_12_03_200003_create_programas_table', 1),
	('2015_12_03_200004_create_instructors_table', 1),
	('2015_12_03_200005_create_cuestionarios_table', 1),
	('2015_12_03_200006_create_preguntas_table', 1),
	('2015_12_03_200011_create_detalle_preguntas_table', 1),
	('2015_12_03_200012_create_detalle_sabers_table', 1),
	('2015_12_03_200013_create_respuestas_table', 1),
	('2015_12_03_200015_create_centros_table', 1),
	('2015_12_03_200016_create_coordinacions_table', 1),
	('2015_12_03_200017_create_fichas_table', 1),
	('2015_12_03_200018_create_aprendizs_table', 1),
	('2015_12_03_200021_create_detalle_respuestas_table', 1),
	('2015_12_03_200023_create_detalle_fichas_table', 1),
	('2015_12_03_200024_create_detalle_cuestionarios_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.pregunta
CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoPregunta` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `indicacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.pregunta: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`id`, `tipoPregunta`, `descripcion`, `indicacion`) VALUES
	(1, 'unica', 'El instructor cumple con el tiempo programado, es puntual y desarrolla totalmente el plan de formacion', '-'),
	(2, 'unica', 'El instructor da a conocer al inicio de su formacion, el proyecto formativo, la planeacion pedagogica y las guias de aprendizaje para el desarrollo de su proceso formativo', '-'),
	(3, 'unica', 'El instructor muestra dominio tecnico de las actividades programadas en el desarrollo de su proceso formativo', '-'),
	(4, 'unica', 'El instructor contextualiza los contenidos de acuerdo al medio, argumenta sus explicaciones y referencia el material bibliografico y webfgrafia pertinentes a la competencia impartida', '-'),
	(5, 'unica', 'El instructor implementa estrategias didacticas(debate, ensayo, estudio de caso, juego de roles y proyectos) para facilitar la apropiacion de los conocimientos', '-'),
	(6, 'unica', 'El instructor promueve el uso de la plataforma blackboard-LMS para el desarrollo de las actividades autonomas de su proceso formativo ', '-'),
	(7, 'unica', 'El instructor promueve la formacion por proyectos como estrategia didactica u pedagogica de su proceso de aprendizaje y la construccion del conocimiento', '-'),
	(8, 'unica', 'El instructor realiza seguimiento al cumplimiento de las actividades concertadas para apoyar a los aprendices en la solucion de dificultades y establecer los planes de mejoramiento', '-'),
	(9, 'unica', 'El instructor trata a los aprendices con equidad, respeto, comportamiento etico, sentido de pertenencia, siendo receptivo a las criticas y sugerencias planteadas por ellos', '-'),
	(10, 'unica', 'El instructor cuenta con las competencias necesarias para guiar su proceso de formacion con calidad', '-'),
	(11, '-', '--', '-');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.programa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'ADSI', '-');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.regional
CREATE TABLE IF NOT EXISTS `regional` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.regional: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `regional` DISABLE KEYS */;
INSERT INTO `regional` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Distrito capital', '-');
/*!40000 ALTER TABLE `regional` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.respuesta
CREATE TABLE IF NOT EXISTS `respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FK_pregunta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `respuesta_fk_pregunta_foreign` (`FK_pregunta`),
  CONSTRAINT `respuesta_fk_pregunta_foreign` FOREIGN KEY (`FK_pregunta`) REFERENCES `pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.respuesta: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` (`id`, `valor`, `FK_pregunta`) VALUES
	(1, '100', 1),
	(2, '70', 1),
	(3, '40', 1),
	(5, '100', 2),
	(6, '70', 2),
	(7, '40', 2),
	(8, '100', 3),
	(9, '70', 3),
	(10, '40', 3),
	(11, '100', 4),
	(12, '70', 4),
	(13, '40', 4),
	(14, '100', 5),
	(15, '70', 5),
	(16, '40', 5),
	(17, '100', 6),
	(18, '70', 6),
	(19, '40', 6),
	(20, '100', 7),
	(21, '70', 7),
	(22, '40', 7),
	(23, '100', 8),
	(24, '70', 8),
	(25, '40', 8),
	(26, '100', 9),
	(27, '70', 9),
	(28, '40', 9),
	(31, '100', 10),
	(32, '70', 10),
	(33, '40', 10);
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.saber
CREATE TABLE IF NOT EXISTS `saber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.saber: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `saber` DISABLE KEYS */;
INSERT INTO `saber` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Hacer', '-'),
	(2, 'Saber', '-'),
	(3, 'Ser', '-');
/*!40000 ALTER TABLE `saber` ENABLE KEYS */;


-- Volcando estructura para tabla sgea.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla sgea.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'andres', 'a@git.com', '$2y$10$98awPikbhizWnSSTRwuQJOsu4CZ10XDxb4MvbqJkqVvz7Xkz/Fq5G', '6RQCwhzMwB7VVv8kIANQThVoLk3ZZVSORDAnaGDnX43rneVIPTk4C49AubsR', '2015-12-04 02:34:48', '2015-12-04 03:02:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
