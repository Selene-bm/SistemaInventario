-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.23-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sistema_inventario_db
CREATE DATABASE IF NOT EXISTS `sistema_inventario_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `sistema_inventario_db`;

-- Volcando estructura para tabla sistema_inventario_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.auth_permission: ~40 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add permission', 1, 'add_permission'),
	(2, 'Can change permission', 1, 'change_permission'),
	(3, 'Can delete permission', 1, 'delete_permission'),
	(4, 'Can view permission', 1, 'view_permission'),
	(5, 'Can add group', 2, 'add_group'),
	(6, 'Can change group', 2, 'change_group'),
	(7, 'Can delete group', 2, 'delete_group'),
	(8, 'Can view group', 2, 'view_group'),
	(9, 'Can add content type', 3, 'add_contenttype'),
	(10, 'Can change content type', 3, 'change_contenttype'),
	(11, 'Can delete content type', 3, 'delete_contenttype'),
	(12, 'Can view content type', 3, 'view_contenttype'),
	(13, 'Can add log entry', 4, 'add_logentry'),
	(14, 'Can change log entry', 4, 'change_logentry'),
	(15, 'Can delete log entry', 4, 'delete_logentry'),
	(16, 'Can view log entry', 4, 'view_logentry'),
	(17, 'Can add usuario', 5, 'add_usuario'),
	(18, 'Can change usuario', 5, 'change_usuario'),
	(19, 'Can delete usuario', 5, 'delete_usuario'),
	(20, 'Can view usuario', 5, 'view_usuario'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add proveedor', 7, 'add_proveedor'),
	(26, 'Can change proveedor', 7, 'change_proveedor'),
	(27, 'Can delete proveedor', 7, 'delete_proveedor'),
	(28, 'Can view proveedor', 7, 'view_proveedor'),
	(29, 'Can add producto', 8, 'add_producto'),
	(30, 'Can change producto', 8, 'change_producto'),
	(31, 'Can delete producto', 8, 'delete_producto'),
	(32, 'Can view producto', 8, 'view_producto'),
	(33, 'Can add cliente', 9, 'add_cliente'),
	(34, 'Can change cliente', 9, 'change_cliente'),
	(35, 'Can delete cliente', 9, 'delete_cliente'),
	(36, 'Can view cliente', 9, 'view_cliente'),
	(37, 'Can add movimiento', 10, 'add_movimiento'),
	(38, 'Can change movimiento', 10, 'change_movimiento'),
	(39, 'Can delete movimiento', 10, 'delete_movimiento'),
	(40, 'Can view movimiento', 10, 'view_movimiento');

-- Volcando estructura para tabla sistema_inventario_db.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `contacto` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.clientes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Usuarios_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Usuarios_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.django_admin_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.django_content_type: ~10 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'auth', 'permission'),
	(2, 'auth', 'group'),
	(3, 'contenttypes', 'contenttype'),
	(4, 'admin', 'logentry'),
	(5, 'cuenta_app', 'usuario'),
	(6, 'sessions', 'session'),
	(7, 'proveedores', 'proveedor'),
	(8, 'productos', 'producto'),
	(9, 'clientes', 'cliente'),
	(10, 'clientes', 'movimiento');

-- Volcando estructura para tabla sistema_inventario_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.django_migrations: ~26 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-10-31 15:17:59.127813'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-10-31 15:17:59.150278'),
	(3, 'auth', '0001_initial', '2025-10-31 15:17:59.225447'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-10-31 15:17:59.241988'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-10-31 15:17:59.247189'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-10-31 15:17:59.252682'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-10-31 15:17:59.259022'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-10-31 15:17:59.260322'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-10-31 15:17:59.264598'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-10-31 15:17:59.269661'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-10-31 15:17:59.275436'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-10-31 15:17:59.291285'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-10-31 15:17:59.296421'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-10-31 15:17:59.301719'),
	(15, 'cuenta_app', '0001_initial', '2025-10-31 15:18:01.092478'),
	(16, 'admin', '0001_initial', '2025-10-31 15:18:01.116392'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-10-31 15:18:01.120885'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-31 15:18:01.125844'),
	(19, 'proveedores', '0001_initial', '2025-10-31 15:18:07.011460'),
	(20, 'sessions', '0001_initial', '2025-10-31 15:18:07.024621'),
	(21, 'productos', '0001_initial', '2025-11-28 21:18:46.663773'),
	(22, 'productos', '0002_alter_producto_precio_compra_and_more', '2025-11-28 21:24:09.069289'),
	(23, 'productos', '0003_alter_producto_precio_compra_and_more', '2025-11-28 21:24:40.465110'),
	(24, 'clientes', '0001_initial', '2025-11-28 21:38:16.754403'),
	(25, 'proveedores', '0002_alter_proveedor_table', '2025-11-28 21:43:36.723537'),
	(26, 'clientes', '0002_alter_cliente_table_alter_movimiento_table', '2025-11-28 21:44:24.035953');

-- Volcando estructura para tabla sistema_inventario_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.django_session: ~6 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('f3umv63nggecpuqvzz5ovapjqov7lnxs', 'e30:1vEqun:wZ0-ybO0EU-CbwFJP-cV9DzNkopBQsC1a_l6FSvvnH4', '2025-11-14 15:19:45.919832'),
	('jgq41n05g1tkr7h834l5ey7yinku10xo', '.eJxVjDsOwjAQBe_iGlmxvf5R0nMGa7Nr4wBypDipEHeHSCmgfTPzXiLhtta09bykicVZWHH63UakR2474Du22yxpbusyjXJX5EG7vM6cn5fD_Tuo2Ou3BrZ2cCHmYnSMBcEoDUVpV5zCQJo0BIPg2ZLP1nDQ2VNkF4ECDsaJ9wfGBzct:1vOkm5:fPxu0nOjLo0uYwDmToho9bYByS3wcTywo1d8t8TEEOY', '2025-12-11 22:47:41.778741'),
	('lxyvqg7bfj0gqvr6905ertqdzracndl0', '.eJxVjDsOwjAQBe_iGlmxvf5R0nMGa7Nr4wBypDipEHeHSCmgfTPzXiLhtta09bykicVZWHH63UakR2474Du22yxpbusyjXJX5EG7vM6cn5fD_Tuo2Ou3BrZ2cCHmYnSMBcEoDUVpV5zCQJo0BIPg2ZLP1nDQ2VNkF4ECDsaJ9wfGBzct:1vOkmI:4cVee64YE2wBTZNngGBlWuCnnblNQThRAXpc2pOWGSo', '2025-12-11 22:47:54.611427'),
	('plzh7sao7rsjza9m6d6zp4am7pegpeb5', '.eJxVjDEOwjAMRe-SGUXUDknNyN4zVI5taAGlUtNOiLtDpQ6w_vfef7me12Xo12pzP6o7O3SH3y2zPKxsQO9cbpOXqSzzmP2m-J1W301qz8vu_h0MXIdvHUIDibIGMGRGywINRYY2Cp7giHhlhZaspUAqYEESmiZUoggpoXt_ANPlN1U:1vErcB:oHZfOb94H4EcxhVEMwXJMpvrT3TIRVeLK2r0ohS7AZY', '2025-11-14 16:04:35.156515'),
	('rmkyjvug5n9pi2d1iwtch5jkudd3hkr3', '.eJxVjEEOgjAQRe_StWkYWpni0j1nIDPTqUUNTSisjHdXEha6_e-9_zIjbWset6rLOEVzMd6cfjcmeei8g3in-VaslHldJra7Yg9a7VCiPq-H-3eQqeZvLdyjj9pCgIAILF1kBhHEc2rRhy6qJofBgYcemJ1QQ8EHVWqS71rz_gDr_DgJ:1vEw82:ZmbtRc-LA6y7NuxwuXWAxwfewFygjPYwAwvBHYgEPw0', '2025-11-14 20:53:46.958954'),
	('zqw3ls7ipvxxh4pq2611jofljimzgoxd', '.eJxVjDsOwjAQBe_iGlmxvf5R0nMGa7Nr4wBypDipEHeHSCmgfTPzXiLhtta09bykicVZWHH63UakR2474Du22yxpbusyjXJX5EG7vM6cn5fD_Tuo2Ou3BrZ2cCHmYnSMBcEoDUVpV5zCQJo0BIPg2ZLP1nDQ2VNkF4ECDsaJ9wfGBzct:1vOkCF:Tg7KgHwj2RMq-gYi5kzjNVxZbYGmZiNNwI8dSThF1Fk', '2025-12-11 22:10:39.977500');

-- Volcando estructura para tabla sistema_inventario_db.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `clientes_movimiento_cliente_id_814dec46_fk_clientes_` (`cliente_id`),
  KEY `clientes_movimiento_producto_id_56b5dcfc_fk_productos` (`producto_id`),
  CONSTRAINT `clientes_movimiento_cliente_id_814dec46_fk_clientes_` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `clientes_movimiento_producto_id_56b5dcfc_fk_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.movimientos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `productos_proveedor_id_166c7fe0_fk_proveedor` (`proveedor_id`),
  CONSTRAINT `productos_proveedor_id_166c7fe0_fk_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.productos: ~2 rows (aproximadamente)
INSERT INTO `productos` (`id_producto`, `nombre`, `precio_compra`, `precio_venta`, `stock_actual`, `proveedor_id`) VALUES
	(1, 'Individuales de navidad', 2000, 25000, 50, 3),
	(2, 'Servilletero navideño', 1500, 10000, 20, 3);

-- Volcando estructura para tabla sistema_inventario_db.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contacto` decimal(10,0) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.proveedores: ~3 rows (aproximadamente)
INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `contacto`, `direccion`) VALUES
	(1, 'Bodemax', 3053790880, 'Calle 43 #109-78'),
	(2, 'Rue Bodegas', 3105916884, 'Calle 70 #2AN - 121'),
	(3, 'Lupita\'s Luxury', 310891262, 'Calle 100 # 42-94');

-- Volcando estructura para tabla sistema_inventario_db.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.usuarios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.usuarios_groups
CREATE TABLE IF NOT EXISTS `usuarios_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuarios_groups_usuario_id_group_id_e88b744a_uniq` (`usuario_id`,`group_id`),
  KEY `Usuarios_groups_group_id_890f65b0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Usuarios_groups_group_id_890f65b0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `Usuarios_groups_usuario_id_88bd6b34_fk_Usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.usuarios_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_inventario_db.usuarios_user_permissions
CREATE TABLE IF NOT EXISTS `usuarios_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuarios_user_permissions_usuario_id_permission_id_82ba4004_uniq` (`usuario_id`,`permission_id`),
  KEY `Usuarios_user_permis_permission_id_dd067c85_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Usuarios_user_permis_permission_id_dd067c85_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `Usuarios_user_permissions_usuario_id_d81d2a07_fk_Usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Volcando datos para la tabla sistema_inventario_db.usuarios_user_permissions: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
