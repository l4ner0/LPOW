--Creación de las tablas

CREATE TABLE IF NOT EXISTS `empleado`(
	`id_empleado` int(11) NOT NULL,
	`foto` varchar(150) NOT NULL,
	`ap_paterno` varchar(20) NOT NULL,
	`ap_materno` varchar(20) NOT NULL,
	`nombres` varchar(50) NOT NULL,
	`sexo` varchar(1) NOT NULL,
	`telefono` varchar(9)
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `usuario_empleado`(
	`id_usuario` int(11) NOT NULL,
	`id_empleado` int(11) NOT NULL,
	`correo` varchar(30) NOT NULL,
	`clave` varchar(100) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `prestamo`(
	`id_prestamo` int(11) NOT NULL,
	`id_libro` int(11) NOT NULL,
	`id_empleado` int(11) NOT NULL,
	`fecha_prestamo` varchar(10) NOT NULL,
	`hora_prestamo` varchar(8) NOT NULL,
	`tipo_prestamo` varchar(20) NOT NULL,
	`observa_prestamo` text(200) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `libros`(
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1; 

CREATE TABLE IF NOT EXISTS `devolucion`(
	`id_devolucion` int(11) NOT NULL,
	`id_prestamo` int(11) NOT NULL,
	`fecha_devolucion` varchar(10) NOT NULL,
	`hora_devolucion` varchar(8) NOT NULL,
	`observa_devolucion` text(200) ,
	`estado_devolucion` varchar(20) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `autor`(
	`id_autor` int(11) NOT NULL,
	`apellidos` varchar(50) NOT NULL,
	`nombres` varchar(60) NOT NULL,
	`detalle` text(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `escuela`(
	`id_escuela` int(11) NOT NULL,
	`nombre` varchar(40) NOT NULL,
	`detalle` text(200)
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `tipo_libro`(
	`id_tipo_libro` int(11) NOT NULL,
	`tipo` varchar(40) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `solicitud_prestamo`(
	`id_alumno` int(11) NOT NULL,
	`id_prestamo` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

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
	`estado` int(1) NOT NULL,
	`key_reg` varchar(200) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `usuario_alumno`(
	`id_usuario` int(11) NOT NULL,
	`id_alumno` int(11) NOT NULL,
	`correo_insti` varchar(30) NOT NULL,
	`clave` varchar(100) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `base`(
	`id_base` int(11) NOT NULL,
	`anio_base` varchar(4) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `compucatalogo`(
	`id_compu` int(11) NOT NULL,
	`numero_compu` int(11) NOT NULL,
	`sistema_operativo` varchar(50),
	`descripcion` text(200),
	`usuario` varchar(20) NOT NULL,
	`clave` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8_general_ci AUTO_INCREMENT=1;