/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: failed_jobs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: model_has_permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`, `model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: model_has_roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'App\\Models\\User',
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`, `model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: password_resets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`, `guard_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: personal_access_tokens
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`, `tokenable_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_cli_contratos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_cli_contratos` (
  `cod_rel_cli_contra` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_cliente` bigint(250) NOT NULL,
  `cod_contratos` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_cli_contra`),
  KEY `fk_cli_contratos` (`cod_contratos`),
  KEY `fk_contratos_cli` (`cod_cliente`),
  CONSTRAINT `fk_cli_contratos` FOREIGN KEY (`cod_contratos`) REFERENCES `tbl_contratos` (`cod_contratos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contratos_cli` FOREIGN KEY (`cod_cliente`) REFERENCES `tbl_clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_emp_contratos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_emp_contratos` (
  `cod_rel_emp_contra` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_empleado` bigint(250) NOT NULL,
  `cod_contratos` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_emp_contra`),
  KEY `fk_emp_contratos` (`cod_contratos`),
  KEY `fk_contratos_emp` (`cod_empleado`),
  CONSTRAINT `fk_contratos_emp` FOREIGN KEY (`cod_empleado`) REFERENCES `tbl_empleados` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_emp_contratos` FOREIGN KEY (`cod_contratos`) REFERENCES `tbl_contratos` (`cod_contratos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_emp_planilla
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_emp_planilla` (
  `cod_rel_emp_pla` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_empleado` bigint(250) NOT NULL,
  `cod_planilla` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_emp_pla`),
  KEY `fk_emp_planilla` (`cod_empleado`),
  KEY `fk_planilla_emp` (`cod_planilla`),
  CONSTRAINT `fk_emp_planilla` FOREIGN KEY (`cod_empleado`) REFERENCES `tbl_empleados` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_planilla_emp` FOREIGN KEY (`cod_planilla`) REFERENCES `tbl_planilla` (`cod_planilla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_personas_dir
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_personas_dir` (
  `cod_rel_personas_dir` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_persona` bigint(250) NOT NULL,
  `cod_direc` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_personas_dir`),
  KEY `fk_personas_dir` (`cod_persona`),
  KEY `fk_dir_personas` (`cod_direc`),
  CONSTRAINT `fk_dir_personas` FOREIGN KEY (`cod_direc`) REFERENCES `tbl_direcciones` (`cod_direc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_personas_dir` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_personas` (`cod_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_personas_tel
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_personas_tel` (
  `cod_rel_personas_tel` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_persona` bigint(250) NOT NULL,
  `cod_tel` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_personas_tel`),
  KEY `fk_personas_tel` (`cod_persona`),
  KEY `fk_tel_personas` (`cod_tel`),
  CONSTRAINT `fk_personas_tel` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_personas` (`cod_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tel_personas` FOREIGN KEY (`cod_tel`) REFERENCES `tbl_telefonos` (`cod_tel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: rel_registro_recursos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `rel_registro_recursos` (
  `cod_rel_regrecu` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_regemp` bigint(250) NOT NULL,
  `cod_recurso` bigint(250) NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_rel_regrecu`),
  KEY `fk_registro_recurso` (`cod_regemp`),
  KEY `fk_recurso_registro` (`cod_recurso`),
  CONSTRAINT `fk_recurso_registro` FOREIGN KEY (`cod_recurso`) REFERENCES `tbl_recursos` (`cod_recurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_recurso` FOREIGN KEY (`cod_regemp`) REFERENCES `tbl_registro_empleados_clientes` (`cod_regemp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: role_has_permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`, `guard_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_bitacora
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_bitacora` (
  `cod_bitacora` bigint(250) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `antes` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `despues` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accion` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_bitacora`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_clientes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_clientes` (
  `cod_cliente` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_persona` bigint(250) NOT NULL,
  `nom_empresa` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correo_electronico` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`),
  KEY `cod_persona` (`cod_persona`),
  CONSTRAINT `tbl_clientes_ibfk_1` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_personas` (`cod_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_contratos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_contratos` (
  `cod_contratos` bigint(250) NOT NULL AUTO_INCREMENT,
  `des_contrato` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_ini_contrato` date NOT NULL,
  `fec_fin_contrato` date NOT NULL,
  `tipo_contrato` enum('Empleado', 'Cliente') COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_contratos`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_direcciones
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_direcciones` (
  `cod_direc` bigint(250) NOT NULL AUTO_INCREMENT,
  `des_direc` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_direc`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_empleados
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_empleados` (
  `cod_empleado` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_persona` bigint(250) NOT NULL,
  `estado_empleado` enum('Activo', 'Inactivo') COLLATE utf8_spanish_ci NOT NULL,
  `tipo_empleado` enum('Guardia', 'Administrador') COLLATE utf8_spanish_ci NOT NULL,
  `hrstrab_emp` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`),
  KEY `cod_persona` (`cod_persona`),
  CONSTRAINT `tbl_empleados_ibfk_1` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_personas` (`cod_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_personas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_personas` (
  `cod_persona` bigint(250) NOT NULL AUTO_INCREMENT,
  `primer_nom` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nom` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apel` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` enum('F', 'M') COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(250) NOT NULL,
  `tipo_persona` enum('Cliente', 'Empleado', 'Administrador') COLLATE utf8_spanish_ci NOT NULL,
  `fec_nac_persona` date NOT NULL,
  `rtn_persona` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_persona`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_planilla
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_planilla` (
  `cod_planilla` bigint(20) NOT NULL AUTO_INCREMENT,
  `mon_pago` int(250) NOT NULL,
  `pago_hrsextra` int(250) NOT NULL,
  `ihss` int(250) NOT NULL,
  `rap` int(250) NOT NULL,
  `vales` int(250) NOT NULL,
  `deducciones` int(250) NOT NULL,
  `pago_stotal` int(250) NOT NULL,
  `pago_total` int(250) NOT NULL,
  `fec_pago_planilla` date NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_planilla`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_recursos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_recursos` (
  `cod_recurso` bigint(250) NOT NULL AUTO_INCREMENT,
  `des_recurso` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `serie_recurso` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `almacen` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_recurso`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_registro_empleados_clientes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_registro_empleados_clientes` (
  `cod_regemp` bigint(250) NOT NULL AUTO_INCREMENT,
  `cod_empleado` bigint(250) NOT NULL,
  `cod_cliente` bigint(250) NOT NULL,
  `fec_asignado` date NOT NULL,
  `turno_asignado` enum('Matutina', 'Vespertina', 'Nocturna') COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_regemp`),
  KEY `cod_empleado` (`cod_empleado`),
  KEY `cod_cliente` (`cod_cliente`),
  CONSTRAINT `tbl_registro_empleados_clientes_ibfk_1` FOREIGN KEY (`cod_empleado`) REFERENCES `tbl_empleados` (`cod_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_registro_empleados_clientes_ibfk_2` FOREIGN KEY (`cod_cliente`) REFERENCES `tbl_clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_telefonos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_telefonos` (
  `cod_tel` bigint(250) NOT NULL AUTO_INCREMENT,
  `num_tel` int(250) NOT NULL,
  `tipo_tel` enum('Casa', 'Celular') COLLATE utf8_spanish_ci NOT NULL,
  `usr_registro` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fec_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_tel`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_spanish_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `est_user` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: failed_jobs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: migrations
# ------------------------------------------------------------

INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    2,
    '2014_10_12_100000_create_password_resets_table',
    1
  );
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    3,
    '2014_10_12_200000_add_two_factor_columns_to_users_table',
    1
  );
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    5,
    '2019_12_14_000001_create_personal_access_tokens_table',
    1
  );
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (6, '2020_05_21_100000_create_teams_table', 1);
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (7, '2020_05_21_200000_create_team_user_table', 1);
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    8,
    '2020_05_21_300000_create_team_invitations_table',
    1
  );
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (9, '2021_08_10_042916_create_sessions_table', 1);
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    10,
    '2021_08_11_230003_create_permission_tables',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: model_has_permissions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: model_has_roles
# ------------------------------------------------------------

INSERT INTO
  `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
  (1, 'App\\Models\\User', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: password_resets
# ------------------------------------------------------------

INSERT INTO
  `password_resets` (`email`, `token`, `created_at`)
VALUES
  (
    'secsystem1030@gmail.com',
    '$2y$10$4gxQcj7L2qBes84G2Zx5q.2VaRqteb6IAbW0vwF7wgEoobV89mkaq',
    '2021-09-24 20:50:43'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'admin.home',
    'Ver el dashboard',
    'web',
    '2021-08-14 10:23:25',
    '2021-08-14 10:23:25'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'admin.bitacoras.index',
    'Ver lista de bitacora',
    'web',
    '2021-08-14 10:23:26',
    '2021-08-14 10:23:26'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    'admin.respaldos.index',
    'Respaldo y Recuperacion',
    'web',
    '2021-08-14 10:23:26',
    '2021-08-14 10:23:26'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'admin.users.index',
    'Ver lista de usuarios',
    'web',
    '2021-08-14 10:23:26',
    '2021-08-14 10:23:26'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    'admin.users.edit',
    'Asignar un rol',
    'web',
    '2021-08-14 10:23:27',
    '2021-08-14 10:23:27'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    'admin.roles.index',
    'Ver lista de roles',
    'web',
    '2021-08-14 10:23:27',
    '2021-08-14 10:23:27'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    'admin.roles.create',
    'Crear rol',
    'web',
    '2021-08-14 10:23:28',
    '2021-08-14 10:23:28'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    'admin.roles.edit',
    'Editar rol',
    'web',
    '2021-08-14 10:23:30',
    '2021-08-14 10:23:30'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    'admin.roles.show',
    'Mostrar rol',
    'web',
    '2021-08-14 10:23:30',
    '2021-08-14 10:23:30'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    10,
    'admin.roles.destroy',
    'Eliminar rol',
    'web',
    '2021-08-14 10:23:31',
    '2021-08-14 10:23:31'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    11,
    'admin.personas.index',
    'Ver lista de personas',
    'web',
    '2021-08-14 10:23:31',
    '2021-08-14 10:23:31'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    12,
    'admin.personas.create',
    'Crear persona',
    'web',
    '2021-08-14 10:23:32',
    '2021-08-14 10:23:32'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    13,
    'admin.personas.edit',
    'Editar persona',
    'web',
    '2021-08-14 10:23:33',
    '2021-08-14 10:23:33'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    14,
    'admin.personas.show',
    'Mostrar persona',
    'web',
    '2021-08-14 10:23:34',
    '2021-08-14 10:23:34'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    15,
    'admin.personas.destroy',
    'Eliminar persona',
    'web',
    '2021-08-14 10:23:34',
    '2021-08-14 10:23:34'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    16,
    'admin.empleados.index',
    'Ver lista de empleados',
    'web',
    '2021-08-14 10:23:34',
    '2021-08-14 10:23:34'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    17,
    'admin.empleados.create',
    'Crear empleado',
    'web',
    '2021-08-14 10:23:35',
    '2021-08-14 10:23:35'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    18,
    'admin.empleados.edit',
    'Editar empleado',
    'web',
    '2021-08-14 10:23:35',
    '2021-08-14 10:23:35'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    19,
    'admin.empleados.show',
    'Mostrar empleado',
    'web',
    '2021-08-14 10:23:36',
    '2021-08-14 10:23:36'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    20,
    'admin.empleados.destroy',
    'Eliminar empleado',
    'web',
    '2021-08-14 10:23:37',
    '2021-08-14 10:23:37'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    21,
    'admin.clientes.index',
    'Ver lista de clientes',
    'web',
    '2021-08-14 10:23:38',
    '2021-08-14 10:23:38'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    22,
    'admin.clientes.create',
    'Crear cliente',
    'web',
    '2021-08-14 10:23:38',
    '2021-08-14 10:23:38'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    23,
    'admin.clientes.edit',
    'Editar cliente',
    'web',
    '2021-08-14 10:23:39',
    '2021-08-14 10:23:39'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    24,
    'admin.clientes.show',
    'Mostrar cliente',
    'web',
    '2021-08-14 10:23:40',
    '2021-08-14 10:23:40'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    25,
    'admin.clientes.destroy',
    'Eliminar cliente',
    'web',
    '2021-08-14 10:23:40',
    '2021-08-14 10:23:40'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    26,
    'admin.registros.index',
    'Ver lista de registros',
    'web',
    '2021-08-14 10:23:41',
    '2021-08-14 10:23:41'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    27,
    'admin.registros.create',
    'Crear registro',
    'web',
    '2021-08-14 10:23:41',
    '2021-08-14 10:23:41'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    28,
    'admin.registros.edit',
    'Editar registro',
    'web',
    '2021-08-14 10:23:42',
    '2021-08-14 10:23:42'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    29,
    'admin.registros.show',
    'Mostrar registro',
    'web',
    '2021-08-14 10:23:42',
    '2021-08-14 10:23:42'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    30,
    'admin.registros.destroy',
    'Eliminar registro',
    'web',
    '2021-08-14 10:23:43',
    '2021-08-14 10:23:43'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    31,
    'admin.recursos.index',
    'Ver lista de recursos',
    'web',
    '2021-08-14 10:23:43',
    '2021-08-14 10:23:43'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    32,
    'admin.recursos.create',
    'Crear recurso',
    'web',
    '2021-08-14 10:23:44',
    '2021-08-14 10:23:44'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    33,
    'admin.recursos.edit',
    'Editar recurso',
    'web',
    '2021-08-14 10:23:45',
    '2021-08-14 10:23:45'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    34,
    'admin.recursos.show',
    'Mostrar recurso',
    'web',
    '2021-08-14 10:23:46',
    '2021-08-14 10:23:46'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    35,
    'admin.recursos.destroy',
    'Eliminar recurso',
    'web',
    '2021-08-14 10:23:46',
    '2021-08-14 10:23:46'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    36,
    'admin.planillas.index',
    'Ver lista de planillas',
    'web',
    '2021-08-14 10:23:47',
    '2021-08-14 10:23:47'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    37,
    'admin.planillas.create',
    'Crear planilla',
    'web',
    '2021-08-14 10:23:49',
    '2021-08-14 10:23:49'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    38,
    'admin.planillas.edit',
    'Editar planilla',
    'web',
    '2021-08-14 10:23:50',
    '2021-08-14 10:23:50'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    39,
    'admin.planillas.show',
    'Mostrar planilla',
    'web',
    '2021-08-14 10:23:50',
    '2021-08-14 10:23:50'
  );
INSERT INTO
  `permissions` (
    `id`,
    `name`,
    `description`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    40,
    'admin.planillas.destroy',
    'Eliminar planilla',
    'web',
    '2021-08-14 10:23:51',
    '2021-08-14 10:23:51'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: personal_access_tokens
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_cli_contratos
# ------------------------------------------------------------

INSERT INTO
  `rel_cli_contratos` (
    `cod_rel_cli_contra`,
    `cod_cliente`,
    `cod_contratos`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (1, 1, 2, '1', '2021-08-14 04:31:17');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_emp_contratos
# ------------------------------------------------------------

INSERT INTO
  `rel_emp_contratos` (
    `cod_rel_emp_contra`,
    `cod_empleado`,
    `cod_contratos`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (1, 1, 1, '1', '2021-08-14 04:28:38');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_emp_planilla
# ------------------------------------------------------------

INSERT INTO
  `rel_emp_planilla` (
    `cod_rel_emp_pla`,
    `cod_empleado`,
    `cod_planilla`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (1, 1, 1, '1', '2021-08-14 04:35:34');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_personas_dir
# ------------------------------------------------------------

INSERT INTO
  `rel_personas_dir` (
    `cod_rel_personas_dir`,
    `cod_persona`,
    `cod_direc`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (1, 1, 1, '1', '2021-08-08 22:49:37');
INSERT INTO
  `rel_personas_dir` (
    `cod_rel_personas_dir`,
    `cod_persona`,
    `cod_direc`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (2, 2, 2, '1', '2021-08-14 04:30:06');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_personas_tel
# ------------------------------------------------------------

INSERT INTO
  `rel_personas_tel` (
    `cod_rel_personas_tel`,
    `cod_persona`,
    `cod_tel`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (1, 1, 1, '1', '2021-08-08 22:49:37');
INSERT INTO
  `rel_personas_tel` (
    `cod_rel_personas_tel`,
    `cod_persona`,
    `cod_tel`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (2, 2, 2, '1', '2021-08-14 04:30:06');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: rel_registro_recursos
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: role_has_permissions
# ------------------------------------------------------------

INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (1, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (1, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (2, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (3, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (4, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (5, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (6, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (6, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (7, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (8, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (9, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (10, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (11, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (11, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (12, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (13, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (14, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (15, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (16, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (16, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (17, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (18, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (19, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (20, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (21, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (21, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (22, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (23, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (24, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (25, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (26, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (26, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (27, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (28, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (29, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (30, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (31, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (31, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (32, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (33, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (34, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (35, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (36, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (36, 2);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (37, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (38, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (39, 1);
INSERT INTO
  `role_has_permissions` (`permission_id`, `role_id`)
VALUES
  (40, 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------

INSERT INTO
  `roles` (
    `id`,
    `name`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Admin',
    'web',
    '2021-08-14 10:23:24',
    '2021-08-14 10:23:24'
  );
INSERT INTO
  `roles` (
    `id`,
    `name`,
    `guard_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'Empleado',
    'web',
    '2021-08-14 10:23:24',
    '2021-08-14 10:23:24'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (
    `id`,
    `user_id`,
    `ip_address`,
    `user_agent`,
    `payload`,
    `last_activity`
  )
VALUES
  (
    's9eOqeF8mFFl61rFAd6axdPMbmaxOkCt6lYJJok1',
    1,
    '127.0.0.1',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0',
    'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidnVLdTR1dU44WU5LY00yU21vUFlkRnVFd3NGdUlhQkdjSlpKdzltMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9yZXNwYWxkb3MiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkUG9jYWtjSU9GUW1oOUt5eC5XeXpvZXVtLnhkMmVRY09sdUhiTU00RlllSVlCQVdJS1lYeE8iO30=',
    1632542898
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_bitacora
# ------------------------------------------------------------

INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    'PERSONAS',
    '{\"primer_nom\": \"Fernando\", \"segundo_nom\": \"Kevin\", \"primer_apel\": \"Zuniga\", \"sexo\": \"M\", \"edad\": 28, \"tipo_persona\": \"Administrador\", \"fec_nac_persona\": \"1998-07-28\", \"rtn_persona\": \"0801199817610\"}',
    '{\"primer_nom\": \"Fernando\", \"segundo_nom\": \"Kevin\", \"primer_apel\": \"Zuniga\", \"sexo\": \"M\", \"edad\": 28, \"tipo_persona\": \"Empleado\", \"fec_nac_persona\": \"1998-07-28\", \"rtn_persona\": \"0801199817610\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    2,
    'DIRECCIONES',
    '{\"des_direc\": \"Villa Nueva\", \"municipio\": \"Distrito Central\", \"departamento\": \"Francisco Morazan\"}',
    '{\"des_direc\": \"Villa Nueva\", \"municipio\": \"Distrito Central\", \"departamento\": \"Francisco Morazan\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    3,
    'TELEFONOS',
    '{\"num_tel\": 98976724, \"tipo_tel\": \"Celular\"}',
    '{\"num_tel\": 98976724, \"tipo_tel\": \"Celular\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    4,
    'PERSONAS',
    '{\"primer_nom\": \"Juan\", \"segundo_nom\": \"Carlos\", \"primer_apel\": \"Perez\", \"sexo\": \"M\", \"edad\": 35, \"tipo_persona\": \"Cliente\", \"fec_nac_persona\": \"1985-07-28\", \"rtn_persona\": \"0801198507280\"}',
    '{\"primer_nom\": \"Juan\", \"segundo_nom\": \"Carlos\", \"primer_apel\": \"Perez\", \"sexo\": \"M\", \"edad\": 36, \"tipo_persona\": \"Cliente\", \"fec_nac_persona\": \"1985-07-28\", \"rtn_persona\": \"0801198507280\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 17:32:06'
  );
INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    5,
    'DIRECCIONES',
    '{\"des_direc\": \"Villa Real\", \"municipio\": \"Distrito Central\", \"departamento\": \"Francisco Morazan\"}',
    '{\"des_direc\": \"Villa Real\", \"municipio\": \"Distrito Central\", \"departamento\": \"Francisco Morazan\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 17:32:06'
  );
INSERT INTO
  `tbl_bitacora` (
    `cod_bitacora`,
    `tabla`,
    `antes`,
    `despues`,
    `accion`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    6,
    'TELEFONOS',
    '{\"num_tel\": 22914758, \"tipo_tel\": \"Casa\"}',
    '{\"num_tel\": 22914758, \"tipo_tel\": \"Casa\"}',
    'UPDATE',
    'root@localhost',
    '2021-08-14 17:32:07'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_clientes
# ------------------------------------------------------------

INSERT INTO
  `tbl_clientes` (
    `cod_cliente`,
    `cod_persona`,
    `nom_empresa`,
    `correo_electronico`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    2,
    'SDLG 2021',
    'sdlg@gmail.com',
    '1',
    '2021-08-14 04:31:17'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_contratos
# ------------------------------------------------------------

INSERT INTO
  `tbl_contratos` (
    `cod_contratos`,
    `des_contrato`,
    `fec_ini_contrato`,
    `fec_fin_contrato`,
    `tipo_contrato`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    'Contrato semestral en la empresa sdlg',
    '2021-08-14',
    '2022-02-14',
    'Empleado',
    '1',
    '2021-08-14 04:28:38'
  );
INSERT INTO
  `tbl_contratos` (
    `cod_contratos`,
    `des_contrato`,
    `fec_ini_contrato`,
    `fec_fin_contrato`,
    `tipo_contrato`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    2,
    'Contrato semestral de 6 empleados',
    '2021-08-14',
    '2022-02-14',
    'Cliente',
    '1',
    '2021-08-14 04:31:17'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_direcciones
# ------------------------------------------------------------

INSERT INTO
  `tbl_direcciones` (
    `cod_direc`,
    `des_direc`,
    `municipio`,
    `departamento`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    'Villa Nueva',
    'Distrito Central',
    'Francisco Morazan',
    'administrador',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_direcciones` (
    `cod_direc`,
    `des_direc`,
    `municipio`,
    `departamento`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    2,
    'Villa Real',
    'Distrito Central',
    'Francisco Morazan',
    'administrador',
    '2021-08-14 17:32:06'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_empleados
# ------------------------------------------------------------

INSERT INTO
  `tbl_empleados` (
    `cod_empleado`,
    `cod_persona`,
    `estado_empleado`,
    `tipo_empleado`,
    `hrstrab_emp`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    1,
    'Activo',
    'Guardia',
    '250',
    '1',
    '2021-08-14 04:28:38'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_personas
# ------------------------------------------------------------

INSERT INTO
  `tbl_personas` (
    `cod_persona`,
    `primer_nom`,
    `segundo_nom`,
    `primer_apel`,
    `sexo`,
    `edad`,
    `tipo_persona`,
    `fec_nac_persona`,
    `rtn_persona`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    'Fernando',
    'Kevin',
    'Zuniga',
    'M',
    28,
    'Empleado',
    '1998-07-28',
    '0801199817610',
    'administrador',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_personas` (
    `cod_persona`,
    `primer_nom`,
    `segundo_nom`,
    `primer_apel`,
    `sexo`,
    `edad`,
    `tipo_persona`,
    `fec_nac_persona`,
    `rtn_persona`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    2,
    'Juan',
    'Carlos',
    'Perez',
    'M',
    36,
    'Cliente',
    '1985-07-28',
    '0801198507280',
    'administrador',
    '2021-08-14 17:32:06'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_planilla
# ------------------------------------------------------------

INSERT INTO
  `tbl_planilla` (
    `cod_planilla`,
    `mon_pago`,
    `pago_hrsextra`,
    `ihss`,
    `rap`,
    `vales`,
    `deducciones`,
    `pago_stotal`,
    `pago_total`,
    `fec_pago_planilla`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    5000,
    250,
    500,
    600,
    350,
    1450,
    5250,
    3800,
    '2021-08-14',
    '1',
    '2021-08-14 04:35:34'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_recursos
# ------------------------------------------------------------

INSERT INTO
  `tbl_recursos` (
    `cod_recurso`,
    `des_recurso`,
    `serie_recurso`,
    `almacen`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    'Ak-47 Silenciador monolitico',
    'ARM-28',
    '1',
    '1',
    '2021-08-14 04:32:04'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_registro_empleados_clientes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_telefonos
# ------------------------------------------------------------

INSERT INTO
  `tbl_telefonos` (
    `cod_tel`,
    `num_tel`,
    `tipo_tel`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    1,
    98976724,
    'Celular',
    'administrador',
    '2021-08-14 04:27:12'
  );
INSERT INTO
  `tbl_telefonos` (
    `cod_tel`,
    `num_tel`,
    `tipo_tel`,
    `usr_registro`,
    `fec_registro`
  )
VALUES
  (
    2,
    22914758,
    'Casa',
    'administrador',
    '2021-08-14 17:32:07'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id`,
    `name`,
    `email`,
    `email_verified_at`,
    `password`,
    `two_factor_secret`,
    `two_factor_recovery_codes`,
    `remember_token`,
    `current_team_id`,
    `profile_photo_path`,
    `created_at`,
    `updated_at`,
    `est_user`
  )
VALUES
  (
    1,
    'Administrador',
    'secsystem1030@gmail.com',
    NULL,
    '$2y$10$PocakcIOFQmh9Kyx.Wyzoeum.xd2eQcOluHbMM4FYeIYBAWIKYXxO',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-08-14 10:23:53',
    '2021-09-25 03:23:21',
    1
  );
INSERT INTO
  `users` (
    `id`,
    `name`,
    `email`,
    `email_verified_at`,
    `password`,
    `two_factor_secret`,
    `two_factor_recovery_codes`,
    `remember_token`,
    `current_team_id`,
    `profile_photo_path`,
    `created_at`,
    `updated_at`,
    `est_user`
  )
VALUES
  (
    2,
    'Empleado Tyrone',
    'empleadosecsystem@gmail.com',
    NULL,
    '$2y$10$ddOC5HEUruGJMvgGSnWpSOM4Ra/ZRR54c3/0a1NnCjOB6m2CgMJNG',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    '2021-08-14 10:23:54',
    '2021-08-14 10:23:54',
    0
  );

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_CLIENTES
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_CLIENTES;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_CLIENTES` AFTER UPDATE ON `tbl_clientes` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'CLIENTES',
  JSON_OBJECT(
    'nom_empresa',OLD.nom_empresa,
    'correo_electronico',OLD.correo_electronico
  ),
  JSON_OBJECT(
    'nom_empresa',NEW.nom_empresa,
    'correo_electronico',NEW.correo_electronico
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_CLIENTES
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_CLIENTES;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_CLIENTES` AFTER DELETE ON `tbl_clientes` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (

  'CLIENTES',
  JSON_OBJECT(
    'nom_empresa',OLD.nom_empresa,
    'correo_electronico',OLD.correo_electronico
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_CONTRATOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_CONTRATOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_CONTRATOS` AFTER UPDATE ON `tbl_contratos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'CONTRATOS',
  JSON_OBJECT(
    'des_contrato',OLD.des_contrato,
    'fec_ini_contrato',OLD.fec_ini_contrato,
    'fec_fin_contrato',OLD.fec_fin_contrato
  ),
  JSON_OBJECT(
    'des_contrato',NEW.des_contrato,
    'fec_ini_contrato',NEW.fec_ini_contrato,
    'fec_fin_contrato',NEW.fec_fin_contrato
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_CONTRATOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_CONTRATOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_CONTRATOS` AFTER DELETE ON `tbl_contratos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'CONTRATOS',
  JSON_OBJECT(
    'des_contrato',OLD.des_contrato,
    'fec_ini_contrato',OLD.fec_ini_contrato,
    'fec_fin_contrato',OLD.fec_fin_contrato,
    'tipo_contrato',OLD.tipo_contrato
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_DIRECCIONES
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_DIRECCIONES;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_DIRECCIONES` AFTER UPDATE ON `tbl_direcciones` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'DIRECCIONES',
  JSON_OBJECT(
    'des_direc',OLD.des_direc,
    'municipio',OLD.municipio,
    'departamento',OLD.departamento
  ),
  JSON_OBJECT(
    'des_direc',NEW.des_direc,
    'municipio',NEW.municipio,
    'departamento',NEW.departamento
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_DIRECCIONES
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_DIRECCIONES;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_DIRECCIONES` AFTER DELETE ON `tbl_direcciones` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (

  'DIRECCIONES',
  JSON_OBJECT(
    'des_direc',OLD.des_direc,
    'municipio',OLD.municipio,
    'departamento',OLD.departamento
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_EMPLEADOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_EMPLEADOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_EMPLEADOS` AFTER UPDATE ON `tbl_empleados` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'EMPLEADOS',
  JSON_OBJECT(
    'estado_empleado',OLD.estado_empleado,
    'tipo_empleado',OLD.tipo_empleado,
    'hrstrab_emp',OLD.hrstrab_emp
  ),
  JSON_OBJECT(
    'estado_empleado',NEW.estado_empleado,
    'tipo_empleado',NEW.tipo_empleado,
    'hrstrab_emp',NEW.hrstrab_emp
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_EMPLEADOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_EMPLEADOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_EMPLEADOS` AFTER DELETE ON `tbl_empleados` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'EMPLEADOS',
  JSON_OBJECT(
    'estado_empleado',OLD.estado_empleado,
    'tipo_empleado',OLD.tipo_empleado,
    'hrstrab_emp',OLD.hrstrab_emp
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_PERSONAS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_PERSONAS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_PERSONAS` AFTER UPDATE ON `tbl_personas` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'PERSONAS',
  JSON_OBJECT(
    'primer_nom',OLD.primer_nom,
    'segundo_nom',OLD.segundo_nom,
    'primer_apel',OLD.primer_apel,
    'sexo',OLD.sexo,
    'edad',OLD.edad,
    'tipo_persona',OLD.tipo_persona,
    'fec_nac_persona',OLD.fec_nac_persona,
    'rtn_persona',OLD.rtn_persona
  ),
  JSON_OBJECT(
    'primer_nom',NEW.primer_nom,
    'segundo_nom',NEW.segundo_nom,
    'primer_apel',NEW.primer_apel,
    'sexo',NEW.sexo,
    'edad',NEW.edad,
    'tipo_persona',NEW.tipo_persona,
    'fec_nac_persona',NEW.fec_nac_persona,
    'rtn_persona',NEW.rtn_persona
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_PERSONAS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_PERSONAS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_PERSONAS` AFTER DELETE ON `tbl_personas` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (

  'PERSONAS',
  JSON_OBJECT(
    'primer_nom',OLD.primer_nom,
    'segundo_nom',OLD.segundo_nom,
    'primer_apel',OLD.primer_apel,
    'sexo',OLD.sexo,
    'edad',OLD.edad,
    'tipo_persona',OLD.tipo_persona,
    'fec_nac_persona',OLD.fec_nac_persona,
    'rtn_persona',OLD.rtn_persona
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_PLANILLAS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_PLANILLAS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_PLANILLAS` AFTER UPDATE ON `tbl_planilla` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'PLANILLAS',
  JSON_OBJECT(
    'mon_pago',OLD.mon_pago,
    'pago_hrsextra',OLD.pago_hrsextra,
    'ihss',OLD.ihss,
    'rap',OLD.rap,
    'vales',OLD.vales,
    'deducciones',OLD.deducciones,
    'pago_stotal',OLD.pago_stotal,
    'pago_total',OLD.pago_total,
    'fec_pago_planilla',OLD.fec_pago_planilla
  ),
  JSON_OBJECT(
    'mon_pago',NEW.mon_pago,
    'pago_hrsextra',NEW.pago_hrsextra,
    'ihss',NEW.ihss,
    'rap',NEW.rap,
    'vales',NEW.vales,
    'deducciones',NEW.deducciones,
    'pago_stotal',NEW.pago_stotal,
    'pago_total',NEW.pago_total,
    'fec_pago_planilla',NEW.fec_pago_planilla
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_PLANILLAS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_PLANILLAS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_PLANILLAS` AFTER DELETE ON `tbl_planilla` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'PLANILLAS',
  JSON_OBJECT(
    'mon_pago',OLD.mon_pago,
    'pago_hrsextra',OLD.pago_hrsextra,
    'ihss',OLD.ihss,
    'rap',OLD.rap,
    'vales',OLD.vales,
    'deducciones',OLD.deducciones,
    'pago_stotal',OLD.pago_stotal,
    'pago_total',OLD.pago_total,
    'fec_pago_planilla',OLD.fec_pago_planilla
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_RECURSOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_RECURSOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_RECURSOS` AFTER UPDATE ON `tbl_recursos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'RECURSOS',
  JSON_OBJECT(
    'des_recurso',OLD.des_recurso,
    'serie_recurso',OLD.serie_recurso,
    'almacen',OLD.almacen
  ),
  JSON_OBJECT(
    'des_recurso',NEW.des_recurso,
    'serie_recurso',NEW.serie_recurso,
    'almacen',NEW.almacen
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_RECURSOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_RECURSOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_RECURSOS` AFTER DELETE ON `tbl_recursos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'RECURSOS',
  JSON_OBJECT(
    'des_recurso',OLD.des_recurso,
    'serie_recurso',OLD.serie_recurso,
    'almacen',OLD.almacen
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_REGISTRO
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_REGISTRO;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_REGISTRO` AFTER UPDATE ON `tbl_registro_empleados_clientes` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'REGISTRO',
  JSON_OBJECT(
    'fec_asignado',OLD.fec_asignado,
    'turno_asignado',OLD.turno_asignado
  ),
  JSON_OBJECT(
    'fec_asignado',NEW.fec_asignado,
    'turno_asignado',NEW.turno_asignado
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_REGISTRO
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_REGISTRO;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_REGISTRO` AFTER DELETE ON `tbl_registro_empleados_clientes` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'REGISTRO',
  JSON_OBJECT(
    'fec_asignado',OLD.fec_asignado,
    'turno_asignado',OLD.turno_asignado
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_UPDATE_TELEFONOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_UPDATE_TELEFONOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_UPDATE_TELEFONOS` AFTER UPDATE ON `tbl_telefonos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (
  'TELEFONOS',
  JSON_OBJECT(
    'num_tel',OLD.num_tel,
    'tipo_tel',OLD.tipo_tel
  ),
  JSON_OBJECT(
    'num_tel',NEW.num_tel,
    'tipo_tel',NEW.tipo_tel
  ),
  'UPDATE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

# ------------------------------------------------------------
# TRIGGER DUMP FOR: BITACORA_DELETE_TELEFONOS
# ------------------------------------------------------------

DROP TRIGGER IF EXISTS BITACORA_DELETE_TELEFONOS;
DELIMITER ;;
CREATE TRIGGER `BITACORA_DELETE_TELEFONOS` AFTER DELETE ON `tbl_telefonos` FOR EACH ROW INSERT INTO tbl_bitacora (
  tabla,
  antes,
  despues,
  accion,
  usr_registro,
  fec_registro
) VALUES (

  'TELEFONOS',
  JSON_OBJECT(
    'num_tel',OLD.num_tel,
    'tipo_tel',OLD.tipo_tel
  ),
  null,
  'DELETE',
  CURRENT_USER(),
  now()
);;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
