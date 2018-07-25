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
	`fecha_prestamo` varchar(10) NOT NULL ,
	`hora_prestamo` varchar(8) NOT NULL,
	`tipo_prestamo` varchar(20) NOT NULL,
	`estado_prestamo` int(20) NOT NULL DEFAULT '1',
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
	`estado_devolucion` int(20) NOT NULL DEFAULT '1'
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
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_libro`, `id_empleado`, `fecha_prestamo`, `hora_prestamo`, `tipo_prestamo`, `observa_prestamo`) VALUES
(1, 4, 1, '2018-07-20', '11:33', 'Presencial', NULL);

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `devolucion`
--

INSERT INTO `devolucion` (`id_devolucion`, `id_prestamo`, `fecha_devolucion`, `hora_devolucion`, `observa_devolucion`) VALUES
(1, 1, '2018-07-21', '11:35', NULL);

-- --------------------------------------------------------
--
-- Volcado de datos para la tabla `solicitud_prestamo`
--

INSERT INTO `solicitud_prestamo` (`id_alumno`, `id_prestamo`) VALUES
(1, 1);

-- --------------------------------------------------------
--
-- Procedimientos Almacenados
--
--

DELIMITER $$

-- Procedimiento para insertar autor

CREATE PROCEDURE insertarAutor(_apellidos varchar(50), _nombres varchar(60), _detalle text)
INSERT INTO autor (apellidos,nombres,detalle) VALUES (_apellidos,_nombres,_detalle)
$$


-- Procedimiento para listar todos los autores

CREATE PROCEDURE listarAutores()
SELECT * FROM autor
$$


-- Procedimiento para obtener un empleado

CREATE PROCEDURE obtenerEmpleado( _id_empleado int(11) )
SELECT * FROM empleado WHERE id_empleado=_id_empleado
$$


-- Procedimiento para validar logueo de un empleado

CREATE PROCEDURE validarIngresoEmpleado( _correo varchar(30), _clave varchar(100) )
SELECT id_empleado FROM usuario_empleado WHERE correo = _correo AND clave = _clave
$$


-- Procedimiento para listar todas las escuelas

CREATE PROCEDURE listarEscuelas()
SELECT * FROM escuela
$$


-- Procedimiento para agregar un libro

CREATE PROCEDURE agregarLibro(
	_id_tipo_documento int(11), 
	_id_escuela int(11), 
	_id_autor int(11), 
	_ISBN varchar(50), 
	_portada varchar(150), 
	_titulo varchar(50), 
	_datos_publi text, 
	_stock_inicial int(4), 
	_stock_final int(4) 
	)
INSERT INTO libro (id_tipo_documento,id_escuela,id_autor,
                   ISBN,portada,titulo,datos_publi,stock_inicial,stock_final) 
        VALUES (_id_tipo_documento,_id_escuela,_id_autor,_ISBN,_portada,_titulo,_datos_publi,_stock_inicial,_stock_final) 
$$


-- Procedimiento para buscar un libro 

CREATE PROCEDURE buscarLibro( _ISBN varchar(50) )
SELECT * FROM libro WHERE ISBN = _ISBN
$$


-- Procedimiento para mostrar libros en la tabla libros

CREATE PROCEDURE listarLibrosTabla()
SELECT 
	id_libro,tipo, nombre, apellidos,nombres,ISBN,portada,titulo,datos_publi,stock_inicial,stock_final
FROM libro as l
INNER JOIN tipo_documento as tp
ON l.id_tipo_documento=tp.id_tipo_documento
INNER JOIN escuela as e
ON l.id_escuela=e.id_escuela
INNER JOIN autor as a
ON l.id_autor=a.id_autor
WHERE estado=1
$$


-- Procedimiento para actualizar datos de un libro

CREATE PROCEDURE editarLibro(
	_id_tipo_documento int(11), 
	_id_escuela int(11), 
	_id_autor int(11), 
	_ISBN varchar(50), 
	_portada varchar(150), 
	_titulo varchar(50), 
	_datos_publi text )
UPDATE libro SET 
    id_tipo_documento = _id_tipo_documento,
    id_escuela = _id_escuela,
    id_autor = _id_autor,
    portada = _portada,
    titulo = _titulo,
    datos_publi = _datos_publi
    WHERE ISBN = _ISBN
$$


-- Procedimiento para eliminar un libro

CREATE PROCEDURE eliminarLibro( _ISBN varchar(50) )
UPDATE libro SET estado=0 WHERE ISBN=_ISBN
$$


-- Procedimiento para listar los tipos de documentos

CREATE PROCEDURE listarTipoDocumentos()
SELECT * FROM tipo_documento
$$


-- Procedimiento para contar los estudiantes registrados

CREATE PROCEDURE contarEstudiantes()
SELECT COUNT(*) AS num_alumnos FROM alumno;
$$


-- Procedimiento para contar entregas pendientes

CREATE PROCEDURE contarEntregasPendientes()
SELECT COUNT(*) AS num_entregasPendientes FROM prestamo WHERE estado_prestamo = 1
$$


-- Procedimiento para contar los estudiantes registrados

CREATE PROCEDURE contarLibros()
SELECT COUNT(*) AS num_libros FROM libro WHERE estado=1
$$


-- Procedimiento para contar los estudiantes registrados

CREATE PROCEDURE contarDevolucionesPendientes()
SELECT COUNT(*) AS num_devolucionesPendientes FROM devolucion WHERE estado_devolucion=1
$$


-- Procedimiento para pintar tabla de entregas pendientes

CREATE PROCEDURE verEntregasPendientes()
SELECT 
	p.id_prestamo,
	al.ap_paterno AS apAlumno,al.ap_materno AS amAlumno,al.cod_alumno,
	l.isbn,l.titulo,
	a.apellidos AS apellidosAutor,a.nombres AS nombresAutor,
	p.hora_prestamo,p.fecha_prestamo,p.tipo_prestamo,p.estado_prestamo 
FROM prestamo as p
INNER JOIN libro as l
ON p.id_libro = l.id_libro
INNER JOIN autor as a 
ON l.id_autor = a.id_autor
INNER JOIN solicitud_prestamo as sp 
ON p.id_prestamo=sp.id_prestamo
INNER JOIN alumno as al 
ON sp.id_alumno = al.id_alumno
WHERE p.estado_prestamo = 1
$$


-- Procedimiento ver datos de aprobar entrega

CREATE PROCEDURE verAprobarEntrega( _id_prestamo int )
SELECT 
	p.id_prestamo,
	al.foto AS fotoAlumno,al.ap_paterno AS apAlumno,al.ap_materno AS amAlumno,al.nombres AS nombAlumno,al.cod_alumno,e.nombre AS escuela,
	l.portada,l.isbn,l.titulo,
	a.apellidos AS apelidosAutor,a.nombres AS nombresAutor,
	p.hora_prestamo,p.fecha_prestamo,p.tipo_prestamo,p.estado_prestamo 
FROM prestamo as p
INNER JOIN libro as l
ON p.id_libro = l.id_libro
INNER JOIN autor as a 
ON l.id_autor = a.id_autor
INNER JOIN solicitud_prestamo as sp 
ON p.id_prestamo=sp.id_prestamo
INNER JOIN alumno as al 
ON sp.id_alumno = al.id_alumno
INNER JOIN escuela as e
ON al.id_escuela = e.id_escuela
WHERE p.id_prestamo = _id_prestamo
$$


-- Procedimiento para aprobar una entrega

CREATE PROCEDURE aprobarEntrega( _id_prestamo int, _fecha_devolucion varchar(10), _hora_devolucion varchar(8))
BEGIN
UPDATE prestamo 
SET estado_prestamo = 2 WHERE id_prestamo = _id_prestamo;
CALL agregarDevolucion(_id_prestamo,_fecha_devolucion,_hora_devolucion);
END$$


-- Procedimiento para cancelar una entrega

CREATE PROCEDURE noAprobarEntrega( _id_prestamo int, _motivo text )
UPDATE prestamo SET estado_prestamo = 0, observa_prestamo = _motivo WHERE id_prestamo = _id_prestamo
$$


-- Procedimiento para ver entregas no aprobadas

CREATE PROCEDURE verEntregasNoAprobadas()
SELECT 
	p.id_prestamo,
	al.ap_paterno AS apAlumno,al.ap_materno AS amAlumno,al.cod_alumno,
	l.isbn,l.titulo,
	a.apellidos AS apelidosAutor,a.nombres AS nombresAutor,
	p.hora_prestamo,p.fecha_prestamo,p.tipo_prestamo,p.estado_prestamo 
FROM prestamo as p
INNER JOIN libro as l
ON p.id_libro = l.id_libro
INNER JOIN autor as a 
ON l.id_autor = a.id_autor
INNER JOIN solicitud_prestamo as sp 
ON p.id_prestamo=sp.id_prestamo
INNER JOIN alumno as al 
ON sp.id_alumno = al.id_alumno
WHERE p.estado_prestamo = 0
$$


-- Procedimiento ver datos de una entrega no aprobada

CREATE PROCEDURE verNoAprobarEntrega( _id_prestamo int )
SELECT 
	p.id_prestamo,
	al.ap_paterno AS apAlumno,al.ap_materno AS amAlumno,al.nombres AS nombAlumno,al.cod_alumno,e.nombre AS escuela,
	l.isbn,l.titulo,
	a.apellidos AS apelidosAutor,a.nombres AS nombresAutor,
	emp.foto,emp.ap_paterno AS apEmpleado,emp.ap_materno AS amEmpleado,emp.nombres AS nombEmpleado,p.observa_prestamo,
	p.hora_prestamo,p.fecha_prestamo,p.tipo_prestamo,p.estado_prestamo 
FROM prestamo as p
INNER JOIN libro as l
ON l.id_libro = p.id_libro
INNER JOIN autor as a 
ON a.id_autor = l.id_autor
INNER JOIN solicitud_prestamo as sp 
ON sp.id_prestamo=p.id_prestamo
INNER JOIN alumno as al 
ON al.id_alumno = sp.id_alumno
INNER JOIN escuela as e
ON e.id_escuela = al.id_escuela
INNER JOIN empleado as emp
ON emp.id_empleado=p.id_empleado
WHERE p.id_prestamo = _id_prestamo
$$


-- Procedimiento para ver datos de una entrega aprobada

CREATE PROCEDURE verEntregasAprobadas()
SELECT 
	p.id_prestamo,
	al.ap_paterno AS apAlumno,al.ap_materno AS amAlumno,al.cod_alumno,
	l.isbn,l.titulo,
	a.apellidos AS apelidosAutor,a.nombres AS nombresAutor,
	p.hora_prestamo,p.fecha_prestamo,p.tipo_prestamo,p.estado_prestamo 
FROM prestamo as p
INNER JOIN libro as l
ON p.id_libro = l.id_libro
INNER JOIN autor as a 
ON l.id_autor = a.id_autor
INNER JOIN solicitud_prestamo as sp 
ON p.id_prestamo=sp.id_prestamo
INNER JOIN alumno as al 
ON sp.id_alumno = al.id_alumno
WHERE p.estado_prestamo = 2
$$

-- Procedimiento para generar una devolución

CREATE PROCEDURE agregarDevolucion(_id_prestamo int, _fecha_devolucion varchar(10), _hora_devolucion varchar(8))
INSERT INTO devolucion(id_prestamo,fecha_devolucion,hora_devolucion) 
VALUES (_id_prestamo, _fecha_devolucion, _hora_devolucion)

DELIMITER ;