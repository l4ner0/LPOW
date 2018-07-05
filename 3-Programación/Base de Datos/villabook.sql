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
	`observa_prestamo` text(200) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `libro`(
	`id_libro` int(11) NOT NULL,
	`id_tipo_libro` int(11) NOT NULL,
	`id_escuela` int(11) NOT NULL,
	`id_autor` int(11) NOT NULL,
	`ISBN` varchar(50) NOT NULL,
	`portada` varchar(150) NOT NULL,
	`titulo` varchar(50) NOT NULL,
	`datos_publi` text(200),
	`stock_inicial` int(4) NOT NULL,
	`stock_final` int(4) NOT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1; 

CREATE TABLE IF NOT EXISTS `devolucion`(
	`id_devolucion` int(11) NOT NULL,
	`id_prestamo` int(11) NOT NULL,
	`fecha_devolucion` varchar(10) NOT NULL,
	`hora_devolucion` varchar(8) NOT NULL,
	`observa_devolucion` text(200) ,
	`estado_devolucion` varchar(20) NOT NULL 
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

CREATE TABLE IF NOT EXISTS `tipo_libro`(
	`id_tipo_libro` int(11) NOT NULL,
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
ADD PRIMARY KEY (`id_libro`), ADD KEY `id_tipo_libro` (`id_tipo_libro`),
ADD KEY `id_escuela` (`id_escuela`),
ADD KEY `id_autor` (`id_autor`);

ALTER TABLE `devolucion`
ADD PRIMARY KEY (`id_devolucion`), ADD KEY `id_prestamo` (`id_prestamo`);

ALTER TABLE `autor`
ADD PRIMARY KEY (`id_autor`);

ALTER TABLE `escuela`
ADD PRIMARY KEY (`id_escuela`);

ALTER TABLE `tipo_libro`
ADD PRIMARY KEY (`id_tipo_libro`);

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

ALTER TABLE `tipo_libro`
MODIFY `id_tipo_libro` int(11) NOT NULL AUTO_INCREMENT;

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
ADD CONSTRAINT `libroFk_id_tipo_libro`
FOREIGN KEY  (`id_tipo_libro`) REFERENCES `tipo_libro` (`id_tipo_libro`),
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



