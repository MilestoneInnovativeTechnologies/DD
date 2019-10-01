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

-- Dumping data for table appframe.areas: ~0 rows (approximately)
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

-- Dumping data for table appframe.area_users: ~0 rows (approximately)
DELETE FROM `area_users`;
/*!40000 ALTER TABLE `area_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_users` ENABLE KEYS */;

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

-- Dumping data for table appframe.d_data: ~0 rows (approximately)
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

-- Dumping data for table appframe.fiscalyearmaster: ~0 rows (approximately)
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

-- Dumping data for table appframe.fn_reserves: ~0 rows (approximately)
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

-- Dumping data for table appframe.functiondetails: ~0 rows (approximately)
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

-- Dumping data for table appframe.menu: ~0 rows (approximately)
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
	(1, 'PURCHASE', 'PURCHASE', 'PUR1,PUR2,PUR3,PUR4,PUR5', NULL, NULL, '2019-10-01 07:43:03', '2019-10-01 07:43:03'),
	(2, 'PURCHASE RETURN', 'PURCHASE RETURN', 'PR1,PR2,PR3', NULL, NULL, '2019-10-01 07:43:03', '2019-10-01 07:43:03'),
	(3, 'PURCHASE ORDER', 'PURCHASE ORDER', 'PO1', NULL, NULL, '2019-10-01 07:43:03', '2019-10-01 07:43:03'),
	(4, 'PAYMENT', 'PAYMENT', 'CP1,BP1,BP2', NULL, NULL, '2019-10-01 07:43:03', '2019-10-01 07:43:03'),
	(5, 'SALES', 'SALES', 'SL1,SL2,SL3,SL4,SL5', NULL, NULL, '2019-10-01 07:43:03', '2019-10-01 07:43:03'),
	(6, 'SALES RETURN', 'SALES RETURN', 'SR1,SR2,SR3', NULL, NULL, '2019-10-01 07:43:04', '2019-10-01 07:43:04'),
	(7, 'SALES ORDER', 'SALES ORDER', 'SO1,SO2', NULL, NULL, '2019-10-01 07:43:04', '2019-10-01 07:43:04'),
	(8, 'RECEIPT', 'RECEIPT', 'CR1,BR1,BR2', NULL, NULL, '2019-10-01 07:43:04', '2019-10-01 07:43:04'),
	(9, 'MATERIAL TRANSFER', 'MATERIAL TRANSFER', 'MT1,MT2', NULL, NULL, '2019-10-01 07:43:04', '2019-10-01 07:43:04'),
	(10, 'BRANCH TRANSFER', 'BRANCH TRANSFER', 'MT3,MT4', NULL, NULL, '2019-10-01 07:43:04', '2019-10-01 07:43:04');
/*!40000 ALTER TABLE `menu_types` ENABLE KEYS */;

-- Dumping structure for table appframe.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.migrations: ~74 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(762, '2014_10_12_000000_create_users_table', 1),
	(763, '2014_10_12_100000_create_password_resets_table', 1),
	(764, '2019_01_24_000002_create___groups_table', 1),
	(765, '2019_01_24_000003_create___group_users_table', 1),
	(766, '2019_01_24_000004_create___roles_table', 1),
	(767, '2019_01_24_000005_create___group_roles_table', 1),
	(768, '2019_01_24_000006_create___resources_table', 1),
	(769, '2019_01_24_000007_create___resource_roles_table', 1),
	(770, '2019_01_24_000008_create___resource_relations_table', 1),
	(771, '2019_01_24_000009_create___resource_scopes_table', 1),
	(772, '2019_01_24_000010_create___resource_forms_table', 1),
	(773, '2019_01_24_000011_create___resource_form_fields_table', 1),
	(774, '2019_01_24_000012_create___resource_form_field_attrs_table', 1),
	(775, '2019_01_24_000013_create___resource_form_field_data_table', 1),
	(776, '2019_01_24_000014_create___resource_form_field_validations_table', 1),
	(777, '2019_01_24_000015_create___resource_form_field_options_table', 1),
	(778, '2019_01_24_000016_create___resource_form_field_depends_table', 1),
	(779, '2019_01_24_000017_create___resource_form_field_dynamic_table', 1),
	(780, '2019_01_24_000018_create___resource_form_layout_table', 1),
	(781, '2019_01_24_000019_create___resource_form_collection_table', 1),
	(782, '2019_01_24_000020_create___resource_form_upload_table', 1),
	(783, '2019_01_24_000021_create___resource_form_defaults_table', 1),
	(784, '2019_01_24_000022_create___resource_lists_table', 1),
	(785, '2019_01_24_000023_create___resource_list_relations_table', 1),
	(786, '2019_01_24_000024_create___resource_list_scopes_table', 1),
	(787, '2019_01_24_000025_create___resource_list_layout_table', 1),
	(788, '2019_01_24_000026_create___resource_list_search_table', 1),
	(789, '2019_01_24_000027_create___resource_data_table', 1),
	(790, '2019_01_24_000028_create___resource_data_relations_table', 1),
	(791, '2019_01_24_000029_create___resource_data_scopes_table', 1),
	(792, '2019_01_24_000030_create___resource_data_view_sections_table', 1),
	(793, '2019_01_24_000031_create___resource_data_view_section_items_table', 1),
	(794, '2019_01_24_000032_create___resource_form_data_map_table', 1),
	(795, '2019_01_24_000033_create___resource_actions_table', 1),
	(796, '2019_01_24_000034_create___resource_action_attrs_table', 1),
	(797, '2019_01_24_000035_create___resource_action_methods_table', 1),
	(798, '2019_01_24_000036_create___resource_action_lists_table', 1),
	(799, '2019_01_24_000037_create___resource_action_data_table', 1),
	(800, '2019_01_24_000038_create___resource_defaults_table', 1),
	(801, '2019_01_24_000039_create___resource_metrics_table', 1),
	(802, '2019_01_24_000040_create___resource_dashboard_table', 1),
	(803, '2019_01_24_000041_create___resource_dashboard_sections_table', 1),
	(804, '2019_01_24_000042_create___resource_dashboard_section_items_table', 1),
	(805, '2019_01_24_000043_create___organisation_table', 1),
	(806, '2019_01_24_000044_create___organisation_contacts_table', 1),
	(807, '2019_03_01_000001_add_ss_fields_in_users_table', 1),
	(808, '2019_03_01_000002_add_ss_fields_in_groups_table', 1),
	(809, '2019_03_01_000003_add_ss_fields_in_roles_table', 1),
	(810, '2019_03_28_000046_create_setup_table', 1),
	(811, '2019_03_28_000047_create_menu_types_table', 1),
	(812, '2019_03_28_000048_create_menu_table', 1),
	(813, '2019_03_28_000049_create_settings_table', 1),
	(814, '2019_03_28_000050_create_fiscalyearmaster_table', 1),
	(815, '2019_03_28_000051_create_product_group_master_table', 1),
	(816, '2019_03_28_000052_create_products_table', 1),
	(817, '2019_03_28_000053_create_product_groups_table', 1),
	(818, '2019_03_28_000054_create_product_images_table', 1),
	(819, '2019_03_28_000055_create_pricelist_table', 1),
	(820, '2019_03_28_000056_create_pricelist_products_table', 1),
	(821, '2019_03_28_000057_create_functiondetails_table', 1),
	(822, '2019_03_28_000058_create_stores_table', 1),
	(823, '2019_03_28_000059_create_areas_table', 1),
	(824, '2019_03_28_000060_create_area_users_table', 1),
	(825, '2019_03_28_000061_create_user_settings_table', 1),
	(826, '2019_03_28_000062_create_user_store_area_table', 1),
	(827, '2019_03_28_000063_create_sales_order_table', 1),
	(828, '2019_03_28_000064_create_sales_order_items_table', 1),
	(829, '2019_03_28_000065_create_transactions_table', 1),
	(830, '2019_03_28_000066_create_transaction_details_table', 1),
	(831, '2019_03_28_000067_create_d_data_table', 1),
	(832, '2019_03_28_000068_create_stock_transfer_table', 1),
	(833, '2019_03_28_000069_create_receipts_table', 1),
	(834, '2019_03_28_000070_create_fn_reserves_table', 1),
	(835, '2019_03_28_000071_create_w_bin_table', 1);
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

-- Dumping data for table appframe.pricelist: ~0 rows (approximately)
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

-- Dumping data for table appframe.pricelist_products: ~0 rows (approximately)
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

-- Dumping data for table appframe.products: ~0 rows (approximately)
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

-- Dumping data for table appframe.product_groups: ~0 rows (approximately)
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

-- Dumping data for table appframe.product_group_master: ~0 rows (approximately)
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

-- Dumping data for table appframe.receipts: ~0 rows (approximately)
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
  KEY `sales_order_fycode_index` (`fycode`),
  KEY `sales_order_fncode_index` (`fncode`),
  KEY `sales_order__ref_index` (`_ref`),
  KEY `sales_order_created_by_index` (`created_by`),
  KEY `sales_order_updated_by_index` (`updated_by`),
  CONSTRAINT `sales_order_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order: ~0 rows (approximately)
DELETE FROM `sales_order`;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;

-- Dumping structure for table appframe.sales_order_items
DROP TABLE IF EXISTS `sales_order_items`;
CREATE TABLE IF NOT EXISTS `sales_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `so` bigint(20) unsigned DEFAULT NULL,
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
  KEY `sales_order_items_product_index` (`product`),
  KEY `sales_order_items__ref_index` (`_ref`),
  KEY `sales_order_items_created_by_index` (`created_by`),
  KEY `sales_order_items_updated_by_index` (`updated_by`),
  CONSTRAINT `sales_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order_items: ~0 rows (approximately)
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

-- Dumping data for table appframe.setup: ~0 rows (approximately)
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

-- Dumping data for table appframe.stock_transfer: ~0 rows (approximately)
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

-- Dumping data for table appframe.stores: ~0 rows (approximately)
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

-- Dumping data for table appframe.transactions: ~0 rows (approximately)
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

-- Dumping data for table appframe.transaction_details: ~0 rows (approximately)
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

-- Dumping data for table appframe.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `login`, `login_password`, `api_token`, `reference`, `phone`, `address`, `outstanding`, `overdue`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(300101, 'Milestone Setup', 'setup@milestoneit.net', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 0.0000000000, NULL, '$2y$10$gKd38iJdi/XlE0pZWWWpduTpcobX6GDv6WBg5OZRzwnQydVd2IzCC', NULL, '2019-10-01 07:42:41', '2019-10-01 07:42:41'),
	(300102, 'Milestone Administrator', 'admin@milestoneit.net', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000000000, 0.0000000000, NULL, '$2y$10$OFZlSIu/mX6/DbA1dWwewe4Vt/Os3QwWdHfoLyp5w3FvLIFLccnbq', NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42');
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

-- Dumping data for table appframe.user_store_area: ~0 rows (approximately)
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

-- Dumping data for table appframe.w_bin: ~0 rows (approximately)
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
	(1, 'setup_user', 'Users created initially to setup Module', 'Setup Users', NULL, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(2, 'developers', 'Users in this group are responsible to build this module', 'Developers', NULL, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(3, 'administrators', 'Administrators are responsible for managing users, groups, roles and their resources', 'Administrators', NULL, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(301101, 'accountant', 'ePlus Accountant', 'Accountant', 'ACC', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(301102, 'administrators', 'ePlus Administrator', 'Administators', 'ADM', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(301103, 'salesExecutive', 'ePlus Sales Executives', 'Sales Executives', 'SLS', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(301104, 'eplus_account', 'ePlus user accounts or customers', 'ePlus Accounts', NULL, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42');
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
	(1, 1, 1, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(2, 2, 2, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(3, 3, 3, NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(304101, 301101, 303102, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(304102, 301102, 303101, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(304103, 301103, 303103, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42');
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

-- Dumping data for table appframe.__group_users: ~2 rows (approximately)
DELETE FROM `__group_users`;
/*!40000 ALTER TABLE `__group_users` DISABLE KEYS */;
INSERT INTO `__group_users` (`id`, `group`, `user`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(302101, 1, 300101, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(302102, 3, 300102, NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42');
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
	(1, 'User', 'All the users of this app', 'Users', 'Milestone\\Appframe\\Model', 'users', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(2, 'Group', 'Groups for users. Every user belongs to any or multiple groups', 'Groups', 'Milestone\\Appframe\\Model', '__groups', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(3, 'Role', 'Roles defines which resources should a group have access', 'Roles', 'Milestone\\Appframe\\Model', '__roles', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(4, 'Resource', 'Each part of this module', 'Resource', 'Milestone\\Appframe\\Model', '__resources', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(5, 'ResourceRole', 'The resources assigned to a role', 'Role Resources', 'Milestone\\Appframe\\Model', '__resource_roles', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(6, 'ResourceRelation', 'Relation details of a resource', 'Resource Relations', 'Milestone\\Appframe\\Model', '__resource_relations', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(7, 'ResourceScope', 'Scopes available on a resource', 'Resource Scopes', 'Milestone\\Appframe\\Model', '__resource_scopes', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(8, 'ResourceForm', 'Forms associated with a resource', 'Forms', 'Milestone\\Appframe\\Model', '__resource_forms', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(9, 'ResourceFormField', 'Field details for a form', 'Form Fields', 'Milestone\\Appframe\\Model', '__resource_form_fields', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(10, 'ResourceFormFieldData', 'Database bindings of a form field', 'Field Data', 'Milestone\\Appframe\\Model', '__resource_form_field_data', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(11, 'ResourceFormFieldAttr', 'Additional attributes of a field', 'Field Attributes', 'Milestone\\Appframe\\Model', '__resource_form_field_attrs', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(12, 'ResourceFormFieldOption', 'Options for form fields', 'Field Options', 'Milestone\\Appframe\\Model', '__resource_form_field_options', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(13, 'ResourceFormFieldValidation', 'Validation details of the field', 'Field Validation', 'Milestone\\Appframe\\Model', '__resource_form_field_validations', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(14, 'ResourceFormFieldDepend', 'Dependent fields in a form', 'Dependent Fields', 'Milestone\\Appframe\\Model', '__resource_form_field_depends', 'ResourceFormFieldDependController', 'Milestone\\Appframe\\Controllers', 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(15, 'ResourceFormFieldDynamic', 'Dynamic field details', 'Dynamic Field', 'Milestone\\Appframe\\Model', '__resource_form_field_dynamic', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(16, 'ResourceFormLayout', 'Form field layout details', 'Form Layout', 'Milestone\\Appframe\\Model', '__resource_form_layout', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(17, 'ResourceFormCollection', 'Collection/Detail Form', 'Collection Form', 'Milestone\\Appframe\\Model', '__resource_form_collection', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(18, 'ResourceFormUpload', 'Upload file details', 'Form Upload', 'Milestone\\Appframe\\Model', '__resource_form_upload', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(19, 'ResourceFormDefault', 'Predefined field values for a form', 'Form Defaults', 'Milestone\\Appframe\\Model', '__resource_form_defaults', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(20, 'ResourceList', 'List of data', 'Lists', 'Milestone\\Appframe\\Model', '__resource_lists', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(21, 'ResourceListRelation', 'Relations to be loaded on accessing list', 'List Relations', 'Milestone\\Appframe\\Model', '__resource_list_relations', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(22, 'ResourceListScope', 'Scope to be applied on list', 'List Scopes', 'Milestone\\Appframe\\Model', '__resource_list_scopes', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(23, 'ResourceListLayout', 'Layout of a list', 'List Layout', 'Milestone\\Appframe\\Model', '__resource_list_layout', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(24, 'ResourceListSearch', 'Searchable fields in a list', 'List Search', 'Milestone\\Appframe\\Model', '__resource_list_search', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(25, 'ResourceData', 'A particular record from database', 'Data', 'Milestone\\Appframe\\Model', '__resource_data', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(26, 'ResourceDataRelation', 'The relations to be loaded from resource data', 'Data Relations', 'Milestone\\Appframe\\Model', '__resource_data_relations', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(27, 'ResourceDataScope', 'Scope to be applied on a detail', 'Data Scopes', 'Milestone\\Appframe\\Model', '__resource_data_relations', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(28, 'ResourceDataViewSection', 'Sections of a data view', 'Data View Section', 'Milestone\\Appframe\\Model', '__resource_data_view_sections', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(29, 'ResourceDataViewSectionItem', 'Items of a data view section', 'Data View Section Items', 'Milestone\\Appframe\\Model', '__resource_data_view_section_items', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(30, 'ResourceAction', 'Actions applicable for the resource', 'Actions', 'Milestone\\Appframe\\Model', '__resource_actions', 'ResourceActionController', 'Milestone\\Appframe\\Controllers', 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(31, 'ResourceActionMethod', 'The methods to be handled for resource action', 'Resource Action Methods', 'Milestone\\Appframe\\Model', '__resource_action_methods', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(32, 'ResourceActionAttr', 'Resource action icon attrs', 'Resource Action Attrs', 'Milestone\\Appframe\\Model', '__resource_action_attrs', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(33, 'ResourceActionList', 'The lists where an action should belongs', 'Resource Action Lists', 'Milestone\\Appframe\\Model', '__resource_action_lists', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(34, 'ResourceActionData', 'The resource show, where an action should belongs', 'Resource Action Data', 'Milestone\\Appframe\\Model', '__resource_action_data', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(35, 'ResourceDefault', 'Resources default Form, List and Data', 'Resource Default', 'Milestone\\Appframe\\Model', '__resource_defaults', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(36, 'ResourceMetric', 'Metrics defined for a resource', 'Resource Metrics', 'Milestone\\Appframe\\Model', '__resource_metrics', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(37, 'ResourceDashboard', 'Dashboard details for a Resource', 'Resource Dashboard', 'Milestone\\Appframe\\Model', '__resource_dashboard', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:47', '2019-10-01 07:41:47'),
	(38, 'ResourceDashboardSection', 'Sections of a Dashboard', 'Dashboard Section', 'Milestone\\Appframe\\Model', '__resource_dashboard_sections', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(39, 'ResourceDashboardSectionItem', 'Items of a Dashboard Section', 'Dashboard Section Items', 'Milestone\\Appframe\\Model', '__resource_dashboard_section_items', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(40, 'Organisation', 'Details of the organisation', 'Organisation', 'Milestone\\Appframe\\Model', '__organisation', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(41, 'OrganisationContact', 'Contact details of organisation', 'Contacts', 'Milestone\\Appframe\\Model', '__organisation_contacts', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(305101, 'User', 'Users of Smart Sale', 'Users', 'Milestone\\SS\\Model', 'users', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305102, 'Setup', 'ePlus setup details', 'Setup', 'Milestone\\SS\\Model', 'setup', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305103, 'MenuType', 'Menu group to display name mapper', 'Menu Group', 'Milestone\\SS\\Model', 'menu_types', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305104, 'Menu', 'Menu details', 'Menu', 'Milestone\\SS\\Model', 'menu_types', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305105, 'Setting', 'Settings available in web and mob interface', 'Settings', 'Milestone\\SS\\Model', 'settings', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305106, 'Fiscalyearmaster', 'Financial Years', 'Fiscal Year', 'Milestone\\SS\\Model', 'fiscalyearmaster', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305107, 'ProductGroupMaster', 'Groups like Category, Brand etc', 'Product Group Masters', 'Milestone\\SS\\Model', 'product_group_master', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305108, 'Product', 'Products or Items', 'Products', 'Milestone\\SS\\Model', 'products', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305109, 'ProductGroup', 'Products and the groups they belongs to', 'Product Groups', 'Milestone\\SS\\Model', 'product_groups', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305110, 'ProductImage', 'Images for  a product', 'Product Images', 'Milestone\\SS\\Model', 'product_images', 'ProductImageController', 'Milestone\\SS\\Controller', 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305111, 'Pricelist', 'Price list header', 'Price List', 'Milestone\\SS\\Model', 'pricelist', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305112, 'PricelistProduct', 'Price list products', 'Price List Products', 'Milestone\\SS\\Model', 'pricelist_products', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(305113, 'Functiondetail', 'ePlus functions', 'ePlus Functions', 'Milestone\\SS\\Model', 'functiondetails', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305114, 'Store', 'Stores', 'Stores', 'Milestone\\SS\\Model', 'stores', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305115, 'Area', 'Areas', 'Areas', 'Milestone\\SS\\Model', 'areas', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305116, 'AreaUser', 'Users in an area', 'Area User', 'Milestone\\SS\\Model', 'area_users', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305117, 'UserSetting', 'Web and Mob settings for each user', 'User Settings', 'Milestone\\SS\\Model', 'user_settings', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305118, 'UserStoreArea', 'Stores and Areas assigned to a user (executive)', 'User Store and Area', 'Milestone\\SS\\Model', 'user_store_area', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305119, 'SalesOrder', 'Sales orders', 'Sales Orders', 'Milestone\\SS\\Model', 'sales_order', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305120, 'SalesOrderItem', 'Sales order items', 'Sales Order Items', 'Milestone\\SS\\Model', 'sales_order_items', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305121, 'Transaction', 'Transaction header - customer, date, document number', 'Transactions', 'Milestone\\SS\\Model', 'transactions', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305122, 'TransactionDetail', 'Products in a transaction, its price tax etc', 'Transaction Details', 'Milestone\\SS\\Model', 'transaction_details', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305123, 'DData', 'ePlus Ddata for detailed transaction bills', 'ePlus DData', 'Milestone\\SS\\Model', 'd_data', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305124, 'StockTransfer', 'Stock transfer from and to a store', 'Stock Transfers', 'Milestone\\SS\\Model', 'stock_transfer', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305125, 'WBin', 'Waste bin used while ePlus direct import', 'Waste Bin', 'Milestone\\SS\\Model', 'w_bin', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305126, 'Receipt', 'Receipts', 'Receipts', 'Milestone\\SS\\Model', 'receipts', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(305127, 'FnReserve', 'Function Reserves', 'Function Reserves', 'Milestone\\SS\\Model', 'fn_reserves', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43');
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
	(1, 1, 'NewAdministratorFormAction', 'Action to call a form to create a new administrator', 'New Administrator', 'outline-info', 'Create Administrator', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(2, 1, 'NewDeveloperFormAction', 'Action to call a form to create a new developer', 'New Developer', 'outline-info', 'Create Developer', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(3, 1, 'NewUserFormAction', 'Action to call a form to create a new user', 'New User', 'outline-info', 'Create User', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(4, 1, 'UsersListForSerupUserAction', 'Action to list all users available for setup user', 'Users', 'outline-info', 'All Users', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(5, 1, 'UsersListAction', 'Action to list all users', 'Users', 'outline-info', 'All Users', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(6, 1, 'EditUserAction', 'Action to update a user', 'Edit User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(7, 1, 'ChangeUserPasswordAction', 'Action to call a form to change user password', 'Change Password', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(8, 4, 'NewResourceFormAction', 'Action to call a form to create a new resource', 'New Resource', 'outline-info', 'Create Resource', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(9, 4, 'ResourcesListAction', 'Action to list all resources', 'Resources', 'outline-info', 'Resources', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(10, 30, 'NewActionAction', 'Action to call a for to create new action', 'Create Action', 'outline-info', 'New Action', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(11, 30, 'AddActionAction', 'List action to call a form which adds a new action to a selected resource', 'Add Action', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(12, 30, 'ActionsListAction', 'Action to list all actions', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(13, 8, 'NewFormAction', 'Action to create a new form', 'New Form', 'outline-info', 'New Form', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(14, 8, 'FormsListAction', 'Action to list all forms', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(15, 4, 'AddNewFormAction', 'Add a form to a resource', 'Add Form', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(16, 20, 'CreateListFormAction', 'Action to call a form to create a list', 'Create List', 'outline-info', 'New List', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(17, 20, 'ListsListAction', 'Action to list all lists', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(18, 20, 'AddListFormAction', 'List action to call a form which adds a new list to the selected resource', 'Add List', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(19, 25, 'CreateDataFormAction', 'Action to call a from to create a data', 'Create Data', 'outline-info', 'New Data', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(20, 25, 'DataListAction', 'Action to list all data', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(21, 25, 'AddDataFormAction', 'List action to call a form which adds a new data to the selected resource', 'Add Data', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(22, 4, 'ListResourceFormsAction', 'List all forms of a selected resource', 'View Forms', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(23, 4, 'ListResourceListsAction', 'List all lists of a selected resource', 'View Lists', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(24, 4, 'ListResourceDataAction', 'List all data of a selected resource', 'View Data', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(25, 4, 'ListResourceActionsAction', 'List all actions of a selected resource', 'View Actions', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(26, 8, 'ListFormFieldsAction', 'Action to list all fields of a selected form', 'View Fields', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(27, 8, 'ListFormLayoutsAction', 'Action to list all layouts of a selected form', 'View Layout', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(28, 8, 'ListFormCollectionsAction', 'Action to list all collections of a selected form', 'View Collections', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(29, 20, 'ListListRelationAction', 'Action to list all relations of a selected list', 'View Relations', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(30, 20, 'ListListScopesAction', 'Action to list all scopes of a selected list', 'View Scopes', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(31, 20, 'ListListLayoutAction', 'Action to list layout details of a selected list', 'View Layout Fields', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(32, 20, 'ListListSearchAction', 'Action to list all search field of a selected list', 'View Search Fields', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(33, 25, 'ListDataRelationsAction', 'Action to list all relations of a selected data', 'View Relations', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(34, 25, 'ListDataScopesAction', 'Action to list all scopes of a selected data', 'View Scopes', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(35, 25, 'ListDataSectionsAction', 'Action to list all sections of a selected data', 'View Sections', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(36, 25, 'ListDataActionsAction', 'Action to list all actions of a selected data', 'View Actions', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(37, 30, 'ListActionAttrsAction', 'Action to list all attributes of a selected action', 'View Attributes', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(38, 30, 'ListActionListsAction', 'Action to list all list of a selected action', 'View Lists', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(39, 30, 'ListActionDataAction', 'Action to list all data of a selected action', 'View Data', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(40, 9, 'ListFieldAttrs', 'Action to list all attrs of a selected field', 'View Attributes', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(41, 9, 'ListFieldOptions', 'Action to list all options of a selected field', 'View Options', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(42, 9, 'ListFieldValidations', 'Action to list all validations of a selected field', 'View Validations', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(43, 9, 'ListFieldDepends', 'Action to list all depends of a selected field', 'View Depends', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(44, 9, 'ListFieldDynamics', 'Action to list all dynamics of a selected field', 'View Dynamics', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(45, 20, 'AddListActionsAction', 'Action to manage Actions assigned to a list', 'Manage Actions', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(46, 2, 'CreateGroupAction', 'Action to create a new group', 'New Group', 'outline-info', 'New Group', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(47, 2, 'ListGroupsAction', 'Action to lists all groups', 'Groups', 'outline-info', 'Groups', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:12', '2019-10-01 07:42:12'),
	(48, 3, 'CreateRoleAction', 'Action to create a new role', 'New Role', 'outline-info', 'New Role', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(49, 3, 'ListRolesAction', 'Action to list all roles', 'Roles', 'outline-info', 'Roles', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(50, 2, 'ManageRolesAction', 'Action to manage roles for a group', 'Add/Remove Roles', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(51, 3, 'ManageGroupAction', 'Action to manage groups of a role', 'Add/Remove Groups', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(52, 3, 'AddRoleResource', 'Action to add a resource', 'Add Resource', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(53, 3, 'ListRoleResources', 'Action to list all resources of a role', 'List Resources', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(332101, 305105, 'NewSettings', 'Create new setting', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332102, 305105, 'ListSettings', 'List all settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332103, 305105, 'ViewSettingsDetails', 'Data view of a settings', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332104, 305105, 'UpdateSettings', 'Edit settings details', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332105, 305101, 'UsersList', 'List all available users', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332106, 305101, 'UserSettingsListAction', 'List all settings of a user', 'View Settings', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332107, 305101, 'ListSalesExecutiveAction', 'Action to list all sales executive', NULL, 'outline-info', 'Sales Executives', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332108, 305117, 'AddNewUserSettingAction', 'Action to call form to add user setting', NULL, 'outline-info', 'New User Setting', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332109, 305101, 'AddSettingsForSelectedUser', 'Action to call a form to add a setting for the selected user', 'Add Setting', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332110, 305105, 'SettingsUsersListAction', 'List all users having this setting', 'View Users', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332111, 305105, 'AddUserForSelectedSetting', 'Action to call a form to add a user for the selected setting', 'Add User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332112, 305117, 'ListAllUserSettingsAction', 'Action to list all user settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332113, 305117, 'ChangeUserSettingStatusAction', 'Action to call the form to change user setting status', 'Change Status', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332114, 305117, 'ViewUserSettingsDetails', 'Action to call resource data of user settings', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332115, 305118, 'AddUserStoreAreaRecordAction', 'Action to call form to add user store area', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332116, 305118, 'ListUserStoreAreaRecordAction', 'Action to list all user store area', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332117, 305118, 'ViewUserStoreAreaAction', 'Action to view user store and area', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332118, 305118, 'EditUserStoreAreaAction', 'Action to call a form to update user store area', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332119, 305115, 'ListAreaAction', 'Action to list all areas', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332120, 305114, 'ListStoreAction', 'Action to list all stores', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332121, 305101, 'ListStoreAreaOfUserAction', 'Action to list all store and area of the selected user', 'View Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332122, 305101, 'AddStoreAreaForUser', 'Action to call the form to add store area for a user', 'Add Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332123, 305115, 'ListStoreAndUserOfArea', 'Action to list all Store and User assigned to selected area', 'View Store and User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332124, 305115, 'AssignStoreAndUserForArea', 'Action to call the form to assign store and user for an area', 'Assign Store and Executive', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332125, 305114, 'ListUsersAssigned', 'Action to list all users assigned to a store', 'Manage Executives Assigned', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332126, 305110, 'AddProductImages', 'Action to add images to a product', NULL, 'primary', 'Add New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55'),
	(332127, 305110, 'EditProductImages', 'Action to edit images to a product', 'Edit Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332128, 305110, 'ListProductImages', 'List all entries of product images', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332129, 305110, 'ViewProductImage', 'View details of a product image entry', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332130, 305127, 'ListReserves', 'List all reserve entries', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332131, 305127, 'AddReserveEntry', 'Add new reserve details', NULL, 'outline-info', 'Add New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332132, 305127, 'ViewFnReserve', 'View details of reserve', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332133, 305127, 'UpdateReserveAction', 'Update reserve details', 'Update', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(332134, 305127, 'ListUncompletedReserves', 'List all uncompleted reserves', NULL, 'outline-info', 'Uncompleted', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56');
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
	(336101, 332104, 327101, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(336102, 332113, 327102, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(336103, 332118, 327103, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(336104, 332133, 327105, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(336105, 332133, 327105, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58');
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
	(1, 6, 1, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(2, 7, 1, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(3, 6, 2, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(4, 7, 2, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(5, 11, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(6, 15, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(7, 18, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(8, 21, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(9, 22, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(10, 23, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(11, 24, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(12, 25, 3, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(13, 26, 5, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(14, 27, 5, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(15, 28, 5, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(16, 29, 6, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(17, 30, 6, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(18, 31, 6, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(19, 32, 6, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(20, 33, 7, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(21, 34, 7, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(22, 35, 7, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(23, 36, 7, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(24, 37, 4, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(25, 38, 4, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(26, 39, 4, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(27, 40, 8, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(28, 41, 8, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(29, 42, 8, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(30, 43, 8, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(31, 44, 8, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(32, 45, 6, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(33, 50, 24, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(34, 51, 25, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(35, 52, 25, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(36, 53, 25, NULL, NULL, '2019-10-01 07:42:16', '2019-10-01 07:42:16'),
	(335101, 332103, 322101, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335102, 332104, 322101, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335103, 332106, 322104, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335104, 332109, 322104, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335105, 332110, 322101, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335106, 332111, 322101, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(335107, 332114, 322103, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335108, 332113, 322103, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335109, 332117, 322105, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335110, 332118, 322105, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335111, 332121, 322104, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335112, 332122, 322104, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335113, 332123, 322106, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335114, 332124, 322106, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335115, 332125, 322107, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335116, 332127, 322108, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335117, 332129, 322108, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335118, 332132, 322110, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335119, 332133, 322110, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335120, 332132, 322111, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(335121, 332133, 322111, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58');
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
	(1, 1, 'Form', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(2, 2, 'Form', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(3, 3, 'Form', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(4, 4, 'List', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(5, 5, 'List', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(6, 6, 'FormWithData', NULL, '4', '1', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(7, 7, 'FormWithData', NULL, '5', '1', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(8, 8, 'Form', NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(9, 9, 'List', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(10, 10, 'Form', NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(11, 11, 'AddRelation', NULL, '7', '8', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(12, 12, 'List', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(13, 13, 'Form', NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(14, 14, 'List', NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(15, 15, 'AddRelation', NULL, '14', '10', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(16, 16, 'Form', NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(17, 17, 'List', NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(18, 18, 'AddRelation', NULL, '54', '13', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(19, 19, 'Form', NULL, '14', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:13', '2019-10-01 07:42:13'),
	(20, 20, 'List', NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(21, 21, 'AddRelation', NULL, '55', '15', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(22, 22, 'ListRelation', NULL, '14', '5', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(23, 23, 'ListRelation', NULL, '54', '6', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(24, 24, 'ListRelation', NULL, '55', '7', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(25, 25, 'ListRelation', NULL, '7', '4', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(26, 26, 'ListRelation', NULL, '15', '8', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(27, 27, 'ListRelation', NULL, '56', '9', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(28, 28, 'ListRelation', NULL, '38', '10', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(29, 29, 'ListRelation', NULL, '26', '11', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(30, 30, 'ListRelation', NULL, '28', '12', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(31, 31, 'ListRelation', NULL, '31', '13', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(32, 32, 'ListRelation', NULL, '43', '14', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(33, 33, 'ListRelation', NULL, '29', '15', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(34, 34, 'ListRelation', NULL, '50', '16', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(35, 35, 'ListRelation', NULL, '34', '17', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(36, 36, 'ListRelation', NULL, '52', '4', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(37, 37, 'ListRelation', NULL, '76', '18', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(38, 38, 'ListRelation', NULL, '9', '6', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(39, 39, 'ListRelation', NULL, '10', '7', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(40, 40, 'ListRelation', NULL, '16', '19', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(41, 41, 'ListRelation', NULL, '17', '20', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(42, 42, 'ListRelation', NULL, '18', '21', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(43, 43, 'ListRelation', NULL, '44', '22', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(44, 44, 'ListRelation', NULL, '49', '23', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(45, 45, 'ManageRelation', NULL, '51', '4', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(46, 46, 'Form', NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(47, 47, 'List', NULL, '24', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(48, 48, 'Form', NULL, '17', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:14', '2019-10-01 07:42:14'),
	(49, 49, 'List', NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(50, 50, 'ManageRelation', NULL, '3', '25', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(51, 51, 'ManageRelation', NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(52, 52, 'AddRelation', NULL, '5', '18', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(53, 53, 'ListRelation', NULL, '5', '26', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:15', '2019-10-01 07:42:15'),
	(333101, 332101, 'Form', NULL, '309101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333102, 332102, 'List', NULL, '322101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333103, 332103, 'Data', NULL, '327101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333104, 332104, 'FormWithData', NULL, '309101', '327101', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333105, 332105, 'List', NULL, '322102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333106, 332106, 'ListRelation', NULL, '308110', '322103', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333107, 332107, 'List', NULL, '322104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333108, 332108, 'Form', NULL, '309102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333109, 332109, 'AddRelation', NULL, '308110', '309102', '310105', NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333110, 332110, 'ListRelation', NULL, '308107', '322103', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333111, 332111, 'AddRelation', NULL, '308107', '309102', '310106', NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333112, 332112, 'List', NULL, '322103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333113, 332113, 'FormWithData', NULL, '309103', '327102', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333114, 332114, 'Data', NULL, '327102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333115, 332115, 'Form', NULL, '309104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333116, 332116, 'List', NULL, '322105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333117, 332117, 'Data', NULL, '327103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:56', '2019-10-01 07:42:56'),
	(333118, 332118, 'FormWithData', NULL, '309104', '327103', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333119, 332119, 'List', NULL, '322106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333120, 332120, 'List', NULL, '322107', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333121, 332121, 'ListRelation', NULL, '308112', '322105', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333122, 332122, 'AddRelation', NULL, '308112', '309104', '310109', NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333123, 332123, 'ListRelation', NULL, '308117', '322105', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333124, 332124, 'AddRelation', NULL, '308117', '309104', '310111', NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333125, 332125, 'ManageRelation', NULL, '308116', '322104', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333126, 332126, 'Form', NULL, '309105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333127, 332127, 'FormWithData', NULL, '309105', '327104', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333128, 332128, 'List', NULL, '322108', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333129, 332129, 'Data', NULL, '327105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333130, 332130, 'List', NULL, '322110', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333131, 332131, 'Form', NULL, '309106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333132, 332132, 'Data', NULL, '327105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333133, 332133, 'FormWithData', NULL, '309107', '327105', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57'),
	(333134, 332134, 'List', NULL, '322111', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:57', '2019-10-01 07:42:57');
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
	(1, 1, 'UserDetailsData', 'View details of a user', 'name', NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(327101, 305105, 'SettingsView', 'View details of a settings', 'name', NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(327102, 305117, 'UserSettingsView', 'View details of a user setting', 'user.name', NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(327103, 305118, 'UserStoreAreaView', 'View details of user store area', 'user.name', NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(327104, 305110, 'ProductImageView', 'View images of a product', 'product.name', NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(327105, 305127, 'ReserveView', 'View reserve details', 'code', NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53');
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
	(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:11', '2019-10-01 07:42:11'),
	(329101, 327102, 308111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329102, 327102, 308109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329103, 327103, 308113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329104, 327103, 308114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329105, 327103, 308115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329106, 327104, 308133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329107, 327105, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(329108, 327105, 308135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53');
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
	(330101, 327101, 'Basic', NULL, NULL, 4, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(330102, 327101, 'Detail', NULL, NULL, 12, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(330103, 327102, 'User Settings Details', NULL, NULL, 12, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(330104, 327103, 'Details', NULL, NULL, 12, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(330105, 327104, NULL, 'product.name', NULL, 12, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(330106, 327105, NULL, NULL, NULL, 9, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(330107, 327105, 'Progress', NULL, NULL, 3, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54');
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
	(331101, 330101, 'Name', 'name', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331102, 330101, 'Default Value', 'value', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331103, 330101, 'Status', 'status', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331104, 330102, 'Details', 'description', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331105, 330103, 'User', 'name', 308111, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331106, 330103, 'Setings', 'name', 308109, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331107, 330103, 'Value', 'value', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331108, 330103, 'Status', 'status', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331109, 330104, 'Executive', 'name', 308115, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331110, 330104, 'Store', 'name', 308114, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331111, 330104, 'Area', 'name', 308113, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331112, 330104, 'Status', 'status', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331113, 330105, 'Image 01', 'image01', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331114, 330105, 'Image 02', 'image02', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331115, 330105, 'Image 03', 'image03', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331116, 330105, 'Image 04', 'image04', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331117, 330105, 'Image 05', 'image05', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331118, 330106, 'Code', 'code', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331119, 330106, 'User', 'name', 308134, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331120, 330106, 'Store', 'name', 308135, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331121, 330106, 'Start', 'start_num', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331122, 330106, 'End', 'end_num', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331123, 330107, 'Quantity', 'quantity', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331124, 330107, 'Current', 'current', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331125, 330107, 'Progress', 'progress', NULL, NULL, NULL, '2019-10-01 07:42:54', '2019-10-01 07:42:54'),
	(331126, 330107, 'Status', 'status', NULL, NULL, NULL, '2019-10-01 07:42:55', '2019-10-01 07:42:55');
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
	(337101, 305105, 332102, 332101, 332103, 332104, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(337102, 305117, 332112, 332108, 332114, 332113, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58'),
	(337103, 305118, 332116, 332115, 332117, 332118, NULL, NULL, '2019-10-01 07:42:58', '2019-10-01 07:42:58');
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
	(1, 1, 'NewAdministratorForm', 'Form to create a new administrator', 'New Administrator', 'Create Administrator', NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(2, 1, 'NewDeveloperForm', 'Form to create a new developer', 'New Developer', 'Create Developer', NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(3, 1, 'NewUserForm', 'Form to create a new user', 'New User', 'Create User', NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(4, 1, 'UpdateUserForm', 'Form to update a user details', 'Update User', 'Update', NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(5, 1, 'ChangeUserPassword', 'Form to change user password', 'Change Password', 'Change', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(6, 4, 'NewResourceForm', 'Form to create a new resource', 'New Resource', 'Create Resource', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(7, 30, 'NewActionForm', 'Form to create a new Action', 'New Action', 'Create Action', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(8, 30, 'AddActionForm', 'Add a action to the selected resource', 'Add Action', 'Add Action', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(9, 8, 'NewFormForm', 'Form to create a form', 'New Resource Form', 'Create Form', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(10, 8, 'AddResourceForm', 'Form to be added from resource', 'New Resource Form', 'Create Form', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(11, 9, 'CreateFormField', 'Create a field for a form', 'Create Field', 'Create Field', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(12, 20, 'CreateListForm', 'form to create a new resource list', 'New List', 'Create List', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(13, 20, 'AddResourceList', 'Add a list to a selected resource', 'Add a list', 'Add List', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(14, 25, 'CreateDataForm', 'Form to create a data', 'Create Data', 'Create Data', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(15, 25, 'AddDataForm', 'Add a data to a selected resource', 'Add Data', 'Add Data', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(16, 2, 'NewGroupForm', 'Form to create a user group', 'Create Group', 'Create Group', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(17, 3, 'NewRoleForm', 'Form to create a new role', 'Create Role', 'Create Role', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(18, 5, 'AddRoleResourceForm', 'Form to add a resource to a role', 'Add Resource', 'Add Resource', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(309101, 305105, 'AddNewSetting', 'Add a new setting, the value mentioned will be deault to all users', 'Settings', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309102, 305117, 'AddNewUserSetting', 'Add new user setting', 'User Setting', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309103, 305117, 'ChangeUserSettingStatus', 'Form to update user settings status', 'Change Status', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309104, 305118, 'AddUserStoreAreaForm', 'Form to add user store area', 'User, Store and Area', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309105, 305110, 'AddProductImage', 'Form to add product images', 'Product Images', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309106, 305127, 'AddFNReserves', 'Form to add function reserves', 'Function Reserves', 'Save', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(309107, 305127, 'UpdateReserves', 'Formt o update reserves', 'Function Reserves', 'Update', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46');
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
INSERT INTO `__resource_form_collection` (`id`, `resource_form`, `collection_form`, `relation`, `foreign_field`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 10, 11, 15, 51, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(2, 9, 11, 15, 51, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04');
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
INSERT INTO `__resource_form_data_map` (`id`, `resource_form`, `resource_data`, `form_field`, `attribute`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `nest_relation4`, `nest_relation5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 4, 1, 13, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04');
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
INSERT INTO `__resource_form_defaults` (`id`, `resource_form`, `name`, `value`, `method`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `attribute`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 1, 'groups', '3', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(2, 2, 'groups', '2', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04');
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
	(1, 1, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(2, 1, 'email', 'text', 'Email', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(3, 1, 'password', 'password', 'Password', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(4, 2, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(5, 2, 'email', 'text', 'Email', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(6, 2, 'password', 'password', 'Password', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(7, 3, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(8, 3, 'group', 'select', 'Group', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(9, 3, 'email', 'text', 'Email', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(10, 3, 'password', 'password', 'Password', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(11, 4, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(12, 4, 'email', 'text', 'Email', NULL, NULL, '2019-10-01 07:41:53', '2019-10-01 07:41:53'),
	(13, 4, 'group', 'multiselect', 'Group', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(14, 5, 'password', 'password', 'Change Password to', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(15, 6, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(16, 6, 'title', 'text', 'Title', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(17, 6, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(18, 6, 'namespace', 'text', 'Namespace', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(19, 6, 'table', 'text', 'Table', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(20, 6, 'controller', 'text', 'Controller', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(21, 6, 'controller_namespace', 'text', 'Controller Namespace', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(22, 6, 'development', 'select', 'Development Resource', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(23, 7, 'resource', 'select', 'Select Resource', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(24, 7, 'name', 'text', 'Action Name', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(25, 7, 'menu', 'text', 'Main Menu Caption', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(26, 7, 'title', 'text', 'List Menu Caption', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(27, 7, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(28, 7, 'type', 'select', 'Action Type', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(29, 7, 'idn1', 'select', 'Type Detail - 1', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(30, 7, 'idn2', 'select', 'Type Detail - 2', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(31, 7, 'idn3', 'select', 'Type Detail - 3', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(32, 8, 'resource', 'text', 'Select Resource', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(33, 8, 'name', 'text', 'Action Name', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(34, 8, 'menu', 'text', 'Main Menu Caption', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(35, 8, 'title', 'text', 'List Menu Caption', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(36, 8, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(37, 8, 'type', 'select', 'Action Type', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(38, 8, 'idn1', 'select', 'Type Detail - 1', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(39, 8, 'idn2', 'select', 'Type Detail - 2', NULL, NULL, '2019-10-01 07:41:54', '2019-10-01 07:41:54'),
	(40, 8, 'idn3', 'select', 'Type Detail - 3', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(41, 9, 'resource', 'select', 'Select Resource', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(42, 9, 'name', 'text', 'Form Name', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(43, 9, 'title', 'text', 'Form Title', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(44, 9, 'action_text', 'text', 'Action Text', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(45, 9, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(46, 10, 'resource', 'text', 'Select Resource', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(47, 10, 'name', 'text', 'Form Name', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(48, 10, 'title', 'text', 'Form Title', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(49, 10, 'action_text', 'text', 'Action Text', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(50, 10, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(51, 11, 'resource_form', 'select', 'Select Form', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(52, 11, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(53, 11, 'type', 'text', 'Type', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(54, 11, 'label', 'text', 'Label', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(55, 11, 'relation', 'select', 'Relation', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(56, 11, 'attribute', 'text', 'Attribute', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(57, 12, 'resource', 'select', 'Select Resource', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(58, 12, 'name', 'text', 'List Name', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(59, 12, 'title', 'text', 'Title', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(60, 12, 'identity', 'text', 'Field name to identify selected item', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(61, 12, 'items_per_page', 'text', 'Items to display per page', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(62, 12, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(63, 13, 'resource', 'text', 'Resource', NULL, NULL, '2019-10-01 07:41:55', '2019-10-01 07:41:55'),
	(64, 13, 'name', 'text', 'List Name', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(65, 13, 'title', 'text', 'Title', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(66, 13, 'identity', 'text', 'Field name to identify selected item', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(67, 13, 'items_per_page', 'text', 'Items to display per page', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(68, 13, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(69, 14, 'resource', 'select', 'Select Resource', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(70, 14, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:56', '2019-10-01 07:41:56'),
	(71, 14, 'title_field', 'text', 'Title Field', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(72, 14, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(73, 15, 'resource', 'text', 'Resource', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(74, 15, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(75, 15, 'title_field', 'text', 'Title Field', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(76, 15, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(77, 16, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(78, 16, 'title', 'text', 'Title', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(79, 16, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(80, 17, 'name', 'text', 'Name', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(81, 17, 'title', 'text', 'Title', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(82, 17, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(83, 18, 'role', 'select', 'Select Role', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(84, 18, 'resource', 'select', 'Select Resource', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(85, 18, 'actions_availability', 'select', 'Actions Availability', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(86, 18, 'actions', 'multiselect', 'Select Actions', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(310101, 309101, 'name', 'text', 'Name of Settings', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310102, 309101, 'value', 'text', 'Default Value', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310103, 309101, 'status', 'select', 'Status', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310104, 309101, 'description', 'textarea', 'Description', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310105, 309102, 'user', 'select', 'User', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310106, 309102, 'setting', 'select', 'Setting', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310107, 309102, 'value', 'text', 'Value', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310108, 309103, 'status', 'select', 'Change Status to', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310109, 309104, 'user', 'select', 'Sales Executive', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310110, 309104, 'store', 'select', 'Store', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310111, 309104, 'area', 'select', 'Area', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310112, 309104, 'status', 'select', 'Status', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310113, 309105, 'product', 'select', 'Product', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310114, 309105, 'image01', 'file', 'Image 01', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310115, 309105, 'image02', 'file', 'Image 02', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310116, 309105, 'image03', 'file', 'Image 03', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310117, 309105, 'image04', 'file', 'Image 04', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310118, 309105, 'image05', 'file', 'Image 05', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310119, 309105, 'default', 'select', 'Set Default Image', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310120, 309106, 'fncode', 'select', 'Select FN Code', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310121, 309106, 'user', 'select', 'Select User', NULL, NULL, '2019-10-01 07:42:46', '2019-10-01 07:42:46'),
	(310122, 309106, 'store', 'select', 'Select Store', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310123, 309106, 'start_num', 'text', 'Enter Sequence Start Number', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310124, 309106, 'end_num', 'text', 'Enter Sequence End Number', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310125, 309107, 'start_num', 'text', 'Start Num', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310126, 309107, 'end_num', 'text', 'End Num', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310127, 309107, 'current', 'text', 'Current', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310128, 309107, 'progress', 'select', 'Progress', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(310129, 309107, 'status', 'select', 'Status', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47');
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
	(1, 11, 'inline', '5', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(2, 12, 'inline', '5', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(3, 13, 'inline', '5', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(4, 14, 'inline', '4', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(313101, 310109, 'inline', '4', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(313102, 310110, 'inline', '4', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(313103, 310111, 'inline', '4', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(313104, 310112, 'inline', '4', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47');
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
	(1, 1, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(2, 2, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(3, 3, NULL, NULL, NULL, NULL, 'password', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(4, 4, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(5, 5, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-10-01 07:41:57', '2019-10-01 07:41:57'),
	(6, 6, NULL, NULL, NULL, NULL, 'password', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(7, 7, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(8, 8, 1, NULL, NULL, NULL, 'group', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(9, 9, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(10, 10, NULL, NULL, NULL, NULL, 'password', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(11, 11, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(12, 12, NULL, NULL, NULL, NULL, 'email', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(13, 13, 1, NULL, NULL, NULL, 'group', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(14, 14, NULL, NULL, NULL, NULL, 'password', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(15, 15, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(16, 16, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(17, 17, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(18, 18, NULL, NULL, NULL, NULL, 'namespace', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(19, 19, NULL, NULL, NULL, NULL, 'table', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(20, 20, NULL, NULL, NULL, NULL, 'controller', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(21, 21, NULL, NULL, NULL, NULL, 'controller_namespace', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(22, 22, NULL, NULL, NULL, NULL, 'development', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(23, 23, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(24, 24, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(25, 25, NULL, NULL, NULL, NULL, 'menu', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(26, 26, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(27, 27, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(28, 28, 8, NULL, NULL, NULL, 'type', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(29, 29, 8, NULL, NULL, NULL, 'idn1', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(30, 30, 8, NULL, NULL, NULL, 'idn2', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(31, 31, 8, NULL, NULL, NULL, 'idn3', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(32, 32, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(33, 33, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(34, 34, NULL, NULL, NULL, NULL, 'menu', NULL, NULL, '2019-10-01 07:41:58', '2019-10-01 07:41:58'),
	(35, 35, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(36, 36, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(37, 37, 8, NULL, NULL, NULL, 'type', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(38, 38, 8, NULL, NULL, NULL, 'idn1', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(39, 39, 8, NULL, NULL, NULL, 'idn2', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(40, 40, 8, NULL, NULL, NULL, 'idn3', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(41, 41, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(42, 42, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(43, 43, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(44, 44, NULL, NULL, NULL, NULL, 'action_text', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(45, 45, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(46, 46, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(47, 47, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(48, 48, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(49, 49, NULL, NULL, NULL, NULL, 'action_text', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(50, 50, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(51, 51, NULL, NULL, NULL, NULL, 'resource_form', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(52, 52, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(53, 53, NULL, NULL, NULL, NULL, 'type', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(54, 54, NULL, NULL, NULL, NULL, 'label', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(55, 55, 21, NULL, NULL, NULL, 'relation', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(56, 56, 21, NULL, NULL, NULL, 'attribute', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(57, 57, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(58, 58, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(59, 59, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(60, 60, NULL, NULL, NULL, NULL, 'identity', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(61, 61, NULL, NULL, NULL, NULL, 'items_per_page', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(62, 62, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(63, 63, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(64, 64, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(65, 65, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(66, 66, NULL, NULL, NULL, NULL, 'identity', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(67, 67, NULL, NULL, NULL, NULL, 'items_per_page', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(68, 68, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(69, 69, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:41:59', '2019-10-01 07:41:59'),
	(70, 70, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(71, 71, NULL, NULL, NULL, NULL, 'title_field', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(72, 72, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(73, 73, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(74, 74, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(75, 75, NULL, NULL, NULL, NULL, 'title_field', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(76, 76, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(77, 77, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(78, 78, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(79, 79, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(80, 80, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(81, 81, NULL, NULL, NULL, NULL, 'title', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(82, 82, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(83, 83, NULL, NULL, NULL, NULL, 'role', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(84, 84, NULL, NULL, NULL, NULL, 'resource', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(85, 85, NULL, NULL, NULL, NULL, 'actions_availability', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(86, 86, NULL, NULL, NULL, NULL, 'actions', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(311101, 310101, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311102, 310102, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311103, 310103, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311104, 310104, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311105, 310105, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311106, 310106, NULL, NULL, NULL, NULL, 'setting', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311107, 310107, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311108, 310108, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311109, 310109, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311110, 310110, NULL, NULL, NULL, NULL, 'store', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311111, 310111, NULL, NULL, NULL, NULL, 'area', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311112, 310112, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311113, 310113, NULL, NULL, NULL, NULL, 'product', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311114, 310114, NULL, NULL, NULL, NULL, 'image01', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311115, 310115, NULL, NULL, NULL, NULL, 'image02', NULL, NULL, '2019-10-01 07:42:47', '2019-10-01 07:42:47'),
	(311116, 310116, NULL, NULL, NULL, NULL, 'image03', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311117, 310117, NULL, NULL, NULL, NULL, 'image04', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311118, 310118, NULL, NULL, NULL, NULL, 'image05', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311119, 310119, NULL, NULL, NULL, NULL, 'default', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311120, 310120, NULL, NULL, NULL, NULL, 'fncode', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311121, 310121, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311122, 310122, NULL, NULL, NULL, NULL, 'store', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311123, 310123, NULL, NULL, NULL, NULL, 'start_num', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311124, 310124, NULL, NULL, NULL, NULL, 'end_num', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311125, 310125, NULL, NULL, NULL, NULL, 'start_num', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311126, 310126, NULL, NULL, NULL, NULL, 'end_num', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311127, 310127, NULL, NULL, NULL, NULL, 'current', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311128, 310128, NULL, NULL, NULL, NULL, 'progress', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(311129, 310129, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48');
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
INSERT INTO `__resource_form_field_depends` (`id`, `form_field`, `depend_field`, `db_field`, `operator`, `compare_method`, `method`, `value_db_field`, `ignore_null`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 29, 'type', NULL, '=', NULL, 'id1List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(2, 29, 'resource', NULL, '=', NULL, 'id1List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(3, 30, 'type', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(4, 30, 'resource', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(5, 30, 'idn1', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(6, 31, 'type', NULL, '=', NULL, 'id3List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(7, 31, 'idn2', NULL, '=', NULL, 'id3List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(8, 38, 'type', NULL, '=', NULL, 'id1List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(9, 38, 'resource', NULL, '=', NULL, 'id1List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(10, 39, 'type', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(11, 39, 'resource', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(12, 39, 'idn1', NULL, '=', NULL, 'id2List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(13, 40, 'type', NULL, '=', NULL, 'id3List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(14, 40, 'idn2', NULL, '=', NULL, 'id3List', NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(15, 55, 'resource', 'resource', '=', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(16, 86, 'resource', 'resource', '=', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01');
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
INSERT INTO `__resource_form_field_dynamic` (`id`, `form_field`, `type`, `depend_field`, `alter_on`, `value`, `values`, `operator`, `on_multiple`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 30, 'disabled-enabled', 'type', 'value', NULL, 'FormWithData,AddRelation,ListRelation,ManageRelation', 'In', 'and', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(2, 31, 'disabled-enabled', 'type', 'value', NULL, 'AddRelation', '=', 'and', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01');
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
	(1, 8, 'Foreign', NULL, 'id', 'title', 'Yes', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(2, 13, 'Foreign', NULL, 'id', 'title', 'Yes', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(3, 22, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(4, 23, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(5, 28, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(6, 29, 'Method', 'id1List', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(7, 30, 'Method', 'id2List', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(8, 31, 'Method', 'id3List', NULL, NULL, 'No', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(9, 37, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(10, 38, 'Method', 'id1List', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(11, 39, 'Method', 'id2List', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(12, 40, 'Method', 'id3List', NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(13, 41, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(14, 55, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(15, 57, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(16, 69, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(17, 83, 'Foreign', NULL, 'id', 'title', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(18, 84, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(19, 85, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(20, 86, 'List', '3', 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:01', '2019-10-01 07:42:01'),
	(312101, 310103, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312102, 310105, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312103, 310106, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312104, 310108, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312105, 310109, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312106, 310110, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312107, 310111, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312108, 310112, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312109, 310113, 'Foreign', NULL, 'id', 'narration', 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312110, 310119, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48'),
	(312111, 310120, 'List', '322111', 'code', 'code', 'Yes', NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(312112, 310121, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(312113, 310122, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(312114, 310128, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(312115, 310129, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49');
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
	(1, 77, 'required', 'Group name cannot be empty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(2, 78, 'required', 'Group title cannot be empty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(3, 80, 'required', 'Group name cannot be empty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(4, 81, 'required', 'Group title cannot be empty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:00', '2019-10-01 07:42:00'),
	(315101, 310101, 'required', 'Name is mandatory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:48', '2019-10-01 07:42:48');
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
	(1, 3, 7, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(2, 3, 8, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(3, 3, 9, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(4, 3, 10, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(5, 6, 15, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(6, 6, 16, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(7, 6, 17, 12, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(8, 6, 18, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(9, 6, 19, 6, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(10, 6, 20, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(11, 6, 21, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(12, 6, 22, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(13, 7, 23, 12, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(14, 7, 24, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(15, 7, 25, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(16, 7, 26, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(17, 7, 27, 12, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(18, 7, 28, 3, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(19, 7, 29, 3, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(20, 7, 30, 3, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(21, 7, 31, 3, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(22, 9, 41, 12, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(23, 9, 42, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(24, 9, 43, 4, NULL, NULL, '2019-10-01 07:42:02', '2019-10-01 07:42:02'),
	(25, 9, 44, 4, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(26, 9, 45, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(27, 12, 57, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(28, 12, 58, 3, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(29, 12, 59, 3, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(30, 12, 60, 3, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(31, 12, 61, 3, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(32, 12, 62, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(33, 13, 63, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(34, 13, 64, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(35, 13, 65, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(36, 13, 66, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(37, 13, 67, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(38, 13, 68, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(39, 14, 69, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(40, 14, 70, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(41, 14, 71, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(42, 14, 72, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(43, 16, 77, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(44, 16, 78, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(45, 16, 79, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(46, 17, 80, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(47, 17, 81, 6, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(48, 17, 82, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(49, 18, 83, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(50, 18, 84, 12, NULL, NULL, '2019-10-01 07:42:03', '2019-10-01 07:42:03'),
	(51, 18, 85, 4, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(52, 18, 86, 8, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(317101, 309101, 310101, 4, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317102, 309101, 310102, 4, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317103, 309101, 310103, 4, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317104, 309101, 310104, 12, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317105, 309102, 310105, 6, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317106, 309102, 310106, 6, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(317107, 309102, 310107, 12, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49');
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
	(1, 1, 'UsersListForSetup', 'List all users', 'Users', 'name', 20, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(2, 1, 'UsersList', 'List all users', 'Users', 'name', 80, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(3, 4, 'ResourcesList', 'List all resources', 'Resources', 'name', 100, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(4, 30, 'ActionsList', 'List all actions', 'Actions', 'name', 100, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(5, 8, 'FormsList', 'List all forms', 'Forms', 'name', 100, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(6, 20, 'ListsList', 'List all lists', 'Lists', 'name', 100, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(7, 25, 'DataList', 'List all data', 'Data', 'name', 100, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(8, 9, 'FieldsList', 'List all fields', 'Fields', 'label', 20, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(9, 16, 'FormLayout', 'List all layout details of a form', 'Form Layout', 'form.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(10, 17, 'FormCollections', 'List all collection forms of a form', 'Form Colletion', 'form.name', 5, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(11, 21, 'ListRelations', 'List all relations of a list', 'List Relations', 'list.name', 10, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(12, 22, 'ListScopes', 'List all scopes of a list', 'List Scopes', 'list.name', 10, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(13, 23, 'ListLayout', 'List layout details of a list', 'List Layout', 'list.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:04', '2019-10-01 07:42:04'),
	(14, 24, 'ListSearchFields', 'Searchable fields of a list', 'List Searchable Fields', 'list.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(15, 26, 'DataRelations', 'List all relations of a data', 'Data Relations', 'data.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(16, 27, 'DataScopes', 'List all scopes of a data', 'Data Scopes', 'data.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(17, 28, 'DataSections', 'List all sections of a data', 'Data Sections', 'data.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(18, 32, 'ActionAttrs', 'List all action attributes', 'Action Attributes', 'action.name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(19, 11, 'FieldAttrsList', 'List all field attributes', 'Field Attributes', 'field.label', 30, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(20, 12, 'FieldOptionsList', 'List all field options', 'Field Options', 'field.label', 5, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(21, 13, 'FieldValidationsList', 'List all field validations', 'Field Validations', 'field.label', 10, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(22, 14, 'FieldDependsList', 'List all field dependents', 'Field Depends', 'field.label', 5, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(23, 15, 'FieldDynamicsList', 'List all field dynamics', 'Field Dynamics', 'field.label', 5, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(24, 2, 'GroupsList', 'List all groups', 'Groups', 'name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(25, 3, 'RolesList', 'List all roles', 'Roles', 'name', 20, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(26, 5, 'RoleResourcesList', 'List all resources of a role', 'Resources', 'role.name', 30, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(322101, 305105, 'Settings', 'List all available Settings', 'Settings', 'name', 20, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322102, 305101, 'ListAllUsers', 'List all available users', 'Users', 'name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322103, 305117, 'ListAllUserSetting', 'List all user setting and value', 'User Settings', 'user.name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322104, 305101, 'SalesExecutiveUserList', 'List all sales executives from users', 'Sales Executives', 'name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322105, 305118, 'UserStoreAreaList', 'List all records in User Store Area', 'User, Store and Area', 'user.name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322106, 305115, 'AreaList', 'List all areas', 'Area', 'name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322107, 305114, 'StoresList', 'List all stores', 'Stores', 'name', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322108, 305110, 'ProductImageList', 'List All entries', 'Product Images', 'product.narration', 15, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322109, 305113, 'FunctionDetailList', 'List All functions available', 'Function details list', 'code', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322110, 305127, 'ReservesList', 'List all reserves', 'Function Reserves', 'code', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(322111, 305127, 'UncompletedReservesList', 'List all reserve entries which are uncompleted', 'Function Reserves', 'code', 50, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49');
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
	(1, 1, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(2, 1, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(3, 1, 'Groups', 'title', 1, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(4, 2, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(5, 2, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(6, 2, 'Groups', 'title', 1, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(7, 3, 'ID', 'id', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(8, 3, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(9, 3, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(10, 4, 'ID', 'id', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(11, 4, 'Resource', 'name', 11, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(12, 4, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(13, 4, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(14, 4, 'Menu', 'menu', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(15, 4, 'Type', 'type', 8, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(16, 5, 'ID', 'id', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:07', '2019-10-01 07:42:07'),
	(17, 5, 'Resource', 'name', 19, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(18, 5, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(19, 5, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(20, 6, 'ID', 'id', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(21, 6, 'Resource', 'name', 25, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(22, 6, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(23, 6, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(24, 6, 'Identity Field', 'identity', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(25, 6, 'Per Page', 'items_per_page', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(26, 7, 'ID', 'id', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(27, 7, 'Resource', 'name', 30, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(28, 7, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(29, 7, 'Title Field', 'title_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(30, 8, 'Form', 'name', 42, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(31, 8, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(32, 8, 'Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(33, 8, 'Label', 'label', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(34, 9, 'Form', 'name', 59, 42, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(35, 9, 'Field', 'name', 59, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(36, 9, 'Colspan', 'colspan', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(37, 10, 'Collection Form', 'name', 39, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(38, 10, 'Relation', 'name', 40, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(39, 10, 'Foreign Field', 'label', 60, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(40, 10, 'Foreign Field Name', 'name', 60, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(41, 10, 'Foreign Field Type', 'type', 60, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(42, 11, 'List', 'name', 61, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(43, 11, 'Relation', 'name', 62, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(44, 11, 'Nest Relation', 'name', 63, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(45, 12, 'List', 'name', 64, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(46, 12, 'Scope', 'name', 65, NULL, NULL, NULL, NULL, '2019-10-01 07:42:08', '2019-10-01 07:42:08'),
	(47, 13, 'List', 'name', 66, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(48, 13, 'Label', 'label', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(49, 13, 'Field', 'field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(50, 13, 'Relation', 'name', 67, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(51, 14, 'List', 'name', 68, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(52, 14, 'Field', 'field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(53, 14, 'Relation', 'name', 69, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(54, 15, 'Data', 'name', 70, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(55, 15, 'Relation', 'name', 71, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(56, 15, 'Deep Relation', 'name', 72, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(57, 16, 'Data', 'name', 73, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(58, 16, 'Scope', 'name', 74, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(59, 17, 'Data', 'name', 75, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(60, 17, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(61, 17, 'Title Field', 'title_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(62, 17, 'Relation', 'name', 35, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(63, 17, 'Colspan', 'colspan', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(64, 18, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(65, 18, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(66, 19, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(67, 19, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(68, 20, 'Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(69, 20, 'Method', 'detail', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(70, 20, 'Value Attribute', 'value_attr', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(71, 20, 'Label Attribute', 'label_attr', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(72, 20, 'Preload', 'preload', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(73, 21, 'Rule', 'rule', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(74, 21, 'Message', 'message', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(75, 21, 'Argument 1', 'arg1', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(76, 21, 'Argument 2', 'arg2', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(77, 21, 'Argument 3', 'arg3', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(78, 22, 'Depend On Field', 'depend_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:09', '2019-10-01 07:42:09'),
	(79, 22, 'Database Field', 'db_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(80, 22, 'Operator', 'operator', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(81, 22, 'Compare Operator', 'compare_method', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(82, 22, 'Method Name', 'method', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(83, 22, 'Value DB Field', 'value_db_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(84, 22, 'Ignore on Null', 'ignore_null', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(85, 23, 'Dynamic Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(86, 23, 'Depend On Field', 'depend_field', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(87, 23, 'Alter On', 'alter_on', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(88, 23, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(89, 23, 'Values', 'values', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(90, 23, 'Operator', 'operator', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(91, 24, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(92, 24, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(93, 24, 'Roles', 'title', 3, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(94, 25, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(95, 25, 'Title', 'title', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(96, 26, 'Resource', 'name', 13, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(97, 26, 'Action Availability', 'actions_availability', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(98, 26, 'Actions', 'actions', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:10', '2019-10-01 07:42:10'),
	(325101, 322101, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325102, 322101, 'Default Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325103, 322101, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325104, 322102, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325105, 322102, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325106, 322102, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325107, 322103, 'User', 'name', 308111, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325108, 322103, 'Settings', 'name', 308109, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325109, 322103, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325110, 322103, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325111, 322104, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325112, 322104, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(325113, 322104, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325114, 322105, 'Executive', 'name', 308115, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325115, 322105, 'Store', 'name', 308114, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325116, 322105, 'Area', 'name', 308113, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325117, 322105, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325118, 322106, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325119, 322106, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325120, 322106, 'Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325121, 322106, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325122, 322107, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325123, 322107, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325124, 322107, 'Company Code', 'cocode', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325125, 322107, 'Branch Code', 'brcode', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325126, 322108, 'Product', 'narration', 308133, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325127, 322109, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325128, 322109, 'Abbreviation', 'abr', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325129, 322109, 'Digit Length', 'digit_length', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:51', '2019-10-01 07:42:51'),
	(325130, 322110, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325131, 322110, 'User', 'name', 308134, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325132, 322110, 'Store', 'name', 308135, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325133, 322110, 'Progress', 'progress', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325134, 322111, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325135, 322111, 'User', 'name', 308134, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325136, 322111, 'Store', 'name', 308135, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(325137, 322111, 'Progress', 'progress', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52');
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
	(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(3, 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(4, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(5, 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(6, 6, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(7, 7, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(8, 8, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(9, 9, 59, 42, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(10, 10, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(11, 10, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(12, 10, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(13, 11, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:05', '2019-10-01 07:42:05'),
	(14, 11, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(15, 11, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(16, 12, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(17, 12, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(18, 13, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(19, 13, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(20, 14, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(21, 14, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(22, 15, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(23, 15, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(24, 15, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(25, 16, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(26, 16, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(27, 17, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(28, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(29, 26, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(324101, 322103, 308109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:49', '2019-10-01 07:42:49'),
	(324102, 322103, 308111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324103, 322105, 308113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324104, 322105, 308114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324105, 322105, 308115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324106, 322108, 308133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324107, 322110, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324108, 322110, 308135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324109, 322111, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(324110, 322111, 308134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50');
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
	(1, 1, 1, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(2, 2, 2, NULL, NULL, '2019-10-01 07:42:06', '2019-10-01 07:42:06'),
	(323101, 322104, 307101, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50'),
	(323102, 322111, 307109, NULL, NULL, '2019-10-01 07:42:50', '2019-10-01 07:42:50');
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
	(326101, 322101, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326102, 322101, 'description', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326103, 322102, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326104, 322102, 'reference', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326105, 322102, 'email', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326106, 322103, 'name', 308111, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326107, 322103, 'name', 308109, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326108, 322104, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326109, 322105, 'name', 308113, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326110, 322105, 'name', 308114, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326111, 322105, 'name', 308115, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326112, 322106, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326113, 322107, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326114, 322108, 'narration', 308133, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326115, 322109, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326116, 322110, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326117, 322110, 'name', 308134, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:52', '2019-10-01 07:42:52'),
	(326118, 322110, 'name', 308135, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(326119, 322111, 'code', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(326120, 322111, 'name', 308134, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53'),
	(326121, 322111, 'name', 308135, NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:53', '2019-10-01 07:42:53');
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
	(1, 1, 'User Groups', 'Which groups this user belongs to', 'Groups', 'belongsToMany', 2, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(2, 2, 'Group Users', 'List of users belongs to this group', 'Users', 'belongsToMany', 1, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(3, 2, 'Group Roles', 'Roles assigneed to this group', 'Roles', 'belongsToMany', 3, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(4, 3, 'Role Groups', 'Details of groups this role assigned to', 'Groups', 'belongsToMany', 2, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(5, 3, 'Role Resource', 'Resources assigned to a role', 'Resources', 'hasMany', 5, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(6, 4, 'Resource Roles', 'The details of roles who have access to this resource', 'Roles', 'belongsToMany', 3, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(7, 4, 'Resource Actions', 'Get actions available for the resource', 'Actions', 'hasMany', 30, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(8, 30, 'Resource Action Methods', 'Handler details of an action', 'Method', 'hasOne', 31, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(9, 30, 'Resource Action Lists', 'Lists where action available', 'Lists', 'hasMany', 33, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(10, 30, 'Resource Action Data', 'Resource data where action available', 'Data', 'hasMany', 34, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(11, 30, 'Resource Action Resource', 'Resoure details of a action', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(12, 40, 'Organisation Contacts', 'Contact details of organisation', 'Contacts', 'hasMany', 41, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(13, 5, 'Resource Details', 'Resource details', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(14, 4, 'Resource Forms', 'Forms available for a resource', 'Forms', 'hasMany', 8, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(15, 8, 'Form Fields', 'Fields associated with a form', 'Fields', 'hasMany', 9, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(16, 9, 'Field Attributes', 'Attributes of Field', 'Attributes', 'hasMany', 11, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(17, 9, 'Field Options', 'Options of Field', 'Options', 'hasMany', 12, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(18, 9, 'Field Validations', 'Validation details of field', 'Validations', 'hasMany', 13, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(19, 8, 'From Resource', 'Resource this form belongs to', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(20, 8, 'Form Defaults', 'Predefined values for a form', 'Defaults', 'hasMany', 19, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(21, 9, 'Field Data', 'Fields Database binding details', 'Data', 'hasOne', 10, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(22, 4, 'Resource Relations', 'Relation of  a resource to another resource', 'Relations', 'hasMany', 6, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(23, 10, 'Bind Data Relation', 'Relation to which the data to be bind', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(24, 19, 'Default Data Relation', 'Relation to which the forms predefined data to be bind', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(25, 20, 'Resource Details', 'Resource details of a list', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(26, 20, 'List Relations', 'Relations to be loaded on accessing list', 'Relations', 'hasMany', 21, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(27, 4, 'Resource Scopes', 'Scopes available on a Resource', 'Scopes', 'hasMany', 7, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(28, 20, 'List Scopes', 'Scopes by which a list to be filtered', 'Scopes', 'belongsToMany', 7, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(29, 25, 'Data Relation', 'Relations to be loaded on a data view', 'Relations', 'hasMany', 26, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(30, 25, 'Resource Details', 'Details of resource of a record', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(31, 20, 'List Layout', 'Layout of a list', 'Layout', 'hasMany', 23, NULL, NULL, '2019-10-01 07:41:50', '2019-10-01 07:41:50'),
	(32, 6, 'Nested Relation', 'Nested Relation', 'Nest', 'hasMany', 6, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(33, 6, 'Related Resource', 'Related Resource Details', 'Relation', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(34, 25, 'Data View Section', 'Section details of data view', 'Sections', 'hasMany', 28, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(35, 28, 'Data Relation', 'View relation of a data', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(36, 29, 'Data item relation', 'View relation of a data item', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(37, 6, 'Owner Relation', 'View the owner resource', 'Owner', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(38, 8, 'Collections', 'Collection/Detail form', 'Collections', 'hasMany', 17, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(39, 17, 'Collection Form', 'Collection Form', 'Form', 'belongsTo', 8, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(40, 17, 'Relation', 'Details of Relation', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(41, 12, 'Field', 'Field details', 'Field', 'belongsTo', 9, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(42, 9, 'Form', 'Form details', 'Form', 'belongsTo', 8, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(43, 20, 'List Search', 'Search fields for a list', 'Search', 'hasMany', 24, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(44, 9, 'Depending Fields', 'Dependent fields', 'Depends', 'hasMany', 14, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(45, 4, 'Resource Dashboards', 'Dashboards of a Resource', 'Dashboards', 'hasMany', 37, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(46, 37, 'Dashboard Sections', 'Sections of a dashboard', 'Sections', 'hasMany', 38, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(47, 38, 'Dashboard Section Items', 'Items of a dashboard section', 'Items', 'hasMany', 39, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(48, 37, 'Dashboard Resource', 'Resource details of a dashboard', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(49, 9, 'Field Dynamics', 'Dynamic field details', 'Dynamics', 'belongsTo', 15, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(50, 25, 'Resource Data Scopes', 'Scopes applied on a data view', 'Scopes', 'belongsToMany', 7, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(51, 20, 'List Actions', 'Actions available for a list', 'Actions', 'belongsToMany', 30, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(52, 25, 'Data Actions', 'Actions available for a data view', 'Actions', 'belongsToMany', 30, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(53, 14, 'Dependent Field', 'Details of field to which this dependent record belongs to', 'Field', 'belongsTo', 9, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(54, 4, 'Resource Lists', 'Lists available for a Resources', 'Lists', 'hasMany', 20, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(55, 4, 'Resource Data', 'Data details avaliable for a Resource', 'Data', 'hasMany', 25, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(56, 8, 'Form Layout', 'Layout details of a form', 'Layout', 'hasMany', 16, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(57, 28, 'Section Items', 'Items of a data section', 'Items', 'hasMany', 29, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(58, 16, 'Layout Form', 'Form details of a layout', 'Form', 'belongsTo', 8, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(59, 16, 'Layout Field', 'Field details of  a layout', 'Field', 'belongsTo', 9, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(60, 17, 'Collection Foreign Field', 'Foreign field details of a from collection', 'Field', 'belongsTo', 9, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(61, 21, 'List Relation to List', 'List details of a list relation', 'List', 'belongsTo', 20, NULL, NULL, '2019-10-01 07:41:51', '2019-10-01 07:41:51'),
	(62, 21, 'List Relation to Relation', 'Relation details of a list relation', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(63, 21, 'List Relation to Nest Relation', 'Level 1 deep relation of a list relation', 'NRelation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(64, 22, 'List Scope to List', 'List details of a list scope', 'List', 'belongsTo', 20, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(65, 22, 'List Scope to Scope', 'Scope details of a list scope', 'Scope', 'belongsTo', 7, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(66, 23, 'List Layout to List', 'List details of a list layout', 'List', 'belongsTo', 20, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(67, 23, 'List Layout to Relation', 'Relation details of a list layout', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(68, 24, 'List search  to List', 'List details of a list search', 'List', 'belongsTo', 20, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(69, 24, 'List search  to Relation', 'Relation details of a list seach', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(70, 26, 'Data relation to Data', 'Data details of a data relation', 'Data', 'belongsTo', 25, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(71, 26, 'Data relation to Relation', 'Relation details of a data relation', 'Relation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(72, 26, 'Data relation to Deep Relation', 'Level 1 Deep Relation details of a data relation', 'NRelation', 'belongsTo', 6, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(73, 27, 'Data scope to Data', 'Data details of a data scope', 'Data', 'belongsTo', 25, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(74, 27, 'Data scope to Scope', 'Scope details of a data scope', 'Scope', 'belongsTo', 7, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(75, 28, 'Data section to Data', 'Data details of a data view section', 'Data', 'belongsTo', 25, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(76, 30, 'Action Attributes', 'Attributes of a action', 'Attrs', 'hasMany', 32, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(77, 4, 'Resource Defaults', 'Default action of a resource', 'Defaults', 'hasOne', 35, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(78, 35, 'Defaults Resource', 'Resource details of a default record', 'Resource', 'belongsTo', 4, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(79, 35, 'Defaults List Action', 'List action details of a default record', 'List', 'belongsTo', 30, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(80, 35, 'Defaults Form Action', 'Create form action details of a default record', 'Form', 'belongsTo', 30, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(81, 35, 'Defaults Data Action', 'Read data action details of a default record', 'Data', 'belongsTo', 30, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(82, 35, 'Defaults Form With Data Action', 'Update record action details of a default record', 'FormWithData', 'belongsTo', 30, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(308101, 305111, 'Items', 'Each items of this pricelist', 'Items', 'hasMany', 305112, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308102, 305112, 'Pricelist', 'Details of pricelist this item belongs to', 'Pricelist', 'belongsTo', 305111, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308103, 305112, 'Product', 'Details of product this item consist of', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308104, 305116, 'Area', 'Details of area', 'Area', 'belongsTo', 305115, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308105, 305116, 'Customer', 'Details of customer', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308106, 305115, 'User', 'Details of user', 'User', 'belongsToMany', 305101, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308107, 305105, 'Users', 'Users list corresponding to a settings', 'Users', 'hasMany', 305117, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308108, 305101, 'Area', 'Details of area', 'Area', 'belongsToMany', 305115, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308109, 305117, 'Settings', 'Details of settings this setting belongs to', 'Settings', 'belongsTo', 305105, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308110, 305101, 'Settings', 'Settings assigned for a user', 'Settings', 'hasMany', 305117, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308111, 305117, 'User', 'Details of user this settings belongs to', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(308112, 305101, 'StoreAndArea', 'Store and Areas assigned for a user', 'StoreAndArea', 'hasMany', 305118, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308113, 305118, 'Area', 'Area details', 'Area', 'belongsTo', 305115, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308114, 305118, 'Store', 'Store Details', 'Store', 'belongsTo', 305114, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308115, 305118, 'User', 'User Details', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308116, 305114, 'Users', 'Users assigned to this store', 'Users', 'belongsToMany', 305101, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308117, 305115, 'StoreAndUser', 'Store and Users assigned to a area', 'StoreAndUser', 'hasMany', 305118, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308118, 305121, 'Details', 'Product wise details of transaction', 'Details', 'hasMany', 305122, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308119, 305119, 'Items', 'Items of a transaction', 'Items', 'hasMany', 305120, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308120, 305120, 'Product', 'Product details of an sales order item', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308121, 305124, 'IN', 'Stock in transactions', 'IN', 'belongsTo', 305121, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308122, 305124, 'OUT', 'Stock out transactions', 'OUT', 'belongsTo', 305121, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308123, 305119, 'Customer', 'The customer to which this sales order belongs', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308124, 305118, 'AssignedAreas', 'The user_areas which assigned to this record', 'AssignedAreas', 'hasMany', 305116, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308125, 305116, 'Users', 'The executives assigned to a area_user', 'Users', 'hasMany', 305118, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308126, 305118, 'Customers', 'Customers who are in selected records area', 'Customers', 'belongsToMany', 305101, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308127, 305101, 'AreaCustomers', 'List of customers belongs to the area which are assigned to a user', 'AreaCustomers', 'hasManyThrough', 305116, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308128, 305120, 'SalesOrder', 'Sales order details for a so item', 'SalesOrder', 'belongsTo', 305119, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308129, 305122, 'Transaction', 'Detail of transaction header', 'Transaction', 'belongsTo', 305121, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308130, 305121, 'StockOutTransactions', 'TransferOut transactions', 'STOut', 'hasOne', 305124, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308131, 305121, 'StockInTransactions', 'TransferIn transactions', 'STIn', 'hasOne', 305124, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308132, 305108, 'ProductImages', 'Images of a product', 'Images', 'hasOne', 305110, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308133, 305110, 'ProductDetails', 'Product Details', 'Product', 'belongsTo', 305108, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308134, 305127, 'ReserveUser', 'User details of reserve', 'User', 'belongsTo', 305101, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(308135, 305127, 'ReserveStore', 'Store details of reserve', 'Store', 'belongsTo', 305114, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45');
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
	(1, 1, 1, 'Only', '1,2,4,6,7', NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(2, 4, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(3, 6, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(4, 7, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(5, 8, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(6, 9, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(7, 10, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(8, 11, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(9, 12, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(10, 13, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(11, 14, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(12, 15, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(13, 16, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(14, 17, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(15, 18, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(16, 19, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(17, 20, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(18, 21, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(19, 22, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:48', '2019-10-01 07:41:48'),
	(20, 23, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(21, 24, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(22, 25, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(23, 26, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(24, 27, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(25, 28, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(26, 29, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(27, 30, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(28, 31, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(29, 32, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(30, 33, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(31, 34, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(32, 35, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(33, 36, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(34, 37, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(35, 38, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(36, 39, 2, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(37, 1, 3, 'Except', '1,2,4', NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(38, 2, 3, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(39, 3, 3, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(40, 5, 3, 'All', NULL, NULL, NULL, '2019-10-01 07:41:49', '2019-10-01 07:41:49'),
	(306101, 305101, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306102, 305102, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306103, 305103, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306104, 305104, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306105, 305105, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306106, 305106, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306107, 305107, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306108, 305108, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306109, 305109, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306110, 305110, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306111, 305111, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:43', '2019-10-01 07:42:43'),
	(306112, 305112, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306113, 305113, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306114, 305114, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306115, 305115, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306116, 305116, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306117, 305117, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306118, 305118, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306119, 305119, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306120, 305120, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306121, 305121, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306122, 305122, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306123, 305123, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306124, 305124, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306125, 305125, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306126, 305126, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44'),
	(306127, 305127, 303101, 'All', NULL, NULL, NULL, '2019-10-01 07:42:44', '2019-10-01 07:42:44');
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
	(1, 1, 'SetupUser', 'Filter users which are maintained by Setup user only', 'setupUser', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(2, 1, 'AdministratorUser', 'Filter users which are maintained by Administrator user', 'administratorUser', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:41:52', '2019-10-01 07:41:52'),
	(307101, 305101, 'SalesExecutives', 'User where has group reference as SLS', 'salesExecutive', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307102, 305118, 'Assigned', 'The store and area whih is assigned to the requesting user', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307103, 305116, 'Assigned', 'The records where area is assigned to the requester', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307104, 305119, 'AssignedAreaCustomer', 'Sales orders of customers belongs to a area which assigned to a executive', 'assignedAreaCustomer', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307105, 305121, 'AssignedCustomerTransactions', 'Transactions related to customers who are assigned to the requesting executive', 'assignedCustomerTransactions', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307106, 305126, 'AssignedCustomerReceipts', 'Receipts related to customers who are assigned to the requesting executive', 'assignedCustomerReceipts', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307107, 305121, 'StockTransferPending', 'The transactions which are all pending stock transfer', 'sTPending', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307108, 305124, 'PendingStockTransfer', 'Stock transfers which are pending', 'pending', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45'),
	(307109, 305127, 'UncompletedReserves', 'Reserve entries which have progress not equal to Completed', 'unCompleted', NULL, NULL, NULL, NULL, NULL, '2019-10-01 07:42:45', '2019-10-01 07:42:45');
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
	(1, 'developer_administrator', 'Have access to Developer and Administrators', 'Developer Administrator', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(2, 'developer', 'Access to resource creation', 'Developer', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(3, 'administrator', 'Have access to Manage Users, Roles and assign Resources', 'Administrator', NULL, NULL, '2019-10-01 07:41:46', '2019-10-01 07:41:46'),
	(303101, 'eplus_administrators', 'ePlus administrators role', 'ePlus Administrator', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(303102, 'eplus_accountant', 'ePlus accountant role', 'ePlus Accountant', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42'),
	(303103, 'eplus_salesExecutive', 'ePlus sales executive', 'ePlus Sales Executive', NULL, NULL, '2019-10-01 07:42:42', '2019-10-01 07:42:42');
/*!40000 ALTER TABLE `__roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
