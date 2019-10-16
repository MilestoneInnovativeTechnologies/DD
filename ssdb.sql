-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.62 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table appframe.areas
DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Public','Protected','System') COLLATE utf8mb4_unicode_ci DEFAULT 'Public',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areas_code_index` (`code`),
  KEY `areas_name_index` (`name`),
  KEY `areas_created_by_index` (`created_by`),
  KEY `areas_updated_by_index` (`updated_by`),
  CONSTRAINT `areas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `areas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.areas: ~1 rows (approximately)
DELETE FROM `areas`;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;

-- Dumping structure for table appframe.area_users
DROP TABLE IF EXISTS `area_users`;
CREATE TABLE IF NOT EXISTS `area_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` bigint(20) unsigned NOT NULL,
  `user` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_users_user_foreign` (`user`),
  KEY `area_users_area_index` (`area`),
  KEY `area_users_created_by_index` (`created_by`),
  KEY `area_users_updated_by_index` (`updated_by`),
  CONSTRAINT `area_users_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `area_users_area_foreign` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `area_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.area_users: ~182 rows (approximately)
DELETE FROM `area_users`;
/*!40000 ALTER TABLE `area_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_users` ENABLE KEYS */;

-- Dumping structure for table appframe.drt
DROP TABLE IF EXISTS `drt`;
CREATE TABLE IF NOT EXISTS `drt` (
  `id` int(1) DEFAULT NULL,
  `Column 2` int(1) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `Index 2` (`Column 2`),
  KEY `Index 3` (`id`),
  KEY `Index 4` (`Column 2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table appframe.drt: ~0 rows (approximately)
DELETE FROM `drt`;
/*!40000 ALTER TABLE `drt` DISABLE KEYS */;
/*!40000 ALTER TABLE `drt` ENABLE KEYS */;

-- Dumping structure for table appframe.d_data
DROP TABLE IF EXISTS `d_data`;
CREATE TABLE IF NOT EXISTS `d_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FYCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOCNO` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SRNO` decimal(10,0) DEFAULT NULL,
  `SLNO` decimal(10,0) DEFAULT NULL,
  `DOCDATE` datetime DEFAULT NULL,
  `CO` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BR` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFNO` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFDATE` datetime DEFAULT NULL,
  `AMT` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `SIGN` decimal(2,0) NOT NULL DEFAULT '1',
  `NARRATION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NARRATION2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFCOCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFBRCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFFYCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFFNCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFDOCNO` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFSRNO` decimal(10,0) DEFAULT NULL,
  `TYPE` enum('System','Normal','PostDated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `APPROVAL_STATUS` enum('Approved','Pending','Rejected') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `APPROVAL_MODE` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci DEFAULT 'Insert',
  `APPROVAL_TYPE` enum('Default','User') COLLATE utf8mb4_unicode_ci DEFAULT 'Default',
  `CANCEL` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `VERSION` decimal(10,0) NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `d_data_created_by_index` (`created_by`),
  KEY `d_data_updated_by_index` (`updated_by`),
  CONSTRAINT `d_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `d_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.d_data: ~1 rows (approximately)
DELETE FROM `d_data`;
/*!40000 ALTER TABLE `d_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_data` ENABLE KEYS */;

-- Dumping structure for table appframe.fiscalyearmaster
DROP TABLE IF EXISTS `fiscalyearmaster`;
CREATE TABLE IF NOT EXISTS `fiscalyearmaster` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cocode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abr` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('ReadWrite','ReadOnly','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'ReadWrite',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fiscalyearmaster_code_index` (`code`),
  KEY `fiscalyearmaster_cocode_index` (`cocode`),
  KEY `fiscalyearmaster_name_index` (`name`),
  KEY `fiscalyearmaster_created_by_index` (`created_by`),
  KEY `fiscalyearmaster_updated_by_index` (`updated_by`),
  CONSTRAINT `fiscalyearmaster_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fiscalyearmaster_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.fiscalyearmaster: ~3 rows (approximately)
DELETE FROM `fiscalyearmaster`;
/*!40000 ALTER TABLE `fiscalyearmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalyearmaster` ENABLE KEYS */;

-- Dumping structure for table appframe.fn_reserves
DROP TABLE IF EXISTS `fn_reserves`;
CREATE TABLE IF NOT EXISTS `fn_reserves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` bigint(20) unsigned DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `start_num` int(10) unsigned DEFAULT NULL,
  `end_num` int(10) unsigned DEFAULT NULL,
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `current` int(10) unsigned DEFAULT '0',
  `progress` enum('Awaiting','Processing','Completed') COLLATE utf8mb4_unicode_ci DEFAULT 'Awaiting',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fn_reserves_fncode_index` (`fncode`),
  KEY `fn_reserves_user_index` (`user`),
  KEY `fn_reserves_store_index` (`store`),
  KEY `fn_reserves_created_by_index` (`created_by`),
  KEY `fn_reserves_updated_by_index` (`updated_by`),
  CONSTRAINT `fn_reserves_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.fn_reserves: ~16 rows (approximately)
DELETE FROM `fn_reserves`;
/*!40000 ALTER TABLE `fn_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `fn_reserves` ENABLE KEYS */;

-- Dumping structure for table appframe.functiondetails
DROP TABLE IF EXISTS `functiondetails`;
CREATE TABLE IF NOT EXISTS `functiondetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abr` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wtype` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '[BR][FN]-[FY]-[AI]',
  `digit_length` decimal(2,0) NOT NULL DEFAULT '4',
  `direction` enum('Out','In') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Out',
  `default_account` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricelist` bigint(20) unsigned DEFAULT NULL,
  `tax` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `taxselection` enum('Tax01','Tax02','Select','Account','Auto') COLLATE utf8mb4_unicode_ci DEFAULT 'Tax01',
  `taxunique` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `ratewithtax` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `discount01` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02base` enum('Net','Gross') COLLATE utf8mb4_unicode_ci DEFAULT 'Net',
  `discount03` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discountmode` enum('None','PriceList','Custom','Buy_nX_Get_mY','Account','User','Branch') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `discount` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list` char(15) COLLATE utf8mb4_unicode_ci DEFAULT '01',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `functiondetails_code_index` (`code`),
  KEY `functiondetails_category_index` (`category`),
  KEY `functiondetails_wtype_index` (`wtype`),
  KEY `functiondetails_pricelist_index` (`pricelist`),
  KEY `functiondetails_created_by_index` (`created_by`),
  KEY `functiondetails_updated_by_index` (`updated_by`),
  CONSTRAINT `functiondetails_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `functiondetails_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `functiondetails_pricelist_foreign` FOREIGN KEY (`pricelist`) REFERENCES `pricelist` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.functiondetails: ~17 rows (approximately)
DELETE FROM `functiondetails`;
/*!40000 ALTER TABLE `functiondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `functiondetails` ENABLE KEYS */;

-- Dumping structure for table appframe.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_display` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drawer_display` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT '1',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_fncode_index` (`fncode`),
  KEY `menu_name_index` (`name`),
  KEY `menu_created_by_index` (`created_by`),
  KEY `menu_updated_by_index` (`updated_by`),
  CONSTRAINT `menu_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menu_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.menu: ~17 rows (approximately)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table appframe.menu_types
DROP TABLE IF EXISTS `menu_types`;
CREATE TABLE IF NOT EXISTS `menu_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fncodes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_types_name_index` (`name`),
  KEY `menu_types_created_by_index` (`created_by`),
  KEY `menu_types_updated_by_index` (`updated_by`),
  CONSTRAINT `menu_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menu_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.menu_types: ~10 rows (approximately)
DELETE FROM `menu_types`;
/*!40000 ALTER TABLE `menu_types` DISABLE KEYS */;
INSERT INTO `menu_types` (`id`, `name`, `display_name`, `fncodes`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'PURCHASE', 'PURCHASE', 'PUR1,PUR2,PUR3,PUR4,PUR5', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(2, 'PURCHASE RETURN', 'PURCHASE RETURN', 'PR1,PR2,PR3', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(3, 'PURCHASE ORDER', 'PURCHASE ORDER', 'PO1', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(4, 'PAYMENT', 'PAYMENT', 'CP1,BP1,BP2', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(5, 'SALES', 'SALES', 'SL1,SL2,SL3,SL4,SL5', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(6, 'SALES RETURN', 'SALES RETURN', 'SR1,SR2,SR3', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(7, 'SALES ORDER', 'SALES ORDER', 'SO1,SO2', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(8, 'RECEIPT', 'RECEIPT', 'CR1,BR1,BR2', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(9, 'MATERIAL TRANSFER', 'MATERIAL TRANSFER', 'MT1,MT2', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28'),
	(10, 'BRANCH TRANSFER', 'BRANCH TRANSFER', 'MT3,MT4', NULL, NULL, '2019-10-07 07:40:28', '2019-10-07 07:40:28');
/*!40000 ALTER TABLE `menu_types` ENABLE KEYS */;

-- Dumping structure for table appframe.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.migrations: ~74 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(910, '2014_10_12_000000_create_users_table', 1),
	(911, '2014_10_12_100000_create_password_resets_table', 1),
	(912, '2019_01_24_000002_create___groups_table', 1),
	(913, '2019_01_24_000003_create___group_users_table', 1),
	(914, '2019_01_24_000004_create___roles_table', 1),
	(915, '2019_01_24_000005_create___group_roles_table', 1),
	(916, '2019_01_24_000006_create___resources_table', 1),
	(917, '2019_01_24_000007_create___resource_roles_table', 1),
	(918, '2019_01_24_000008_create___resource_relations_table', 1),
	(919, '2019_01_24_000009_create___resource_scopes_table', 1),
	(920, '2019_01_24_000010_create___resource_forms_table', 1),
	(921, '2019_01_24_000011_create___resource_form_fields_table', 1),
	(922, '2019_01_24_000012_create___resource_form_field_attrs_table', 1),
	(923, '2019_01_24_000013_create___resource_form_field_data_table', 1),
	(924, '2019_01_24_000014_create___resource_form_field_validations_table', 1),
	(925, '2019_01_24_000015_create___resource_form_field_options_table', 1),
	(926, '2019_01_24_000016_create___resource_form_field_depends_table', 1),
	(927, '2019_01_24_000017_create___resource_form_field_dynamic_table', 1),
	(928, '2019_01_24_000018_create___resource_form_layout_table', 1),
	(929, '2019_01_24_000019_create___resource_form_collection_table', 1),
	(930, '2019_01_24_000020_create___resource_form_upload_table', 1),
	(931, '2019_01_24_000021_create___resource_form_defaults_table', 1),
	(932, '2019_01_24_000022_create___resource_lists_table', 1),
	(933, '2019_01_24_000023_create___resource_list_relations_table', 1),
	(934, '2019_01_24_000024_create___resource_list_scopes_table', 1),
	(935, '2019_01_24_000025_create___resource_list_layout_table', 1),
	(936, '2019_01_24_000026_create___resource_list_search_table', 1),
	(937, '2019_01_24_000027_create___resource_data_table', 1),
	(938, '2019_01_24_000028_create___resource_data_relations_table', 1),
	(939, '2019_01_24_000029_create___resource_data_scopes_table', 1),
	(940, '2019_01_24_000030_create___resource_data_view_sections_table', 1),
	(941, '2019_01_24_000031_create___resource_data_view_section_items_table', 1),
	(942, '2019_01_24_000032_create___resource_form_data_map_table', 1),
	(943, '2019_01_24_000033_create___resource_actions_table', 1),
	(944, '2019_01_24_000034_create___resource_action_attrs_table', 1),
	(945, '2019_01_24_000035_create___resource_action_methods_table', 1),
	(946, '2019_01_24_000036_create___resource_action_lists_table', 1),
	(947, '2019_01_24_000037_create___resource_action_data_table', 1),
	(948, '2019_01_24_000038_create___resource_defaults_table', 1),
	(949, '2019_01_24_000039_create___resource_metrics_table', 1),
	(950, '2019_01_24_000040_create___resource_dashboard_table', 1),
	(951, '2019_01_24_000041_create___resource_dashboard_sections_table', 1),
	(952, '2019_01_24_000042_create___resource_dashboard_section_items_table', 1),
	(953, '2019_01_24_000043_create___organisation_table', 1),
	(954, '2019_01_24_000044_create___organisation_contacts_table', 1),
	(955, '2019_03_01_000001_add_ss_fields_in_users_table', 1),
	(956, '2019_03_01_000002_add_ss_fields_in_groups_table', 1),
	(957, '2019_03_01_000003_add_ss_fields_in_roles_table', 1),
	(958, '2019_03_28_000046_create_setup_table', 1),
	(959, '2019_03_28_000047_create_menu_types_table', 1),
	(960, '2019_03_28_000048_create_menu_table', 1),
	(961, '2019_03_28_000049_create_settings_table', 1),
	(962, '2019_03_28_000050_create_fiscalyearmaster_table', 1),
	(963, '2019_03_28_000051_create_product_group_master_table', 1),
	(964, '2019_03_28_000052_create_products_table', 1),
	(965, '2019_03_28_000053_create_product_groups_table', 1),
	(966, '2019_03_28_000054_create_product_images_table', 1),
	(967, '2019_03_28_000055_create_pricelist_table', 1),
	(968, '2019_03_28_000056_create_pricelist_products_table', 1),
	(969, '2019_03_28_000057_create_functiondetails_table', 1),
	(970, '2019_03_28_000058_create_stores_table', 1),
	(971, '2019_03_28_000059_create_areas_table', 1),
	(972, '2019_03_28_000060_create_area_users_table', 1),
	(973, '2019_03_28_000061_create_user_settings_table', 1),
	(974, '2019_03_28_000062_create_user_store_area_table', 1),
	(975, '2019_03_28_000063_create_sales_order_table', 1),
	(976, '2019_03_28_000064_create_sales_order_items_table', 1),
	(977, '2019_03_28_000065_create_transactions_table', 1),
	(978, '2019_03_28_000066_create_transaction_details_table', 1),
	(979, '2019_03_28_000067_create_d_data_table', 1),
	(980, '2019_03_28_000068_create_stock_transfer_table', 1),
	(981, '2019_03_28_000069_create_receipts_table', 1),
	(982, '2019_03_28_000070_create_fn_reserves_table', 1),
	(983, '2019_03_28_000071_create_w_bin_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table appframe.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table appframe.pricelist
DROP TABLE IF EXISTS `pricelist`;
CREATE TABLE IF NOT EXISTS `pricelist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pricelist_code_index` (`code`),
  KEY `pricelist_name_index` (`name`),
  KEY `pricelist_created_by_index` (`created_by`),
  KEY `pricelist_updated_by_index` (`updated_by`),
  CONSTRAINT `pricelist_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pricelist_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.pricelist: ~1 rows (approximately)
DELETE FROM `pricelist`;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;

-- Dumping structure for table appframe.pricelist_products
DROP TABLE IF EXISTS `pricelist_products`;
CREATE TABLE IF NOT EXISTS `pricelist_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pricelist` bigint(20) unsigned NOT NULL,
  `product` bigint(20) unsigned NOT NULL,
  `price` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `price_min` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `price_max` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount1_type` enum('Amount','Percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Amount',
  `discount1_quantity` decimal(5,2) NOT NULL DEFAULT '0.00',
  `discount2_type` enum('Amount','Percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Amount',
  `discount2_quantity` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pricelist_products_pricelist_index` (`pricelist`),
  KEY `pricelist_products_product_index` (`product`),
  KEY `pricelist_products_created_by_index` (`created_by`),
  KEY `pricelist_products_updated_by_index` (`updated_by`),
  CONSTRAINT `pricelist_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_pricelist_foreign` FOREIGN KEY (`pricelist`) REFERENCES `pricelist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.pricelist_products: ~273 rows (approximately)
DELETE FROM `pricelist_products`;
/*!40000 ALTER TABLE `pricelist_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist_products` ENABLE KEYS */;

-- Dumping structure for table appframe.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uom` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partcode` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration2` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxcode01` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxfactor01` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `subtaxfactor01` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `taxcode02` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxfactor02` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `subtaxfactor02` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `type` enum('Public','Protected','System') COLLATE utf8mb4_unicode_ci DEFAULT 'Public',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_code_index` (`code`),
  KEY `products_name_index` (`name`),
  KEY `products_taxcode01_index` (`taxcode01`),
  KEY `products_taxcode02_index` (`taxcode02`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_updated_by_index` (`updated_by`),
  CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.products: ~243 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table appframe.product_groups
DROP TABLE IF EXISTS `product_groups`;
CREATE TABLE IF NOT EXISTS `product_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product` bigint(20) unsigned NOT NULL,
  `g01` bigint(20) unsigned DEFAULT NULL,
  `g02` bigint(20) unsigned DEFAULT NULL,
  `g03` bigint(20) unsigned DEFAULT NULL,
  `g04` bigint(20) unsigned DEFAULT NULL,
  `g05` bigint(20) unsigned DEFAULT NULL,
  `g06` bigint(20) unsigned DEFAULT NULL,
  `g07` bigint(20) unsigned DEFAULT NULL,
  `g08` bigint(20) unsigned DEFAULT NULL,
  `g09` bigint(20) unsigned DEFAULT NULL,
  `g10` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_groups_product_index` (`product`),
  KEY `product_groups_g01_index` (`g01`),
  KEY `product_groups_g02_index` (`g02`),
  KEY `product_groups_g03_index` (`g03`),
  KEY `product_groups_g04_index` (`g04`),
  KEY `product_groups_g05_index` (`g05`),
  KEY `product_groups_g06_index` (`g06`),
  KEY `product_groups_g07_index` (`g07`),
  KEY `product_groups_g08_index` (`g08`),
  KEY `product_groups_g09_index` (`g09`),
  KEY `product_groups_g10_index` (`g10`),
  KEY `product_groups_created_by_index` (`created_by`),
  KEY `product_groups_updated_by_index` (`updated_by`),
  CONSTRAINT `product_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g01_foreign` FOREIGN KEY (`g01`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g02_foreign` FOREIGN KEY (`g02`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g03_foreign` FOREIGN KEY (`g03`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g04_foreign` FOREIGN KEY (`g04`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g05_foreign` FOREIGN KEY (`g05`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g06_foreign` FOREIGN KEY (`g06`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g07_foreign` FOREIGN KEY (`g07`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g08_foreign` FOREIGN KEY (`g08`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g09_foreign` FOREIGN KEY (`g09`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_g10_foreign` FOREIGN KEY (`g10`) REFERENCES `product_group_master` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_groups_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.product_groups: ~211 rows (approximately)
DELETE FROM `product_groups`;
/*!40000 ALTER TABLE `product_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_groups` ENABLE KEYS */;

-- Dumping structure for table appframe.product_group_master
DROP TABLE IF EXISTS `product_group_master`;
CREATE TABLE IF NOT EXISTS `product_group_master` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_master_name_index` (`name`),
  KEY `product_group_master_code_index` (`code`),
  KEY `product_group_master_list_index` (`list`),
  KEY `product_group_master_created_by_index` (`created_by`),
  KEY `product_group_master_updated_by_index` (`updated_by`),
  CONSTRAINT `product_group_master_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_group_master_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.product_group_master: ~117 rows (approximately)
DELETE FROM `product_group_master`;
/*!40000 ALTER TABLE `product_group_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_group_master` ENABLE KEYS */;

-- Dumping structure for table appframe.product_images
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product` bigint(20) unsigned DEFAULT NULL,
  `image01` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image02` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image03` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image04` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image05` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` enum('Image 01','Image 02','Image 03','Image 04','Image 05') COLLATE utf8mb4_unicode_ci DEFAULT 'Image 01',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_index` (`product`),
  KEY `product_images_created_by_index` (`created_by`),
  KEY `product_images_updated_by_index` (`updated_by`),
  CONSTRAINT `product_images_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_images_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_images_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.product_images: ~0 rows (approximately)
DELETE FROM `product_images`;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;

-- Dumping structure for table appframe.receipts
DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `docno` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `fycode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` bigint(20) unsigned DEFAULT NULL,
  `mode` enum('Cash','Cheque') COLLATE utf8mb4_unicode_ci DEFAULT 'Cash',
  `customer` bigint(20) unsigned DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `bank` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` datetime DEFAULT NULL,
  `source` enum('ePlus','SS') COLLATE utf8mb4_unicode_ci DEFAULT 'ePlus',
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipts_docno_index` (`docno`),
  KEY `receipts_store_index` (`store`),
  KEY `receipts_fycode_index` (`fycode`),
  KEY `receipts_fncode_index` (`fncode`),
  KEY `receipts_user_index` (`user`),
  KEY `receipts_customer_index` (`customer`),
  KEY `receipts__ref_index` (`_ref`),
  KEY `receipts_created_by_index` (`created_by`),
  KEY `receipts_updated_by_index` (`updated_by`),
  CONSTRAINT `receipts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.receipts: ~1 rows (approximately)
DELETE FROM `receipts`;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;

-- Dumping structure for table appframe.sales_order
DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE IF NOT EXISTS `sales_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `docno` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` bigint(20) unsigned DEFAULT NULL,
  `customer` bigint(20) unsigned DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `fycode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` enum('Cash','Credit','Card','Cheque','DemandDraft','Digital Wallet','Multi') COLLATE utf8mb4_unicode_ci DEFAULT 'Cash',
  `progress` enum('Incomplete','Partial','Completed') COLLATE utf8mb4_unicode_ci DEFAULT 'Incomplete',
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_docno_index` (`docno`),
  KEY `sales_order_user_index` (`user`),
  KEY `sales_order_customer_index` (`customer`),
  KEY `sales_order_store_index` (`store`),
  KEY `sales_order_fycode_index` (`fycode`),
  KEY `sales_order_fncode_index` (`fncode`),
  KEY `sales_order__ref_index` (`_ref`),
  KEY `sales_order_created_by_index` (`created_by`),
  KEY `sales_order_updated_by_index` (`updated_by`),
  CONSTRAINT `sales_order_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order: ~56 rows (approximately)
DELETE FROM `sales_order`;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;

-- Dumping structure for table appframe.sales_order_items
DROP TABLE IF EXISTS `sales_order_items`;
CREATE TABLE IF NOT EXISTS `sales_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `so` bigint(20) unsigned DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `fycode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` bigint(20) unsigned DEFAULT NULL,
  `rate` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `taxrule` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount01` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount02` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_items_so_index` (`so`),
  KEY `sales_order_items_store_index` (`store`),
  KEY `sales_order_items_fycode_index` (`fycode`),
  KEY `sales_order_items_fncode_index` (`fncode`),
  KEY `sales_order_items_product_index` (`product`),
  KEY `sales_order_items__ref_index` (`_ref`),
  KEY `sales_order_items_created_by_index` (`created_by`),
  KEY `sales_order_items_updated_by_index` (`updated_by`),
  CONSTRAINT `sales_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order_items: ~496 rows (approximately)
DELETE FROM `sales_order_items`;
/*!40000 ALTER TABLE `sales_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_items` ENABLE KEYS */;

-- Dumping structure for table appframe.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_name_index` (`name`),
  KEY `settings_created_by_index` (`created_by`),
  KEY `settings_updated_by_index` (`updated_by`),
  CONSTRAINT `settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.settings: ~0 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table appframe.setup
DROP TABLE IF EXISTS `setup`;
CREATE TABLE IF NOT EXISTS `setup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `CODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DBTYPE` enum('Normal','DistributedServer','DistributedClient') COLLATE utf8mb4_unicode_ci DEFAULT 'Normal',
  `PASSWORDENCODING` enum('Utf8','Utf16') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Utf16',
  `QUANTITY_DECIMAL` decimal(10,0) DEFAULT '0',
  `RATE_DECIMAL` decimal(10,0) DEFAULT '2',
  `AMOUNT_DECIMAL` decimal(10,0) DEFAULT '2',
  `CURRENCY_DECIMAL` decimal(10,0) DEFAULT '6',
  `QUANTITY_SEPARATOR` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RATE_SEPARATOR` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AMOUNT_SEPARATOR` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENCY_SEPARATOR` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOCDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'dd-MM-yyyy',
  `REFDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'dd-MM-yyyy',
  `CHQDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'dd-MM-yyyy',
  `OTHDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'dd-MM-yyyy',
  `CURRENCYDENOMINATION` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MULTICOMPANY` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `MULTIBRANCH` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `MULTICURRENCY` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `MULTIPRINT` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `MULTISTORE` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `MULTIUNIT` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `SHIFTMANAGEMENT` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `BUSINESSKEY` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INVACCPOSTING` enum('ExactValue','RoundedValue') COLLATE utf8mb4_unicode_ci DEFAULT 'ExactValue',
  `ITEMCACHE` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `NEGATIVESTOCK` enum('Allow','Block','Question','User') COLLATE utf8mb4_unicode_ci DEFAULT 'Allow',
  `POQTYUDATE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SOQTYUDATE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCTION` enum('None','Simple','Standard','Advanced') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `PRODUCTIONCOSTUPDATION` enum('Auto','None') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `PRODUCTIONNARRATION` enum('Public','Protected') COLLATE utf8mb4_unicode_ci DEFAULT 'Protected',
  `DEFAULTBRANCH` char(15) COLLATE utf8mb4_unicode_ci DEFAULT 'HO',
  `DEFAULTUNIT` char(15) COLLATE utf8mb4_unicode_ci DEFAULT 'PCS',
  `TAX` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'Yes',
  `TAX02` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `TAXREF` enum('ItemGroup','Item') COLLATE utf8mb4_unicode_ci DEFAULT 'Item',
  `ITEMSERIAL` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `ITEMSERIALTEXT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Item Serial',
  `PAYMENTMODEACTION` enum('Direct','Ledger') COLLATE utf8mb4_unicode_ci DEFAULT 'Direct',
  `BILLPOSTING` enum('Auto','Manual','None') COLLATE utf8mb4_unicode_ci DEFAULT 'Manual',
  `AUTOBILLPOSTING` enum('UptoDate','AnyDate') COLLATE utf8mb4_unicode_ci DEFAULT 'UptoDate',
  `PROFIT` enum('Profit','Margin') COLLATE utf8mb4_unicode_ci DEFAULT 'Profit',
  `PROFITCALCULATION` enum('Online','Offline') COLLATE utf8mb4_unicode_ci DEFAULT 'Online',
  `CLOSEDUPTO` datetime DEFAULT NULL,
  `COSTING` enum('FIFO','WeightedAverage','LIFO','Manual') COLLATE utf8mb4_unicode_ci DEFAULT 'FIFO',
  `BATCHNO` enum('Auto','Manual','None') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `MFGDATE` enum('Auto','Manual','None') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `EXPDATE` enum('Auto','Manual','None') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `MFGDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'MMM-yyyy',
  `EXPDATE_FORMAT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'MMM-yyyy',
  `LIFETIME` mediumint(9) NOT NULL DEFAULT '2',
  `LIFETIMEINTERVAL` enum('Day','Week','Month','Year') COLLATE utf8mb4_unicode_ci DEFAULT 'Year',
  `PARTCODE` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `PARTCODETEXT` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PARTCODE',
  `AREA` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `AREATEXT` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Area',
  `STORAGEBIN` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `STORAGEBINTEXT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'Storage Bin',
  `WORKFLOW` enum('Enabled','Disabled') COLLATE utf8mb4_unicode_ci DEFAULT 'Disabled',
  `LANGUAGE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CULTURE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STOCKJVPOSTING` enum('Monthly','Quarterly','Half-Yearly','Annually') COLLATE utf8mb4_unicode_ci DEFAULT 'Monthly',
  `PROFITJVPOSTING` enum('Monthly','Quarterly','Half-Yearly','Annually') COLLATE utf8mb4_unicode_ci DEFAULT 'Annually',
  `REPORTTITLE` enum('CompanyName','BranchName','Branches') COLLATE utf8mb4_unicode_ci DEFAULT 'CompanyName',
  `PRINTLOG` enum('None','Function','Report','All') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `LOADIMAGEONSTARTUP` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `THEME` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SERACHFROMBEGINNING` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `SEACHAUTOLOCK` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'Yes',
  `REMEMBERLASTSEARCH` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `DIGITALWALLETTEXT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'eWallet',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setup_created_by_index` (`created_by`),
  KEY `setup_updated_by_index` (`updated_by`),
  CONSTRAINT `setup_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `setup_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.setup: ~1 rows (approximately)
DELETE FROM `setup`;
/*!40000 ALTER TABLE `setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `setup` ENABLE KEYS */;

-- Dumping structure for table appframe.stock_transfer
DROP TABLE IF EXISTS `stock_transfer`;
CREATE TABLE IF NOT EXISTS `stock_transfer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `out` bigint(20) unsigned DEFAULT NULL,
  `in` bigint(20) unsigned DEFAULT NULL,
  `verified_by` bigint(20) unsigned DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfer_out_index` (`out`),
  KEY `stock_transfer_in_index` (`in`),
  KEY `stock_transfer_verified_by_index` (`verified_by`),
  KEY `stock_transfer_created_by_index` (`created_by`),
  KEY `stock_transfer_updated_by_index` (`updated_by`),
  CONSTRAINT `stock_transfer_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_in_foreign` FOREIGN KEY (`in`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_out_foreign` FOREIGN KEY (`out`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.stock_transfer: ~1 rows (approximately)
DELETE FROM `stock_transfer`;
/*!40000 ALTER TABLE `stock_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transfer` ENABLE KEYS */;

-- Dumping structure for table appframe.stores
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cocode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_abr` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brcode` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `br_abr` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Public','Protected','System') COLLATE utf8mb4_unicode_ci DEFAULT 'Public',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_catcode_index` (`catcode`),
  KEY `stores_code_index` (`code`),
  KEY `stores_name_index` (`name`),
  KEY `stores_cocode_index` (`cocode`),
  KEY `stores_brcode_index` (`brcode`),
  KEY `stores_created_by_index` (`created_by`),
  KEY `stores_updated_by_index` (`updated_by`),
  CONSTRAINT `stores_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stores_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.stores: ~2 rows (approximately)
DELETE FROM `stores`;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

-- Dumping structure for table appframe.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` bigint(20) unsigned DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `docno` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer` bigint(20) unsigned DEFAULT NULL,
  `fycode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fncode` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` enum('Cash','Credit','Card','Cheque','DemandDraft','Digital Wallet','Multi') COLLATE utf8mb4_unicode_ci DEFAULT 'Cash',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions__ref_index` (`_ref`),
  KEY `transactions_user_index` (`user`),
  KEY `transactions_store_index` (`store`),
  KEY `transactions_docno_index` (`docno`),
  KEY `transactions_customer_index` (`customer`),
  KEY `transactions_fycode_index` (`fycode`),
  KEY `transactions_fncode_index` (`fncode`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_updated_by_index` (`updated_by`),
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.transactions: ~61 rows (approximately)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table appframe.transaction_details
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE IF NOT EXISTS `transaction_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction` bigint(20) unsigned NOT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `product` bigint(20) unsigned DEFAULT NULL,
  `direction` enum('Out','In') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Out',
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `rate` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `taxrule` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount01` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount02` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `soi` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_details_transaction_index` (`transaction`),
  KEY `transaction_details_store_index` (`store`),
  KEY `transaction_details_product_index` (`product`),
  KEY `transaction_details_soi_index` (`soi`),
  KEY `transaction_details_created_by_index` (`created_by`),
  KEY `transaction_details_updated_by_index` (`updated_by`),
  CONSTRAINT `transaction_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_soi_foreign` FOREIGN KEY (`soi`) REFERENCES `sales_order_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_transaction_foreign` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.transaction_details: ~453 rows (approximately)
DELETE FROM `transaction_details`;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;

-- Dumping structure for table appframe.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_password` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outstanding` decimal(30,10) DEFAULT '0.0000000000',
  `overdue` decimal(30,10) DEFAULT '0.0000000000',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_phone_index` (`phone`),
  KEY `users_reference_index` (`reference`),
  KEY `users_api_token_index` (`api_token`),
  KEY `users_login_index` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=300103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.users: ~235 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `login`, `login_password`, `api_token`, `reference`, `phone`, `address`, `outstanding`, `overdue`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(300101, 'Milestone Setup', 'setup@milestoneit.net', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 0.0000000000, NULL, '$2y$10$GTB/JrHEADZl0wsp4SruhedKCwMuJD0HxT/4JyByq870hEuD4bOmS', NULL, '2019-10-07 07:36:35', '2019-10-07 07:36:35'),
	(300102, 'Milestone Administrator', 'admin@milestoneit.net', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 0.0000000000, NULL, '$2y$10$t/ClHFBmV1dK6VsiPcXjm.2spBglcYm2uXbgXX/HS8cOwbdRd3SZO', NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table appframe.user_settings
DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE IF NOT EXISTS `user_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` bigint(20) unsigned NOT NULL,
  `setting` bigint(20) unsigned NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_settings_user_index` (`user`),
  KEY `user_settings_setting_index` (`setting`),
  KEY `user_settings_created_by_index` (`created_by`),
  KEY `user_settings_updated_by_index` (`updated_by`),
  CONSTRAINT `user_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_settings_setting_foreign` FOREIGN KEY (`setting`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_settings_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.user_settings: ~0 rows (approximately)
DELETE FROM `user_settings`;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;

-- Dumping structure for table appframe.user_store_area
DROP TABLE IF EXISTS `user_store_area`;
CREATE TABLE IF NOT EXISTS `user_store_area` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` bigint(20) unsigned NOT NULL,
  `store` bigint(20) unsigned NOT NULL,
  `area` bigint(20) unsigned NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_store_area_user_index` (`user`),
  KEY `user_store_area_store_index` (`store`),
  KEY `user_store_area_area_index` (`area`),
  KEY `user_store_area_created_by_index` (`created_by`),
  KEY `user_store_area_updated_by_index` (`updated_by`),
  CONSTRAINT `user_store_area_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_area_foreign` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.user_store_area: ~1 rows (approximately)
DELETE FROM `user_store_area`;
/*!40000 ALTER TABLE `user_store_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_store_area` ENABLE KEYS */;

-- Dumping structure for table appframe.w_bin
DROP TABLE IF EXISTS `w_bin`;
CREATE TABLE IF NOT EXISTS `w_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `w_bin_created_by_index` (`created_by`),
  KEY `w_bin_updated_by_index` (`updated_by`),
  CONSTRAINT `w_bin_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `w_bin_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.w_bin: ~3 rows (approximately)
DELETE FROM `w_bin`;
/*!40000 ALTER TABLE `w_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_bin` ENABLE KEYS */;

-- Dumping structure for table appframe.__groups
DROP TABLE IF EXISTS `__groups`;
CREATE TABLE IF NOT EXISTS `__groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__groups_name_index` (`name`),
  KEY `__groups_created_by_index` (`created_by`),
  KEY `__groups_updated_by_index` (`updated_by`),
  KEY `__groups_reference_index` (`reference`),
  CONSTRAINT `__groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__groups: ~7 rows (approximately)
DELETE FROM `__groups`;
/*!40000 ALTER TABLE `__groups` DISABLE KEYS */;
INSERT INTO `__groups` (`id`, `name`, `description`, `title`, `reference`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(301101, 'accountant', 'ePlus Accountant', 'Accountant', 'ACC', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(301102, 'administrators', 'ePlus Administrator', 'Administators', 'ADM', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(301103, 'salesExecutive', 'ePlus Sales Executives', 'Sales Executives', 'SLS', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(301104, 'eplus_account', 'ePlus user accounts or customers', 'ePlus Accounts', NULL, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36');
/*!40000 ALTER TABLE `__groups` ENABLE KEYS */;

-- Dumping structure for table appframe.__group_roles
DROP TABLE IF EXISTS `__group_roles`;
CREATE TABLE IF NOT EXISTS `__group_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` int(10) unsigned NOT NULL,
  `role` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__group_roles_group_foreign` (`group`),
  KEY `__group_roles_role_foreign` (`role`),
  KEY `__group_roles_created_by_index` (`created_by`),
  KEY `__group_roles_updated_by_index` (`updated_by`),
  CONSTRAINT `__group_roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_group_foreign` FOREIGN KEY (`group`) REFERENCES `__groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_role_foreign` FOREIGN KEY (`role`) REFERENCES `__roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=304104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__group_roles: ~6 rows (approximately)
DELETE FROM `__group_roles`;
/*!40000 ALTER TABLE `__group_roles` DISABLE KEYS */;
INSERT INTO `__group_roles` (`id`, `group`, `role`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(304101, 301101, 303102, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(304102, 301102, 303101, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(304103, 301103, 303103, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36');
/*!40000 ALTER TABLE `__group_roles` ENABLE KEYS */;

-- Dumping structure for table appframe.__group_users
DROP TABLE IF EXISTS `__group_users`;
CREATE TABLE IF NOT EXISTS `__group_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` int(10) unsigned NOT NULL,
  `user` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__group_users_group_foreign` (`group`),
  KEY `__group_users_user_foreign` (`user`),
  KEY `__group_users_created_by_index` (`created_by`),
  KEY `__group_users_updated_by_index` (`updated_by`),
  CONSTRAINT `__group_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__group_users_group_foreign` FOREIGN KEY (`group`) REFERENCES `__groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__group_users_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=302103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__group_users: ~190 rows (approximately)
DELETE FROM `__group_users`;
/*!40000 ALTER TABLE `__group_users` DISABLE KEYS */;
INSERT INTO `__group_users` (`id`, `group`, `user`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(302101, 1, 300101, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(302102, 3, 300102, NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36');
/*!40000 ALTER TABLE `__group_users` ENABLE KEYS */;

-- Dumping structure for table appframe.__organisation
DROP TABLE IF EXISTS `__organisation`;
CREATE TABLE IF NOT EXISTS `__organisation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_short` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_long` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_short` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_long` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__organisation_name_index` (`name`),
  KEY `__organisation_created_by_index` (`created_by`),
  KEY `__organisation_updated_by_index` (`updated_by`),
  CONSTRAINT `__organisation_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__organisation_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__organisation: ~0 rows (approximately)
DELETE FROM `__organisation`;
/*!40000 ALTER TABLE `__organisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `__organisation` ENABLE KEYS */;

-- Dumping structure for table appframe.__organisation_contacts
DROP TABLE IF EXISTS `__organisation_contacts`;
CREATE TABLE IF NOT EXISTS `__organisation_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organisation` int(10) unsigned NOT NULL,
  `type` enum('number','email','address') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'number',
  `type_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__organisation_contacts_organisation_foreign` (`organisation`),
  KEY `__organisation_contacts_created_by_index` (`created_by`),
  KEY `__organisation_contacts_updated_by_index` (`updated_by`),
  CONSTRAINT `__organisation_contacts_organisation_foreign` FOREIGN KEY (`organisation`) REFERENCES `__organisation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__organisation_contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__organisation_contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__organisation_contacts: ~0 rows (approximately)
DELETE FROM `__organisation_contacts`;
/*!40000 ALTER TABLE `__organisation_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `__organisation_contacts` ENABLE KEYS */;

-- Dumping structure for table appframe.__resources
DROP TABLE IF EXISTS `__resources`;
CREATE TABLE IF NOT EXISTS `__resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namespace` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT 'MilestoneAppframe',
  `table` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller_namespace` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `development` enum('No','Yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resources_name_index` (`name`),
  KEY `__resources_created_by_index` (`created_by`),
  KEY `__resources_updated_by_index` (`updated_by`),
  CONSTRAINT `__resources_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resources_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=305128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resources: ~68 rows (approximately)
DELETE FROM `__resources`;
/*!40000 ALTER TABLE `__resources` DISABLE KEYS */;
INSERT INTO `__resources` (`id`, `name`, `description`, `title`, `namespace`, `table`, `controller`, `controller_namespace`, `development`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(305101, 'User', 'Users of Smart Sale', 'Users', 'Milestone\\SS\\Model', 'users', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305102, 'Setup', 'ePlus setup details', 'Setup', 'Milestone\\SS\\Model', 'setup', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305103, 'MenuType', 'Menu group to display name mapper', 'Menu Group', 'Milestone\\SS\\Model', 'menu_types', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305104, 'Menu', 'Menu details', 'Menu', 'Milestone\\SS\\Model', 'menu_types', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305105, 'Setting', 'Settings available in web and mob interface', 'Settings', 'Milestone\\SS\\Model', 'settings', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305106, 'Fiscalyearmaster', 'Financial Years', 'Fiscal Year', 'Milestone\\SS\\Model', 'fiscalyearmaster', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(305107, 'ProductGroupMaster', 'Groups like Category, Brand etc', 'Product Group Masters', 'Milestone\\SS\\Model', 'product_group_master', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305108, 'Product', 'Products or Items', 'Products', 'Milestone\\SS\\Model', 'products', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305109, 'ProductGroup', 'Products and the groups they belongs to', 'Product Groups', 'Milestone\\SS\\Model', 'product_groups', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305110, 'ProductImage', 'Images for  a product', 'Product Images', 'Milestone\\SS\\Model', 'product_images', 'ProductImageController', 'Milestone\\SS\\Controller', 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305111, 'Pricelist', 'Price list header', 'Price List', 'Milestone\\SS\\Model', 'pricelist', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305112, 'PricelistProduct', 'Price list products', 'Price List Products', 'Milestone\\SS\\Model', 'pricelist_products', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305113, 'Functiondetail', 'ePlus functions', 'ePlus Functions', 'Milestone\\SS\\Model', 'functiondetails', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305114, 'Store', 'Stores', 'Stores', 'Milestone\\SS\\Model', 'stores', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305115, 'Area', 'Areas', 'Areas', 'Milestone\\SS\\Model', 'areas', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305116, 'AreaUser', 'Users in an area', 'Area User', 'Milestone\\SS\\Model', 'area_users', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305117, 'UserSetting', 'Web and Mob settings for each user', 'User Settings', 'Milestone\\SS\\Model', 'user_settings', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305118, 'UserStoreArea', 'Stores and Areas assigned to a user (executive)', 'User Store and Area', 'Milestone\\SS\\Model', 'user_store_area', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305119, 'SalesOrder', 'Sales orders', 'Sales Orders', 'Milestone\\SS\\Model', 'sales_order', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305120, 'SalesOrderItem', 'Sales order items', 'Sales Order Items', 'Milestone\\SS\\Model', 'sales_order_items', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305121, 'Transaction', 'Transaction header - customer, date, document number', 'Transactions', 'Milestone\\SS\\Model', 'transactions', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305122, 'TransactionDetail', 'Products in a transaction, its price tax etc', 'Transaction Details', 'Milestone\\SS\\Model', 'transaction_details', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305123, 'DData', 'ePlus Ddata for detailed transaction bills', 'ePlus DData', 'Milestone\\SS\\Model', 'd_data', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305124, 'StockTransfer', 'Stock transfer from and to a store', 'Stock Transfers', 'Milestone\\SS\\Model', 'stock_transfer', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305125, 'WBin', 'Waste bin used while ePlus direct import', 'Waste Bin', 'Milestone\\SS\\Model', 'w_bin', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305126, 'Receipt', 'Receipts', 'Receipts', 'Milestone\\SS\\Model', 'receipts', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(305127, 'FnReserve', 'Function Reserves', 'Function Reserves', 'Milestone\\SS\\Model', 'fn_reserves', NULL, NULL, 'No', NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37');
/*!40000 ALTER TABLE `__resources` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_actions
DROP TABLE IF EXISTS `__resource_actions`;
CREATE TABLE IF NOT EXISTS `__resource_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('primary','secondary','success','danger','warning','info','light','dark','link','outline-primary','outline-secondary','outline-success','outline-danger','outline-warning','outline-info','outline-light','outline-dark') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'outline-info',
  `menu` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `set` enum('far','fas','fab') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'far',
  `on` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handler` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_actions_resource_index` (`resource`),
  KEY `__resource_actions_name_index` (`name`),
  KEY `__resource_actions_created_by_index` (`created_by`),
  KEY `__resource_actions_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_actions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_actions_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_actions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=332135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_actions: ~87 rows (approximately)
DELETE FROM `__resource_actions`;
/*!40000 ALTER TABLE `__resource_actions` DISABLE KEYS */;
INSERT INTO `__resource_actions` (`id`, `resource`, `name`, `description`, `title`, `type`, `menu`, `icon`, `set`, `on`, `confirm`, `handler`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(332101, 305105, 'NewSettings', 'Create new setting', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332102, 305105, 'ListSettings', 'List all settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332103, 305105, 'ViewSettingsDetails', 'Data view of a settings', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332104, 305105, 'UpdateSettings', 'Edit settings details', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332105, 305101, 'UsersList', 'List all available users', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332106, 305101, 'UserSettingsListAction', 'List all settings of a user', 'View Settings', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332107, 305101, 'ListSalesExecutiveAction', 'Action to list all sales executive', NULL, 'outline-info', 'Sales Executives', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332108, 305117, 'AddNewUserSettingAction', 'Action to call form to add user setting', NULL, 'outline-info', 'New User Setting', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332109, 305101, 'AddSettingsForSelectedUser', 'Action to call a form to add a setting for the selected user', 'Add Setting', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332110, 305105, 'SettingsUsersListAction', 'List all users having this setting', 'View Users', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332111, 305105, 'AddUserForSelectedSetting', 'Action to call a form to add a user for the selected setting', 'Add User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332112, 305117, 'ListAllUserSettingsAction', 'Action to list all user settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332113, 305117, 'ChangeUserSettingStatusAction', 'Action to call the form to change user setting status', 'Change Status', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332114, 305117, 'ViewUserSettingsDetails', 'Action to call resource data of user settings', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332115, 305118, 'AddUserStoreAreaRecordAction', 'Action to call form to add user store area', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332116, 305118, 'ListUserStoreAreaRecordAction', 'Action to list all user store area', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332117, 305118, 'ViewUserStoreAreaAction', 'Action to view user store and area', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332118, 305118, 'EditUserStoreAreaAction', 'Action to call a form to update user store area', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332119, 305115, 'ListAreaAction', 'Action to list all areas', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332120, 305114, 'ListStoreAction', 'Action to list all stores', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332121, 305101, 'ListStoreAreaOfUserAction', 'Action to list all store and area of the selected user', 'View Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332122, 305101, 'AddStoreAreaForUser', 'Action to call the form to add store area for a user', 'Add Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332123, 305115, 'ListStoreAndUserOfArea', 'Action to list all Store and User assigned to selected area', 'View Store and User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332124, 305115, 'AssignStoreAndUserForArea', 'Action to call the form to assign store and user for an area', 'Assign Store and Executive', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332125, 305114, 'ListUsersAssigned', 'Action to list all users assigned to a store', 'Manage Executives Assigned', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332126, 305110, 'AddProductImages', 'Action to add images to a product', NULL, 'primary', 'Add New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332127, 305110, 'EditProductImages', 'Action to edit images to a product', 'Edit Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332128, 305110, 'ListProductImages', 'List all entries of product images', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332129, 305110, 'ViewProductImage', 'View details of a product image entry', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332130, 305127, 'ListReserves', 'List all reserve entries', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332131, 305127, 'AddReserveEntry', 'Add new reserve details', NULL, 'outline-info', 'Add New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332132, 305127, 'ViewFnReserve', 'View details of reserve', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332133, 305127, 'UpdateReserveAction', 'Update reserve details', 'Update', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:49', '2019-10-07 07:36:49'),
	(332134, 305127, 'ListUncompletedReserves', 'List all uncompleted reserves', NULL, 'outline-info', 'Uncompleted', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50');
/*!40000 ALTER TABLE `__resource_actions` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_action_attrs
DROP TABLE IF EXISTS `__resource_action_attrs`;
CREATE TABLE IF NOT EXISTS `__resource_action_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_action` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_action_attrs_resource_action_index` (`resource_action`),
  KEY `__resource_action_attrs_created_by_index` (`created_by`),
  KEY `__resource_action_attrs_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_action_attrs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_attrs_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_attrs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=334101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_attrs: ~0 rows (approximately)
DELETE FROM `__resource_action_attrs`;
/*!40000 ALTER TABLE `__resource_action_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_action_attrs` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_action_data
DROP TABLE IF EXISTS `__resource_action_data`;
CREATE TABLE IF NOT EXISTS `__resource_action_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_action` int(10) unsigned NOT NULL,
  `resource_data` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_action_data_resource_action_index` (`resource_action`),
  KEY `__resource_action_data_resource_data_index` (`resource_data`),
  KEY `__resource_action_data_created_by_index` (`created_by`),
  KEY `__resource_action_data_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_action_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=336106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_data: ~5 rows (approximately)
DELETE FROM `__resource_action_data`;
/*!40000 ALTER TABLE `__resource_action_data` DISABLE KEYS */;
INSERT INTO `__resource_action_data` (`id`, `resource_action`, `resource_data`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(336101, 332104, 327101, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(336102, 332113, 327102, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(336103, 332118, 327103, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(336104, 332133, 327105, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(336105, 332133, 327105, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51');
/*!40000 ALTER TABLE `__resource_action_data` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_action_lists
DROP TABLE IF EXISTS `__resource_action_lists`;
CREATE TABLE IF NOT EXISTS `__resource_action_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_action` int(10) unsigned NOT NULL,
  `resource_list` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_action_lists_resource_action_index` (`resource_action`),
  KEY `__resource_action_lists_resource_list_index` (`resource_list`),
  KEY `__resource_action_lists_created_by_index` (`created_by`),
  KEY `__resource_action_lists_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_action_lists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_lists: ~57 rows (approximately)
DELETE FROM `__resource_action_lists`;
/*!40000 ALTER TABLE `__resource_action_lists` DISABLE KEYS */;
INSERT INTO `__resource_action_lists` (`id`, `resource_action`, `resource_list`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(335101, 332103, 322101, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335102, 332104, 322101, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335103, 332106, 322104, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335104, 332109, 322104, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335105, 332110, 322101, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335106, 332111, 322101, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335107, 332114, 322103, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335108, 332113, 322103, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335109, 332117, 322105, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335110, 332118, 322105, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335111, 332121, 322104, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335112, 332122, 322104, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335113, 332123, 322106, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335114, 332124, 322106, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335115, 332125, 322107, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335116, 332127, 322108, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335117, 332129, 322108, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335118, 332132, 322110, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335119, 332133, 322110, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335120, 332132, 322111, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(335121, 332133, 322111, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51');
/*!40000 ALTER TABLE `__resource_action_lists` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_action_methods
DROP TABLE IF EXISTS `__resource_action_methods`;
CREATE TABLE IF NOT EXISTS `__resource_action_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_action` int(10) unsigned NOT NULL,
  `type` enum('Method','Dashboard','Form','List','Data','FormWithData','ListRelation','AddRelation','ManageRelation') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Method',
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn1` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn2` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn3` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn4` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idn5` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_action_methods_resource_action_index` (`resource_action`),
  KEY `__resource_action_methods_created_by_index` (`created_by`),
  KEY `__resource_action_methods_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_action_methods_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_methods_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_methods_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=333135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_methods: ~87 rows (approximately)
DELETE FROM `__resource_action_methods`;
/*!40000 ALTER TABLE `__resource_action_methods` DISABLE KEYS */;
INSERT INTO `__resource_action_methods` (`id`, `resource_action`, `type`, `method`, `idn1`, `idn2`, `idn3`, `idn4`, `idn5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(333101, 332101, 'Form', NULL, '309101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333102, 332102, 'List', NULL, '322101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333103, 332103, 'Data', NULL, '327101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333104, 332104, 'FormWithData', NULL, '309101', '327101', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333105, 332105, 'List', NULL, '322102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333106, 332106, 'ListRelation', NULL, '308110', '322103', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333107, 332107, 'List', NULL, '322104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333108, 332108, 'Form', NULL, '309102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333109, 332109, 'AddRelation', NULL, '308110', '309102', '310105', NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333110, 332110, 'ListRelation', NULL, '308107', '322103', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333111, 332111, 'AddRelation', NULL, '308107', '309102', '310106', NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333112, 332112, 'List', NULL, '322103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333113, 332113, 'FormWithData', NULL, '309103', '327102', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333114, 332114, 'Data', NULL, '327102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333115, 332115, 'Form', NULL, '309104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333116, 332116, 'List', NULL, '322105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333117, 332117, 'Data', NULL, '327103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333118, 332118, 'FormWithData', NULL, '309104', '327103', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333119, 332119, 'List', NULL, '322106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333120, 332120, 'List', NULL, '322107', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333121, 332121, 'ListRelation', NULL, '308112', '322105', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333122, 332122, 'AddRelation', NULL, '308112', '309104', '310109', NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333123, 332123, 'ListRelation', NULL, '308117', '322105', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333124, 332124, 'AddRelation', NULL, '308117', '309104', '310111', NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333125, 332125, 'ManageRelation', NULL, '308116', '322104', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333126, 332126, 'Form', NULL, '309105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333127, 332127, 'FormWithData', NULL, '309105', '327104', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333128, 332128, 'List', NULL, '322108', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333129, 332129, 'Data', NULL, '327105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333130, 332130, 'List', NULL, '322110', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333131, 332131, 'Form', NULL, '309106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:50', '2019-10-07 07:36:50'),
	(333132, 332132, 'Data', NULL, '327105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(333133, 332133, 'FormWithData', NULL, '309107', '327105', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(333134, 332134, 'List', NULL, '322111', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51');
/*!40000 ALTER TABLE `__resource_action_methods` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_dashboard
DROP TABLE IF EXISTS `__resource_dashboard`;
CREATE TABLE IF NOT EXISTS `__resource_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_dashboard_resource_index` (`resource`),
  KEY `__resource_dashboard_name_index` (`name`),
  KEY `__resource_dashboard_created_by_index` (`created_by`),
  KEY `__resource_dashboard_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_dashboard_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=339101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard: ~0 rows (approximately)
DELETE FROM `__resource_dashboard`;
/*!40000 ALTER TABLE `__resource_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_dashboard_sections
DROP TABLE IF EXISTS `__resource_dashboard_sections`;
CREATE TABLE IF NOT EXISTS `__resource_dashboard_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_dashboard` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` smallint(5) unsigned NOT NULL DEFAULT '300',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_dashboard_sections_resource_dashboard_index` (`resource_dashboard`),
  KEY `__resource_dashboard_sections_name_index` (`name`),
  KEY `__resource_dashboard_sections_created_by_index` (`created_by`),
  KEY `__resource_dashboard_sections_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_dashboard_sections_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_sections_resource_dashboard_foreign` FOREIGN KEY (`resource_dashboard`) REFERENCES `__resource_dashboard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_sections_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard_sections: ~0 rows (approximately)
DELETE FROM `__resource_dashboard_sections`;
/*!40000 ALTER TABLE `__resource_dashboard_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard_sections` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_dashboard_section_items
DROP TABLE IF EXISTS `__resource_dashboard_section_items`;
CREATE TABLE IF NOT EXISTS `__resource_dashboard_section_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` int(10) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` enum('Metric','List','ListRelation') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Metric',
  `item_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id2` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_dashboard_section_items_section_index` (`section`),
  KEY `__resource_dashboard_section_items_created_by_index` (`created_by`),
  KEY `__resource_dashboard_section_items_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_dashboard_section_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_section_items_section_foreign` FOREIGN KEY (`section`) REFERENCES `__resource_dashboard_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_section_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard_section_items: ~0 rows (approximately)
DELETE FROM `__resource_dashboard_section_items`;
/*!40000 ALTER TABLE `__resource_dashboard_section_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard_section_items` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_data
DROP TABLE IF EXISTS `__resource_data`;
CREATE TABLE IF NOT EXISTS `__resource_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_data_resource_index` (`resource`),
  KEY `__resource_data_name_index` (`name`),
  KEY `__resource_data_created_by_index` (`created_by`),
  KEY `__resource_data_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data: ~6 rows (approximately)
DELETE FROM `__resource_data`;
/*!40000 ALTER TABLE `__resource_data` DISABLE KEYS */;
INSERT INTO `__resource_data` (`id`, `resource`, `name`, `description`, `title_field`, `method`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(327101, 305105, 'SettingsView', 'View details of a settings', 'name', NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(327102, 305117, 'UserSettingsView', 'View details of a user setting', 'user.name', NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(327103, 305118, 'UserStoreAreaView', 'View details of user store area', 'user.name', NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(327104, 305110, 'ProductImageView', 'View images of a product', 'product.name', NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(327105, 305127, 'ReserveView', 'View reserve details', 'code', NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47');
/*!40000 ALTER TABLE `__resource_data` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_data_relations
DROP TABLE IF EXISTS `__resource_data_relations`;
CREATE TABLE IF NOT EXISTS `__resource_data_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_data` int(10) unsigned NOT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `nest_relation4` int(10) unsigned DEFAULT NULL,
  `nest_relation5` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_data_relations_resource_data_index` (`resource_data`),
  KEY `__resource_data_relations_relation_index` (`relation`),
  KEY `__resource_data_relations_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_data_relations_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_data_relations_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_data_relations_nest_relation4_index` (`nest_relation4`),
  KEY `__resource_data_relations_nest_relation5_index` (`nest_relation5`),
  KEY `__resource_data_relations_created_by_index` (`created_by`),
  KEY `__resource_data_relations_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_data_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_relations: ~9 rows (approximately)
DELETE FROM `__resource_data_relations`;
/*!40000 ALTER TABLE `__resource_data_relations` DISABLE KEYS */;
INSERT INTO `__resource_data_relations` (`id`, `resource_data`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `nest_relation4`, `nest_relation5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(329101, 327102, 308111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329102, 327102, 308109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329103, 327103, 308113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329104, 327103, 308114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329105, 327103, 308115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329106, 327104, 308133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329107, 327105, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(329108, 327105, 308135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47');
/*!40000 ALTER TABLE `__resource_data_relations` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_data_scopes
DROP TABLE IF EXISTS `__resource_data_scopes`;
CREATE TABLE IF NOT EXISTS `__resource_data_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_data` int(10) unsigned NOT NULL,
  `scope` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_data_scopes_resource_data_index` (`resource_data`),
  KEY `__resource_data_scopes_scope_index` (`scope`),
  KEY `__resource_data_scopes_created_by_index` (`created_by`),
  KEY `__resource_data_scopes_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_data_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_scope_foreign` FOREIGN KEY (`scope`) REFERENCES `__resource_scopes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=328101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_scopes: ~0 rows (approximately)
DELETE FROM `__resource_data_scopes`;
/*!40000 ALTER TABLE `__resource_data_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_data_scopes` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_data_view_sections
DROP TABLE IF EXISTS `__resource_data_view_sections`;
CREATE TABLE IF NOT EXISTS `__resource_data_view_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_data` int(10) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `colspan` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_data_view_sections_resource_data_index` (`resource_data`),
  KEY `__resource_data_view_sections_relation_index` (`relation`),
  KEY `__resource_data_view_sections_created_by_index` (`created_by`),
  KEY `__resource_data_view_sections_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_data_view_sections_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=330108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_view_sections: ~7 rows (approximately)
DELETE FROM `__resource_data_view_sections`;
/*!40000 ALTER TABLE `__resource_data_view_sections` DISABLE KEYS */;
INSERT INTO `__resource_data_view_sections` (`id`, `resource_data`, `title`, `title_field`, `relation`, `colspan`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(330101, 327101, 'Basic', NULL, NULL, 4, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(330102, 327101, 'Detail', NULL, NULL, 12, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(330103, 327102, 'User Settings Details', NULL, NULL, 12, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(330104, 327103, 'Details', NULL, NULL, 12, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(330105, 327104, NULL, 'product.name', NULL, 12, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(330106, 327105, NULL, NULL, NULL, 9, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(330107, 327105, 'Progress', NULL, NULL, 3, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48');
/*!40000 ALTER TABLE `__resource_data_view_sections` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_data_view_section_items
DROP TABLE IF EXISTS `__resource_data_view_section_items`;
CREATE TABLE IF NOT EXISTS `__resource_data_view_section_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` int(10) unsigned NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_data_view_section_items_section_index` (`section`),
  KEY `__resource_data_view_section_items_relation_index` (`relation`),
  KEY `__resource_data_view_section_items_created_by_index` (`created_by`),
  KEY `__resource_data_view_section_items_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_data_view_section_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_section_foreign` FOREIGN KEY (`section`) REFERENCES `__resource_data_view_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=331127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_view_section_items: ~26 rows (approximately)
DELETE FROM `__resource_data_view_section_items`;
/*!40000 ALTER TABLE `__resource_data_view_section_items` DISABLE KEYS */;
INSERT INTO `__resource_data_view_section_items` (`id`, `section`, `label`, `attribute`, `relation`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(331101, 330101, 'Name', 'name', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331102, 330101, 'Default Value', 'value', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331103, 330101, 'Status', 'status', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331104, 330102, 'Details', 'description', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331105, 330103, 'User', 'name', 308111, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331106, 330103, 'Setings', 'name', 308109, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331107, 330103, 'Value', 'value', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331108, 330103, 'Status', 'status', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331109, 330104, 'Executive', 'name', 308115, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331110, 330104, 'Store', 'name', 308114, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331111, 330104, 'Area', 'name', 308113, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331112, 330104, 'Status', 'status', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331113, 330105, 'Image 01', 'image01', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331114, 330105, 'Image 02', 'image02', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331115, 330105, 'Image 03', 'image03', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331116, 330105, 'Image 04', 'image04', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331117, 330105, 'Image 05', 'image05', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331118, 330106, 'Code', 'code', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331119, 330106, 'User', 'name', 308134, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331120, 330106, 'Store', 'name', 308135, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331121, 330106, 'Start', 'start_num', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331122, 330106, 'End', 'end_num', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331123, 330107, 'Quantity', 'quantity', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331124, 330107, 'Current', 'current', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331125, 330107, 'Progress', 'progress', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48'),
	(331126, 330107, 'Status', 'status', NULL, NULL, NULL, '2019-10-07 07:36:48', '2019-10-07 07:36:48');
/*!40000 ALTER TABLE `__resource_data_view_section_items` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_defaults
DROP TABLE IF EXISTS `__resource_defaults`;
CREATE TABLE IF NOT EXISTS `__resource_defaults` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `list` int(10) unsigned DEFAULT NULL,
  `create` int(10) unsigned DEFAULT NULL,
  `read` int(10) unsigned DEFAULT NULL,
  `update` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_defaults_resource_index` (`resource`),
  KEY `__resource_defaults_list_index` (`list`),
  KEY `__resource_defaults_create_index` (`create`),
  KEY `__resource_defaults_read_index` (`read`),
  KEY `__resource_defaults_update_index` (`update`),
  KEY `__resource_defaults_created_by_index` (`created_by`),
  KEY `__resource_defaults_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_defaults_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_create_foreign` FOREIGN KEY (`create`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_list_foreign` FOREIGN KEY (`list`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_read_foreign` FOREIGN KEY (`read`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_update_foreign` FOREIGN KEY (`update`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=337104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_defaults: ~3 rows (approximately)
DELETE FROM `__resource_defaults`;
/*!40000 ALTER TABLE `__resource_defaults` DISABLE KEYS */;
INSERT INTO `__resource_defaults` (`id`, `resource`, `list`, `create`, `read`, `update`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(337101, 305105, 332102, 332101, 332103, 332104, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(337102, 305117, 332112, 332108, 332114, 332113, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51'),
	(337103, 305118, 332116, 332115, 332117, 332118, NULL, NULL, '2019-10-07 07:36:51', '2019-10-07 07:36:51');
/*!40000 ALTER TABLE `__resource_defaults` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_forms
DROP TABLE IF EXISTS `__resource_forms`;
CREATE TABLE IF NOT EXISTS `__resource_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_text` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Submit',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_forms_resource_index` (`resource`),
  KEY `__resource_forms_name_index` (`name`),
  KEY `__resource_forms_created_by_index` (`created_by`),
  KEY `__resource_forms_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_forms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_forms_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_forms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=309108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_forms: ~25 rows (approximately)
DELETE FROM `__resource_forms`;
/*!40000 ALTER TABLE `__resource_forms` DISABLE KEYS */;
INSERT INTO `__resource_forms` (`id`, `resource`, `name`, `description`, `title`, `action_text`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(309101, 305105, 'AddNewSetting', 'Add a new setting, the value mentioned will be deault to all users', 'Settings', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309102, 305117, 'AddNewUserSetting', 'Add new user setting', 'User Setting', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309103, 305117, 'ChangeUserSettingStatus', 'Form to update user settings status', 'Change Status', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309104, 305118, 'AddUserStoreAreaForm', 'Form to add user store area', 'User, Store and Area', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309105, 305110, 'AddProductImage', 'Form to add product images', 'Product Images', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309106, 305127, 'AddFNReserves', 'Form to add function reserves', 'Function Reserves', 'Save', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(309107, 305127, 'UpdateReserves', 'Formt o update reserves', 'Function Reserves', 'Update', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40');
/*!40000 ALTER TABLE `__resource_forms` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_collection
DROP TABLE IF EXISTS `__resource_form_collection`;
CREATE TABLE IF NOT EXISTS `__resource_form_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_form` int(10) unsigned NOT NULL,
  `collection_form` int(10) unsigned NOT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `foreign_field` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_collection_resource_form_index` (`resource_form`),
  KEY `__resource_form_collection_collection_form_index` (`collection_form`),
  KEY `__resource_form_collection_relation_index` (`relation`),
  KEY `__resource_form_collection_foreign_field_index` (`foreign_field`),
  KEY `__resource_form_collection_created_by_index` (`created_by`),
  KEY `__resource_form_collection_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_collection_collection_form_foreign` FOREIGN KEY (`collection_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_foreign_field_foreign` FOREIGN KEY (`foreign_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=320101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_collection: ~2 rows (approximately)
DELETE FROM `__resource_form_collection`;
/*!40000 ALTER TABLE `__resource_form_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_collection` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_data_map
DROP TABLE IF EXISTS `__resource_form_data_map`;
CREATE TABLE IF NOT EXISTS `__resource_form_data_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_form` int(10) unsigned NOT NULL,
  `resource_data` int(10) unsigned NOT NULL,
  `form_field` int(10) unsigned NOT NULL,
  `attribute` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `nest_relation4` int(10) unsigned DEFAULT NULL,
  `nest_relation5` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_data_map_resource_form_index` (`resource_form`),
  KEY `__resource_form_data_map_resource_data_index` (`resource_data`),
  KEY `__resource_form_data_map_form_field_index` (`form_field`),
  KEY `__resource_form_data_map_relation_index` (`relation`),
  KEY `__resource_form_data_map_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_form_data_map_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_form_data_map_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_form_data_map_nest_relation4_index` (`nest_relation4`),
  KEY `__resource_form_data_map_nest_relation5_index` (`nest_relation5`),
  KEY `__resource_form_data_map_created_by_index` (`created_by`),
  KEY `__resource_form_data_map_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_data_map_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=318101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_data_map: ~1 rows (approximately)
DELETE FROM `__resource_form_data_map`;
/*!40000 ALTER TABLE `__resource_form_data_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_data_map` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_defaults
DROP TABLE IF EXISTS `__resource_form_defaults`;
CREATE TABLE IF NOT EXISTS `__resource_form_defaults` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_form` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `attribute` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_defaults_resource_form_index` (`resource_form`),
  KEY `__resource_form_defaults_name_index` (`name`),
  KEY `__resource_form_defaults_relation_index` (`relation`),
  KEY `__resource_form_defaults_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_form_defaults_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_form_defaults_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_form_defaults_created_by_index` (`created_by`),
  KEY `__resource_form_defaults_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_defaults_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=319101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_defaults: ~2 rows (approximately)
DELETE FROM `__resource_form_defaults`;
/*!40000 ALTER TABLE `__resource_form_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_defaults` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_fields
DROP TABLE IF EXISTS `__resource_form_fields`;
CREATE TABLE IF NOT EXISTS `__resource_form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_form` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_fields_resource_form_index` (`resource_form`),
  KEY `__resource_form_fields_name_index` (`name`),
  KEY `__resource_form_fields_created_by_index` (`created_by`),
  KEY `__resource_form_fields_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_fields_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_fields_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_fields_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=310130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_fields: ~115 rows (approximately)
DELETE FROM `__resource_form_fields`;
/*!40000 ALTER TABLE `__resource_form_fields` DISABLE KEYS */;
INSERT INTO `__resource_form_fields` (`id`, `resource_form`, `name`, `type`, `label`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(310101, 309101, 'name', 'text', 'Name of Settings', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310102, 309101, 'value', 'text', 'Default Value', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310103, 309101, 'status', 'select', 'Status', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310104, 309101, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310105, 309102, 'user', 'select', 'User', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310106, 309102, 'setting', 'select', 'Setting', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310107, 309102, 'value', 'text', 'Value', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310108, 309103, 'status', 'select', 'Change Status to', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310109, 309104, 'user', 'select', 'Sales Executive', NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(310110, 309104, 'store', 'select', 'Store', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310111, 309104, 'area', 'select', 'Area', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310112, 309104, 'status', 'select', 'Status', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310113, 309105, 'product', 'select', 'Product', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310114, 309105, 'image01', 'file', 'Image 01', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310115, 309105, 'image02', 'file', 'Image 02', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310116, 309105, 'image03', 'file', 'Image 03', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310117, 309105, 'image04', 'file', 'Image 04', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310118, 309105, 'image05', 'file', 'Image 05', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310119, 309105, 'default', 'select', 'Set Default Image', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310120, 309106, 'fncode', 'select', 'Select FN Code', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310121, 309106, 'user', 'select', 'Select User', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310122, 309106, 'store', 'select', 'Select Store', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310123, 309106, 'start_num', 'text', 'Enter Sequence Start Number', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310124, 309106, 'end_num', 'text', 'Enter Sequence End Number', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310125, 309107, 'start_num', 'text', 'Start Num', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310126, 309107, 'end_num', 'text', 'End Num', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310127, 309107, 'current', 'text', 'Current', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310128, 309107, 'progress', 'select', 'Progress', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(310129, 309107, 'status', 'select', 'Status', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41');
/*!40000 ALTER TABLE `__resource_form_fields` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_attrs
DROP TABLE IF EXISTS `__resource_form_field_attrs`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_attrs_form_field_index` (`form_field`),
  KEY `__resource_form_field_attrs_created_by_index` (`created_by`),
  KEY `__resource_form_field_attrs_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_attrs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_attrs_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_attrs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=313105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_attrs: ~8 rows (approximately)
DELETE FROM `__resource_form_field_attrs`;
/*!40000 ALTER TABLE `__resource_form_field_attrs` DISABLE KEYS */;
INSERT INTO `__resource_form_field_attrs` (`id`, `form_field`, `name`, `value`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(313101, 310109, 'inline', '4', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(313102, 310110, 'inline', '4', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(313103, 310111, 'inline', '4', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41'),
	(313104, 310112, 'inline', '4', NULL, NULL, '2019-10-07 07:36:41', '2019-10-07 07:36:41');
/*!40000 ALTER TABLE `__resource_form_field_attrs` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_data
DROP TABLE IF EXISTS `__resource_form_field_data`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `attribute` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_data_form_field_index` (`form_field`),
  KEY `__resource_form_field_data_relation_index` (`relation`),
  KEY `__resource_form_field_data_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_form_field_data_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_form_field_data_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_form_field_data_created_by_index` (`created_by`),
  KEY `__resource_form_field_data_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=311130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_data: ~115 rows (approximately)
DELETE FROM `__resource_form_field_data`;
/*!40000 ALTER TABLE `__resource_form_field_data` DISABLE KEYS */;
INSERT INTO `__resource_form_field_data` (`id`, `form_field`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `attribute`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(311101, 310101, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311102, 310102, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311103, 310103, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311104, 310104, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311105, 310105, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311106, 310106, NULL, NULL, NULL, NULL, 'setting', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311107, 310107, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311108, 310108, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311109, 310109, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311110, 310110, NULL, NULL, NULL, NULL, 'store', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311111, 310111, NULL, NULL, NULL, NULL, 'area', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311112, 310112, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311113, 310113, NULL, NULL, NULL, NULL, 'product', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311114, 310114, NULL, NULL, NULL, NULL, 'image01', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311115, 310115, NULL, NULL, NULL, NULL, 'image02', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311116, 310116, NULL, NULL, NULL, NULL, 'image03', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311117, 310117, NULL, NULL, NULL, NULL, 'image04', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311118, 310118, NULL, NULL, NULL, NULL, 'image05', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311119, 310119, NULL, NULL, NULL, NULL, 'default', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311120, 310120, NULL, NULL, NULL, NULL, 'fncode', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311121, 310121, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311122, 310122, NULL, NULL, NULL, NULL, 'store', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311123, 310123, NULL, NULL, NULL, NULL, 'start_num', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311124, 310124, NULL, NULL, NULL, NULL, 'end_num', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311125, 310125, NULL, NULL, NULL, NULL, 'start_num', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311126, 310126, NULL, NULL, NULL, NULL, 'end_num', NULL, NULL, '2019-10-07 07:36:42', '2019-10-07 07:36:42'),
	(311127, 310127, NULL, NULL, NULL, NULL, 'current', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(311128, 310128, NULL, NULL, NULL, NULL, 'progress', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(311129, 310129, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43');
/*!40000 ALTER TABLE `__resource_form_field_data` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_depends
DROP TABLE IF EXISTS `__resource_form_field_depends`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_depends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `depend_field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` enum('=','<','>','<=','>=','<>','In','NotIn','like') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=',
  `compare_method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_db_field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ignore_null` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_depends_form_field_index` (`form_field`),
  KEY `__resource_form_field_depends_depend_field_index` (`depend_field`),
  KEY `__resource_form_field_depends_created_by_index` (`created_by`),
  KEY `__resource_form_field_depends_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_depends_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_depends_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_depends_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=316101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_depends: ~16 rows (approximately)
DELETE FROM `__resource_form_field_depends`;
/*!40000 ALTER TABLE `__resource_form_field_depends` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_field_depends` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_dynamic
DROP TABLE IF EXISTS `__resource_form_field_dynamic`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_dynamic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `type` enum('disabled-enabled','enabled-disabled','hidden-visible','visible-hidden','readonly-editable','editable-readonly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disabled-enabled',
  `depend_field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alter_on` enum('not null','value','null') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not null',
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `values` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` enum('=','<','>','<=','>=','<>','In','NotIn','like') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=',
  `on_multiple` enum('and','or') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'and',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_dynamic_form_field_index` (`form_field`),
  KEY `__resource_form_field_dynamic_depend_field_index` (`depend_field`),
  KEY `__resource_form_field_dynamic_created_by_index` (`created_by`),
  KEY `__resource_form_field_dynamic_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_dynamic_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_dynamic_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_dynamic_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=314101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_dynamic: ~2 rows (approximately)
DELETE FROM `__resource_form_field_dynamic`;
/*!40000 ALTER TABLE `__resource_form_field_dynamic` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_field_dynamic` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_options
DROP TABLE IF EXISTS `__resource_form_field_options`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `type` enum('List','Enum','Foreign','Method') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'List',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `value_attr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_attr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preload` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_options_form_field_index` (`form_field`),
  KEY `__resource_form_field_options_created_by_index` (`created_by`),
  KEY `__resource_form_field_options_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_options_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_options: ~35 rows (approximately)
DELETE FROM `__resource_form_field_options`;
/*!40000 ALTER TABLE `__resource_form_field_options` DISABLE KEYS */;
INSERT INTO `__resource_form_field_options` (`id`, `form_field`, `type`, `detail`, `value_attr`, `label_attr`, `preload`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(312101, 310103, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312102, 310105, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312103, 310106, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312104, 310108, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312105, 310109, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312106, 310110, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312107, 310111, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312108, 310112, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312109, 310113, 'Foreign', NULL, 'id', 'narration', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312110, 310119, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312111, 310120, 'List', '322111', 'code', 'code', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312112, 310121, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312113, 310122, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312114, 310128, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43'),
	(312115, 310129, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43');
/*!40000 ALTER TABLE `__resource_form_field_options` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_field_validations
DROP TABLE IF EXISTS `__resource_form_field_validations`;
CREATE TABLE IF NOT EXISTS `__resource_form_field_validations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_field` int(10) unsigned NOT NULL,
  `rule` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg1` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg2` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg3` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg4` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg5` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_field_validations_form_field_index` (`form_field`),
  KEY `__resource_form_field_validations_created_by_index` (`created_by`),
  KEY `__resource_form_field_validations_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_field_validations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_validations_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_validations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_validations: ~5 rows (approximately)
DELETE FROM `__resource_form_field_validations`;
/*!40000 ALTER TABLE `__resource_form_field_validations` DISABLE KEYS */;
INSERT INTO `__resource_form_field_validations` (`id`, `form_field`, `rule`, `message`, `arg1`, `arg2`, `arg3`, `arg4`, `arg5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(315101, 310101, 'required', 'Name is mandatory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:43', '2019-10-07 07:36:43');
/*!40000 ALTER TABLE `__resource_form_field_validations` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_layout
DROP TABLE IF EXISTS `__resource_form_layout`;
CREATE TABLE IF NOT EXISTS `__resource_form_layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_form` int(10) unsigned NOT NULL,
  `form_field` int(10) unsigned NOT NULL,
  `colspan` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_layout_resource_form_index` (`resource_form`),
  KEY `__resource_form_layout_form_field_index` (`form_field`),
  KEY `__resource_form_layout_created_by_index` (`created_by`),
  KEY `__resource_form_layout_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_layout_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=317108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_layout: ~59 rows (approximately)
DELETE FROM `__resource_form_layout`;
/*!40000 ALTER TABLE `__resource_form_layout` DISABLE KEYS */;
INSERT INTO `__resource_form_layout` (`id`, `resource_form`, `form_field`, `colspan`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(317101, 309101, 310101, 4, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317102, 309101, 310102, 4, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317103, 309101, 310103, 4, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317104, 309101, 310104, 12, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317105, 309102, 310105, 6, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317106, 309102, 310106, 6, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(317107, 309102, 310107, 12, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44');
/*!40000 ALTER TABLE `__resource_form_layout` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_form_upload
DROP TABLE IF EXISTS `__resource_form_upload`;
CREATE TABLE IF NOT EXISTS `__resource_form_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_client` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_client` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(10) unsigned NOT NULL DEFAULT '1',
  `disk` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_form_upload_created_by_index` (`created_by`),
  KEY `__resource_form_upload_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_form_upload_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_upload_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=321101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_upload: ~0 rows (approximately)
DELETE FROM `__resource_form_upload`;
/*!40000 ALTER TABLE `__resource_form_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_upload` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_lists
DROP TABLE IF EXISTS `__resource_lists`;
CREATE TABLE IF NOT EXISTS `__resource_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items_per_page` smallint(5) unsigned NOT NULL DEFAULT '25',
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_lists_resource_index` (`resource`),
  KEY `__resource_lists_name_index` (`name`),
  KEY `__resource_lists_created_by_index` (`created_by`),
  KEY `__resource_lists_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_lists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_lists_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_lists_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=322112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_lists: ~37 rows (approximately)
DELETE FROM `__resource_lists`;
/*!40000 ALTER TABLE `__resource_lists` DISABLE KEYS */;
INSERT INTO `__resource_lists` (`id`, `resource`, `name`, `description`, `title`, `identity`, `items_per_page`, `method`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(322101, 305105, 'Settings', 'List all available Settings', 'Settings', 'name', 20, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322102, 305101, 'ListAllUsers', 'List all available users', 'Users', 'name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322103, 305117, 'ListAllUserSetting', 'List all user setting and value', 'User Settings', 'user.name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322104, 305101, 'SalesExecutiveUserList', 'List all sales executives from users', 'Sales Executives', 'name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322105, 305118, 'UserStoreAreaList', 'List all records in User Store Area', 'User, Store and Area', 'user.name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322106, 305115, 'AreaList', 'List all areas', 'Area', 'name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322107, 305114, 'StoresList', 'List all stores', 'Stores', 'name', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322108, 305110, 'ProductImageList', 'List All entries', 'Product Images', 'product.narration', 15, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322109, 305113, 'FunctionDetailList', 'List All functions available', 'Function details list', 'code', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322110, 305127, 'ReservesList', 'List all reserves', 'Function Reserves', 'code', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(322111, 305127, 'UncompletedReservesList', 'List all reserve entries which are uncompleted', 'Function Reserves', 'code', 50, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44');
/*!40000 ALTER TABLE `__resource_lists` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_list_layout
DROP TABLE IF EXISTS `__resource_list_layout`;
CREATE TABLE IF NOT EXISTS `__resource_list_layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_list` int(10) unsigned NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_list_layout_resource_list_index` (`resource_list`),
  KEY `__resource_list_layout_relation_index` (`relation`),
  KEY `__resource_list_layout_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_list_layout_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_list_layout_created_by_index` (`created_by`),
  KEY `__resource_list_layout_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_list_layout_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=325138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_layout: ~135 rows (approximately)
DELETE FROM `__resource_list_layout`;
/*!40000 ALTER TABLE `__resource_list_layout` DISABLE KEYS */;
INSERT INTO `__resource_list_layout` (`id`, `resource_list`, `label`, `field`, `relation`, `nest_relation1`, `nest_relation2`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(325101, 322101, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325102, 322101, 'Default Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325103, 322101, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325104, 322102, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325105, 322102, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325106, 322102, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325107, 322103, 'User', 'name', 308111, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325108, 322103, 'Settings', 'name', 308109, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325109, 322103, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325110, 322103, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325111, 322104, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325112, 322104, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325113, 322104, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325114, 322105, 'Executive', 'name', 308115, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325115, 322105, 'Store', 'name', 308114, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325116, 322105, 'Area', 'name', 308113, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325117, 322105, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325118, 322106, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325119, 322106, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325120, 322106, 'Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(325121, 322106, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325122, 322107, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325123, 322107, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325124, 322107, 'Company Code', 'cocode', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325125, 322107, 'Branch Code', 'brcode', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325126, 322108, 'Product', 'narration', 308133, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325127, 322109, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325128, 322109, 'Abbreviation', 'abr', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325129, 322109, 'Digit Length', 'digit_length', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325130, 322110, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325131, 322110, 'User', 'name', 308134, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325132, 322110, 'Store', 'name', 308135, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325133, 322110, 'Progress', 'progress', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325134, 322111, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325135, 322111, 'User', 'name', 308134, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325136, 322111, 'Store', 'name', 308135, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(325137, 322111, 'Progress', 'progress', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46');
/*!40000 ALTER TABLE `__resource_list_layout` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_list_relations
DROP TABLE IF EXISTS `__resource_list_relations`;
CREATE TABLE IF NOT EXISTS `__resource_list_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_list` int(10) unsigned NOT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `nest_relation4` int(10) unsigned DEFAULT NULL,
  `nest_relation5` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_list_relations_resource_list_index` (`resource_list`),
  KEY `__resource_list_relations_relation_index` (`relation`),
  KEY `__resource_list_relations_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_list_relations_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_list_relations_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_list_relations_nest_relation4_index` (`nest_relation4`),
  KEY `__resource_list_relations_nest_relation5_index` (`nest_relation5`),
  KEY `__resource_list_relations_created_by_index` (`created_by`),
  KEY `__resource_list_relations_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_list_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=324111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_relations: ~39 rows (approximately)
DELETE FROM `__resource_list_relations`;
/*!40000 ALTER TABLE `__resource_list_relations` DISABLE KEYS */;
INSERT INTO `__resource_list_relations` (`id`, `resource_list`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `nest_relation4`, `nest_relation5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(324101, 322103, 308109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(324102, 322103, 308111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(324103, 322105, 308113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(324104, 322105, 308114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(324105, 322105, 308115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:44', '2019-10-07 07:36:44'),
	(324106, 322108, 308133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(324107, 322110, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(324108, 322110, 308135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(324109, 322111, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(324110, 322111, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45');
/*!40000 ALTER TABLE `__resource_list_relations` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_list_scopes
DROP TABLE IF EXISTS `__resource_list_scopes`;
CREATE TABLE IF NOT EXISTS `__resource_list_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_list` int(10) unsigned NOT NULL,
  `scope` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_list_scopes_resource_list_index` (`resource_list`),
  KEY `__resource_list_scopes_scope_index` (`scope`),
  KEY `__resource_list_scopes_created_by_index` (`created_by`),
  KEY `__resource_list_scopes_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_list_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_scope_foreign` FOREIGN KEY (`scope`) REFERENCES `__resource_scopes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=323103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_scopes: ~4 rows (approximately)
DELETE FROM `__resource_list_scopes`;
/*!40000 ALTER TABLE `__resource_list_scopes` DISABLE KEYS */;
INSERT INTO `__resource_list_scopes` (`id`, `resource_list`, `scope`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(323101, 322104, 307101, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45'),
	(323102, 322111, 307109, NULL, NULL, '2019-10-07 07:36:45', '2019-10-07 07:36:45');
/*!40000 ALTER TABLE `__resource_list_scopes` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_list_search
DROP TABLE IF EXISTS `__resource_list_search`;
CREATE TABLE IF NOT EXISTS `__resource_list_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_list` int(10) unsigned NOT NULL,
  `field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation` int(10) unsigned DEFAULT NULL,
  `nest_relation1` int(10) unsigned DEFAULT NULL,
  `nest_relation2` int(10) unsigned DEFAULT NULL,
  `nest_relation3` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_list_search_resource_list_index` (`resource_list`),
  KEY `__resource_list_search_relation_index` (`relation`),
  KEY `__resource_list_search_nest_relation1_index` (`nest_relation1`),
  KEY `__resource_list_search_nest_relation2_index` (`nest_relation2`),
  KEY `__resource_list_search_nest_relation3_index` (`nest_relation3`),
  KEY `__resource_list_search_created_by_index` (`created_by`),
  KEY `__resource_list_search_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_list_search_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=326122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_search: ~21 rows (approximately)
DELETE FROM `__resource_list_search`;
/*!40000 ALTER TABLE `__resource_list_search` DISABLE KEYS */;
INSERT INTO `__resource_list_search` (`id`, `resource_list`, `field`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(326101, 322101, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326102, 322101, 'description', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326103, 322102, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326104, 322102, 'reference', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326105, 322102, 'email', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326106, 322103, 'name', 308111, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326107, 322103, 'name', 308109, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326108, 322104, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326109, 322105, 'name', 308113, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:46', '2019-10-07 07:36:46'),
	(326110, 322105, 'name', 308114, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326111, 322105, 'name', 308115, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326112, 322106, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326113, 322107, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326114, 322108, 'narration', 308133, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326115, 322109, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326116, 322110, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326117, 322110, 'name', 308134, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326118, 322110, 'name', 308135, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326119, 322111, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326120, 322111, 'name', 308134, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47'),
	(326121, 322111, 'name', 308135, NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:47', '2019-10-07 07:36:47');
/*!40000 ALTER TABLE `__resource_list_search` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_metrics
DROP TABLE IF EXISTS `__resource_metrics`;
CREATE TABLE IF NOT EXISTS `__resource_metrics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('value','trend') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'value',
  `resource_list` int(10) unsigned NOT NULL,
  `aggregate` enum('COUNT','SUM','AVG','MAX','MIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'COUNT',
  `aggregate_field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aggregate_distinct` enum('No','Yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `field` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_sub` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cache` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_metrics_resource_index` (`resource`),
  KEY `__resource_metrics_name_index` (`name`),
  KEY `__resource_metrics_resource_list_index` (`resource_list`),
  KEY `__resource_metrics_created_by_index` (`created_by`),
  KEY `__resource_metrics_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_metrics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=338101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_metrics: ~0 rows (approximately)
DELETE FROM `__resource_metrics`;
/*!40000 ALTER TABLE `__resource_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_metrics` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_relations
DROP TABLE IF EXISTS `__resource_relations`;
CREATE TABLE IF NOT EXISTS `__resource_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('hasOne','hasMany','belongsTo','belongsToMany','hasOneThrough','hasManyThrough') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hasMany',
  `relate_resource` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_relations_resource_index` (`resource`),
  KEY `__resource_relations_name_index` (`name`),
  KEY `__resource_relations_relate_resource_index` (`relate_resource`),
  KEY `__resource_relations_created_by_index` (`created_by`),
  KEY `__resource_relations_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_relate_resource_foreign` FOREIGN KEY (`relate_resource`) REFERENCES `__resources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=308136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_relations: ~117 rows (approximately)
DELETE FROM `__resource_relations`;
/*!40000 ALTER TABLE `__resource_relations` DISABLE KEYS */;
INSERT INTO `__resource_relations` (`id`, `resource`, `name`, `description`, `method`, `type`, `relate_resource`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(308101, 305111, 'Items', 'Each items of this pricelist', 'Items', 'hasMany', 305112, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308102, 305112, 'Pricelist', 'Details of pricelist this item belongs to', 'Pricelist', 'belongsTo', 305111, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308103, 305112, 'Product', 'Details of product this item consist of', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308104, 305116, 'Area', 'Details of area', 'Area', 'belongsTo', 305115, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308105, 305116, 'Customer', 'Details of customer', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308106, 305115, 'User', 'Details of user', 'User', 'belongsToMany', 305101, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(308107, 305105, 'Users', 'Users list corresponding to a settings', 'Users', 'hasMany', 305117, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308108, 305101, 'Area', 'Details of area', 'Area', 'belongsToMany', 305115, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308109, 305117, 'Settings', 'Details of settings this setting belongs to', 'Settings', 'belongsTo', 305105, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308110, 305101, 'Settings', 'Settings assigned for a user', 'Settings', 'hasMany', 305117, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308111, 305117, 'User', 'Details of user this settings belongs to', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308112, 305101, 'StoreAndArea', 'Store and Areas assigned for a user', 'StoreAndArea', 'hasMany', 305118, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308113, 305118, 'Area', 'Area details', 'Area', 'belongsTo', 305115, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308114, 305118, 'Store', 'Store Details', 'Store', 'belongsTo', 305114, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308115, 305118, 'User', 'User Details', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308116, 305114, 'Users', 'Users assigned to this store', 'Users', 'belongsToMany', 305101, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308117, 305115, 'StoreAndUser', 'Store and Users assigned to a area', 'StoreAndUser', 'hasMany', 305118, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308118, 305121, 'Details', 'Product wise details of transaction', 'Details', 'hasMany', 305122, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308119, 305119, 'Items', 'Items of a transaction', 'Items', 'hasMany', 305120, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308120, 305120, 'Product', 'Product details of an sales order item', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308121, 305124, 'IN', 'Stock in transactions', 'IN', 'belongsTo', 305121, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308122, 305124, 'OUT', 'Stock out transactions', 'OUT', 'belongsTo', 305121, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308123, 305119, 'Customer', 'The customer to which this sales order belongs', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308124, 305118, 'AssignedAreas', 'The user_areas which assigned to this record', 'AssignedAreas', 'hasMany', 305116, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308125, 305116, 'Users', 'The executives assigned to a area_user', 'Users', 'hasMany', 305118, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308126, 305118, 'Customers', 'Customers who are in selected records area', 'Customers', 'belongsToMany', 305101, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308127, 305101, 'AreaCustomers', 'List of customers belongs to the area which are assigned to a user', 'AreaCustomers', 'hasManyThrough', 305116, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308128, 305120, 'SalesOrder', 'Sales order details for a so item', 'SalesOrder', 'belongsTo', 305119, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308129, 305122, 'Transaction', 'Detail of transaction header', 'Transaction', 'belongsTo', 305121, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308130, 305121, 'StockOutTransactions', 'TransferOut transactions', 'STOut', 'hasOne', 305124, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308131, 305121, 'StockInTransactions', 'TransferIn transactions', 'STIn', 'hasOne', 305124, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308132, 305108, 'ProductImages', 'Images of a product', 'Images', 'hasOne', 305110, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308133, 305110, 'ProductDetails', 'Product Details', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-07 07:36:39', '2019-10-07 07:36:39'),
	(308134, 305127, 'ReserveUser', 'User details of reserve', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(308135, 305127, 'ReserveStore', 'Store details of reserve', 'Store', 'belongsTo', 305114, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40');
/*!40000 ALTER TABLE `__resource_relations` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_roles
DROP TABLE IF EXISTS `__resource_roles`;
CREATE TABLE IF NOT EXISTS `__resource_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `role` int(10) unsigned NOT NULL,
  `actions_availability` enum('All','Only','Except') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'All',
  `actions` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_roles_role_foreign` (`role`),
  KEY `__resource_roles_resource_index` (`resource`),
  KEY `__resource_roles_created_by_index` (`created_by`),
  KEY `__resource_roles_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_role_foreign` FOREIGN KEY (`role`) REFERENCES `__roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=306128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_roles: ~67 rows (approximately)
DELETE FROM `__resource_roles`;
/*!40000 ALTER TABLE `__resource_roles` DISABLE KEYS */;
INSERT INTO `__resource_roles` (`id`, `resource`, `role`, `actions_availability`, `actions`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(306101, 305101, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(306102, 305102, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(306103, 305103, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(306104, 305104, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(306105, 305105, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:37', '2019-10-07 07:36:37'),
	(306106, 305106, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306107, 305107, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306108, 305108, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306109, 305109, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306110, 305110, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306111, 305111, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306112, 305112, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306113, 305113, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306114, 305114, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306115, 305115, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306116, 305116, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306117, 305117, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306118, 305118, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306119, 305119, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306120, 305120, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306121, 305121, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306122, 305122, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306123, 305123, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306124, 305124, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306125, 305125, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306126, 305126, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38'),
	(306127, 305127, 303101, 'All', NULL, NULL, NULL, '2019-10-07 07:36:38', '2019-10-07 07:36:38');
/*!40000 ALTER TABLE `__resource_roles` ENABLE KEYS */;

-- Dumping structure for table appframe.__resource_scopes
DROP TABLE IF EXISTS `__resource_scopes`;
CREATE TABLE IF NOT EXISTS `__resource_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg1` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg2` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg3` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__resource_scopes_resource_index` (`resource`),
  KEY `__resource_scopes_name_index` (`name`),
  KEY `__resource_scopes_created_by_index` (`created_by`),
  KEY `__resource_scopes_updated_by_index` (`updated_by`),
  CONSTRAINT `__resource_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_scopes_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_scopes: ~11 rows (approximately)
DELETE FROM `__resource_scopes`;
/*!40000 ALTER TABLE `__resource_scopes` DISABLE KEYS */;
INSERT INTO `__resource_scopes` (`id`, `resource`, `name`, `description`, `method`, `arg1`, `arg2`, `arg3`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(307101, 305101, 'SalesExecutives', 'User where has group reference as SLS', 'salesExecutive', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307102, 305118, 'Assigned', 'The store and area whih is assigned to the requesting user', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307103, 305116, 'Assigned', 'The records where area is assigned to the requester', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307104, 305119, 'AssignedAreaCustomer', 'Sales orders of customers belongs to a area which assigned to a executive', 'assignedAreaCustomer', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307105, 305121, 'AssignedCustomerTransactions', 'Transactions related to customers who are assigned to the requesting executive', 'assignedCustomerTransactions', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307106, 305126, 'AssignedCustomerReceipts', 'Receipts related to customers who are assigned to the requesting executive', 'assignedCustomerReceipts', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307107, 305121, 'StockTransferPending', 'The transactions which are all pending stock transfer', 'sTPending', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307108, 305124, 'PendingStockTransfer', 'Stock transfers which are pending', 'pending', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40'),
	(307109, 305127, 'UncompletedReserves', 'Reserve entries which have progress not equal to Completed', 'unCompleted', NULL, NULL, NULL, NULL, NULL, '2019-10-07 07:36:40', '2019-10-07 07:36:40');
/*!40000 ALTER TABLE `__resource_scopes` ENABLE KEYS */;

-- Dumping structure for table appframe.__roles
DROP TABLE IF EXISTS `__roles`;
CREATE TABLE IF NOT EXISTS `__roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `__roles_name_index` (`name`),
  KEY `__roles_created_by_index` (`created_by`),
  KEY `__roles_updated_by_index` (`updated_by`),
  CONSTRAINT `__roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__roles: ~6 rows (approximately)
DELETE FROM `__roles`;
/*!40000 ALTER TABLE `__roles` DISABLE KEYS */;
INSERT INTO `__roles` (`id`, `name`, `description`, `title`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(303101, 'eplus_administrators', 'ePlus administrators role', 'ePlus Administrator', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(303102, 'eplus_accountant', 'ePlus accountant role', 'ePlus Accountant', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36'),
	(303103, 'eplus_salesExecutive', 'ePlus sales executive', 'ePlus Sales Executive', NULL, NULL, '2019-10-07 07:36:36', '2019-10-07 07:36:36');
/*!40000 ALTER TABLE `__roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
