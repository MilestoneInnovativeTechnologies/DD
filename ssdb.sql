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

-- Dumping structure for table smartsalemaster.areas
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
  CONSTRAINT `areas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `areas_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.areas: ~0 rows (approximately)
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.area_users
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
  CONSTRAINT `area_users_area_foreign` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `area_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `area_users_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.area_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `area_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_users` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.bill_data
DROP TABLE IF EXISTS `bill_data`;
CREATE TABLE IF NOT EXISTS `bill_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FYCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOCNO` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SRNO` decimal(10,0) DEFAULT NULL,
  `DSRNO` decimal(10,0) DEFAULT NULL,
  `DOCDATE` datetime DEFAULT NULL,
  `CO` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BR` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BILLNO` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BILLDATE` datetime DEFAULT NULL,
  `DUEDATE` datetime DEFAULT NULL,
  `AMT` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `SIGN` decimal(2,0) NOT NULL DEFAULT '1',
  `BILL_TYPE` enum('Original','Allocation') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Original',
  `TYPE` enum('System','Normal','PostDated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `CANCEL` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_data_created_by_index` (`created_by`),
  KEY `bill_data_updated_by_index` (`updated_by`),
  CONSTRAINT `bill_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bill_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.bill_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_data` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.cheque_details
DROP TABLE IF EXISTS `cheque_details`;
CREATE TABLE IF NOT EXISTS `cheque_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `COCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BRCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FYCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FNCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOCNO` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SRNO` decimal(10,0) DEFAULT NULL,
  `VERSION` decimal(10,0) NOT NULL DEFAULT '1',
  `DOCDATE` datetime DEFAULT NULL,
  `CO` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BR` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BANKCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PDCCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CHQNO` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CHQDATE` datetime DEFAULT NULL,
  `SUBMITTEDDATE` datetime DEFAULT NULL,
  `PROCESSEDDATE` datetime DEFAULT NULL,
  `AMT` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `SIGN` decimal(2,0) NOT NULL DEFAULT '1',
  `CHQ_STATUS` enum('Approved','Pending','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `CANCEL` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `SETTLEMENT` enum('NONE','National Electronics Funds Transfer(NEFT)','Real Time Gross Settlement(RTGS)','New Cheque','Resubmitt','Cash') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NONE',
  `RESUBMITIONDATE` datetime DEFAULT NULL,
  `REFCOCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFBRCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFFNCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFFYCODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFDOCNO` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheque_details_created_by_index` (`created_by`),
  KEY `cheque_details_updated_by_index` (`updated_by`),
  CONSTRAINT `cheque_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cheque_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.cheque_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `cheque_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque_details` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.d_data
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
  CONSTRAINT `d_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `d_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.d_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `d_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_data` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.fiscalyearmaster
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
  CONSTRAINT `fiscalyearmaster_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fiscalyearmaster_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.fiscalyearmaster: ~0 rows (approximately)
/*!40000 ALTER TABLE `fiscalyearmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalyearmaster` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.fn_reserves
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
  CONSTRAINT `fn_reserves_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fn_reserves_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.fn_reserves: ~0 rows (approximately)
/*!40000 ALTER TABLE `fn_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `fn_reserves` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.functiondetails
DROP TABLE IF EXISTS `functiondetails`;
CREATE TABLE IF NOT EXISTS `functiondetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abr` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wtype` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `format` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '[BR][FN]-[FY]-[AI]',
  `digit_length` decimal(2,0) NOT NULL DEFAULT '4',
  `direction` enum('Out','In') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Out',
  `default_account` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `taxselection` enum('Tax01','Tax02','Select','Account','Auto') COLLATE utf8mb4_unicode_ci DEFAULT 'Tax01',
  `taxunique` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `taxrule` bigint(20) unsigned DEFAULT NULL,
  `ratewithtax` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `discount01` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02base` enum('Net','Gross') COLLATE utf8mb4_unicode_ci DEFAULT 'Net',
  `discount03` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discountmode` enum('None','PriceList','Custom','Buy_nX_Get_mY','Account','User','Branch') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `discount` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `functiondetails_code_index` (`code`),
  KEY `functiondetails_category_index` (`category`),
  KEY `functiondetails_wtype_index` (`wtype`),
  KEY `functiondetails_taxrule_index` (`taxrule`),
  KEY `functiondetails_created_by_index` (`created_by`),
  KEY `functiondetails_updated_by_index` (`updated_by`),
  CONSTRAINT `functiondetails_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `functiondetails_taxrule_foreign` FOREIGN KEY (`taxrule`) REFERENCES `tax` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `functiondetails_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.functiondetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `functiondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `functiondetails` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.importsales
DROP TABLE IF EXISTS `importsales`;
CREATE TABLE IF NOT EXISTS `importsales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `BILLNO` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOCDATE` datetime DEFAULT NULL,
  `ACCCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEMCODE` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UNITCODE` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARTCODE` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QTY` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `RATE` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `DISCOUNT` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `importsales_created_by_index` (`created_by`),
  KEY `importsales_updated_by_index` (`updated_by`),
  CONSTRAINT `importsales_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `importsales_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.importsales: ~0 rows (approximately)
/*!40000 ALTER TABLE `importsales` DISABLE KEYS */;
/*!40000 ALTER TABLE `importsales` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.migrations: ~82 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(46, '2014_10_12_000000_create_users_table', 1),
	(47, '2014_10_12_100000_create_password_resets_table', 1),
	(48, '2019_01_24_000002_create___groups_table', 1),
	(49, '2019_01_24_000003_create___group_users_table', 1),
	(50, '2019_01_24_000004_create___roles_table', 1),
	(51, '2019_01_24_000005_create___group_roles_table', 1),
	(52, '2019_01_24_000006_create___resources_table', 1),
	(53, '2019_01_24_000007_create___resource_roles_table', 1),
	(54, '2019_01_24_000008_create___resource_relations_table', 1),
	(55, '2019_01_24_000009_create___resource_scopes_table', 1),
	(56, '2019_01_24_000010_create___resource_forms_table', 1),
	(57, '2019_01_24_000011_create___resource_form_fields_table', 1),
	(58, '2019_01_24_000012_create___resource_form_field_attrs_table', 1),
	(59, '2019_01_24_000013_create___resource_form_field_data_table', 1),
	(60, '2019_01_24_000014_create___resource_form_field_validations_table', 1),
	(61, '2019_01_24_000015_create___resource_form_field_options_table', 1),
	(62, '2019_01_24_000016_create___resource_form_field_depends_table', 1),
	(63, '2019_01_24_000017_create___resource_form_field_dynamic_table', 1),
	(64, '2019_01_24_000018_create___resource_form_layout_table', 1),
	(65, '2019_01_24_000019_create___resource_form_collection_table', 1),
	(66, '2019_01_24_000020_create___resource_form_upload_table', 1),
	(67, '2019_01_24_000021_create___resource_form_defaults_table', 1),
	(68, '2019_01_24_000022_create___resource_lists_table', 1),
	(69, '2019_01_24_000023_create___resource_list_relations_table', 1),
	(70, '2019_01_24_000024_create___resource_list_scopes_table', 1),
	(71, '2019_01_24_000025_create___resource_list_layout_table', 1),
	(72, '2019_01_24_000026_create___resource_list_search_table', 1),
	(73, '2019_01_24_000027_create___resource_data_table', 1),
	(74, '2019_01_24_000028_create___resource_data_relations_table', 1),
	(75, '2019_01_24_000029_create___resource_data_scopes_table', 1),
	(76, '2019_01_24_000030_create___resource_data_view_sections_table', 1),
	(77, '2019_01_24_000031_create___resource_data_view_section_items_table', 1),
	(78, '2019_01_24_000032_create___resource_form_data_map_table', 1),
	(79, '2019_01_24_000033_create___resource_actions_table', 1),
	(80, '2019_01_24_000034_create___resource_action_attrs_table', 1),
	(81, '2019_01_24_000035_create___resource_action_methods_table', 1),
	(82, '2019_01_24_000036_create___resource_action_lists_table', 1),
	(83, '2019_01_24_000037_create___resource_action_data_table', 1),
	(84, '2019_01_24_000038_create___resource_defaults_table', 1),
	(85, '2019_01_24_000039_create___resource_metrics_table', 1),
	(86, '2019_01_24_000040_create___resource_dashboard_table', 1),
	(87, '2019_01_24_000041_create___resource_dashboard_sections_table', 1),
	(88, '2019_01_24_000042_create___resource_dashboard_section_items_table', 1),
	(89, '2019_01_24_000043_create___organisation_table', 1),
	(90, '2019_01_24_000044_create___organisation_contacts_table', 1),
	(91, '2019_03_01_000001_add_ss_fields_in_users_table', 1),
	(92, '2019_03_01_000002_add_ss_fields_in_groups_table', 1),
	(93, '2019_03_01_000003_add_ss_fields_in_roles_table', 1),
	(94, '2019_03_01_000004_create_outstanding_functions', 1),
	(95, '2019_03_01_000005_create_taxvalue_functions', 1),
	(96, '2019_03_28_000046_create_setup_table', 1),
	(97, '2019_03_28_000047_create_settings_table', 1),
	(98, '2019_03_28_000048_create_tax_table', 1),
	(99, '2019_03_28_000049_create_tax_details_table', 1),
	(100, '2019_03_28_000050_create_fiscalyearmaster_table', 1),
	(101, '2019_03_28_000051_create_functiondetails_table', 1),
	(102, '2019_03_28_000052_create_productgroups_table', 1),
	(103, '2019_03_28_000053_create_products_table', 1),
	(104, '2019_03_28_000054_create_pricelist_table', 1),
	(105, '2019_03_28_000055_create_pricelist_products_table', 1),
	(106, '2019_03_28_000056_create_stores_table', 1),
	(107, '2019_03_28_000057_create_areas_table', 1),
	(108, '2019_03_28_000058_create_area_users_table', 1),
	(109, '2019_03_28_000059_create_user_settings_table', 1),
	(110, '2019_03_28_000060_create_user_store_area_table', 1),
	(111, '2019_03_28_000061_create_store_products_table', 1),
	(112, '2019_03_28_000062_create_product_transaction_natures_table', 1),
	(113, '2019_03_28_000063_create_product_transaction_types_table', 1),
	(114, '2019_03_28_000064_create_store_product_transactions_table', 1),
	(115, '2019_03_28_000065_create_transactions_table', 1),
	(116, '2019_03_28_000066_create_transaction_details_table', 1),
	(117, '2019_03_28_000067_create_bill_data_table', 1),
	(118, '2019_03_28_000068_create_d_data_table', 1),
	(119, '2019_03_28_000069_create_cheque_details_table', 1),
	(120, '2019_03_28_000070_create_sales_order_table', 1),
	(121, '2019_03_28_000071_create_sales_order_items_table', 1),
	(122, '2019_03_28_000072_create_stock_transfer_table', 1),
	(123, '2019_03_28_000073_create_receipts_table', 1),
	(124, '2019_03_28_000074_create_fn_reserves_table', 1),
	(125, '2019_03_28_000075_create_sales_order_sales_table', 1),
	(126, '2019_03_28_000076_create_w_bin_table', 1),
	(127, '2019_03_28_000077_create_importsales_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.pricelist
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
  CONSTRAINT `pricelist_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pricelist_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.pricelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.pricelist_products
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
  CONSTRAINT `pricelist_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_pricelist_foreign` FOREIGN KEY (`pricelist`) REFERENCES `pricelist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pricelist_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.pricelist_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `pricelist_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist_products` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.productgroups
DROP TABLE IF EXISTS `productgroups`;
CREATE TABLE IF NOT EXISTS `productgroups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `igmref` char(31) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `belongs` bigint(20) unsigned DEFAULT NULL,
  `parent` bigint(20) unsigned DEFAULT NULL,
  `tax1` bigint(20) unsigned DEFAULT NULL,
  `tax2` bigint(20) unsigned DEFAULT NULL,
  `type` enum('Public','Protected','System') COLLATE utf8mb4_unicode_ci DEFAULT 'Public',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productgroups_code_index` (`code`),
  KEY `productgroups_name_index` (`name`),
  KEY `productgroups_igmref_index` (`igmref`),
  KEY `productgroups_belongs_index` (`belongs`),
  KEY `productgroups_parent_index` (`parent`),
  KEY `productgroups_tax1_index` (`tax1`),
  KEY `productgroups_tax2_index` (`tax2`),
  KEY `productgroups_created_by_index` (`created_by`),
  KEY `productgroups_updated_by_index` (`updated_by`),
  CONSTRAINT `productgroups_belongs_foreign` FOREIGN KEY (`belongs`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productgroups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productgroups_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productgroups_tax1_foreign` FOREIGN KEY (`tax1`) REFERENCES `tax` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productgroups_tax2_foreign` FOREIGN KEY (`tax2`) REFERENCES `tax` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productgroups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.productgroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `productgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `productgroups` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.products
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
  `narration3` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration4` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration5` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration6` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration7` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration8` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration9` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `narration10` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group1` bigint(20) unsigned DEFAULT NULL,
  `group2` bigint(20) unsigned DEFAULT NULL,
  `group3` bigint(20) unsigned DEFAULT NULL,
  `group4` bigint(20) unsigned DEFAULT NULL,
  `group5` bigint(20) unsigned DEFAULT NULL,
  `group6` bigint(20) unsigned DEFAULT NULL,
  `group7` bigint(20) unsigned DEFAULT NULL,
  `group8` bigint(20) unsigned DEFAULT NULL,
  `group9` bigint(20) unsigned DEFAULT NULL,
  `group10` bigint(20) unsigned DEFAULT NULL,
  `type` enum('Public','Protected','System') COLLATE utf8mb4_unicode_ci DEFAULT 'Public',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_code_index` (`code`),
  KEY `products_name_index` (`name`),
  KEY `products_group1_index` (`group1`),
  KEY `products_group2_index` (`group2`),
  KEY `products_group3_index` (`group3`),
  KEY `products_group4_index` (`group4`),
  KEY `products_group5_index` (`group5`),
  KEY `products_group6_index` (`group6`),
  KEY `products_group7_index` (`group7`),
  KEY `products_group8_index` (`group8`),
  KEY `products_group9_index` (`group9`),
  KEY `products_group10_index` (`group10`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_updated_by_index` (`updated_by`),
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group10_foreign` FOREIGN KEY (`group10`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group1_foreign` FOREIGN KEY (`group1`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group2_foreign` FOREIGN KEY (`group2`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group3_foreign` FOREIGN KEY (`group3`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group4_foreign` FOREIGN KEY (`group4`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group5_foreign` FOREIGN KEY (`group5`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group6_foreign` FOREIGN KEY (`group6`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group7_foreign` FOREIGN KEY (`group7`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group8_foreign` FOREIGN KEY (`group8`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_group9_foreign` FOREIGN KEY (`group9`) REFERENCES `productgroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.product_transaction_natures
DROP TABLE IF EXISTS `product_transaction_natures`;
CREATE TABLE IF NOT EXISTS `product_transaction_natures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_transaction_natures_name_index` (`name`),
  KEY `product_transaction_natures_created_by_index` (`created_by`),
  KEY `product_transaction_natures_updated_by_index` (`updated_by`),
  CONSTRAINT `product_transaction_natures_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_transaction_natures_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.product_transaction_natures: ~5 rows (approximately)
/*!40000 ALTER TABLE `product_transaction_natures` DISABLE KEYS */;
INSERT INTO `product_transaction_natures` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Fresh', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(2, 'Damaged', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(3, 'Expired', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(4, 'Unsold', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(5, 'Other', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51');
/*!40000 ALTER TABLE `product_transaction_natures` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.product_transaction_types
DROP TABLE IF EXISTS `product_transaction_types`;
CREATE TABLE IF NOT EXISTS `product_transaction_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_transaction_types_name_index` (`name`),
  KEY `product_transaction_types_created_by_index` (`created_by`),
  KEY `product_transaction_types_updated_by_index` (`updated_by`),
  CONSTRAINT `product_transaction_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_transaction_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.product_transaction_types: ~6 rows (approximately)
/*!40000 ALTER TABLE `product_transaction_types` DISABLE KEYS */;
INSERT INTO `product_transaction_types` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Purchase', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(2, 'Sale', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(3, 'Return', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(4, 'Load', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(5, 'Unload', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51'),
	(6, 'Other', 'Active', NULL, NULL, '2019-07-18 13:04:51', '2019-07-18 13:04:51');
/*!40000 ALTER TABLE `product_transaction_types` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.receipts
DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `docno` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipts_docno_index` (`docno`),
  KEY `receipts_fycode_index` (`fycode`),
  KEY `receipts_fncode_index` (`fncode`),
  KEY `receipts_user_index` (`user`),
  KEY `receipts_customer_index` (`customer`),
  KEY `receipts__ref_index` (`_ref`),
  KEY `receipts_created_by_index` (`created_by`),
  KEY `receipts_updated_by_index` (`updated_by`),
  CONSTRAINT `receipts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.receipts: ~0 rows (approximately)
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.sales_order
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
  CONSTRAINT `sales_order_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.sales_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.sales_order_items
DROP TABLE IF EXISTS `sales_order_items`;
CREATE TABLE IF NOT EXISTS `sales_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `so` bigint(20) unsigned DEFAULT NULL,
  `product` bigint(20) unsigned DEFAULT NULL,
  `rate` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `tax` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `total` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
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
  CONSTRAINT `sales_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.sales_order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `sales_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_items` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.sales_order_sales
DROP TABLE IF EXISTS `sales_order_sales`;
CREATE TABLE IF NOT EXISTS `sales_order_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `so` bigint(20) unsigned DEFAULT NULL,
  `product` bigint(20) unsigned DEFAULT NULL,
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `transaction` bigint(20) unsigned DEFAULT NULL,
  `sale_quantity` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_sales_so_index` (`so`),
  KEY `sales_order_sales_product_index` (`product`),
  KEY `sales_order_sales_transaction_index` (`transaction`),
  KEY `sales_order_sales_created_by_index` (`created_by`),
  KEY `sales_order_sales_updated_by_index` (`updated_by`),
  CONSTRAINT `sales_order_sales_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_transaction_foreign` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.sales_order_sales: ~0 rows (approximately)
/*!40000 ALTER TABLE `sales_order_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_sales` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.settings
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
  CONSTRAINT `settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.settings: ~8 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `name`, `description`, `value`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'SALESB2CFNCODE', 'Function code used in sales form', 'SL1', 'Active', NULL, NULL, '2019-07-18 13:04:49', '2019-07-18 13:04:49'),
	(2, 'SALESB2BFNCODE', 'Function code used in sales form B2C', 'SL2', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(3, 'SALESRETURNFNCODE', 'Function code used in sales return form', 'SR1', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(4, 'SALESORDERFNCODE', 'Function code used in sales order form', 'SO1', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(5, 'CASHRECEIPTFNCODE', 'Function code used in cash receipt form', 'CR1', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(6, 'CHEQUERECEIPTFNCODE', 'Function code used in cheque receipt form', 'BR1', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(7, 'STOCKTRANSFERINFNCODE', 'Function code used in stock transfer IN form', 'MT1', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50'),
	(8, 'STOCKTRANSFEROUTFNCODE', 'Function code used in stock transfer OUT form', 'MT2', 'Active', NULL, NULL, '2019-07-18 13:04:50', '2019-07-18 13:04:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.setup
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
  CONSTRAINT `setup_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `setup_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.setup: ~0 rows (approximately)
/*!40000 ALTER TABLE `setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `setup` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.stock_transfer
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
  CONSTRAINT `stock_transfer_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_in_foreign` FOREIGN KEY (`in`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_out_foreign` FOREIGN KEY (`out`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stock_transfer_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.stock_transfer: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_transfer` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.stores
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
  CONSTRAINT `stores_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `stores_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.stores: ~0 rows (approximately)
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.store_products
DROP TABLE IF EXISTS `store_products`;
CREATE TABLE IF NOT EXISTS `store_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store` bigint(20) unsigned NOT NULL,
  `product` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_products_store_index` (`store`),
  KEY `store_products_product_index` (`product`),
  KEY `store_products_created_by_index` (`created_by`),
  KEY `store_products_updated_by_index` (`updated_by`),
  CONSTRAINT `store_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_products_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_products_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.store_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `store_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_products` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.store_product_transactions
DROP TABLE IF EXISTS `store_product_transactions`;
CREATE TABLE IF NOT EXISTS `store_product_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store` bigint(20) unsigned DEFAULT NULL,
  `product` bigint(20) unsigned DEFAULT NULL,
  `direction` enum('Out','In') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Out',
  `quantity` decimal(30,10) NOT NULL DEFAULT '1.0000000000',
  `user` bigint(20) unsigned DEFAULT NULL,
  `nature` bigint(20) unsigned DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` bigint(20) unsigned DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_product_transactions_user_foreign` (`user`),
  KEY `store_product_transactions__ref_index` (`_ref`),
  KEY `store_product_transactions_store_index` (`store`),
  KEY `store_product_transactions_product_index` (`product`),
  KEY `store_product_transactions_nature_index` (`nature`),
  KEY `store_product_transactions_type_index` (`type`),
  KEY `store_product_transactions_created_by_index` (`created_by`),
  KEY `store_product_transactions_updated_by_index` (`updated_by`),
  CONSTRAINT `store_product_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_nature_foreign` FOREIGN KEY (`nature`) REFERENCES `product_transaction_natures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_type_foreign` FOREIGN KEY (`type`) REFERENCES `product_transaction_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.store_product_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `store_product_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_transactions` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.tax
DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_code_index` (`code`),
  KEY `tax_name_index` (`name`),
  KEY `tax_created_by_index` (`created_by`),
  KEY `tax_updated_by_index` (`updated_by`),
  CONSTRAINT `tax_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tax_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.tax: ~0 rows (approximately)
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.tax_details
DROP TABLE IF EXISTS `tax_details`;
CREATE TABLE IF NOT EXISTS `tax_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax` bigint(20) unsigned NOT NULL,
  `taxcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percentageequation` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxtype` enum('TaxOnTaxableAmount','TaxOnMRP','TaxOnTotalAmount','TaxOnTax','TaxOnTotalTax','TaxOnQuantity','FixedTax') COLLATE utf8mb4_unicode_ci DEFAULT 'TaxOnTaxableAmount',
  `taxnature` enum('Tax','SubTax','AdditionalTax') COLLATE utf8mb4_unicode_ci DEFAULT 'Tax',
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `inputcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outputcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reftaxcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processorder` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_details_tax_index` (`tax`),
  KEY `tax_details_taxcode_index` (`taxcode`),
  KEY `tax_details_code_index` (`code`),
  KEY `tax_details_name_index` (`name`),
  KEY `tax_details_created_by_index` (`created_by`),
  KEY `tax_details_updated_by_index` (`updated_by`),
  CONSTRAINT `tax_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tax_details_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tax_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.tax_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `tax_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_details` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `_ref` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` bigint(20) unsigned DEFAULT NULL,
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
  KEY `transactions_docno_index` (`docno`),
  KEY `transactions_customer_index` (`customer`),
  KEY `transactions_fycode_index` (`fycode`),
  KEY `transactions_fncode_index` (`fncode`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_updated_by_index` (`updated_by`),
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.transaction_details
DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE IF NOT EXISTS `transaction_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction` bigint(20) unsigned NOT NULL,
  `spt` bigint(20) unsigned NOT NULL,
  `amount` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `tax` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `discount` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `total` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `_ref_trans` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_ref_spt` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_details_transaction_index` (`transaction`),
  KEY `transaction_details_spt_index` (`spt`),
  KEY `transaction_details__ref_trans_index` (`_ref_trans`),
  KEY `transaction_details__ref_spt_index` (`_ref_spt`),
  KEY `transaction_details_created_by_index` (`created_by`),
  KEY `transaction_details_updated_by_index` (`updated_by`),
  CONSTRAINT `transaction_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_spt_foreign` FOREIGN KEY (`spt`) REFERENCES `store_product_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_transaction_foreign` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.transaction_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_reference_index` (`reference`),
  KEY `users_api_token_index` (`api_token`),
  KEY `users_phone_index` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.user_settings
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
  CONSTRAINT `user_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_settings_setting_foreign` FOREIGN KEY (`setting`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_settings_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.user_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.user_store_area
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
  CONSTRAINT `user_store_area_area_foreign` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_store_area_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.user_store_area: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_store_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_store_area` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.w_bin
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
  CONSTRAINT `w_bin_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `w_bin_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.w_bin: ~0 rows (approximately)
/*!40000 ALTER TABLE `w_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `w_bin` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__groups
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

-- Dumping data for table smartsalemaster.__groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `__groups` DISABLE KEYS */;
INSERT INTO `__groups` (`id`, `name`, `description`, `title`, `reference`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(301101, 'accountant', 'ePlus Accountant', 'Accountant', 'ACC', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(301102, 'administrators', 'ePlus Administrator', 'Administators', 'ADM', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(301103, 'salesExecutive', 'ePlus Sales Executives', 'Sales Executives', 'SLS', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(301104, 'eplus_account', 'ePlus user accounts or customers', 'ePlus Accounts', NULL, NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14');
/*!40000 ALTER TABLE `__groups` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__group_roles
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

-- Dumping data for table smartsalemaster.__group_roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `__group_roles` DISABLE KEYS */;
INSERT INTO `__group_roles` (`id`, `group`, `role`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(304101, 301101, 303102, NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(304102, 301102, 303101, NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(304103, 301103, 303103, NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14');
/*!40000 ALTER TABLE `__group_roles` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__group_users
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__group_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `__group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `__group_users` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__organisation
DROP TABLE IF EXISTS `__organisation`;
CREATE TABLE IF NOT EXISTS `__organisation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  KEY `__organisation_name_index` (`name`(191)),
  KEY `__organisation_created_by_index` (`created_by`),
  KEY `__organisation_updated_by_index` (`updated_by`),
  CONSTRAINT `__organisation_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__organisation_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__organisation: ~0 rows (approximately)
/*!40000 ALTER TABLE `__organisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `__organisation` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__organisation_contacts
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
  CONSTRAINT `__organisation_contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__organisation_contacts_organisation_foreign` FOREIGN KEY (`organisation`) REFERENCES `__organisation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__organisation_contacts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__organisation_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `__organisation_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `__organisation_contacts` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resources
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
) ENGINE=InnoDB AUTO_INCREMENT=305133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resources: ~32 rows (approximately)
/*!40000 ALTER TABLE `__resources` DISABLE KEYS */;
INSERT INTO `__resources` (`id`, `name`, `description`, `title`, `namespace`, `table`, `controller`, `controller_namespace`, `development`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(305101, 'User', 'Users of Smart Sale', 'Users', 'Milestone\\SS\\Model', 'users', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305102, 'Setup', 'ePlus setup details', 'Setup', 'Milestone\\SS\\Model', 'setup', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305103, 'Setting', 'Settings available in web and mob interface', 'Settings', 'Milestone\\SS\\Model', 'settings', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305104, 'Tax', 'Tax master', 'Tax', 'Milestone\\SS\\Model', 'tax', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305105, 'TaxDetail', 'Tax details', 'Tax Details', 'Milestone\\SS\\Model', 'tax_details', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305106, 'Fiscalyearmaster', 'Financial Years', 'Fiscal Year', 'Milestone\\SS\\Model', 'fiscalyearmaster', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305107, 'Functiondetail', 'ePlus functions', 'ePlus Functions', 'Milestone\\SS\\Model', 'functiondetails', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305108, 'Productgroup', 'Product groups - item group and item group master', 'Product Group', 'Milestone\\SS\\Model', 'productgroups', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305109, 'Product', 'Products or Items', 'Products', 'Milestone\\SS\\Model', 'products', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305110, 'Pricelist', 'Price list header', 'Price List', 'Milestone\\SS\\Model', 'pricelist', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305111, 'PricelistProduct', 'Price list products', 'Price List Products', 'Milestone\\SS\\Model', 'pricelist_products', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305112, 'Store', 'Stores', 'Stores', 'Milestone\\SS\\Model', 'stores', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305113, 'Area', 'Areas', 'Areas', 'Milestone\\SS\\Model', 'areas', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305114, 'AreaUser', 'Users in an area', 'Area User', 'Milestone\\SS\\Model', 'area_users', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(305115, 'UserSetting', 'Web and Mob settings for each user', 'User Settings', 'Milestone\\SS\\Model', 'user_settings', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305116, 'UserStoreArea', 'Stores and Areas assigned to a user (executive)', 'User Store and Area', 'Milestone\\SS\\Model', 'user_store_area', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305117, 'StoreProduct', 'Products in a store', 'Store Products', 'Milestone\\SS\\Model', 'store_products', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305118, 'ProductTransactionNature', 'Product transaction nature', 'Product Transaction Natures', 'Milestone\\SS\\Model', 'product_transaction_natures', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305119, 'ProductTransactionType', 'Product transaction types', 'Product Transaction Types', 'Milestone\\SS\\Model', 'product_transaction_types', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305120, 'StoreProductTransaction', 'Product transactions in a store - in and out', 'Product Transaction in Store', 'Milestone\\SS\\Model', 'store_product_transactions', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305121, 'Transaction', 'Transaction header - customer, date, document number', 'Transactions', 'Milestone\\SS\\Model', 'transactions', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305122, 'TransactionDetail', 'Products in a transaction, its price tax etc', 'Transaction Details', 'Milestone\\SS\\Model', 'transaction_details', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305123, 'BillData', 'Bills generated during transactions', 'Bill Data', 'Milestone\\SS\\Model', 'bill_data', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305124, 'DData', 'ePlus Ddata for detailed transaction bills', 'ePlus DData', 'Milestone\\SS\\Model', 'd_data', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305125, 'ChequeDetail', 'Cheque Details', 'Cheque Details', 'Milestone\\SS\\Model', 'cheque_details', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305126, 'SalesOrder', 'Sales orders', 'Sales Orders', 'Milestone\\SS\\Model', 'sales_order', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305127, 'SalesOrderItem', 'Sales order items', 'Sales Order Items', 'Milestone\\SS\\Model', 'sales_order_items', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305128, 'StockTransfer', 'Stock transfer from and to a store', 'Stock Transfers', 'Milestone\\SS\\Model', 'stock_transfer', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305129, 'WBin', 'Waste bin used while ePlus direct import', 'Waste Bin', 'Milestone\\SS\\Model', 'w_bin', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305130, 'Receipt', 'Receipts', 'Receipts', 'Milestone\\SS\\Model', 'receipts', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305131, 'FnReserve', 'Function Reserves', 'Function Reserves', 'Milestone\\SS\\Model', 'fn_reserves', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(305132, 'SalesOrderSale', 'Sales which done on Sales Order', 'Sales Order Sales', 'Milestone\\SS\\Model', 'sales_order_sales', NULL, NULL, 'No', NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15');
/*!40000 ALTER TABLE `__resources` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_actions
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
) ENGINE=InnoDB AUTO_INCREMENT=332132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_actions: ~31 rows (approximately)
/*!40000 ALTER TABLE `__resource_actions` DISABLE KEYS */;
INSERT INTO `__resource_actions` (`id`, `resource`, `name`, `description`, `title`, `type`, `menu`, `icon`, `set`, `on`, `confirm`, `handler`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(332101, 305118, 'ProductTransactionNewNature', 'Nature of the product in a transaction.. Fresh, Expired, Damaged etc', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(332102, 305118, 'ProductTransactionViewNature', 'List all natures a product transaction havs', NULL, 'outline-info', 'List', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332103, 305119, 'ProductTransactionNewType', 'Type of transaction like Loading, Unloading, Sales', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332104, 305119, 'ProductTransactionViewTypes', 'List all available types of product transaction', NULL, 'outline-info', 'List', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332105, 305118, 'UpdateProductTransactionNature', 'Edit Nature details, change status', 'Update', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332106, 305119, 'UpdateProductTransactionType', 'Change type status, update name ', 'Update', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332107, 305103, 'NewSettings', 'Create new setting', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332108, 305103, 'ListSettings', 'List all settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332109, 305103, 'ViewSettingsDetails', 'Data view of a settings', 'Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332110, 305103, 'UpdateSettings', 'Edit settings details', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332111, 305101, 'UsersList', 'List all available users', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332112, 305101, 'UserSettingsListAction', 'List all settings of a user', 'View Settings', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332113, 305101, 'ListSalesExecutiveAction', 'Action to list all sales executive', NULL, 'outline-info', 'Sales Executives', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332114, 305115, 'AddNewUserSettingAction', 'Action to call form to add user setting', NULL, 'outline-info', 'New User Setting', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332115, 305101, 'AddSettingsForSelectedUser', 'Action to call a form to add a setting for the selected user', 'Add Setting', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332116, 305103, 'SettingsUsersListAction', 'List all users having this setting', 'View Users', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332117, 305103, 'AddUserForSelectedSetting', 'Action to call a form to add a user for the selected setting', 'Add User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:27', '2019-07-18 13:04:27'),
	(332118, 305115, 'ListAllUserSettingsAction', 'Action to list all user settings', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332119, 305115, 'ChangeUserSettingStatusAction', 'Action to call the form to change user setting status', 'Change Status', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332120, 305115, 'ViewUserSettingsDetails', 'Action to call resource data of user settings', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332121, 305116, 'AddUserStoreAreaRecordAction', 'Action to call form to add user store area', NULL, 'outline-info', 'New', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332122, 305116, 'ListUserStoreAreaRecordAction', 'Action to list all user store area', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332123, 305116, 'ViewUserStoreAreaAction', 'Action to view user store and area', 'View Details', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332124, 305116, 'EditUserStoreAreaAction', 'Action to call a form to update user store area', 'Edit', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332125, 305113, 'ListAreaAction', 'Action to list all areas', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332126, 305112, 'ListStoreAction', 'Action to list all stores', NULL, 'outline-info', 'List All', NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332127, 305101, 'ListStoreAreaOfUserAction', 'Action to list all store and area of the selected user', 'View Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332128, 305101, 'AddStoreAreaForUser', 'Action to call the form to add store area for a user', 'Add Store and Area', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332129, 305113, 'ListStoreAndUserOfArea', 'Action to list all Store and User assigned to selected area', 'View Store and User', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332130, 305113, 'AssignStoreAndUserForArea', 'Action to call the form to assign store and user for an area', 'Assign Store and Executive', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(332131, 305112, 'ListUsersAssigned', 'Action to list all users assigned to a store', 'Manage Executives Assigned', 'primary', NULL, NULL, 'far', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28');
/*!40000 ALTER TABLE `__resource_actions` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_action_attrs
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_action_attrs: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_action_attrs` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_action_data
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

-- Dumping data for table smartsalemaster.__resource_action_data: ~5 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_data` DISABLE KEYS */;
INSERT INTO `__resource_action_data` (`id`, `resource_action`, `resource_data`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(336101, 332105, 327101, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(336102, 332106, 327102, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(336103, 332110, 327103, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(336104, 332119, 327104, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(336105, 332124, 327105, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31');
/*!40000 ALTER TABLE `__resource_action_data` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_action_lists
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
) ENGINE=InnoDB AUTO_INCREMENT=335118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_action_lists: ~17 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_lists` DISABLE KEYS */;
INSERT INTO `__resource_action_lists` (`id`, `resource_action`, `resource_list`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(335101, 332105, 322101, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335102, 332106, 322102, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335103, 332109, 322103, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335104, 332110, 322103, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335105, 332112, 322106, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335106, 332115, 322106, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335107, 332116, 322103, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335108, 332117, 322103, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335109, 332120, 322105, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(335110, 332119, 322105, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335111, 332123, 322107, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335112, 332124, 322107, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335113, 332127, 322106, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335114, 332128, 322106, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335115, 332129, 322108, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335116, 332130, 322108, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(335117, 332131, 322109, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31');
/*!40000 ALTER TABLE `__resource_action_lists` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_action_methods
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
) ENGINE=InnoDB AUTO_INCREMENT=333132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_action_methods: ~31 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_methods` DISABLE KEYS */;
INSERT INTO `__resource_action_methods` (`id`, `resource_action`, `type`, `method`, `idn1`, `idn2`, `idn3`, `idn4`, `idn5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(333101, 332101, 'Form', NULL, '309101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:28', '2019-07-18 13:04:28'),
	(333102, 332102, 'List', NULL, '322101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333103, 332103, 'Form', NULL, '309101', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333104, 332104, 'List', NULL, '322102', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333105, 332105, 'FormWithData', NULL, '309101', '327101', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333106, 332106, 'FormWithData', NULL, '309102', '327102', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333107, 332107, 'Form', NULL, '309103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333108, 332108, 'List', NULL, '322103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333109, 332109, 'Data', NULL, '327103', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333110, 332110, 'FormWithData', NULL, '309103', '327103', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333111, 332111, 'List', NULL, '322104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333112, 332112, 'ListRelation', NULL, '308137', '322105', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333113, 332113, 'List', NULL, '322106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333114, 332114, 'Form', NULL, '309104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333115, 332115, 'AddRelation', NULL, '308137', '309104', '310109', NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333116, 332116, 'ListRelation', NULL, '308134', '322105', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333117, 332117, 'AddRelation', NULL, '308134', '309104', '310110', NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333118, 332118, 'List', NULL, '322105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333119, 332119, 'FormWithData', NULL, '309105', '327104', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:29', '2019-07-18 13:04:29'),
	(333120, 332120, 'Data', NULL, '327104', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333121, 332121, 'Form', NULL, '309106', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333122, 332122, 'List', NULL, '322107', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333123, 332123, 'Data', NULL, '327105', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333124, 332124, 'FormWithData', NULL, '309106', '327105', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333125, 332125, 'List', NULL, '322108', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333126, 332126, 'List', NULL, '322109', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333127, 332127, 'ListRelation', NULL, '308139', '322107', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333128, 332128, 'AddRelation', NULL, '308139', '309106', '310113', NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333129, 332129, 'ListRelation', NULL, '308144', '322107', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333130, 332130, 'AddRelation', NULL, '308144', '309106', '310115', NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30'),
	(333131, 332131, 'ManageRelation', NULL, '308143', '322106', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:30', '2019-07-18 13:04:30');
/*!40000 ALTER TABLE `__resource_action_methods` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_dashboard
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_dashboard: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_dashboard_sections
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_dashboard_sections: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_dashboard_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard_sections` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_dashboard_section_items
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_dashboard_section_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_dashboard_section_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_dashboard_section_items` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_data
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

-- Dumping data for table smartsalemaster.__resource_data: ~5 rows (approximately)
/*!40000 ALTER TABLE `__resource_data` DISABLE KEYS */;
INSERT INTO `__resource_data` (`id`, `resource`, `name`, `description`, `title_field`, `method`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(327101, 305118, 'TransactionProductNatureView', 'View details of a product transaction nature', 'name', NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(327102, 305119, 'TransactionProductTypeView', 'View details of a product transaction type', 'name', NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(327103, 305103, 'SettingsView', 'View details of a settings', 'name', NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(327104, 305115, 'UserSettingsView', 'View details of a user setting', 'user.name', NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(327105, 305116, 'UserStoreAreaView', 'View details of user store area', 'user.name', NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25');
/*!40000 ALTER TABLE `__resource_data` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_data_relations
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
) ENGINE=InnoDB AUTO_INCREMENT=329106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_data_relations: ~5 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_relations` DISABLE KEYS */;
INSERT INTO `__resource_data_relations` (`id`, `resource_data`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `nest_relation4`, `nest_relation5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(329101, 327104, 308138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(329102, 327104, 308136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(329103, 327105, 308140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(329104, 327105, 308141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(329105, 327105, 308142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25');
/*!40000 ALTER TABLE `__resource_data_relations` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_data_scopes
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_data_scopes: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_data_scopes` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_data_view_sections
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
) ENGINE=InnoDB AUTO_INCREMENT=330107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_data_view_sections: ~6 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_view_sections` DISABLE KEYS */;
INSERT INTO `__resource_data_view_sections` (`id`, `resource_data`, `title`, `title_field`, `relation`, `colspan`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(330101, 327101, NULL, 'name', NULL, 12, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(330102, 327102, NULL, 'name', NULL, 12, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(330103, 327103, 'Basic', NULL, NULL, 4, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(330104, 327103, 'Detail', NULL, NULL, 12, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(330105, 327104, 'User Settings Details', NULL, NULL, 12, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(330106, 327105, 'Details', NULL, NULL, 12, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26');
/*!40000 ALTER TABLE `__resource_data_view_sections` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_data_view_section_items
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
) ENGINE=InnoDB AUTO_INCREMENT=331117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_data_view_section_items: ~16 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_view_section_items` DISABLE KEYS */;
INSERT INTO `__resource_data_view_section_items` (`id`, `section`, `label`, `attribute`, `relation`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(331101, 330101, 'Name', 'name', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331102, 330101, 'Status', 'status', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331103, 330102, 'Name', 'name', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331104, 330102, 'Status', 'status', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331105, 330103, 'Name', 'name', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331106, 330103, 'Default Value', 'value', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331107, 330103, 'Status', 'status', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331108, 330104, 'Details', 'description', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331109, 330105, 'User', 'name', 308138, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331110, 330105, 'Setings', 'name', 308136, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331111, 330105, 'Value', 'value', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331112, 330105, 'Status', 'status', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331113, 330106, 'Executive', 'name', 308142, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331114, 330106, 'Store', 'name', 308141, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331115, 330106, 'Area', 'name', 308140, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26'),
	(331116, 330106, 'Status', 'status', NULL, NULL, NULL, '2019-07-18 13:04:26', '2019-07-18 13:04:26');
/*!40000 ALTER TABLE `__resource_data_view_section_items` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_defaults
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
) ENGINE=InnoDB AUTO_INCREMENT=337106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_defaults: ~5 rows (approximately)
/*!40000 ALTER TABLE `__resource_defaults` DISABLE KEYS */;
INSERT INTO `__resource_defaults` (`id`, `resource`, `list`, `create`, `read`, `update`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(337101, 305118, 332102, 332101, NULL, 332105, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(337102, 305119, 332104, 332103, NULL, 332106, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(337103, 305103, 332108, 332107, 332109, 332110, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(337104, 305115, 332118, 332114, 332120, 332119, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31'),
	(337105, 305116, 332122, 332121, 332123, 332124, NULL, NULL, '2019-07-18 13:04:31', '2019-07-18 13:04:31');
/*!40000 ALTER TABLE `__resource_defaults` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_forms
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
) ENGINE=InnoDB AUTO_INCREMENT=309107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_forms: ~6 rows (approximately)
/*!40000 ALTER TABLE `__resource_forms` DISABLE KEYS */;
INSERT INTO `__resource_forms` (`id`, `resource`, `name`, `description`, `title`, `action_text`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(309101, 305118, 'NewTransactionProductNature', 'Enter a new nature of a product transaction', 'New Nature of Product in Transaction', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(309102, 305119, 'NewProductTransactionType', 'Enter a new type of product transaction', 'New Type of Product Transaction', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(309103, 305103, 'AddNewSetting', 'Add a new setting, the value mentioned will be deault to all users', 'Settings', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(309104, 305115, 'AddNewUserSetting', 'Add new user setting', 'User Setting', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(309105, 305115, 'ChangeUserSettingStatus', 'Form to update user settings status', 'Change Status', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(309106, 305116, 'AddUserStoreAreaForm', 'Form to add user store area', 'User, Store and Area', 'Save', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20');
/*!40000 ALTER TABLE `__resource_forms` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_collection
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_collection: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_collection` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_data_map
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_data_map: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_data_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_data_map` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_defaults
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_defaults: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_defaults` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_fields
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
) ENGINE=InnoDB AUTO_INCREMENT=310117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_fields: ~16 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_fields` DISABLE KEYS */;
INSERT INTO `__resource_form_fields` (`id`, `resource_form`, `name`, `type`, `label`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(310101, 309101, 'name', 'text', 'Nature Name', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310102, 309101, 'status', 'select', 'Status', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310103, 309102, 'name', 'text', 'Type Name', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310104, 309102, 'status', 'select', 'Status', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310105, 309103, 'name', 'text', 'Name of Settings', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310106, 309103, 'value', 'text', 'Default Value', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310107, 309103, 'status', 'select', 'Status', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310108, 309103, 'description', 'textarea', 'Description', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310109, 309104, 'user', 'select', 'User', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310110, 309104, 'setting', 'select', 'Setting', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310111, 309104, 'value', 'text', 'Value', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310112, 309105, 'status', 'select', 'Change Status to', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310113, 309106, 'user', 'select', 'Sales Executive', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310114, 309106, 'store', 'select', 'Store', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310115, 309106, 'area', 'select', 'Area', NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20'),
	(310116, 309106, 'status', 'select', 'Status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21');
/*!40000 ALTER TABLE `__resource_form_fields` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_attrs
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

-- Dumping data for table smartsalemaster.__resource_form_field_attrs: ~4 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_attrs` DISABLE KEYS */;
INSERT INTO `__resource_form_field_attrs` (`id`, `form_field`, `name`, `value`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(313101, 310113, 'inline', '4', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(313102, 310114, 'inline', '4', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(313103, 310115, 'inline', '4', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(313104, 310116, 'inline', '4', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21');
/*!40000 ALTER TABLE `__resource_form_field_attrs` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_data
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
) ENGINE=InnoDB AUTO_INCREMENT=311117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_field_data: ~16 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_data` DISABLE KEYS */;
INSERT INTO `__resource_form_field_data` (`id`, `form_field`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `attribute`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(311101, 310101, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311102, 310102, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311103, 310103, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311104, 310104, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311105, 310105, NULL, NULL, NULL, NULL, 'name', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311106, 310106, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311107, 310107, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311108, 310108, NULL, NULL, NULL, NULL, 'description', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311109, 310109, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311110, 310110, NULL, NULL, NULL, NULL, 'setting', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311111, 310111, NULL, NULL, NULL, NULL, 'value', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311112, 310112, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311113, 310113, NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311114, 310114, NULL, NULL, NULL, NULL, 'store', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311115, 310115, NULL, NULL, NULL, NULL, 'area', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(311116, 310116, NULL, NULL, NULL, NULL, 'status', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21');
/*!40000 ALTER TABLE `__resource_form_field_data` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_depends
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_field_depends: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_depends` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_field_depends` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_dynamic
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_field_dynamic: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_dynamic` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_field_dynamic` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_options
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
) ENGINE=InnoDB AUTO_INCREMENT=312111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_field_options: ~10 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_options` DISABLE KEYS */;
INSERT INTO `__resource_form_field_options` (`id`, `form_field`, `type`, `detail`, `value_attr`, `label_attr`, `preload`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(312101, 310102, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(312102, 310104, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(312103, 310107, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312104, 310109, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312105, 310110, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312106, 310112, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312107, 310113, 'List', '322106', 'id', 'name', 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312108, 310114, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312109, 310115, 'Foreign', NULL, 'id', 'name', 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(312110, 310116, 'Enum', NULL, NULL, NULL, 'Yes', NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22');
/*!40000 ALTER TABLE `__resource_form_field_options` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_field_validations
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
) ENGINE=InnoDB AUTO_INCREMENT=315104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_field_validations: ~3 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_validations` DISABLE KEYS */;
INSERT INTO `__resource_form_field_validations` (`id`, `form_field`, `rule`, `message`, `arg1`, `arg2`, `arg3`, `arg4`, `arg5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(315101, 310101, 'required', 'Name is mandatory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(315102, 310103, 'required', 'Name is mandatory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21'),
	(315103, 310105, 'required', 'Name is mandatory', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:21', '2019-07-18 13:04:21');
/*!40000 ALTER TABLE `__resource_form_field_validations` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_layout
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

-- Dumping data for table smartsalemaster.__resource_form_layout: ~7 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_layout` DISABLE KEYS */;
INSERT INTO `__resource_form_layout` (`id`, `resource_form`, `form_field`, `colspan`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(317101, 309103, 310105, 4, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317102, 309103, 310106, 4, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317103, 309103, 310107, 4, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317104, 309103, 310108, 12, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317105, 309104, 310109, 6, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317106, 309104, 310110, 6, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(317107, 309104, 310111, 12, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22');
/*!40000 ALTER TABLE `__resource_form_layout` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_form_upload
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_form_upload: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_form_upload` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_lists
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
) ENGINE=InnoDB AUTO_INCREMENT=322110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_lists: ~9 rows (approximately)
/*!40000 ALTER TABLE `__resource_lists` DISABLE KEYS */;
INSERT INTO `__resource_lists` (`id`, `resource`, `name`, `description`, `title`, `identity`, `items_per_page`, `method`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(322101, 305118, 'TransactionProductNature', 'Nature of the product in a transaction', 'Product Nature', 'name', 20, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322102, 305119, 'TransactionProductType', 'Type of transaction whether is load, unload etc', 'Transaction Types', 'name', 20, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322103, 305103, 'Settings', 'List all available Settings', 'Settings', 'name', 20, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322104, 305101, 'ListAllUsers', 'List all available users', 'Users', 'name', 50, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322105, 305115, 'ListAllUserSetting', 'List all user setting and value', 'User Settings', 'user.name', 50, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322106, 305101, 'SalesExecutiveUserList', 'List all sales executives from users', 'Sales Executives', 'name', 50, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322107, 305116, 'UserStoreAreaList', 'List all records in User Store Area', 'User, Store and Area', 'user.name', 50, NULL, NULL, NULL, '2019-07-18 13:04:22', '2019-07-18 13:04:22'),
	(322108, 305113, 'AreaList', 'List all areas', 'Area', 'name', 50, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(322109, 305112, 'StoresList', 'List all stores', 'Stores', 'name', 50, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23');
/*!40000 ALTER TABLE `__resource_lists` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_list_layout
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
) ENGINE=InnoDB AUTO_INCREMENT=325130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_list_layout: ~29 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_layout` DISABLE KEYS */;
INSERT INTO `__resource_list_layout` (`id`, `resource_list`, `label`, `field`, `relation`, `nest_relation1`, `nest_relation2`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(325101, 322101, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325102, 322101, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325103, 322102, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325104, 322102, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325105, 322103, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325106, 322103, 'Default Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325107, 322103, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325108, 322104, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325109, 322104, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325110, 322104, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325111, 322105, 'User', 'name', 308138, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325112, 322105, 'Settings', 'name', 308136, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325113, 322105, 'Value', 'value', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325114, 322105, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(325115, 322106, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325116, 322106, 'Email', 'email', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325117, 322106, 'Reference', 'reference', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325118, 322107, 'Executive', 'name', 308142, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325119, 322107, 'Store', 'name', 308141, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325120, 322107, 'Area', 'name', 308140, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325121, 322107, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325122, 322108, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325123, 322108, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325124, 322108, 'Type', 'type', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325125, 322108, 'Status', 'status', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325126, 322109, 'Code', 'code', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325127, 322109, 'Name', 'name', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325128, 322109, 'Company Code', 'cocode', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(325129, 322109, 'Branch Code', 'brcode', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24');
/*!40000 ALTER TABLE `__resource_list_layout` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_list_relations
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
) ENGINE=InnoDB AUTO_INCREMENT=324106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_list_relations: ~5 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_relations` DISABLE KEYS */;
INSERT INTO `__resource_list_relations` (`id`, `resource_list`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `nest_relation4`, `nest_relation5`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(324101, 322105, 308136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(324102, 322105, 308138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(324103, 322107, 308140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(324104, 322107, 308141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23'),
	(324105, 322107, 308142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23');
/*!40000 ALTER TABLE `__resource_list_relations` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_list_scopes
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
) ENGINE=InnoDB AUTO_INCREMENT=323102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_list_scopes: ~1 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_scopes` DISABLE KEYS */;
INSERT INTO `__resource_list_scopes` (`id`, `resource_list`, `scope`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(323101, 322106, 307101, NULL, NULL, '2019-07-18 13:04:23', '2019-07-18 13:04:23');
/*!40000 ALTER TABLE `__resource_list_scopes` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_list_search
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
) ENGINE=InnoDB AUTO_INCREMENT=326116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_list_search: ~15 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_search` DISABLE KEYS */;
INSERT INTO `__resource_list_search` (`id`, `resource_list`, `field`, `relation`, `nest_relation1`, `nest_relation2`, `nest_relation3`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(326101, 322101, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326102, 322102, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326103, 322103, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326104, 322103, 'description', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326105, 322104, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326106, 322104, 'reference', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326107, 322104, 'email', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:24', '2019-07-18 13:04:24'),
	(326108, 322105, 'name', 308138, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326109, 322105, 'name', 308136, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326110, 322106, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326111, 322107, 'name', 308140, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326112, 322107, 'name', 308141, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326113, 322107, 'name', 308142, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326114, 322108, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25'),
	(326115, 322109, 'name', NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:25', '2019-07-18 13:04:25');
/*!40000 ALTER TABLE `__resource_list_search` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_metrics
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_metrics: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `__resource_metrics` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_relations
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
) ENGINE=InnoDB AUTO_INCREMENT=308167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_relations: ~66 rows (approximately)
/*!40000 ALTER TABLE `__resource_relations` DISABLE KEYS */;
INSERT INTO `__resource_relations` (`id`, `resource`, `name`, `description`, `method`, `type`, `relate_resource`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(308101, 305104, 'TaxDetail', 'Details and sub taxes', 'Detail', 'hasMany', 305105, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308102, 305105, 'Tax', 'Detail of Tax', 'Tax', 'belongsTo', 305104, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308103, 305107, 'Tax', 'Detail of Tax', 'Tax', 'belongsTo', 305104, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308104, 305108, 'Belongs', 'Detail of main group this group belongs', 'Belongs', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308105, 305108, 'Parent', 'The parent group details of this group', 'Parent', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308106, 305108, 'Tax01', 'Details of Tax for this group', 'Tax', 'belongsTo', 305104, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(308107, 305108, 'Tax02', 'Details of Sub Tax for this group', 'Tax2', 'belongsTo', 305104, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308108, 305109, 'Group01', 'Detail of group this product belongs to via group 01', 'Group01', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308109, 305109, 'Group02', 'Detail of group this product belongs to via group 02', 'Group02', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308110, 305109, 'Group03', 'Detail of group this product belongs to via group 03', 'Group03', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308111, 305109, 'Group04', 'Detail of group this product belongs to via group 04', 'Group04', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308112, 305109, 'Group05', 'Detail of group this product belongs to via group 05', 'Group05', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308113, 305109, 'Group06', 'Detail of group this product belongs to via group 06', 'Group06', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308114, 305109, 'Group07', 'Detail of group this product belongs to via group 07', 'Group07', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308115, 305109, 'Group08', 'Detail of group this product belongs to via group 08', 'Group08', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308116, 305109, 'Group09', 'Detail of group this product belongs to via group 09', 'Group09', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308117, 305109, 'Group10', 'Detail of group this product belongs to via group 10', 'Group10', 'belongsTo', 305108, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308118, 305108, 'ProductsAsOfGroup01', 'Products belongs to this group via group 01', 'ProductsAsOfGroup01', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308119, 305108, 'ProductsAsOfGroup02', 'Products belongs to this group via group 02', 'ProductsAsOfGroup02', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308120, 305108, 'ProductsAsOfGroup03', 'Products belongs to this group via group 03', 'ProductsAsOfGroup03', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308121, 305108, 'ProductsAsOfGroup04', 'Products belongs to this group via group 04', 'ProductsAsOfGroup04', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308122, 305108, 'ProductsAsOfGroup05', 'Products belongs to this group via group 05', 'ProductsAsOfGroup05', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308123, 305108, 'ProductsAsOfGroup06', 'Products belongs to this group via group 06', 'ProductsAsOfGroup06', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308124, 305108, 'ProductsAsOfGroup07', 'Products belongs to this group via group 07', 'ProductsAsOfGroup07', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308125, 305108, 'ProductsAsOfGroup08', 'Products belongs to this group via group 08', 'ProductsAsOfGroup08', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308126, 305108, 'ProductsAsOfGroup09', 'Products belongs to this group via group 09', 'ProductsAsOfGroup09', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308127, 305108, 'ProductsAsOfGroup10', 'Products belongs to this group via group 10', 'ProductsAsOfGroup10', 'hasMany', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308128, 305110, 'Items', 'Each items of this pricelist', 'Items', 'hasMany', 305111, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308129, 305111, 'Pricelist', 'Details of pricelist this item belongs to', 'Pricelist', 'belongsTo', 305110, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308130, 305111, 'Product', 'Details of product this item consist of', 'Product', 'belongsTo', 305109, NULL, NULL, '2019-07-18 13:04:17', '2019-07-18 13:04:17'),
	(308131, 305114, 'Area', 'Details of area', 'Area', 'belongsTo', 305113, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308132, 305114, 'Customer', 'Details of customer', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308133, 305113, 'User', 'Details of user', 'User', 'belongsToMany', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308134, 305103, 'Users', 'Users list corresponding to a settings', 'Users', 'hasMany', 305115, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308135, 305101, 'Area', 'Details of area', 'Area', 'belongsToMany', 305113, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308136, 305115, 'Settings', 'Details of settings this setting belongs to', 'Settings', 'belongsTo', 305103, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308137, 305101, 'Settings', 'Settings assigned for a user', 'Settings', 'hasMany', 305115, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308138, 305115, 'User', 'Details of user this settings belongs to', 'User', 'belongsTo', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308139, 305101, 'StoreAndArea', 'Store and Areas assigned for a user', 'StoreAndArea', 'hasMany', 305116, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308140, 305116, 'Area', 'Area details', 'Area', 'belongsTo', 305113, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308141, 305116, 'Store', 'Store Details', 'Store', 'belongsTo', 305112, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308142, 305116, 'User', 'User Details', 'User', 'belongsTo', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308143, 305112, 'Users', 'Users assigned to this store', 'Users', 'belongsToMany', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308144, 305113, 'StoreAndUser', 'Store and Users assigned to a area', 'StoreAndUser', 'hasMany', 305116, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308145, 305120, 'Product', 'Details of product', 'Product', 'belongsTo', 305109, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308146, 305120, 'Store', 'Details of store', 'Store', 'belongsTo', 305112, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308147, 305120, 'User', 'Details of user', 'User', 'belongsTo', 305101, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308148, 305120, 'Nature', 'Nature of transaction', 'Nature', 'belongsTo', 305118, NULL, NULL, '2019-07-18 13:04:18', '2019-07-18 13:04:18'),
	(308149, 305120, 'Type', 'Type of transaction', 'Type', 'belongsTo', 305119, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308150, 305112, 'ProductTransaction', 'Product transaction of a store', 'ProductTransaction', 'hasMany', 305120, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308151, 305121, 'Details', 'Product wise details of transaction', 'Details', 'hasMany', 305122, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308152, 305121, 'Products', 'Product transactions', 'Products', 'belongsToMany', 305120, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308153, 305122, 'Product', 'Product and its transaction details', 'Product', 'belongsTo', 305120, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308154, 305126, 'Items', 'Items of a transaction', 'Items', 'hasMany', 305127, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308155, 305127, 'Product', 'Product details of an sales order item', 'Product', 'belongsTo', 305109, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308156, 305128, 'IN', 'Stock in transactions', 'IN', 'belongsTo', 305121, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308157, 305128, 'OUT', 'Stock out transactions', 'OUT', 'belongsTo', 305121, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308158, 305126, 'Customer', 'The customer to which this sales order belongs', 'Customer', 'belongsTo', 305101, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308159, 305116, 'AssignedAreas', 'The user_areas which assigned to this record', 'AssignedAreas', 'hasMany', 305114, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308160, 305114, 'Users', 'The executives assigned to a area_user', 'Users', 'hasMany', 305116, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308161, 305116, 'Customers', 'Customers who are in selected records area', 'Customers', 'belongsToMany', 305101, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308162, 305101, 'AreaCustomers', 'List of customers belongs to the area which are assigned to a user', 'AreaCustomers', 'hasManyThrough', 305114, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308163, 305127, 'SalesOrder', 'Sales order details for a so item', 'SalesOrder', 'belongsTo', 305126, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308164, 305122, 'Transaction', 'Detail of transaction header', 'Transaction', 'belongsTo', 305121, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308165, 305132, 'SalesOrder', 'Sales order details', 'SalesOrder', 'belongsTo', 305126, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(308166, 305132, 'Transaction', 'Detail of transaction', 'Transaction', 'belongsTo', 305121, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19');
/*!40000 ALTER TABLE `__resource_relations` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_roles
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
) ENGINE=InnoDB AUTO_INCREMENT=306132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_roles: ~31 rows (approximately)
/*!40000 ALTER TABLE `__resource_roles` DISABLE KEYS */;
INSERT INTO `__resource_roles` (`id`, `resource`, `role`, `actions_availability`, `actions`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(306101, 305101, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306102, 305102, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306103, 305103, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306104, 305104, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306105, 305105, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306106, 305106, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306107, 305107, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306108, 305108, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306109, 305109, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306110, 305110, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306111, 305111, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306112, 305112, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306113, 305113, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306114, 305114, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:15', '2019-07-18 13:04:15'),
	(306115, 305115, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306116, 305116, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306117, 305117, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306118, 305118, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306119, 305119, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306120, 305120, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306121, 305121, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306122, 305122, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306123, 305123, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306124, 305124, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306125, 305125, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306126, 305126, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306127, 305127, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306128, 305128, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306129, 305129, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306130, 305130, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16'),
	(306131, 305131, 303101, 'All', NULL, NULL, NULL, '2019-07-18 13:04:16', '2019-07-18 13:04:16');
/*!40000 ALTER TABLE `__resource_roles` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__resource_scopes
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
) ENGINE=InnoDB AUTO_INCREMENT=307108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table smartsalemaster.__resource_scopes: ~7 rows (approximately)
/*!40000 ALTER TABLE `__resource_scopes` DISABLE KEYS */;
INSERT INTO `__resource_scopes` (`id`, `resource`, `name`, `description`, `method`, `arg1`, `arg2`, `arg3`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(307101, 305101, 'SalesExecutives', 'User where has group reference as SLS', 'salesExecutive', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307102, 305116, 'Assigned', 'The store and area whih is assigned to the requesting user', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307103, 305114, 'Assigned', 'The records where area is assigned to the requester', 'assigned', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307104, 305126, 'AssignedAreaCustomer', 'Sales orders of customers belongs to a area which assigned to a executive', 'assignedAreaCustomer', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307105, 305121, 'AssignedCustomerTransactions', 'Transactions related to customers who are assigned to the requesting executive', 'assignedCustomerTransactions', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307106, 305130, 'AssignedCustomerReceipts', 'Receipts related to customers who are assigned to the requesting executive', 'assignedCustomerReceipts', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:19', '2019-07-18 13:04:19'),
	(307107, 305132, 'AssignedCustomerSalesOrder', 'The records of sales order in which sales order belongs to any assigned customer', 'assignedCustomerSalesOrder', NULL, NULL, NULL, NULL, NULL, '2019-07-18 13:04:20', '2019-07-18 13:04:20');
/*!40000 ALTER TABLE `__resource_scopes` ENABLE KEYS */;

-- Dumping structure for table smartsalemaster.__roles
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

-- Dumping data for table smartsalemaster.__roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `__roles` DISABLE KEYS */;
INSERT INTO `__roles` (`id`, `name`, `description`, `title`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(303101, 'eplus_administrators', 'ePlus administrators role', 'ePlus Administrator', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(303102, 'eplus_accountant', 'ePlus accountant role', 'ePlus Accountant', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14'),
	(303103, 'eplus_salesExecutive', 'ePlus sales executive', 'ePlus Sales Executive', NULL, NULL, '2019-07-18 13:04:14', '2019-07-18 13:04:14');
/*!40000 ALTER TABLE `__roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



CREATE FUNCTION `OUTSTANDINGASON`(`V_ACCCODE` CHAR(15), `V_DATE` DATETIME, `V_PDC` ENUM('Yes','No'), `V_OUTSTANDING` ENUM('Normal','Overdue','Critical'))
RETURNS decimal(24,4)
BEGIN
DECLARE V_AMT DECIMAL(24,4);
	SELECT IFNULL(SUM(AMT*SIGN),0)  INTO V_AMT
	FROM bill_data D
	WHERE  ACCCODE = V_ACCCODE
	AND CANCEL ='No' AND DATE(DOCDATE)<=V_DATE
	AND ( V_PDC  = 'Yes' Or CASE TYPE WHEN 'System' THEN 'Normal' ELSE CASE PDCSTATUS(COCODE,BRCODE,FYCODE,FNCODE,DOCNO,SRNO,V_DATE)
		WHEN 'Pending' THEN TYPE ELSE 'Normal' END END <>'PostDated')
	AND ( V_OUTSTANDING = 'Normal'
	OR	V_OUTSTANDING = 'Overdue' AND  BILLNO IN (SELECT BILLNO FROM bill_data WHERE ACCCODE = D.ACCCODE
		AND BILL_TYPE = 'Original' AND DUEDATE<V_DATE)
	OR	V_OUTSTANDING = 'Critical' AND  BILLNO IN (SELECT BILLNO FROM bill_data WHERE ACCCODE = D.ACCCODE
		AND BILL_TYPE = 'Original' AND DATE_ADD(DUEDATE, INTERVAL 4 DAY )<V_DATE))	;
    RETURN V_AMT;
END



CREATE FUNCTION `PDCSTATUS`( `V_COCODE` CHAR(5), `V_BRCODE` CHAR(5), `V_FYCODE` CHAR(5), `V_FNCODE` CHAR(5), `V_DOCNO` CHAR(20), `V_SRNO` DECIMAL(10), `V_DATE` DATETIME )
RETURNS enum('Approved','Pending','Rejected')
BEGIN
DECLARE V_CHQSTATUS ENUM('Approved', 'Pending', 'Rejected');
DECLARE V_PROCESSEDDATE DATETIME;
	SELECT CHQ_STATUS,PROCESSEDDATE INTO V_CHQSTATUS,V_PROCESSEDDATE FROM cheque_details WHERE COCODE = V_COCODE AND BRCODE = V_BRCODE
		AND FYCODE = V_FYCODE AND FNCODE = V_FNCODE AND DOCNO = V_DOCNO AND SRNO =V_SRNO
		ORDER BY VERSION DESC LIMIT 1;
	IF V_CHQSTATUS = 'Pending' THEN
		RETURN V_CHQSTATUS;
	ELSE
		IF V_DATE < V_PROCESSEDDATE THEN
			RETURN 'Pending';
		ELSE
			RETURN V_CHQSTATUS;
		END IF;
	END IF;
END




CREATE FUNCTION `PROCESSEDDATE`( `V_COCODE` CHAR(5), `V_BRCODE` CHAR(5), `V_FYCODE` CHAR(5), `V_FNCODE` CHAR(5), `V_DOCNO` CHAR(20), `V_SRNO` DECIMAL(10), `V_DATE` DATETIME )
RETURNS datetime
BEGIN
DECLARE V_CHQSTATUS ENUM('Approved', 'Pending', 'Rejected');
DECLARE V_TYPE ENUM('System','Normal','PostDated');
DECLARE V_DOCDATE DATETIME;
DECLARE V_PROCESSEDDATE DATETIME;
	SELECT TYPE,DOCDATE INTO V_TYPE,V_DOCDATE FROM d_data WHERE COCODE = V_COCODE AND BRCODE = V_BRCODE
		AND FYCODE = V_FYCODE AND FNCODE = V_FNCODE AND DOCNO = V_DOCNO AND SRNO =V_SRNO;
	IF V_TYPE = 'System' OR V_TYPE = 'Normal' THEN
		RETURN V_DOCDATE;
	END IF;

	SELECT CHQ_STATUS,PROCESSEDDATE INTO V_CHQSTATUS,V_PROCESSEDDATE FROM cheque_details WHERE COCODE = V_COCODE AND BRCODE = V_BRCODE
		AND FYCODE = V_FYCODE AND FNCODE = V_FNCODE AND DOCNO = V_DOCNO AND SRNO =V_SRNO
		ORDER BY VERSION DESC LIMIT 1;
	IF V_CHQSTATUS = 'Pending' THEN
		RETURN V_DOCDATE;
	ELSE
		IF V_DATE < V_PROCESSEDDATE THEN
			RETURN V_DOCDATE;
		ELSE
			RETURN V_PROCESSEDDATE;
		END IF;
	END IF;
END




CREATE FUNCTION `TAXVALUE`(
	`V_TAXCODE` CHAR(15),
	`V_QTY` DECIMAL(30,10),
	`V_AMOUNT` DECIMAL(30,10),
	`V_MRP` DECIMAL(30,10)
)
RETURNS decimal(30,10)
BEGIN
DECLARE V_DONE INT DEFAULT FALSE;
DECLARE V_CODE CHAR(15);
DECLARE V_AMOUNT_DECIMAL DECIMAL;
DECLARE V_TAXAMOUNT DECIMAL(30,10);
DECLARE V_TOTALTAXAMOUNT DECIMAL(30,10);
DECLARE V_PERCENTAGE DECIMAL(5,2);
DECLARE V_PERCENTAGEEQUATION VARCHAR(200);
DECLARE V_TAXRULEAMOUNT DECIMAL(30,10);
DECLARE V_TAXTYPE ENUM ('TaxOnTaxableAmount','TaxOnMRP','TaxOnTotalAmount','TaxOnTax','TaxOnTotalTax','TaxOnQuantity','FixedTax');
DECLARE V_INPUTCODE CHAR(15);
DECLARE V_OUTPUTCODE CHAR(15);
DECLARE V_REFTAXCODE CHAR(15);
DECLARE V_TAXNATURE ENUM('Tax','SubTax','AdditionalTax');
DECLARE TAXCURSOR CURSOR FOR SELECT code,percentage,percentageequation,amount,taxtype,taxnature,inputcode,outputcode,reftaxcode
	FROM tax_details
	WHERE taxcode = V_TAXCODE AND (amount<>0 OR percentage<>0 OR IFNULL(percentageequation,'') <>'')
	ORDER BY processorder;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET V_DONE = TRUE;
	DROP TEMPORARY TABLE IF EXISTS TAXTABLE ;
	CREATE TEMPORARY TABLE TAXTABLE(
	TAXCODE CHAR(15) NOT NULL,
	CODE CHAR(15) NOT NULL,
	INPUTCODE CHAR(15) NOT NULL,
	OUTPUTCODE CHAR(15) NOT NULL,
   TAXNATURE ENUM('Tax','SubTax','AdditionalTax') NOT NULL DEFAULT 'Tax',
   AMOUNT DECIMAL(30,10),
	PRIMARY KEY (TAXCODE,CODE)
	)  COMMENT='Temporary Tax Table';
	SELECT AMOUNT_DECIMAL INTO V_AMOUNT_DECIMAL FROM setup WHERE CODE='01';
	SET V_TAXAMOUNT =0;
   SET V_TOTALTAXAMOUNT = 0;
	OPEN TAXCURSOR;
	REPEAT
	FETCH TAXCURSOR INTO V_CODE,V_PERCENTAGE,V_PERCENTAGEEQUATION,V_TAXRULEAMOUNT,V_TAXTYPE,V_TAXNATURE,V_INPUTCODE,V_OUTPUTCODE,V_REFTAXCODE ;
	IF NOT V_DONE THEN
		IF V_TAXTYPE='TaxOnTaxableAmount' THEN
			IF V_PERCENTAGEEQUATION <>'' THEN
				SET V_PERCENTAGE= GETTAXPERCENTAGE(V_PERCENTAGEEQUATION,V_AMOUNT);
			END IF;
			SET V_TAXAMOUNT = ROUND(V_AMOUNT*V_PERCENTAGE*0.01,V_AMOUNT_DECIMAL);
		ELSEIF V_TAXTYPE='TaxOnTax' THEN
			SELECT AMOUNT INTO V_TAXAMOUNT FROM TAXTABLE WHERE TAXCODE = V_TAXCODE AND CODE = V_REFTAXCODE;
			SET V_TAXAMOUNT = ROUND(V_TAXAMOUNT*V_PERCENTAGE*0.01,V_AMOUNT_DECIMAL);
		ELSEIF V_TAXTYPE='TaxOnTotalAmount' THEN
			SET V_TAXAMOUNT = ROUND((V_AMOUNT+V_TOTALTAXAMOUNT)*V_PERCENTAGE*0.01,V_AMOUNT_DECIMAL);
		ELSEIF V_TAXTYPE='TaxOnTotalTax' THEN
			SET V_TAXAMOUNT = ROUND(V_TOTALTAXAMOUNT*V_PERCENTAGE*0.01,V_AMOUNT_DECIMAL);
      ELSEIF V_TAXTYPE='TaxOnMRP' THEN
			IF V_PERCENTAGEEQUATION <>'' THEN
				SET V_PERCENTAGE= GETTAXPERCENTAGE(V_PERCENTAGEEQUATION,V_MRP);
			END IF;
			SET V_TAXAMOUNT = ROUND(V_MRP*V_PERCENTAGE*0.01,V_AMOUNT_DECIMAL);
		ELSEIF V_TAXTYPE='TaxOnQuantity' THEN
			SET V_TAXAMOUNT = ROUND(V_QTY*V_TAXRULEAMOUNT,V_AMOUNT_DECIMAL);
		ELSE
			SET V_TAXAMOUNT = ROUND(V_AMOUNT,V_AMOUNT_DECIMAL);
		END IF;
		INSERT INTO TAXTABLE (TAXCODE,CODE,INPUTCODE,OUTPUTCODE,TAXNATURE,AMOUNT)
			VALUES (V_TAXCODE,V_CODE,V_INPUTCODE,V_OUTPUTCODE,V_TAXNATURE,V_TAXAMOUNT);
		SET V_TOTALTAXAMOUNT = V_TOTALTAXAMOUNT + V_TAXAMOUNT;
	END IF;
	UNTIL V_DONE END REPEAT;
	CLOSE TAXCURSOR;
	SELECT SUM(AMOUNT) INTO V_TAXAMOUNT FROM TAXTABLE;
   RETURN V_TAXAMOUNT;
END




CREATE FUNCTION `TAXCODE`(
	`V_CODE` CHAR(30)
)
RETURNS char(15) CHARSET utf8
BEGIN
DECLARE V_TAXRULE CHAR(15);
	SELECT tax1 INTO V_TAXRULE FROM productgroup G,products P
		WHERE P.group1 = G.id AND P.code = V_CODE;
    RETURN V_TAXRULE;
END




CREATE FUNCTION `GETTAXPERCENTAGE`(
	`V_PERCENTAGEEQUATION` VARCHAR(200),
	`V_AMOUNT` DECIMAL(24,4)
)
RETURNS VARCHAR(200) CHARSET utf8
BEGIN
DECLARE V_PERCENTAGE DECIMAL(5,2);
DECLARE V_STPOS INT;
DECLARE V_ENPOS INT;
DECLARE V_STATEMENT VARCHAR(200);
DECLARE V_PART1 VARCHAR(200);
DECLARE V_PART2 VARCHAR(200);
DECLARE V_PART3 VARCHAR(200);
DECLARE V_PART11 VARCHAR(200);
DECLARE V_PART12 VARCHAR(200);
DECLARE V_SYMB CHAR(2);
	SET V_PERCENTAGE = 0;
	SET V_STPOS= LOCATE('IF(',V_PERCENTAGEEQUATION);
	IF V_STPOS = 0 THEN
		RETURN V_PERCENTAGE;
	END IF;
    SET V_PERCENTAGEEQUATION = SUBSTRING(V_PERCENTAGEEQUATION,3+V_STPOS);
    SET V_ENPOS= LOCATE(',',V_PERCENTAGEEQUATION);
    SET V_PART1 = SUBSTRING(V_PERCENTAGEEQUATION,1,V_ENPOS - 1);
    SET V_PERCENTAGEEQUATION = SUBSTRING(V_PERCENTAGEEQUATION,V_ENPOS + 1);
    SET V_ENPOS= LOCATE(',',V_PERCENTAGEEQUATION);
    SET V_PART2 = SUBSTRING(V_PERCENTAGEEQUATION,1,V_ENPOS - 1);
    SET V_PERCENTAGEEQUATION = SUBSTRING(V_PERCENTAGEEQUATION,V_ENPOS + 1);
    SET V_ENPOS= LOCATE(')',V_PERCENTAGEEQUATION);
    SET V_PART3 = SUBSTRING(V_PERCENTAGEEQUATION,1,V_ENPOS - 1);
    SET V_SYMB = '';
    SET V_STPOS= LOCATE('>=',V_PART1);
    IF V_STPOS = 0 THEN
		SET V_STPOS= LOCATE('<=',V_PART1);
    ELSE
		SET V_SYMB = '>=';
	END IF;
	IF V_SYMB = ''  THEN
		IF V_STPOS = 0 THEN
			SET V_STPOS= LOCATE('<>',V_PART1);
		ELSE
			SET V_SYMB = '<=';
		END IF;
	END IF;
    IF V_SYMB = ''  THEN
		IF V_STPOS = 0 THEN
			SET V_STPOS= LOCATE('=',V_PART1);
		ELSE
			SET V_SYMB = '<>';
		END IF;
	END IF;
    IF V_SYMB = ''  THEN
		IF V_STPOS = 0 THEN
			SET V_STPOS= LOCATE('>',V_PART1);
		ELSE
			SET V_SYMB = '=';
		END IF;
	END IF;
    IF V_SYMB = ''  THEN
		IF V_STPOS = 0 THEN
			SET V_STPOS= LOCATE('<',V_PART1);
		ELSE
			SET V_SYMB = '>';
		END IF;
	END IF;
    IF V_SYMB = ''  THEN
		IF V_STPOS <> 0 THEN
			SET V_SYMB = '<';
		END IF;
	END IF;
    SET V_PART11 = SUBSTRING(V_PART1,1,V_STPOS - 1);
    SET V_PART12 = SUBSTRING(V_PART1,V_STPOS + 1);
    SET V_PART11 = REPLACE(V_PART11,'[VAL]',V_AMOUNT);
    SET V_PART11 = REPLACE(V_PART11,'%','*0.01');
    SET V_PART12 = REPLACE(V_PART12,'[VAL]',V_AMOUNT);
    SET V_PART12 = REPLACE(V_PART12,'%','*0.01');
    CASE V_SYMB
		WHEN '=' THEN
		IF GETDECIMALRESULT(V_PART11) =  GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
        WHEN '<' THEN
		IF GETDECIMALRESULT(V_PART11) <  GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
        WHEN '>' THEN
		IF GETDECIMALRESULT(V_PART11) >  GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
        WHEN '<=' THEN
        SET V_PART12 = SUBSTRING(V_PART12,2);
		IF GETDECIMALRESULT(V_PART11) >  GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
        WHEN '>=' THEN
        SET V_PART12 = SUBSTRING(V_PART12,2);
		IF GETDECIMALRESULT(V_PART11) >=  GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
        WHEN '<>' THEN
        SET V_PART12 = SUBSTRING(V_PART12,2);
		IF GETDECIMALRESULT(V_PART11) <> GETDECIMALRESULT(V_PART12) THEN
			RETURN V_PART2;
		ELSE
			RETURN V_PART3;
		END IF;
	END CASE;
    RETURN 0;
END





CREATE FUNCTION `GETDECIMALRESULT`(
	`V_STRING` VARCHAR(200)
)
RETURNS decimal(24,4)
BEGIN
DECLARE V_OPERATOR VARCHAR(30);
DECLARE V_NEXTOPERATOR VARCHAR(30);
DECLARE V_OPINDEX INT;
DECLARE V_CHAR CHAR(1);
DECLARE V_DECIMALVAL DECIMAL(24,4);
DECLARE V_RESULT DECIMAL(24,4);
DECLARE V_POS INT;
	SET V_RESULT = 1;
    SET V_NEXTOPERATOR = '*';
	WHILE V_STRING<>'' DO
		SET V_OPERATOR = V_NEXTOPERATOR;
		SET V_POS = 1;
        LABEL1: LOOP
			IF V_POS <= LENGTH(V_STRING) THEN
				SET V_CHAR = SUBSTRING(V_STRING,V_POS,1);
				IF V_CHAR = '+' OR V_CHAR = '-' OR V_CHAR = '*' OR V_CHAR = '/' THEN
					SET V_NEXTOPERATOR = SUBSTRING(V_STRING,V_POS,1);
                    LEAVE LABEL1;
				END IF;
				SET V_POS = V_POS + 1;
				ITERATE LABEL1;
			END IF;
			LEAVE LABEL1;
		END LOOP LABEL1;
        SET V_OPINDEX = V_POS ;
        IF V_OPINDEX<>0 THEN
			SET V_DECIMALVAL=SUBSTRING(V_STRING,1,V_OPINDEX -1 ) ;
            SET V_STRING=SUBSTRING(V_STRING,V_OPINDEX + 1) ;
		ELSE
			SET V_DECIMALVAL=V_STRING;
			SET V_STRING='';
        END IF;
        CASE V_OPERATOR
			WHEN '+' THEN
				SET V_RESULT = V_RESULT+V_DECIMALVAL;
			WHEN '-' THEN
				SET V_RESULT = V_RESULT - V_DECIMALVAL ;
			WHEN '*' THEN
				SET V_RESULT = V_RESULT*V_DECIMALVAL;
			WHEN '/' THEN
				SET V_RESULT = V_RESULT / V_DECIMALVAL ;
			ELSE
				SET V_RESULT = V_RESULT*V_DECIMALVAL;
		END CASE;
	END WHILE;
	RETURN V_RESULT;
END
