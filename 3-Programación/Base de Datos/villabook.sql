-- ##################
-- CREACION DE TABLAS
-- ##################

CREATE TABLE IF NOT EXISTS `empleado`(
	`id_empleado` int(11) NOT NULL,
	`foto` varchar(150) NOT NULL,
	`ap_paterno` varchar(20) NOT NULL,
	`ap_materno` varchar(20) NOT NULL,
	`nombres` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`telefono` varchar(9)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `usuario_empleado`(
	`id_usuario` int(11) NOT NULL,
	`id_empleado` int(11) NOT NULL,
	`correo` varchar(30) NOT NULL,
	`clave` varchar(100) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `prestamo`(
	`id_prestamo` int(11) NOT NULL,
	`id_libro` int(11) NOT NULL,
	`id_empleado` int(11) NOT NULL,
	`fecha_prestamo` varchar(10) NOT NULL,
	`hora_prestamo` varchar(8) NOT NULL,
	`tipo_prestamo` varchar(20) NOT NULL,
	`estado_prestamo` int(20) NOT NULL DEFAULT '0',
	`observa_prestamo` text(200) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `libro`(
	`id_libro` int(11) NOT NULL,
	`id_tipo_documento` int(11) NOT NULL,
	`id_escuela` int(11) NOT NULL,
	`id_autor` int(11) NOT NULL,
	`ISBN` varchar(50) NOT NULL,
	`portada` varchar(150) NOT NULL,
	`titulo` varchar(50) NOT NULL,
	`datos_publi` text(200),
	`stock_inicial` int(4) NOT NULL,
	`stock_final` int(4) NOT NULL,
	`estado` int(4) NOT NULL DEFAULT '1'  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1; 

CREATE TABLE IF NOT EXISTS `devolucion`(
	`id_devolucion` int(11) NOT NULL,
	`id_prestamo` int(11) NOT NULL,
	`fecha_devolucion` varchar(10) NOT NULL,
	`hora_devolucion` varchar(8) NOT NULL,
	`observa_devolucion` text(200) ,
	`estado_devolucion` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `autor`(
	`id_autor` int(11) NOT NULL,
	`apellidos` varchar(50) NOT NULL,
	`nombres` varchar(60) NOT NULL,
	`detalle` text(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `escuela`(
	`id_escuela` int(11) NOT NULL,
	`nombre` varchar(40) NOT NULL,
	`detalle` text(200)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tipo_documento`(
	`id_tipo_documento` int(11) NOT NULL,
	`tipo` varchar(40) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `solicitud_prestamo`(
	`id_alumno` int(11) NOT NULL,
	`id_prestamo` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `alumno`(
	`id_alumno` int(11) NOT NULL,
	`id_escuela` int(11) NOT NULL,
	`id_base` int(11) NOT NULL,
	`foto` varchar(150),
	`cod_alumno` varchar(10) NOT NULL,
	`ap_paterno` varchar(20) NOT NULL,
	`ap_materno` varchar(20) NOT NULL,
	`nombres` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`DNI` varchar(8) NOT NULL,
	`telefono` varchar(9),
	`direccion` varchar(50) NOT NULL,
	`fecha_registro` varchar(10) NOT NULL,
	`estado` int(1) DEFAULT '0' NOT NULL,
	`key_reg` varchar(200) DEFAULT '' NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `usuario_alumno`(
	`id_usuario` int(11) NOT NULL,
	`id_alumno` int(11) NOT NULL,
	`correo_insti` varchar(30) NOT NULL,
	`clave` varchar(100) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `base`(
	`id_base` int(11) NOT NULL,
	`anio_base` varchar(4) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `compucatalogo`(
	`id_compu` int(11) NOT NULL,
	`numero_compu` int(11) NOT NULL,
	`sistema_operativo` varchar(50),
	`descripcion` text(200),
	`usuario` varchar(20) NOT NULL,
	`clave` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- ---------------------------------------------------------------------------

-- #######################################
-- DECLARACION DE LLAVES PRIMARIAS E INDEX
-- #######################################

ALTER TABLE `empleado`
ADD PRIMARY KEY (`id_empleado`);

ALTER TABLE `usuario_empleado`
ADD PRIMARY KEY (`id_usuario`), ADD KEY `id_empleado` (`id_empleado`);

ALTER TABLE `prestamo`
ADD PRIMARY KEY (`id_prestamo`), ADD KEY `id_libro` (`id_libro`), 
ADD KEY `id_empleado` (`id_empleado`);

ALTER TABLE `libro`
ADD PRIMARY KEY (`id_libro`), ADD KEY `id_tipo_documento` (`id_tipo_documento`),
ADD KEY `id_escuela` (`id_escuela`),
ADD KEY `id_autor` (`id_autor`);

ALTER TABLE `devolucion`
ADD PRIMARY KEY (`id_devolucion`), ADD KEY `id_prestamo` (`id_prestamo`);

ALTER TABLE `autor`
ADD PRIMARY KEY (`id_autor`);

ALTER TABLE `escuela`
ADD PRIMARY KEY (`id_escuela`);

ALTER TABLE `tipo_documento`
ADD PRIMARY KEY (`id_tipo_documento`);

ALTER TABLE `solicitud_prestamo`
ADD KEY  `id_alumno` (`id_alumno`), ADD KEY `id_prestamo` (`id_prestamo`);

ALTER TABLE `alumno`
ADD PRIMARY KEY (`id_alumno`), ADD KEY `id_escuela` (`id_escuela`),
ADD KEY `id_base` (`id_base`);

ALTER TABLE `usuario_alumno`
ADD PRIMARY KEY (`id_usuario`), ADD KEY `id_alumno` (`id_alumno`);

ALTER TABLE `base`
ADD PRIMARY KEY (`id_base`);

ALTER TABLE `compucatalogo`
ADD PRIMARY KEY (`id_compu`); 

-- ---------------------------------------------------------------------------

-- #######################################
-- AÑADIENDO LA PROPIEDAD DE AUTOINCREMENT
-- #######################################

ALTER TABLE `empleado`
MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usuario_empleado`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `prestamo`
MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `libro`
MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `devolucion`
MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `autor`
MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `escuela`
MODIFY `id_escuela` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipo_documento`
MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alumno`
MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usuario_alumno`
MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `base`
MODIFY `id_base` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `compucatalogo`
MODIFY `id_compu` int(11) NOT NULL AUTO_INCREMENT;

-- ---------------------------------------------------------------------------

-- ####################################
-- AÑADIENDO LA PROPIEDAD DE DATO UNICO
-- ####################################

ALTER TABLE `usuario_empleado`
ADD UNIQUE KEY `correo` (`correo`);

ALTER TABLE `libro`
ADD UNIQUE KEY `ISBN` (`ISBN`);

ALTER TABLE `alumno`
ADD UNIQUE KEY `cod_alumno` (`cod_alumno`),
ADD UNIQUE KEY `DNI` (`DNI`);

ALTER TABLE `usuario_alumno`
ADD UNIQUE KEY `correo_insti` (`correo_insti`);

ALTER TABLE `compucatalogo`
ADD UNIQUE KEY `numero_compu` (`numero_compu`),
ADD UNIQUE KEY `usuario` (`usuario`);

-- ---------------------------------------------------------------------------


-- #######################################
-- CREANDO LAS RELACIONES ENTRE LAS TABLAS
-- #######################################

ALTER TABLE `usuario_empleado`
ADD CONSTRAINT `usuario_empleadoFk_id_empleado` 
FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `prestamo`
ADD CONSTRAINT `prestamoFk_id_libro`
FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
ADD CONSTRAINT `prestamoFk_id_empleado`
FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `libro`
ADD CONSTRAINT `libroFk_id_tipo_documento`
FOREIGN KEY  (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
ADD CONSTRAINT `libroFk_id_escuela`
FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id_escuela`),
ADD CONSTRAINT `libroFk_id_autor`
FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`);

ALTER TABLE `devolucion`
ADD CONSTRAINT `devolucionFk_id_prestamo`
FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`);

ALTER TABLE `solicitud_prestamo`
ADD CONSTRAINT `solicitud_prestamoFk_id_alumno`
FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
ADD CONSTRAINT `solicitud_prestamoFk_id_prestamo`
FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`);

ALTER TABLE `alumno`
ADD CONSTRAINT `alumnoFk_id_escuela`
FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id_escuela`),
ADD CONSTRAINT `alumnoFk_id_base`
FOREIGN KEY (`id_base`) REFERENCES `base` (`id_base`);

ALTER TABLE `usuario_alumno`
ADD CONSTRAINT `usuario_alumnoFk_id_alumno`
FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`);


--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `apellidos`, `nombres`, `detalle`) VALUES
(1, 'Lopez Ayala', 'Julio Cesar', ''),
(2, 'Perez', 'Jaime', ''),
(3, 'Santos ', 'German', ''),
(4, 'Feliciano', 'Luis', ''),
(5, 'Guillermo', 'Fernando', ''),
(6, 'Lopez', 'Gabriel', '');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `base`
--

INSERT INTO `base` (`id_base`, `anio_base`) VALUES
(1, '2015');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `foto`, `ap_paterno`, `ap_materno`, `nombres`, `sexo`, `telefono`) VALUES
(1, '', 'Urbina', 'Sante', 'Rodrigo Alonso', 'M', '5638324');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`id_escuela`, `nombre`, `detalle`) VALUES
(1, 'Ingeniería de Sistemas', NULL),
(2, 'Ingeniería Agroindustrial', NULL),
(3, 'Ingeniería de Transportes', NULL),
(4, 'Ingeniería Industrial', NULL);

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `tipo`) VALUES
(1, 'Libro');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `id_tipo_documento`, `id_escuela`, `id_autor`, `ISBN`, `portada`, `titulo`, `datos_publi`, `stock_inicial`, `stock_final`, `estado`) VALUES
(1, 1, 1, 1, '454-MP0', '', 'Fisica III', 'Libros prestados por el gobierno del Perú', 4, 4, 1),
(2, 1, 1, 1, '4444-PM', '', 'Dibujo Técnico III', 'Nada xD', 2, 2, 1),
(3, 1, 1, 2, '532PP-0', '', 'Mate I', '', 3, 3, 1),
(4, 1, 1, 1, '000-3333', '', 'Quimica I', '', 3, 3, 1),
(5, 1, 1, 1, '233333', '', 'Quimica II', '', 4, 4, 1),
(6, 1, 1, 2, '56667-099N', '', 'Administración III', 'Libro prestado', 3, 3, 1),
(7, 1, 1, 6, '333333-999', '', 'Inteligencia Artificial 2', '', 4, 4, 1);

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `id_escuela`, `id_base`, `foto`, `cod_alumno`, `ap_paterno`, `ap_materno`, `nombres`, `sexo`, `DNI`, `telefono`, `direccion`, `fecha_registro`, `estado`, `key_reg`) VALUES
(1, 1, 1, NULL, '2015019637', 'Urbina', 'Sante', 'Diego Alejandro', 'M', '77344583', '941885678', 'Av. Santa Gertrudis 393', '2018-07-20', 1, '');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `devolucion`
--
--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_libro`, `id_empleado`, `fecha_prestamo`, `hora_prestamo`, `tipo_prestamo`, `estado_prestamo`, `observa_prestamo`) VALUES
(1, 4, 1, '2018-07-20', '11:33', 'Presencial', 0, NULL);

-- --------------------------------------------------------

INSERT INTO `devolucion` (`id_devolucion`, `id_prestamo`, `fecha_devolucion`, `hora_devolucion`, `observa_devolucion`, `estado_devolucion`) VALUES
(1, 1, '2018-07-21', '11:35', NULL, '0');

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `solicitud_prestamo`
--

INSERT INTO `solicitud_prestamo` (`id_alumno`, `id_prestamo`) VALUES
(1, 1);

-- --------------------------------------------------------