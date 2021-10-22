-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-10-2021 a las 21:52:05
-- Versión del servidor: 8.0.26-0ubuntu0.20.04.2
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dixiproj_kao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int NOT NULL,
  `actividad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicional`
--

CREATE TABLE `adicional` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `adicional` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alberca`
--

CREATE TABLE `alberca` (
  `id` int NOT NULL,
  `alberca` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `status_alberca_id` int NOT NULL,
  `horario_inicial` time DEFAULT NULL,
  `horatio_final` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amenidad`
--

CREATE TABLE `amenidad` (
  `id` int NOT NULL,
  `amenidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `id` int NOT NULL,
  `canal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_cancelacion`
--

CREATE TABLE `cargo_cancelacion` (
  `id` int NOT NULL,
  `cargo_cancelacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_kao`
--

CREATE TABLE `categoria_kao` (
  `id` int NOT NULL,
  `categoria_kao` varchar(255) DEFAULT NULL,
  `occ_max` varchar(255) DEFAULT NULL,
  `prioridad` varchar(255) DEFAULT NULL,
  `grupo` varchar(255) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `channel_manager`
--

CREATE TABLE `channel_manager` (
  `id` int NOT NULL,
  `channel_manager` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id` int NOT NULL,
  `clase` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonia`
--

CREATE TABLE `colonia` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `municipio_id` int NOT NULL,
  `asentamiento` varchar(255) DEFAULT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `colonia`
--

INSERT INTO `colonia` (`id`, `nombre`, `ciudad`, `municipio_id`, `asentamiento`, `codigo_postal`) VALUES
(10011, 'Zona Centro', 'Aguascalientes', 1001, 'Colonia', '20000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `score` int DEFAULT NULL,
  `canal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

CREATE TABLE `comida` (
  `id` int NOT NULL,
  `comida` varchar(255) DEFAULT NULL,
  `incluido` tinyint DEFAULT NULL,
  `costo_promedio` decimal(18,2) DEFAULT NULL,
  `restaurant_id` int NOT NULL,
  `origen_id` int NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_field`
--

CREATE TABLE `conf_field` (
  `id` int NOT NULL,
  `conf_field` varchar(255) DEFAULT NULL,
  `conf_field_new` varchar(255) DEFAULT NULL,
  `conf_table_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_table`
--

CREATE TABLE `conf_table` (
  `id` int NOT NULL,
  `conf_table` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img` tinyint DEFAULT NULL,
  `pdf` tinyint DEFAULT NULL,
  `files` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_type_view`
--

CREATE TABLE `conf_type_view` (
  `id` int NOT NULL,
  `conf_type_view` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_view`
--

CREATE TABLE `conf_view` (
  `id` int NOT NULL,
  `conf_table_id` int NOT NULL,
  `conf_type_view_id` int NOT NULL,
  `conf_field_id` int NOT NULL,
  `order` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `modelo_id` int NOT NULL,
  `termino_contrato` varchar(255) DEFAULT NULL,
  `penalizacion` varchar(255) DEFAULT NULL,
  `tipo_contrato_id` int NOT NULL,
  `costo_fijo` decimal(18,2) DEFAULT NULL,
  `distribucion_free` int DEFAULT NULL,
  `flat_take_rate` int DEFAULT NULL,
  `fecha_firma` date DEFAULT NULL,
  `link_carpeta` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_habitaciones` int DEFAULT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `pais_id` int NOT NULL,
  `estado_id` int NOT NULL,
  `municipio_id` int NOT NULL,
  `colonia_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_bloque`
--

CREATE TABLE `contrato_bloque` (
  `id` int NOT NULL,
  `VENTA` varchar(255) DEFAULT NULL,
  `comision` int DEFAULT NULL,
  `contrato_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_cpl`
--

CREATE TABLE `contrato_cpl` (
  `id` int NOT NULL,
  `CONTRATO_id` int NOT NULL,
  `tr` varchar(255) DEFAULT NULL,
  `cm` varchar(255) DEFAULT NULL,
  `ltv` varchar(255) DEFAULT NULL,
  `link_carpeta` varchar(255) DEFAULT NULL,
  `contacto_hotel` varchar(255) DEFAULT NULL,
  `renuncia` varchar(255) DEFAULT NULL,
  `b2bwaiver` varchar(255) DEFAULT NULL,
  `b2bgroup` varchar(255) DEFAULT NULL,
  `slab` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_excepcion`
--

CREATE TABLE `contrato_excepcion` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `monto` int DEFAULT NULL,
  `contrato_id` int NOT NULL,
  `tipo_excepcion_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id` int NOT NULL,
  `descuento` varchar(255) DEFAULT NULL,
  `PERSONA` varchar(255) DEFAULT NULL,
  `contrato_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_checkin`
--

CREATE TABLE `detalle_checkin` (
  `id` int NOT NULL,
  `detalle_checkin` varchar(255) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `comentarios` text,
  `hotel_id` int NOT NULL,
  `detalle_recepcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `empleado` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `acceso_aihms` varchar(255) DEFAULT NULL,
  `maneja_ota` varchar(255) DEFAULT NULL,
  `actividad_id` int NOT NULL,
  `puesto_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `requiere_reserva` tinyint DEFAULT NULL,
  `costo` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`, `pais_id`) VALUES
(1, 'Aguascalientes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festividad`
--

CREATE TABLE `festividad` (
  `id` int NOT NULL,
  `festividad` varchar(255) DEFAULT NULL,
  `tipo_dia_festivo_id` int NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` varchar(255) DEFAULT NULL,
  `precio_minimo` decimal(18,2) DEFAULT NULL,
  `precio_maximo` decimal(18,2) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id` int NOT NULL,
  `forma_pago` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generales`
--

CREATE TABLE `generales` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `edad_maxima_menores` int DEFAULT NULL,
  `hay_recepcion` tinyint DEFAULT NULL,
  `contacto_huesped_antes_llegar` tinyint DEFAULT NULL,
  `huesped_aceptado_mismo_dia` tinyint DEFAULT NULL,
  `horas_anticipacion_reserva` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` int NOT NULL,
  `habitacion` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `tipo_habitacion_id` int NOT NULL,
  `vista` varchar(255) DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `vendible` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id` int NOT NULL,
  `cuih` varchar(255) DEFAULT NULL,
  `hotel` varchar(255) DEFAULT NULL,
  `codigo_postal` char(5) DEFAULT NULL,
  `pais_id` int NOT NULL,
  `estado_id` int NOT NULL,
  `municipio_id` int NOT NULL,
  `colonia_id` int NOT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `numero_interior` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `liga_gogole` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `telefono_2` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `num_habitaciones` int DEFAULT NULL,
  `pagina_web` varchar(255) DEFAULT NULL,
  `sitio_interes_id` int NOT NULL,
  `deposito` decimal(18,2) DEFAULT NULL,
  `mascota` tinyint DEFAULT NULL,
  `tarifa_promedio` decimal(18,2) DEFAULT NULL,
  `tipo_hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id`, `cuih`, `hotel`, `codigo_postal`, `pais_id`, `estado_id`, `municipio_id`, `colonia_id`, `calle`, `numero_interior`, `correo`, `liga_gogole`, `telefono`, `telefono_2`, `celular`, `num_habitaciones`, `pagina_web`, `sitio_interes_id`, `deposito`, `mascota`, `tarifa_promedio`, `tipo_hotel_id`) VALUES
(1, 'dddd', 'hotel del sur', '56560', 1, 1, 1001, 10011, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_amenidad`
--

CREATE TABLE `hotel_has_amenidad` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `amenidad_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_amenidad_has_habitacion`
--

CREATE TABLE `hotel_has_amenidad_has_habitacion` (
  `hotel_has_amenidad_id` int NOT NULL,
  `habitacion_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_forma_pago`
--

CREATE TABLE `hotel_has_forma_pago` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `forma_pago_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_idioma`
--

CREATE TABLE `hotel_has_idioma` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `idioma_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_politica_cancelacion`
--

CREATE TABLE `hotel_has_politica_cancelacion` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `politica_cancelacion_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_servicio`
--

CREATE TABLE `hotel_has_servicio` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `servicio_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_tarjeta`
--

CREATE TABLE `hotel_has_tarjeta` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `tarjeta_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_tipo_habitacion`
--

CREATE TABLE `hotel_has_tipo_habitacion` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `tipo_habitacion_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_has_tipo_moneda`
--

CREATE TABLE `hotel_has_tipo_moneda` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `tipo_moneda_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `id` int NOT NULL,
  `idioma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `internet`
--

CREATE TABLE `internet` (
  `id` int NOT NULL,
  `INTERNET` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `cobertura` varchar(255) DEFAULT NULL,
  `calculo_costo` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL,
  `monto_reserva` varchar(255) DEFAULT NULL,
  `dominio` varchar(255) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id` int NOT NULL,
  `aplica_cargo` tinyint DEFAULT NULL,
  `cargo_mascota` decimal(18,2) DEFAULT NULL,
  `como_se_cobra` varchar(255) DEFAULT NULL,
  `comentarios` text,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medida_seguridad`
--

CREATE TABLE `medida_seguridad` (
  `id` int NOT NULL,
  `medida_seguridad` varchar(255) DEFAULT NULL,
  `tipo_medida_seguridad_id` int NOT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metabuscador`
--

CREATE TABLE `metabuscador` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `link_pagina_web` varchar(255) DEFAULT NULL,
  `accesos` varchar(255) DEFAULT NULL,
  `plataforma_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` int NOT NULL,
  `modelo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`, `estado_id`) VALUES
(1001, 'Aguascalientes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

CREATE TABLE `origen` (
  `id` int NOT NULL,
  `origen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ota`
--

CREATE TABLE `ota` (
  `id` int NOT NULL,
  `ota` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `status_ota_id` int NOT NULL,
  `status` tinyint DEFAULT NULL,
  `link_publicacion` varchar(255) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `mail_asociado` varchar(255) DEFAULT NULL,
  `fecha_ultimo_pago` date DEFAULT NULL,
  `tiene_adeudo` tinyint DEFAULT NULL,
  `monto_adeudo` decimal(18,2) DEFAULT '0.00',
  `comision` int DEFAULT NULL,
  `ota_nombre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ota_nombre`
--

CREATE TABLE `ota_nombre` (
  `id` int NOT NULL,
  `ota` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`) VALUES
(1, 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `penalizacion`
--

CREATE TABLE `penalizacion` (
  `id` int NOT NULL,
  `penalizacion` varchar(255) DEFAULT NULL,
  `costo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_adicionales`
--

CREATE TABLE `personas_adicionales` (
  `id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `costo_persona` decimal(18,2) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `photoshoot`
--

CREATE TABLE `photoshoot` (
  `id` int NOT NULL,
  `photoshoot` varchar(255) DEFAULT NULL,
  `fecha_sesion` date DEFAULT NULL,
  `CLAVE` varchar(255) DEFAULT NULL,
  `CARPETA` varchar(255) DEFAULT NULL,
  `ESPACIO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `ESPECIFICACIONES` varchar(255) DEFAULT NULL,
  `CANTIDAD` varchar(255) DEFAULT NULL,
  `UNIDAD` varchar(255) DEFAULT NULL,
  `AGENDADO` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id` int NOT NULL,
  `plataforma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `politica_cancelacion`
--

CREATE TABLE `politica_cancelacion` (
  `id` int NOT NULL,
  `tipo_cancelacion_id` int NOT NULL,
  `politica_cancelacion` varchar(255) DEFAULT NULL,
  `penalizacion_id` int NOT NULL,
  `cobrable` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_habitacion`
--

CREATE TABLE `precio_habitacion` (
  `id` int NOT NULL,
  `precio_habitacion` varchar(255) DEFAULT NULL,
  `tipo_habitacion_id` int NOT NULL,
  `precio_base` varchar(255) DEFAULT NULL,
  `lunes` varchar(255) DEFAULT NULL,
  `martes` varchar(255) DEFAULT NULL,
  `miercoles` varchar(255) DEFAULT NULL,
  `jueves` varchar(255) DEFAULT NULL,
  `viernes` varchar(255) DEFAULT NULL,
  `sabado` varchar(255) DEFAULT NULL,
  `domingo` varchar(255) DEFAULT NULL,
  `precio_persona_extra` varchar(255) DEFAULT NULL,
  `factura` tinyint DEFAULT NULL,
  `festividad_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id` int NOT NULL,
  `puesto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int NOT NULL,
  `restaurant` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `in_hotel` tinyint DEFAULT NULL,
  `hora_apertura` time DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL,
  `desayuno_id` int NOT NULL,
  `dias_servicio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int NOT NULL,
  `rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'administrador'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int NOT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  `tipo_servicio_id` int NOT NULL,
  `DEPORTE` varchar(255) DEFAULT NULL,
  `status_servicio_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_accesibilidad`
--

CREATE TABLE `servicio_accesibilidad` (
  `id` int NOT NULL,
  `servicio_accesibilidad` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio_interes`
--

CREATE TABLE `sitio_interes` (
  `id` int NOT NULL,
  `sitio_interes` varchar(255) DEFAULT NULL,
  `se_llega_caminando` tinyint DEFAULT NULL,
  `se_requiere_transporte` tinyint DEFAULT NULL,
  `AEREOPUERTO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sitio_interes`
--

INSERT INTO `sitio_interes` (`id`, `sitio_interes`, `se_llega_caminando`, `se_requiere_transporte`, `AEREOPUERTO`) VALUES
(1, 'centro coercial', 1, 1, 'dddd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_alberca`
--

CREATE TABLE `status_alberca` (
  `id` int NOT NULL,
  `status_alberca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_ota`
--

CREATE TABLE `status_ota` (
  `id` int NOT NULL,
  `status_ota` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_servicio`
--

CREATE TABLE `status_servicio` (
  `id` int NOT NULL,
  `status_servicio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int NOT NULL,
  `tarjeta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE `temporada` (
  `id` int NOT NULL,
  `temporada` varchar(255) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `tipo_temporada_id` int NOT NULL,
  `precio_minimo` int DEFAULT NULL,
  `precio_maximo` int DEFAULT NULL,
  `precio_base` int DEFAULT NULL,
  `FACTOR_DE_TEMPORADA` varchar(255) DEFAULT NULL,
  `PROMOCION` varchar(255) DEFAULT NULL,
  `DETALLE_DESC_PROMO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cancelacion`
--

CREATE TABLE `tipo_cancelacion` (
  `id` int NOT NULL,
  `tipo_cancelacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id` int NOT NULL,
  `tipo_contrato` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_dia_festivo`
--

CREATE TABLE `tipo_dia_festivo` (
  `id` int NOT NULL,
  `tipo_dia_festivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_excepcion`
--

CREATE TABLE `tipo_excepcion` (
  `id` int NOT NULL,
  `tipo_exencion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `id` int NOT NULL,
  `tipo_habitacion` varchar(255) DEFAULT NULL,
  `inventario` varchar(255) DEFAULT NULL,
  `max_occ` varchar(255) DEFAULT NULL,
  `nombre_ota_pms` varchar(255) DEFAULT NULL,
  `i` varchar(255) DEFAULT NULL,
  `m` varchar(255) DEFAULT NULL,
  `q` varchar(255) DEFAULT NULL,
  `k` varchar(255) DEFAULT NULL,
  `literas` varchar(255) DEFAULT NULL,
  `sofa_cama` varchar(255) DEFAULT NULL,
  `categoria_kao_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_hotel`
--

CREATE TABLE `tipo_hotel` (
  `id` int NOT NULL,
  `tipo_hotel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipo_hotel`
--

INSERT INTO `tipo_hotel` (`id`, `tipo_hotel`) VALUES
(1, 'hostal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_medida_seguridad`
--

CREATE TABLE `tipo_medida_seguridad` (
  `id` int NOT NULL,
  `tipo_medida_seguridad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE `tipo_moneda` (
  `id` int NOT NULL,
  `tipo_moneda` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id` int NOT NULL,
  `tipo_servicio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_temporada`
--

CREATE TABLE `tipo_temporada` (
  `id` int NOT NULL,
  `tipo_temporada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `rol_id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `rol_id`, `nombre`, `apellido`, `correo`, `telefono`, `hotel_id`, `status_id`, `password`) VALUES
(1, 'nancy', 1, 'nancy', 'tapia', 'tapian197@gmail.com', NULL, 1, 1, '202cb962ac59075b964b07152d234b70'),
(2, 'alfredo', 1, 'alfredo', NULL, 'alfdixi@gmail.com', NULL, 1, 1, '202cb962ac59075b964b07152d234b70');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `adicional`
--
ALTER TABLE `adicional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adicionales_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `alberca`
--
ALTER TABLE `alberca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alberca_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_alberca_status_alberca1_idx` (`status_alberca_id`);

--
-- Indices de la tabla `amenidad`
--
ALTER TABLE `amenidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo_cancelacion`
--
ALTER TABLE `cargo_cancelacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `categoria_kao`
--
ALTER TABLE `categoria_kao`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `channel_manager`
--
ALTER TABLE `channel_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_channel_manager_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clase_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_colonia_municipio1_idx` (`municipio_id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comentario_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_comentario_canal1_idx` (`canal_id`);

--
-- Indices de la tabla `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comida_restaurant1_idx` (`restaurant_id`),
  ADD KEY `fk_comida_origen1_idx` (`origen_id`);

--
-- Indices de la tabla `conf_field`
--
ALTER TABLE `conf_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conf_field_conf_table1_idx` (`conf_table_id`);

--
-- Indices de la tabla `conf_table`
--
ALTER TABLE `conf_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conf_type_view`
--
ALTER TABLE `conf_type_view`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conf_view`
--
ALTER TABLE `conf_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conf_view_conf_table1_idx` (`conf_table_id`),
  ADD KEY `fk_conf_view_conf_type_view1_idx` (`conf_type_view_id`),
  ADD KEY `fk_conf_view_conf_field1_idx` (`conf_field_id`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contrato_hotel2_idx` (`hotel_id`),
  ADD KEY `fk_contrato_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_contrato_pais1_idx` (`pais_id`),
  ADD KEY `fk_contrato_estado1_idx` (`estado_id`),
  ADD KEY `fk_contrato_municipio1_idx` (`municipio_id`),
  ADD KEY `fk_contrato_colonia1_idx` (`colonia_id`),
  ADD KEY `fk_contrato_tipo_contrato1_idx` (`tipo_contrato_id`),
  ADD KEY `fk_contrato_modelo1_idx` (`modelo_id`);

--
-- Indices de la tabla `contrato_bloque`
--
ALTER TABLE `contrato_bloque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contrato_bloque_contrato1_idx` (`contrato_id`);

--
-- Indices de la tabla `contrato_cpl`
--
ALTER TABLE `contrato_cpl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contrato_cpl_CONTRATO1_idx` (`CONTRATO_id`);

--
-- Indices de la tabla `contrato_excepcion`
--
ALTER TABLE `contrato_excepcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contrato_exencion_contrato1_idx` (`contrato_id`),
  ADD KEY `fk_contrato_exencion_tipo_excepcion1_idx` (`tipo_excepcion_id`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_descuento_contrato1_idx` (`contrato_id`);

--
-- Indices de la tabla `detalle_checkin`
--
ALTER TABLE `detalle_checkin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_checkin_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`,`actividad_id`),
  ADD KEY `fk_empleado_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_empleado_actividad1_idx` (`actividad_id`),
  ADD KEY `fk_empleado_puesto1_idx` (`puesto_id`);

--
-- Indices de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estacionamiento_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estado_pais1_idx` (`pais_id`);

--
-- Indices de la tabla `festividad`
--
ALTER TABLE `festividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_festividad_tipo_dia_festivo1_idx` (`tipo_dia_festivo_id`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generales`
--
ALTER TABLE `generales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_generales_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_habitacion_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_habitacion_tipo_habitacion1_idx` (`tipo_habitacion_id`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_pais1_idx` (`pais_id`),
  ADD KEY `fk_hotel_estado1_idx` (`estado_id`),
  ADD KEY `fk_hotel_municipio1_idx` (`municipio_id`),
  ADD KEY `fk_hotel_colonia1_idx` (`colonia_id`),
  ADD KEY `fk_hotel_sitio_interes1_idx` (`sitio_interes_id`),
  ADD KEY `fk_hotel_tipo_hotel1_idx` (`tipo_hotel_id`);

--
-- Indices de la tabla `hotel_has_amenidad`
--
ALTER TABLE `hotel_has_amenidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_amenidad_amenidad1_idx` (`amenidad_id`),
  ADD KEY `fk_hotel_has_amenidad_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_amenidad_has_habitacion`
--
ALTER TABLE `hotel_has_amenidad_has_habitacion`
  ADD PRIMARY KEY (`hotel_has_amenidad_id`,`habitacion_id`),
  ADD KEY `fk_hotel_has_amenidad_has_habitacion_habitacion1_idx` (`habitacion_id`),
  ADD KEY `fk_hotel_has_amenidad_has_habitacion_hotel_has_amenidad1_idx` (`hotel_has_amenidad_id`);

--
-- Indices de la tabla `hotel_has_forma_pago`
--
ALTER TABLE `hotel_has_forma_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_forma_pago_forma_pago1_idx` (`forma_pago_id`),
  ADD KEY `fk_hotel_has_forma_pago_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_idioma`
--
ALTER TABLE `hotel_has_idioma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_idioma_idioma1_idx` (`idioma_id`),
  ADD KEY `fk_hotel_has_idioma_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_politica_cancelacion`
--
ALTER TABLE `hotel_has_politica_cancelacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_politica_cancelacion_politica_cancelacion1_idx` (`politica_cancelacion_id`),
  ADD KEY `fk_hotel_has_politica_cancelacion_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_servicio`
--
ALTER TABLE `hotel_has_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_servicio_servicio1_idx` (`servicio_id`),
  ADD KEY `fk_hotel_has_servicio_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_tarjeta`
--
ALTER TABLE `hotel_has_tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_tarjeta_tarjeta1_idx` (`tarjeta_id`),
  ADD KEY `fk_hotel_has_tarjeta_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_tipo_habitacion`
--
ALTER TABLE `hotel_has_tipo_habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_tipo_habitacion_tipo_habitacion1_idx` (`tipo_habitacion_id`),
  ADD KEY `fk_hotel_has_tipo_habitacion_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `hotel_has_tipo_moneda`
--
ALTER TABLE `hotel_has_tipo_moneda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_has_tipo_moneda_tipo_moneda1_idx` (`tipo_moneda_id`),
  ADD KEY `fk_hotel_has_tipo_moneda_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `internet`
--
ALTER TABLE `internet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_INTERNET_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mascota_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `medida_seguridad`
--
ALTER TABLE `medida_seguridad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medida_seguridad_tipo_medida_seguridad1_idx` (`tipo_medida_seguridad_id`),
  ADD KEY `fk_medida_seguridad_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `metabuscador`
--
ALTER TABLE `metabuscador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_metabuscador_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_metabuscador_plataforma1_idx` (`plataforma_id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_municipio_estado1_idx` (`estado_id`);

--
-- Indices de la tabla `origen`
--
ALTER TABLE `origen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ota`
--
ALTER TABLE `ota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ota_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_ota_status_ota1_idx` (`status_ota_id`),
  ADD KEY `fk_ota_ota_nombre1_idx` (`ota_nombre_id`);

--
-- Indices de la tabla `ota_nombre`
--
ALTER TABLE `ota_nombre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `penalizacion`
--
ALTER TABLE `penalizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_adicionales`
--
ALTER TABLE `personas_adicionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personas_adicionales_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `photoshoot`
--
ALTER TABLE `photoshoot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_photoshoot_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `politica_cancelacion`
--
ALTER TABLE `politica_cancelacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cancelacion_tipo_cancelacion1_idx` (`tipo_cancelacion_id`),
  ADD KEY `fk_politica_cancelacion_penalizacion1_idx` (`penalizacion_id`);

--
-- Indices de la tabla `precio_habitacion`
--
ALTER TABLE `precio_habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_precio_habitacion_tipo_habitacion1_idx` (`tipo_habitacion_id`),
  ADD KEY `fk_precio_habitacion_festividad1_idx` (`festividad_id`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_restaurant_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicio_tipo_servicio1_idx` (`tipo_servicio_id`),
  ADD KEY `fk_servicio_status_servicio1_idx` (`status_servicio_id`);

--
-- Indices de la tabla `servicio_accesibilidad`
--
ALTER TABLE `servicio_accesibilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servicio_accesibilidad_hotel1_idx` (`hotel_id`);

--
-- Indices de la tabla `sitio_interes`
--
ALTER TABLE `sitio_interes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_alberca`
--
ALTER TABLE `status_alberca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_ota`
--
ALTER TABLE `status_ota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_servicio`
--
ALTER TABLE `status_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_temporada_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_temporada_tipo_temporada1_idx` (`tipo_temporada_id`);

--
-- Indices de la tabla `tipo_cancelacion`
--
ALTER TABLE `tipo_cancelacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_dia_festivo`
--
ALTER TABLE `tipo_dia_festivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_excepcion`
--
ALTER TABLE `tipo_excepcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_habitacion_categoria_kao1_idx` (`categoria_kao_id`);

--
-- Indices de la tabla `tipo_hotel`
--
ALTER TABLE `tipo_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_medida_seguridad`
--
ALTER TABLE `tipo_medida_seguridad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_temporada`
--
ALTER TABLE `tipo_temporada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_rol1_idx` (`rol_id`),
  ADD KEY `fk_usuario_hotel1_idx` (`hotel_id`),
  ADD KEY `fk_usuario_status1_idx` (`status_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adicional`
--
ALTER TABLE `adicional`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alberca`
--
ALTER TABLE `alberca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amenidad`
--
ALTER TABLE `amenidad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo_cancelacion`
--
ALTER TABLE `cargo_cancelacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_kao`
--
ALTER TABLE `categoria_kao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `channel_manager`
--
ALTER TABLE `channel_manager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colonia`
--
ALTER TABLE `colonia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10012;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conf_field`
--
ALTER TABLE `conf_field`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conf_table`
--
ALTER TABLE `conf_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conf_type_view`
--
ALTER TABLE `conf_type_view`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conf_view`
--
ALTER TABLE `conf_view`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato_bloque`
--
ALTER TABLE `contrato_bloque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato_cpl`
--
ALTER TABLE `contrato_cpl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato_excepcion`
--
ALTER TABLE `contrato_excepcion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_checkin`
--
ALTER TABLE `detalle_checkin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `festividad`
--
ALTER TABLE `festividad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generales`
--
ALTER TABLE `generales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `hotel_has_amenidad`
--
ALTER TABLE `hotel_has_amenidad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_forma_pago`
--
ALTER TABLE `hotel_has_forma_pago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_idioma`
--
ALTER TABLE `hotel_has_idioma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_politica_cancelacion`
--
ALTER TABLE `hotel_has_politica_cancelacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_servicio`
--
ALTER TABLE `hotel_has_servicio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_tarjeta`
--
ALTER TABLE `hotel_has_tarjeta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_tipo_habitacion`
--
ALTER TABLE `hotel_has_tipo_habitacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hotel_has_tipo_moneda`
--
ALTER TABLE `hotel_has_tipo_moneda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `internet`
--
ALTER TABLE `internet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medida_seguridad`
--
ALTER TABLE `medida_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metabuscador`
--
ALTER TABLE `metabuscador`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT de la tabla `origen`
--
ALTER TABLE `origen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ota`
--
ALTER TABLE `ota`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ota_nombre`
--
ALTER TABLE `ota_nombre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `penalizacion`
--
ALTER TABLE `penalizacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas_adicionales`
--
ALTER TABLE `personas_adicionales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `photoshoot`
--
ALTER TABLE `photoshoot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `politica_cancelacion`
--
ALTER TABLE `politica_cancelacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio_habitacion`
--
ALTER TABLE `precio_habitacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio_accesibilidad`
--
ALTER TABLE `servicio_accesibilidad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sitio_interes`
--
ALTER TABLE `sitio_interes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status_alberca`
--
ALTER TABLE `status_alberca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_ota`
--
ALTER TABLE `status_ota`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_servicio`
--
ALTER TABLE `status_servicio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temporada`
--
ALTER TABLE `temporada`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_cancelacion`
--
ALTER TABLE `tipo_cancelacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_dia_festivo`
--
ALTER TABLE `tipo_dia_festivo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_excepcion`
--
ALTER TABLE `tipo_excepcion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_hotel`
--
ALTER TABLE `tipo_hotel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_medida_seguridad`
--
ALTER TABLE `tipo_medida_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_temporada`
--
ALTER TABLE `tipo_temporada`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adicional`
--
ALTER TABLE `adicional`
  ADD CONSTRAINT `fk_adicionales_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `alberca`
--
ALTER TABLE `alberca`
  ADD CONSTRAINT `fk_alberca_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_alberca_status_alberca1` FOREIGN KEY (`status_alberca_id`) REFERENCES `status_alberca` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `channel_manager`
--
ALTER TABLE `channel_manager`
  ADD CONSTRAINT `fk_channel_manager_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `fk_clase_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD CONSTRAINT `fk_colonia_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comentario_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comida`
--
ALTER TABLE `comida`
  ADD CONSTRAINT `fk_comida_origen1` FOREIGN KEY (`origen_id`) REFERENCES `origen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comida_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `conf_field`
--
ALTER TABLE `conf_field`
  ADD CONSTRAINT `fk_conf_field_conf_table1` FOREIGN KEY (`conf_table_id`) REFERENCES `conf_table` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `conf_view`
--
ALTER TABLE `conf_view`
  ADD CONSTRAINT `fk_conf_view_conf_field1` FOREIGN KEY (`conf_field_id`) REFERENCES `conf_field` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_conf_view_conf_table1` FOREIGN KEY (`conf_table_id`) REFERENCES `conf_table` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_conf_view_conf_type_view1` FOREIGN KEY (`conf_type_view_id`) REFERENCES `conf_type_view` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_colonia1` FOREIGN KEY (`colonia_id`) REFERENCES `colonia` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_hotel2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`),
  ADD CONSTRAINT `fk_contrato_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_tipo_contrato1` FOREIGN KEY (`tipo_contrato_id`) REFERENCES `tipo_contrato` (`id`),
  ADD CONSTRAINT `fk_contrato_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contrato_bloque`
--
ALTER TABLE `contrato_bloque`
  ADD CONSTRAINT `fk_contrato_bloque_contrato1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`);

--
-- Filtros para la tabla `contrato_cpl`
--
ALTER TABLE `contrato_cpl`
  ADD CONSTRAINT `fk_contrato_cpl_CONTRATO1` FOREIGN KEY (`CONTRATO_id`) REFERENCES `contrato` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contrato_excepcion`
--
ALTER TABLE `contrato_excepcion`
  ADD CONSTRAINT `fk_contrato_exencion_contrato1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `fk_contrato_exencion_tipo_excepcion1` FOREIGN KEY (`tipo_excepcion_id`) REFERENCES `tipo_excepcion` (`id`);

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `fk_descuento_contrato1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`);

--
-- Filtros para la tabla `detalle_checkin`
--
ALTER TABLE `detalle_checkin`
  ADD CONSTRAINT `fk_detalle_checkin_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_actividad1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`),
  ADD CONSTRAINT `fk_empleado_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_empleado_puesto1` FOREIGN KEY (`puesto_id`) REFERENCES `puesto` (`id`);

--
-- Filtros para la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD CONSTRAINT `fk_estacionamiento_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `festividad`
--
ALTER TABLE `festividad`
  ADD CONSTRAINT `fk_festividad_tipo_dia_festivo1` FOREIGN KEY (`tipo_dia_festivo_id`) REFERENCES `tipo_dia_festivo` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `generales`
--
ALTER TABLE `generales`
  ADD CONSTRAINT `fk_generales_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `fk_habitacion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_habitacion_tipo_habitacion1` FOREIGN KEY (`tipo_habitacion_id`) REFERENCES `tipo_habitacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_colonia1` FOREIGN KEY (`colonia_id`) REFERENCES `colonia` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_sitio_interes1` FOREIGN KEY (`sitio_interes_id`) REFERENCES `sitio_interes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_tipo_hotel1` FOREIGN KEY (`tipo_hotel_id`) REFERENCES `tipo_hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_amenidad`
--
ALTER TABLE `hotel_has_amenidad`
  ADD CONSTRAINT `fk_hotel_has_amenidad_amenidad1` FOREIGN KEY (`amenidad_id`) REFERENCES `amenidad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_amenidad_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_amenidad_has_habitacion`
--
ALTER TABLE `hotel_has_amenidad_has_habitacion`
  ADD CONSTRAINT `fk_hotel_has_amenidad_has_habitacion_habitacion1` FOREIGN KEY (`habitacion_id`) REFERENCES `habitacion` (`id`),
  ADD CONSTRAINT `fk_hotel_has_amenidad_has_habitacion_hotel_has_amenidad1` FOREIGN KEY (`hotel_has_amenidad_id`) REFERENCES `hotel_has_amenidad` (`id`);

--
-- Filtros para la tabla `hotel_has_forma_pago`
--
ALTER TABLE `hotel_has_forma_pago`
  ADD CONSTRAINT `fk_hotel_has_forma_pago_forma_pago1` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_forma_pago_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_idioma`
--
ALTER TABLE `hotel_has_idioma`
  ADD CONSTRAINT `fk_hotel_has_idioma_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_idioma_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_politica_cancelacion`
--
ALTER TABLE `hotel_has_politica_cancelacion`
  ADD CONSTRAINT `fk_hotel_has_politica_cancelacion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_politica_cancelacion_politica_cancelacion1` FOREIGN KEY (`politica_cancelacion_id`) REFERENCES `politica_cancelacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_servicio`
--
ALTER TABLE `hotel_has_servicio`
  ADD CONSTRAINT `fk_hotel_has_servicio_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_servicio_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_tarjeta`
--
ALTER TABLE `hotel_has_tarjeta`
  ADD CONSTRAINT `fk_hotel_has_tarjeta_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_tarjeta_tarjeta1` FOREIGN KEY (`tarjeta_id`) REFERENCES `tarjeta` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_tipo_habitacion`
--
ALTER TABLE `hotel_has_tipo_habitacion`
  ADD CONSTRAINT `fk_hotel_has_tipo_habitacion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_tipo_habitacion_tipo_habitacion1` FOREIGN KEY (`tipo_habitacion_id`) REFERENCES `tipo_habitacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `hotel_has_tipo_moneda`
--
ALTER TABLE `hotel_has_tipo_moneda`
  ADD CONSTRAINT `fk_hotel_has_tipo_moneda_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hotel_has_tipo_moneda_tipo_moneda1` FOREIGN KEY (`tipo_moneda_id`) REFERENCES `tipo_moneda` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `internet`
--
ALTER TABLE `internet`
  ADD CONSTRAINT `fk_INTERNET_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `fk_mascota_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medida_seguridad`
--
ALTER TABLE `medida_seguridad`
  ADD CONSTRAINT `fk_medida_seguridad_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_medida_seguridad_tipo_medida_seguridad1` FOREIGN KEY (`tipo_medida_seguridad_id`) REFERENCES `tipo_medida_seguridad` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `metabuscador`
--
ALTER TABLE `metabuscador`
  ADD CONSTRAINT `fk_metabuscador_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_metabuscador_plataforma1` FOREIGN KEY (`plataforma_id`) REFERENCES `plataforma` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `fk_municipio_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ota`
--
ALTER TABLE `ota`
  ADD CONSTRAINT `fk_ota_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ota_ota_nombre1` FOREIGN KEY (`ota_nombre_id`) REFERENCES `ota_nombre` (`id`),
  ADD CONSTRAINT `fk_ota_status_ota1` FOREIGN KEY (`status_ota_id`) REFERENCES `status_ota` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personas_adicionales`
--
ALTER TABLE `personas_adicionales`
  ADD CONSTRAINT `fk_personas_adicionales_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `photoshoot`
--
ALTER TABLE `photoshoot`
  ADD CONSTRAINT `fk_photoshoot_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `politica_cancelacion`
--
ALTER TABLE `politica_cancelacion`
  ADD CONSTRAINT `fk_cancelacion_tipo_cancelacion1` FOREIGN KEY (`tipo_cancelacion_id`) REFERENCES `tipo_cancelacion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_politica_cancelacion_penalizacion1` FOREIGN KEY (`penalizacion_id`) REFERENCES `penalizacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `precio_habitacion`
--
ALTER TABLE `precio_habitacion`
  ADD CONSTRAINT `fk_precio_habitacion_festividad1` FOREIGN KEY (`festividad_id`) REFERENCES `festividad` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_precio_habitacion_tipo_habitacion1` FOREIGN KEY (`tipo_habitacion_id`) REFERENCES `tipo_habitacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `fk_restaurant_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_status_servicio1` FOREIGN KEY (`status_servicio_id`) REFERENCES `status_servicio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_servicio_tipo_servicio1` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipo_servicio` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `servicio_accesibilidad`
--
ALTER TABLE `servicio_accesibilidad`
  ADD CONSTRAINT `fk_servicio_accesibilidad_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD CONSTRAINT `fk_temporada_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_temporada_tipo_temporada1` FOREIGN KEY (`tipo_temporada_id`) REFERENCES `tipo_temporada` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD CONSTRAINT `fk_tipo_habitacion_categoria_kao1` FOREIGN KEY (`categoria_kao_id`) REFERENCES `categoria_kao` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
