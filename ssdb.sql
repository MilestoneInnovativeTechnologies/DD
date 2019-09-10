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
/*!40000 ALTER TABLE `fn_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `fn_reserves` ENABLE KEYS */;

-- Dumping structure for table appframe.functiondetails
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
  `ratewithtax` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `discount01` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discount02base` enum('Net','Gross') COLLATE utf8mb4_unicode_ci DEFAULT 'Net',
  `discount03` enum('NotRequired','Amount','Percentage') COLLATE utf8mb4_unicode_ci DEFAULT 'NotRequired',
  `discountmode` enum('None','PriceList','Custom','Buy_nX_Get_mY','Account','User','Branch') COLLATE utf8mb4_unicode_ci DEFAULT 'None',
  `discount` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list` char(15) COLLATE utf8mb4_unicode_ci DEFAULT '01',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `functiondetails_code_index` (`code`),
  KEY `functiondetails_category_index` (`category`),
  KEY `functiondetails_wtype_index` (`wtype`),
  KEY `functiondetails_created_by_index` (`created_by`),
  KEY `functiondetails_updated_by_index` (`updated_by`),
  CONSTRAINT `functiondetails_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `functiondetails_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.functiondetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `functiondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `functiondetails` ENABLE KEYS */;

-- Dumping structure for table appframe.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.migrations: ~76 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(352, '2014_10_12_000000_create_users_table', 1),
	(353, '2014_10_12_100000_create_password_resets_table', 1),
	(354, '2019_01_24_000002_create___groups_table', 1),
	(355, '2019_01_24_000003_create___group_users_table', 1),
	(356, '2019_01_24_000004_create___roles_table', 1),
	(357, '2019_01_24_000005_create___group_roles_table', 1),
	(358, '2019_01_24_000006_create___resources_table', 1),
	(359, '2019_01_24_000007_create___resource_roles_table', 1),
	(360, '2019_01_24_000008_create___resource_relations_table', 1),
	(361, '2019_01_24_000009_create___resource_scopes_table', 1),
	(362, '2019_01_24_000010_create___resource_forms_table', 1),
	(363, '2019_01_24_000011_create___resource_form_fields_table', 1),
	(364, '2019_01_24_000012_create___resource_form_field_attrs_table', 1),
	(365, '2019_01_24_000013_create___resource_form_field_data_table', 1),
	(366, '2019_01_24_000014_create___resource_form_field_validations_table', 1),
	(367, '2019_01_24_000015_create___resource_form_field_options_table', 1),
	(368, '2019_01_24_000016_create___resource_form_field_depends_table', 1),
	(369, '2019_01_24_000017_create___resource_form_field_dynamic_table', 1),
	(370, '2019_01_24_000018_create___resource_form_layout_table', 1),
	(371, '2019_01_24_000019_create___resource_form_collection_table', 1),
	(372, '2019_01_24_000020_create___resource_form_upload_table', 1),
	(373, '2019_01_24_000021_create___resource_form_defaults_table', 1),
	(374, '2019_01_24_000022_create___resource_lists_table', 1),
	(375, '2019_01_24_000023_create___resource_list_relations_table', 1),
	(376, '2019_01_24_000024_create___resource_list_scopes_table', 1),
	(377, '2019_01_24_000025_create___resource_list_layout_table', 1),
	(378, '2019_01_24_000026_create___resource_list_search_table', 1),
	(379, '2019_01_24_000027_create___resource_data_table', 1),
	(380, '2019_01_24_000028_create___resource_data_relations_table', 1),
	(381, '2019_01_24_000029_create___resource_data_scopes_table', 1),
	(382, '2019_01_24_000030_create___resource_data_view_sections_table', 1),
	(383, '2019_01_24_000031_create___resource_data_view_section_items_table', 1),
	(384, '2019_01_24_000032_create___resource_form_data_map_table', 1),
	(385, '2019_01_24_000033_create___resource_actions_table', 1),
	(386, '2019_01_24_000034_create___resource_action_attrs_table', 1),
	(387, '2019_01_24_000035_create___resource_action_methods_table', 1),
	(388, '2019_01_24_000036_create___resource_action_lists_table', 1),
	(389, '2019_01_24_000037_create___resource_action_data_table', 1),
	(390, '2019_01_24_000038_create___resource_defaults_table', 1),
	(391, '2019_01_24_000039_create___resource_metrics_table', 1),
	(392, '2019_01_24_000040_create___resource_dashboard_table', 1),
	(393, '2019_01_24_000041_create___resource_dashboard_sections_table', 1),
	(394, '2019_01_24_000042_create___resource_dashboard_section_items_table', 1),
	(395, '2019_01_24_000043_create___organisation_table', 1),
	(396, '2019_01_24_000044_create___organisation_contacts_table', 1),
	(397, '2019_03_01_000001_add_ss_fields_in_users_table', 1),
	(398, '2019_03_01_000002_add_ss_fields_in_groups_table', 1),
	(399, '2019_03_01_000003_add_ss_fields_in_roles_table', 1),
	(400, '2019_03_28_000046_create_setup_table', 1),
	(401, '2019_03_28_000047_create_settings_table', 1),
	(402, '2019_03_28_000048_create_fiscalyearmaster_table', 1),
	(403, '2019_03_28_000049_create_functiondetails_table', 1),
	(404, '2019_03_28_000050_create_product_group_master_table', 1),
	(405, '2019_03_28_000051_create_products_table', 1),
	(406, '2019_03_28_000052_create_product_groups_table', 1),
	(407, '2019_03_28_000053_create_pricelist_table', 1),
	(408, '2019_03_28_000054_create_pricelist_products_table', 1),
	(409, '2019_03_28_000055_create_stores_table', 1),
	(410, '2019_03_28_000056_create_areas_table', 1),
	(411, '2019_03_28_000057_create_area_users_table', 1),
	(412, '2019_03_28_000058_create_user_settings_table', 1),
	(413, '2019_03_28_000059_create_user_store_area_table', 1),
	(414, '2019_03_28_000060_create_store_products_table', 1),
	(415, '2019_03_28_000061_create_product_transaction_natures_table', 1),
	(416, '2019_03_28_000062_create_product_transaction_types_table', 1),
	(417, '2019_03_28_000063_create_store_product_transactions_table', 1),
	(418, '2019_03_28_000064_create_transactions_table', 1),
	(419, '2019_03_28_000065_create_transaction_details_table', 1),
	(420, '2019_03_28_000066_create_d_data_table', 1),
	(421, '2019_03_28_000067_create_sales_order_table', 1),
	(422, '2019_03_28_000068_create_sales_order_items_table', 1),
	(423, '2019_03_28_000069_create_stock_transfer_table', 1),
	(424, '2019_03_28_000070_create_receipts_table', 1),
	(425, '2019_03_28_000071_create_fn_reserves_table', 1),
	(426, '2019_03_28_000072_create_sales_order_sales_table', 1),
	(427, '2019_03_28_000073_create_w_bin_table', 1);
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
  `taxcode` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxfactor` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
  `subtaxfactor` decimal(30,10) NOT NULL DEFAULT '0.0000000000',
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
  KEY `products_taxcode_index` (`taxcode`),
  KEY `products_taxcode02_index` (`taxcode02`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_updated_by_index` (`updated_by`),
  CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.products: ~0 rows (approximately)
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
/*!40000 ALTER TABLE `product_group_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_group_master` ENABLE KEYS */;

-- Dumping structure for table appframe.product_transaction_natures
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
  CONSTRAINT `product_transaction_natures_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_transaction_natures_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.product_transaction_natures: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_transaction_natures` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_transaction_natures` ENABLE KEYS */;

-- Dumping structure for table appframe.product_transaction_types
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
  CONSTRAINT `product_transaction_types_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_transaction_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.product_transaction_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `product_transaction_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_transaction_types` ENABLE KEYS */;

-- Dumping structure for table appframe.receipts
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
  CONSTRAINT `receipts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `receipts_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.receipts: ~0 rows (approximately)
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
  CONSTRAINT `sales_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_items_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `sales_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_items` ENABLE KEYS */;

-- Dumping structure for table appframe.sales_order_sales
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
  CONSTRAINT `sales_order_sales_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_so_foreign` FOREIGN KEY (`so`) REFERENCES `sales_order` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sales_order_sales_transaction_foreign` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.sales_order_sales: ~0 rows (approximately)
/*!40000 ALTER TABLE `sales_order_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_sales` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;

-- Dumping structure for table appframe.store_products
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
  CONSTRAINT `store_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_products_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_products_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.store_products: ~0 rows (approximately)
/*!40000 ALTER TABLE `store_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_products` ENABLE KEYS */;

-- Dumping structure for table appframe.store_product_transactions
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
  CONSTRAINT `store_product_transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_nature_foreign` FOREIGN KEY (`nature`) REFERENCES `product_transaction_natures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_store_foreign` FOREIGN KEY (`store`) REFERENCES `stores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_type_foreign` FOREIGN KEY (`type`) REFERENCES `product_transaction_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_product_transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.store_product_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `store_product_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_product_transactions` ENABLE KEYS */;

-- Dumping structure for table appframe.transactions
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
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transactions_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table appframe.transaction_details
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
  CONSTRAINT `transaction_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_spt_foreign` FOREIGN KEY (`spt`) REFERENCES `store_product_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_details_transaction_foreign` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.transaction_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;

-- Dumping structure for table appframe.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outstanding` decimal(30,10) DEFAULT '0.0000000000',
  `overdue` decimal(30,10) DEFAULT '0.0000000000',
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

-- Dumping data for table appframe.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `__groups` DISABLE KEYS */;
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
  CONSTRAINT `__group_roles_role_foreign` FOREIGN KEY (`role`) REFERENCES `__roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_group_foreign` FOREIGN KEY (`group`) REFERENCES `__groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__group_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `__group_roles` DISABLE KEYS */;
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
  CONSTRAINT `__group_users_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__group_users_group_foreign` FOREIGN KEY (`group`) REFERENCES `__groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__group_users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__group_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `__group_users` DISABLE KEYS */;
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
  CONSTRAINT `__resources_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resources_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resources: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resources` DISABLE KEYS */;
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
  CONSTRAINT `__resource_actions_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_actions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_actions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_actions: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_actions` DISABLE KEYS */;
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
  CONSTRAINT `__resource_action_attrs_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_attrs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_attrs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_attrs: ~0 rows (approximately)
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
  CONSTRAINT `__resource_action_data_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_data` DISABLE KEYS */;
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
  CONSTRAINT `__resource_action_lists_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_lists_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_lists: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_lists` DISABLE KEYS */;
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
  CONSTRAINT `__resource_action_methods_resource_action_foreign` FOREIGN KEY (`resource_action`) REFERENCES `__resource_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_methods_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_action_methods_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_action_methods: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_action_methods` DISABLE KEYS */;
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
  CONSTRAINT `__resource_dashboard_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard: ~0 rows (approximately)
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
  CONSTRAINT `__resource_dashboard_sections_resource_dashboard_foreign` FOREIGN KEY (`resource_dashboard`) REFERENCES `__resource_dashboard` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_sections_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_sections_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard_sections: ~0 rows (approximately)
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
  CONSTRAINT `__resource_dashboard_section_items_section_foreign` FOREIGN KEY (`section`) REFERENCES `__resource_dashboard_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_section_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_dashboard_section_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_dashboard_section_items: ~0 rows (approximately)
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
  CONSTRAINT `__resource_data_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_data` DISABLE KEYS */;
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
  CONSTRAINT `__resource_data_relations_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_relations` DISABLE KEYS */;
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
  CONSTRAINT `__resource_data_scopes_scope_foreign` FOREIGN KEY (`scope`) REFERENCES `__resource_scopes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_scopes: ~0 rows (approximately)
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
  CONSTRAINT `__resource_data_view_sections_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_sections_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_view_sections: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_view_sections` DISABLE KEYS */;
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
  CONSTRAINT `__resource_data_view_section_items_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_section_foreign` FOREIGN KEY (`section`) REFERENCES `__resource_data_view_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_data_view_section_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_data_view_section_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_data_view_section_items` DISABLE KEYS */;
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
  CONSTRAINT `__resource_defaults_update_foreign` FOREIGN KEY (`update`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_create_foreign` FOREIGN KEY (`create`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_list_foreign` FOREIGN KEY (`list`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_read_foreign` FOREIGN KEY (`read`) REFERENCES `__resource_actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_defaults_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_defaults: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_defaults` DISABLE KEYS */;
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
  CONSTRAINT `__resource_forms_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_forms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_forms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_forms: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_forms` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_collection_foreign_field_foreign` FOREIGN KEY (`foreign_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_collection_form_foreign` FOREIGN KEY (`collection_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_collection_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_collection: ~0 rows (approximately)
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
  CONSTRAINT `__resource_form_data_map_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_resource_data_foreign` FOREIGN KEY (`resource_data`) REFERENCES `__resource_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_data_map_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_data_map: ~0 rows (approximately)
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
  CONSTRAINT `__resource_form_defaults_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_defaults_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_defaults: ~0 rows (approximately)
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
  CONSTRAINT `__resource_form_fields_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_fields_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_fields_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_fields: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_fields` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_field_attrs_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_attrs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_attrs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_attrs: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_attrs` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_field_data_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_data_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_data` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_field_depends_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_depends_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_depends_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_depends: ~0 rows (approximately)
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
  CONSTRAINT `__resource_form_field_dynamic_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_dynamic_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_dynamic_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_dynamic: ~0 rows (approximately)
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
  CONSTRAINT `__resource_form_field_options_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_options` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_field_validations_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_validations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_field_validations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_field_validations: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_field_validations` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_layout_form_field_foreign` FOREIGN KEY (`form_field`) REFERENCES `__resource_form_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_resource_form_foreign` FOREIGN KEY (`resource_form`) REFERENCES `__resource_forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_layout_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_layout: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_form_layout` DISABLE KEYS */;
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
  CONSTRAINT `__resource_form_upload_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_form_upload_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_form_upload: ~0 rows (approximately)
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
  CONSTRAINT `__resource_lists_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_lists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_lists_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_lists: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_lists` DISABLE KEYS */;
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
  CONSTRAINT `__resource_list_layout_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_layout_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_layout: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_layout` DISABLE KEYS */;
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
  CONSTRAINT `__resource_list_relations_nest_relation5_foreign` FOREIGN KEY (`nest_relation5`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_nest_relation4_foreign` FOREIGN KEY (`nest_relation4`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_relations` DISABLE KEYS */;
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
  CONSTRAINT `__resource_list_scopes_scope_foreign` FOREIGN KEY (`scope`) REFERENCES `__resource_scopes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_scopes: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_scopes` DISABLE KEYS */;
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
  CONSTRAINT `__resource_list_search_nest_relation3_foreign` FOREIGN KEY (`nest_relation3`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_nest_relation1_foreign` FOREIGN KEY (`nest_relation1`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_nest_relation2_foreign` FOREIGN KEY (`nest_relation2`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_relation_foreign` FOREIGN KEY (`relation`) REFERENCES `__resource_relations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_list_search_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_list_search: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_list_search` DISABLE KEYS */;
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
  CONSTRAINT `__resource_metrics_resource_list_foreign` FOREIGN KEY (`resource_list`) REFERENCES `__resource_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_metrics_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_metrics: ~0 rows (approximately)
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
  CONSTRAINT `__resource_relations_relate_resource_foreign` FOREIGN KEY (`relate_resource`) REFERENCES `__resources` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_relations_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_relations` DISABLE KEYS */;
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
  CONSTRAINT `__resource_roles_role_foreign` FOREIGN KEY (`role`) REFERENCES `__roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_roles` DISABLE KEYS */;
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
  CONSTRAINT `__resource_scopes_resource_foreign` FOREIGN KEY (`resource`) REFERENCES `__resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `__resource_scopes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__resource_scopes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__resource_scopes: ~0 rows (approximately)
/*!40000 ALTER TABLE `__resource_scopes` DISABLE KEYS */;
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
  CONSTRAINT `__roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `__roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table appframe.__roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `__roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `__roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
