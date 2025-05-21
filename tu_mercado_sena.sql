-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2025 a las 18:34:42
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
-- Base de datos: `tu_mercado_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloqueados`
--

DROP TABLE IF EXISTS `bloqueados`;
CREATE TABLE `bloqueados` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bloqueador` int(10) UNSIGNED NOT NULL COMMENT 'quien bloqueo al bloqueado',
  `id_bloqueado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_calificador` int(10) UNSIGNED NOT NULL COMMENT 'el calificador le puso unas estrellas al calificado',
  `id_calificado` int(10) UNSIGNED NOT NULL,
  `estrellas` tinyint(3) UNSIGNED NOT NULL COMMENT 'le puede poner de 1 a 5 estrellas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'por ejemplo, electrodomesticos, mobiliario, comida, ropa, etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'vestimenta'),
(2, 'alimento'),
(3, 'papelería'),
(4, 'herramienta'),
(5, 'cosmético'),
(6, 'deportivo'),
(7, 'dispositivo'),
(8, 'servicio'),
(9, 'social'),
(10, 'mobiliario'),
(11, 'vehículo'),
(12, 'mascota'),
(13, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario_a` int(10) UNSIGNED NOT NULL,
  `id_usuario_b` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'los chats se inician mediante un producto en venta, aqui estaria ese producto',
  `id_est_chat` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'el estado dice si el chat esta eliminado, finalizado, activo, etc',
  `visto_a` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'true indica que el ultimo mensaje de A fue visto por B, este bool se pone a true y false a medida que se escribe y lee el chat',
  `visto_b` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'true indica que el ultimo mensaje de B fue visto por A, este bool se pone a true y false a medida que se escribe y lee el chat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_chats`
--

DROP TABLE IF EXISTS `est_chats`;
CREATE TABLE `est_chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'ejemplo: eliminado, activo, finalizado con exito, etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `est_chats`
--

INSERT INTO `est_chats` (`id`, `nombre`) VALUES
(1, 'activo'),
(2, 'eliminado'),
(3, 'exitoso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_productos`
--

DROP TABLE IF EXISTS `est_productos`;
CREATE TABLE `est_productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'ejemplo: eliminado, activo, no visible, bloqueado para todos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `est_productos`
--

INSERT INTO `est_productos` (`id`, `nombre`) VALUES
(1, 'activo'),
(2, 'invisible'),
(3, 'eliminado'),
(4, 'bloqueado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_usuarios`
--

DROP TABLE IF EXISTS `est_usuarios`;
CREATE TABLE `est_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'ejemplo: activo, eliminado, bloqueado en general, invisible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `est_usuarios`
--

INSERT INTO `est_usuarios` (`id`, `nombre`) VALUES
(1, 'activo'),
(2, 'invisible'),
(3, 'eliminado'),
(4, 'bloqueado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE `favoritos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_votante` int(10) UNSIGNED NOT NULL COMMENT 'el votante dijo que el votado era su favorito',
  `id_votado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiales`
--

DROP TABLE IF EXISTS `historiales`;
CREATE TABLE `historiales` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'quien hizo la compra o la venta',
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'cual es el producto que se compro o vendio',
  `id_chat` int(10) UNSIGNED NOT NULL COMMENT 'el chat asociado a la transaccion',
  `precio` float NOT NULL COMMENT 'costo total de la transaccion en COP, todos los productos',
  `cantidad` smallint(5) UNSIGNED NOT NULL COMMENT 'cuantos se vendieron o compraron en la transaccion',
  `es_compra` tinyint(1) NOT NULL COMMENT 'true compro, false vendio',
  `fecha_registro` date NOT NULL DEFAULT current_timestamp() COMMENT 'esto se pone automaticamente al crear el registro y ya'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE `mensajes` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_escritor` int(10) UNSIGNED NOT NULL COMMENT 'quien creo el mensaje',
  `id_chat` int(10) UNSIGNED NOT NULL COMMENT 'a que chat va, ahi estara el receptor',
  `mensaje` varchar(512) NOT NULL COMMENT 'el texto como tal',
  `fecha_registro` date NOT NULL DEFAULT current_timestamp() COMMENT 'automaticamente se establece cuando se creo el mensaje',
  `es_imagen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'en true significa que habra un archivo JPG con su nombre referenciado al id de este mensaje'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preregistros`
--

DROP TABLE IF EXISTS `preregistros`;
CREATE TABLE `preregistros` (
  `id` int(10) UNSIGNED NOT NULL,
  `correo` varchar(64) NOT NULL,
  `password` varchar(127) NOT NULL COMMENT 'debe guardarse como hash',
  `fecha_mail` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'guarda el momento en que se envio una solicitud al mail, para poder esperar y no enviarlas muy seguido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `is_imagen` tinyint(1) NOT NULL COMMENT 'si es true, significa que habra un archivo del tipo img_id_producto.jpg en la carpeta correspondiente',
  `id_subcategoria` int(10) UNSIGNED NOT NULL COMMENT 'la subcategoria incluye a la categoria, por ejemplo, electrodomesticos, mobiliario, alimento, etc',
  `id_uso` int(10) UNSIGNED NOT NULL COMMENT 'para saber si el producto es nuevo, de segunda pero en buen estado o si es un producto con fallas',
  `id_propietario` int(10) UNSIGNED NOT NULL COMMENT 'apunta al id de usuario que es su creador',
  `id_est_producto` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'l estado define si esta visible, eliminado, bloqueado',
  `descripcion` varchar(512) NOT NULL COMMENT 'texto amplio describiendo las caracteristicas del producto',
  `precio` float NOT NULL COMMENT 'cuanto cuesta en COP',
  `disponibles` smallint(5) UNSIGNED NOT NULL COMMENT 'cuandos articulos hay disponibles',
  `fecha_registro` date NOT NULL DEFAULT current_timestamp() COMMENT 'esto solo se coloca automaticamente al crear el registro, y se deja asi',
  `fecha_actualiza` date NOT NULL DEFAULT '2000-01-01' COMMENT 'esto se actualiza cuando hay edicion por parte del propietario, es para evitar actualizaciones muy seguidas, opcionalmente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'por ejemplo, para la categoria ropa tenemos: calzado, pantalon, camisa, sombrero, etc',
  `id_categoria` int(10) UNSIGNED NOT NULL COMMENT 'a que categoria pertenece la subcategoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `nombre`, `id_categoria`) VALUES
(1, 'otro', 2),
(2, 'postre o helado', 2),
(3, 'fruta o verdura fresca', 2),
(4, 'carne o huevos', 2),
(5, 'especias o aditivos', 2),
(6, 'almuerzo o desayuno', 2),
(7, 'chatarra preparada', 2),
(8, 'chatarra industrial', 2),
(9, 'pan o pastel', 2),
(10, 'bebidas', 2),
(21, 'otro', 5),
(22, 'cuidado de la piel', 5),
(23, 'cuidado del pelo', 5),
(24, 'labial', 5),
(25, 'sombra', 5),
(26, 'delineador', 5),
(27, 'piercing', 5),
(28, 'tatuaje', 5),
(29, 'maniquiur', 5),
(30, 'peluqueria', 5),
(31, 'otro', 6),
(32, 'balón', 6),
(33, 'pesas', 6),
(34, 'suplemento alimenticio', 6),
(35, 'patineta o patines', 6),
(36, 'implementos acuaticos', 6),
(37, 'implementos terrestres', 6),
(38, 'implementos extremos', 6),
(39, 'arte marcial o lucha', 6),
(40, 'aseo deportivo', 6),
(41, 'otro', 7),
(42, 'computador de escritorio', 7),
(43, 'computador portátil', 7),
(44, 'periféricos para computador', 7),
(45, 'celular', 7),
(46, 'cámara fotográfica', 7),
(47, 'calculadora o mediciónes', 7),
(48, 'tableta para arte', 7),
(49, 'audifónos, reloj o corporales', 7),
(50, 'sistema de seguridad', 7),
(51, 'otro', 4),
(52, 'taladro, pulidora o similar', 4),
(53, 'martillo, alicate o similar', 4),
(54, 'licuadora, microondas o similar', 4),
(55, 'seguridad para ajustar bicicleta', 4),
(56, 'escuadra o regla para dibujo', 4),
(57, 'metro o medidores', 4),
(58, 'tijera, visturí o similar', 4),
(59, 'ventilador o aire acondicionado', 4),
(60, 'kit de mecánico', 4),
(61, 'otro', 4),
(62, 'taladro, pulidora o similar', 4),
(63, 'martillo, alicate o similar', 4),
(64, 'licuadora, microondas o similar', 4),
(65, 'seguridad para ajustar bicicleta', 4),
(66, 'escuadra o regla para dibujo', 4),
(67, 'metro o medidores', 4),
(68, 'tijera, visturí o similar', 4),
(69, 'ventilador o aire acondicionado', 4),
(70, 'kit de mecánico', 4),
(71, 'otro', 12),
(72, 'perro', 12),
(73, 'gato', 12),
(74, 'pez', 12),
(75, 'alimento', 12),
(76, 'correa', 12),
(77, 'juguete', 12),
(78, 'roedor', 12),
(79, 'tapete', 12),
(80, 'ropa', 12),
(81, 'otro', 10),
(82, 'silla regulable', 10),
(83, 'silla estática', 10),
(84, 'sillón grande', 10),
(85, 'mesa', 10),
(86, 'cama o colchón', 10),
(87, 'matera', 10),
(88, 'armario o nochero', 10),
(89, 'escritorio', 10),
(90, 'tapete', 10),
(91, 'otro', 13),
(92, 'otro', 3),
(93, 'hoja', 3),
(94, 'cartulina', 3),
(95, 'pegamento', 3),
(96, 'colores', 3),
(97, 'lápiz', 3),
(98, 'lapicero', 3),
(99, 'marcador', 3),
(100, 'borrador o sacapuntas', 3),
(101, 'fomi o tela', 3),
(102, 'otro', 8),
(103, 'entrenamiento deportivo', 8),
(104, 'eseñanza artística', 8),
(105, 'enseñanza tecnológica', 8),
(106, 'mantenimiento computadora', 8),
(107, 'reparación dispositivos', 8),
(108, 'preparación de comidas', 8),
(109, 'documentación', 8),
(110, 'creación de arte o manualidades', 8),
(111, 'cuidado y aseo', 8),
(112, 'otro', 9),
(113, 'juego deportivo', 9),
(114, 'juego videojuegos', 9),
(115, 'practicar idiomas', 9),
(116, 'fiesta y baile', 9),
(117, 'charlar', 9),
(118, 'emprendimiento', 9),
(119, 'paseos y viajes', 9),
(120, 'seguir en redes', 9),
(121, 'religión e ideologías', 9),
(122, 'otro', 11),
(123, 'bicicleta', 11),
(124, 'moto de gasolina', 11),
(125, 'casco de moto', 11),
(126, 'moto eléctrica', 11),
(127, 'bici o patín eléctricos', 11),
(128, 'carro', 11),
(129, 'chaleco, guantes o vestimenta', 11),
(130, 'repuesto', 11),
(131, 'parrillas o implementos', 11),
(132, 'otro', 1),
(133, 'calzado', 1),
(134, 'sombrero', 1),
(135, 'pantalón', 1),
(136, 'camisa', 1),
(137, 'vestido', 1),
(138, 'falda', 1),
(139, 'medias o guantes', 1),
(140, 'chaleco o buzo', 1),
(141, 'colgandijas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usos`
--

DROP TABLE IF EXISTS `usos`;
CREATE TABLE `usos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(32) NOT NULL COMMENT 'ejemplo, nuevo, de segunda pero bueno, en mal estado (digamos que vende un PC malo para sacarle componentes)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usos`
--

INSERT INTO `usos` (`id`, `nombre`) VALUES
(1, 'nuevo'),
(2, 'usado'),
(3, 'dañado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `correo` varchar(64) NOT NULL,
  `password` varchar(127) NOT NULL COMMENT 'debe guardarse como un hash',
  `nombre` varchar(32) NOT NULL,
  `avatar` int(10) UNSIGNED NOT NULL COMMENT 'apunta a alguna configuracion de sprites (imagenes) o a un servicio web con ID de avatar',
  `descripcion` varchar(512) NOT NULL COMMENT 'para que el usuario diga algo sobre si mismo en su perfil',
  `link` varchar(128) NOT NULL COMMENT 'si el usuario quiere compartir redes sociales o algo asi',
  `id_est_usuario` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'esto dice si el usuario esta pendiente de aprobacion, bloqueado del sistema, eliminado, etc',
  `notifica_correo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'en true significa que desea recibir correos cuando alguien se pone en contacto',
  `notifica_push` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'en true significa que quiere recibir notificaciones emergentes en celular o computadora cuando algo sucede',
  `uso_datos` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'en false reduce el consumo de datos de la aplicacion evitando cargar imagenes',
  `fecha_registro` date NOT NULL DEFAULT current_timestamp() COMMENT 'esto no se cambia, solo se pone automaticamente cuando el usuario se registra',
  `fecha_actualiza` date NOT NULL DEFAULT '2000-01-01' COMMENT 'se actualizara cada que el usuario edita su perfil, para dar una ventana de tiempo entre ediciones',
  `fecha_reciente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'utilizado para saber si el usuario ha estado activo recientemente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vistos`
--

DROP TABLE IF EXISTS `vistos`;
CREATE TABLE `vistos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL COMMENT 'quien observo el producto',
  `id_producto` int(10) UNSIGNED NOT NULL COMMENT 'que producto fue observado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bloqueados`
--
ALTER TABLE `bloqueados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_bloqueado` (`id_bloqueado`),
  ADD KEY `usuario_bloqueador` (`id_bloqueador`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_calificado` (`id_calificado`),
  ADD KEY `usuario_calificador` (`id_calificador`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_usuario_a` (`id_usuario_a`),
  ADD KEY `chat_usuario_b` (`id_usuario_b`),
  ADD KEY `chat_producto` (`id_producto`),
  ADD KEY `chat_estado` (`id_est_chat`);

--
-- Indices de la tabla `est_chats`
--
ALTER TABLE `est_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `est_productos`
--
ALTER TABLE `est_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `est_usuarios`
--
ALTER TABLE `est_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_votado` (`id_votado`),
  ADD KEY `usuario_votante` (`id_votante`);

--
-- Indices de la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_chat` (`id_chat`),
  ADD KEY `historial_producto` (`id_producto`),
  ADD KEY `historial_usuario` (`id_usuario`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensaje_chat` (`id_chat`),
  ADD KEY `mensaje_usuario` (`id_escritor`);

--
-- Indices de la tabla `preregistros`
--
ALTER TABLE `preregistros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_unico` (`correo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_usuario` (`id_propietario`),
  ADD KEY `producto_estado` (`id_est_producto`),
  ADD KEY `producto_subcategoria` (`id_subcategoria`),
  ADD KEY `producto_uso` (`id_uso`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategoria_categoria` (`id_categoria`);

--
-- Indices de la tabla `usos`
--
ALTER TABLE `usos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_unico` (`correo`),
  ADD KEY `usuario_estado` (`id_est_usuario`);

--
-- Indices de la tabla `vistos`
--
ALTER TABLE `vistos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visto_producto` (`id_producto`),
  ADD KEY `visto_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bloqueados`
--
ALTER TABLE `bloqueados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `est_chats`
--
ALTER TABLE `est_chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `est_productos`
--
ALTER TABLE `est_productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `est_usuarios`
--
ALTER TABLE `est_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historiales`
--
ALTER TABLE `historiales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preregistros`
--
ALTER TABLE `preregistros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `usos`
--
ALTER TABLE `usos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vistos`
--
ALTER TABLE `vistos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloqueados`
--
ALTER TABLE `bloqueados`
  ADD CONSTRAINT `usuario_bloqueado` FOREIGN KEY (`id_bloqueado`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_bloqueador` FOREIGN KEY (`id_bloqueador`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `usuario_calificado` FOREIGN KEY (`id_calificado`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usuario_calificador` FOREIGN KEY (`id_calificador`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chat_estado` FOREIGN KEY (`id_est_chat`) REFERENCES `est_chats` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_usuario_a` FOREIGN KEY (`id_usuario_a`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_usuario_b` FOREIGN KEY (`id_usuario_b`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `usuario_votado` FOREIGN KEY (`id_votado`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_votante` FOREIGN KEY (`id_votante`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD CONSTRAINT `historial_chat` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensaje_chat` FOREIGN KEY (`id_chat`) REFERENCES `chats` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mensaje_usuario` FOREIGN KEY (`id_escritor`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_estado` FOREIGN KEY (`id_est_producto`) REFERENCES `est_productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_subcategoria` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_uso` FOREIGN KEY (`id_uso`) REFERENCES `usos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_usuario` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategoria_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_estado` FOREIGN KEY (`id_est_usuario`) REFERENCES `est_usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vistos`
--
ALTER TABLE `vistos`
  ADD CONSTRAINT `visto_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `visto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
