/*
 Navicat Premium Data Transfer

 Source Server         : kc
 Source Server Type    : PostgreSQL
 Source Server Version : 140003
 Source Host           : localhost:5432
 Source Catalog        : db_kc
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140003
 File Encoding         : 65001

 Date: 19/06/2023 16:36:34
*/


-- ----------------------------
-- Sequence structure for tbl_assets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_assets_id_seq";
CREATE SEQUENCE "public"."tbl_assets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_assets_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_assets_info_id_seq";
CREATE SEQUENCE "public"."tbl_assets_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_assign_asset_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_assign_asset_id_seq";
CREATE SEQUENCE "public"."tbl_assign_asset_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_audit_trail_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_audit_trail_id_seq";
CREATE SEQUENCE "public"."tbl_audit_trail_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_brand_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_brand_id_seq";
CREATE SEQUENCE "public"."tbl_brand_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_category_id_seq";
CREATE SEQUENCE "public"."tbl_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_company_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_company_id_seq";
CREATE SEQUENCE "public"."tbl_company_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_depertment_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_depertment_id_seq";
CREATE SEQUENCE "public"."tbl_depertment_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_employee_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_employee_id_seq";
CREATE SEQUENCE "public"."tbl_employee_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_items_id_seq";
CREATE SEQUENCE "public"."tbl_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_module_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_module_id_seq";
CREATE SEQUENCE "public"."tbl_module_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_physical_count_des_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_des_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_des_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_physical_count_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_physical_count_personnels_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_personnels_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_personnels_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_physical_count_ras_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_ras_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_ras_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_physical_count_rcs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_rcs_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_rcs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_position_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_position_id_seq";
CREATE SEQUENCE "public"."tbl_position_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_racks_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_racks_id_seq";
CREATE SEQUENCE "public"."tbl_racks_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_services_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_services_id_seq";
CREATE SEQUENCE "public"."tbl_services_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_services_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_services_report_id_seq";
CREATE SEQUENCE "public"."tbl_services_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_services_sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_services_sales_id_seq";
CREATE SEQUENCE "public"."tbl_services_sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_services_technical_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_services_technical_id_seq";
CREATE SEQUENCE "public"."tbl_services_technical_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_sub_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_sub_category_id_seq";
CREATE SEQUENCE "public"."tbl_sub_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_sub_module_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_sub_module_id_seq";
CREATE SEQUENCE "public"."tbl_sub_module_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_supplies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_supplies_id_seq";
CREATE SEQUENCE "public"."tbl_supplies_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_supplies_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_supplies_info_id_seq";
CREATE SEQUENCE "public"."tbl_supplies_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_tracker_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_tracker_id_seq";
CREATE SEQUENCE "public"."tbl_tracker_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_users_id_seq";
CREATE SEQUENCE "public"."tbl_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_users_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_users_permissions_id_seq";
CREATE SEQUENCE "public"."tbl_users_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for tbl_assets
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_assets";
CREATE TABLE "public"."tbl_assets" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_assets_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "category_id" int4,
  "sub_category_id" int4,
  "asset_tag" varchar(100) COLLATE "pg_catalog"."default",
  "is_released" int4,
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_assets
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_assets_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_assets_info";
CREATE TABLE "public"."tbl_assets_info" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_assets_info_id_seq'::regclass),
  "asset_id" int4,
  "brand" varchar(100) COLLATE "pg_catalog"."default",
  "color" varchar(50) COLLATE "pg_catalog"."default",
  "weight" varchar(50) COLLATE "pg_catalog"."default",
  "dimension" varchar(100) COLLATE "pg_catalog"."default",
  "appearance" varchar(20) COLLATE "pg_catalog"."default",
  "with_sidetable" varchar(15) COLLATE "pg_catalog"."default",
  "with_armrest" varchar(15) COLLATE "pg_catalog"."default",
  "assembly_required" varchar(15) COLLATE "pg_catalog"."default",
  "mount_type" varchar(50) COLLATE "pg_catalog"."default",
  "no_of_drawers" int4,
  "serial_no" varchar(100) COLLATE "pg_catalog"."default",
  "model" varchar(100) COLLATE "pg_catalog"."default",
  "os" varchar(100) COLLATE "pg_catalog"."default",
  "processor" varchar(100) COLLATE "pg_catalog"."default",
  "video_card" varchar(100) COLLATE "pg_catalog"."default",
  "ram" varchar(50) COLLATE "pg_catalog"."default",
  "hdd" varchar(50) COLLATE "pg_catalog"."default",
  "ssd" varchar(50) COLLATE "pg_catalog"."default",
  "input_connectivity" text COLLATE "pg_catalog"."default",
  "warranty" int4,
  "date_purchased" varchar(20) COLLATE "pg_catalog"."default",
  "resolution" varchar(100) COLLATE "pg_catalog"."default",
  "interface" varchar(50) COLLATE "pg_catalog"."default",
  "orientation" varchar(50) COLLATE "pg_catalog"."default",
  "dpi" int4,
  "no_of_keys" int4,
  "printer_type" varchar(50) COLLATE "pg_catalog"."default",
  "screen_size" varchar(50) COLLATE "pg_catalog"."default",
  "aspect_ratio" varchar(50) COLLATE "pg_catalog"."default",
  "refresh_rate" varchar(50) COLLATE "pg_catalog"."default",
  "equipment_type" varchar(50) COLLATE "pg_catalog"."default",
  "no_of_ports" int4,
  "data_transfer" varchar(100) COLLATE "pg_catalog"."default",
  "frequency" varchar(50) COLLATE "pg_catalog"."default",
  "tool" varchar(100) COLLATE "pg_catalog"."default",
  "stock" int4,
  "capacity" varchar(20) COLLATE "pg_catalog"."default",
  "extension" int4
)
;

-- ----------------------------
-- Records of tbl_assets_info
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_assign_asset
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_assign_asset";
CREATE TABLE "public"."tbl_assign_asset" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_assign_asset_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_id" int4,
  "category_id" int4,
  "sub_category_id" int4,
  "asset_id" int4,
  "issued_to" int4,
  "remarks" varchar(1000) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_assign_asset
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_audit_trail
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_audit_trail";
CREATE TABLE "public"."tbl_audit_trail" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_audit_trail_id_seq'::regclass),
  "series_no" varchar(150) COLLATE "pg_catalog"."default",
  "table_name" varchar(100) COLLATE "pg_catalog"."default",
  "item_id" int4,
  "field" varchar(50) COLLATE "pg_catalog"."default",
  "previous" text COLLATE "pg_catalog"."default",
  "current" text COLLATE "pg_catalog"."default",
  "action" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "date" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_audit_trail
-- ----------------------------
INSERT INTO "public"."tbl_audit_trail" VALUES (2, 'HRYVO9Z', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-06-09 15:30:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (3, '444H0V2', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 1, '2023-06-09 15:40:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (4, 'K0SHQQL', 'tbl_users', 3, 'all', NULL, NULL, 'create', 1, '2023-06-09 15:41:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (5, 'AXE0GVD', 'tbl_physical_count', 1, 'personnel', '[]', '[{"branch":"quezon_ave","employee":{"id":3,"name":"SY, CALVIN "},"type":"admin"}]', 'update', 1, '2023-06-09 15:41:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (6, '5RKYXBP', 'tbl_physical_count_personnels', 2, 'type', NULL, 'admin', 'update', 1, '2023-06-09 15:41:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (9, '6B924F3', 'tbl_physical_count_personnels', 2, 'assigned_by', NULL, '1', 'update', 1, '2023-06-09 15:41:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (7, '7V1HCA5', 'tbl_physical_count_personnels', 2, 'physical_count_id', NULL, '1', 'update', 1, '2023-06-09 15:41:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (8, 'DZRL9E3', 'tbl_physical_count_personnels', 2, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-06-09 15:41:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (10, 'G66TO68', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 1, '2023-06-09 16:27:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (11, 'W2H6YWF', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 1, '2023-06-09 16:28:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (12, '0Y8E46P', 'tbl_physical_count', 2, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:33:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (13, 'YMX28JO', 'tbl_physical_count', 2, 'personnel', '[]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":3,"name":"SY, CALVIN "}}]', 'update', 1, '2023-06-13 08:34:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (14, 'LI8VIJ2', 'tbl_physical_count_personnels', 2, 'physical_count_id', '1', '2', 'update', 1, '2023-06-13 08:34:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (15, 'C63SQBN', 'tbl_physical_count_personnels', 2, 'assigned_by', '1', '1', 'update', 1, '2023-06-13 08:34:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (16, '6MTEJJU', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:49:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (17, 'VK8FA5G', 'tbl_physical_count_rcs', 4, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:49:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (18, '4OG1KAH', 'tbl_physical_count_rcs', 5, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:49:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (19, 'Q4YGZR6', 'tbl_physical_count_rcs', 3, 'qty_mother_box', '0', '6', 'update', 1, '2023-06-13 08:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (20, '63SLJP5', 'tbl_physical_count_rcs', 3, 'qty_per_mother_box', '0', '40', 'update', 1, '2023-06-13 08:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (21, 'VRLCNQD', 'tbl_physical_count_rcs', 3, 'qty_small_box', '0', '', 'update', 1, '2023-06-13 08:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (22, '3V1BKWT', 'tbl_physical_count_rcs', 3, 'total', '0', '240', 'update', 1, '2023-06-13 08:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (23, 'F4Z47MY', 'tbl_physical_count_rcs', 4, 'qty_mother_box', '0', '0', 'update', 1, '2023-06-13 08:52:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (24, '5YM8BAV', 'tbl_physical_count_rcs', 4, 'qty_small_box', '0', '10', 'update', 1, '2023-06-13 08:52:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (25, '7C1A0CS', 'tbl_physical_count_rcs', 4, 'qty_per_small_box', '0', '100', 'update', 1, '2023-06-13 08:52:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (26, 'BSFU977', 'tbl_physical_count_rcs', 4, 'tingi', '0', '32', 'update', 1, '2023-06-13 08:52:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (27, 'H93U1ES', 'tbl_physical_count_rcs', 4, 'total', '0', '1032', 'update', 1, '2023-06-13 08:52:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (29, 'WWCEX2N', 'tbl_physical_count_rcs', 5, 'qty_per_mother_box', '0', '50', 'update', 1, '2023-06-13 08:52:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (28, 'AEW7OHN', 'tbl_physical_count_rcs', 5, 'qty_mother_box', '0', '5', 'update', 1, '2023-06-13 08:52:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (30, 'CQ5LEN9', 'tbl_physical_count_rcs', 5, 'total', '0', '282', 'update', 1, '2023-06-13 08:52:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (31, 'CUU42CP', 'tbl_physical_count_rcs', 5, 'tingi', '0', '32', 'update', 1, '2023-06-13 08:52:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (32, 'KLJ5569', 'tbl_users', 4, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:54:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (33, '7AXBD11', 'tbl_physical_count_ras', 1, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:56:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (34, 'D1X786E', 'tbl_physical_count_ras', 2, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:56:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (35, 'TE3X2T8', 'tbl_physical_count_ras', 3, 'all', NULL, NULL, 'create', 1, '2023-06-13 08:56:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (36, 'J3VOQJY', 'tbl_physical_count_ras', 1, 'qty_mother_box', '0', '6', 'update', 1, '2023-06-13 08:58:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (37, 'I9ZNKHP', 'tbl_physical_count_ras', 1, 'qty_per_mother_box', '0', '40', 'update', 1, '2023-06-13 08:58:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (38, 'L8MPULZ', 'tbl_physical_count_ras', 1, 'total', '0', '240', 'update', 1, '2023-06-13 08:58:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (39, 'TJXC50M', 'tbl_physical_count_ras', 2, 'qty_mother_box', '0', '10', 'update', 1, '2023-06-13 08:59:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (40, 'RKJIGIE', 'tbl_physical_count_ras', 2, 'qty_per_mother_box', '0', '100', 'update', 1, '2023-06-13 08:59:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (41, 'TJEUNZC', 'tbl_physical_count_ras', 2, 'tingi', '0', '32', 'update', 1, '2023-06-13 08:59:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (42, 'ISH3RT0', 'tbl_physical_count_ras', 2, 'total', '0', '1032', 'update', 1, '2023-06-13 08:59:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (43, 'WDGGRCQ', 'tbl_physical_count_ras', 3, 'qty_mother_box', '0', '5', 'update', 1, '2023-06-13 09:00:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (44, '65ID2WJ', 'tbl_physical_count_ras', 3, 'qty_per_mother_box', '0', '50', 'update', 1, '2023-06-13 09:00:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (45, '95HEODL', 'tbl_physical_count_ras', 3, 'total', '0', '250', 'update', 1, '2023-06-13 09:00:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (46, '5SLUOVT', 'tbl_department', 5, 'all', NULL, NULL, 'create', 1, '2023-06-13 09:12:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (47, '9UACVYU', 'tbl_position', 6, 'all', NULL, NULL, 'create', 1, '2023-06-13 09:12:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (48, '89RBL7B', 'tbl_users', 5, 'all', NULL, NULL, 'create', 1, '2023-06-13 09:13:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (49, '3XU0OLU', 'tbl_department', 6, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:24:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (50, 'MFR5H73', 'tbl_position', 7, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:24:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (51, 'X5CAX10', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:25:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (52, 'CMZSS4H', 'tbl_position', 8, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:29:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (53, 'BXL6639', 'tbl_users', 3, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:30:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (54, 'GYYYQW2', 'tbl_department', 7, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:32:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (55, 'V55GN3Y', 'tbl_position', 9, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:32:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (56, 'BGOSHU7', 'tbl_users', 4, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:33:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (57, 'VG07IQG', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 1, '2023-06-13 11:34:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (58, '9B9F2ND', 'tbl_physical_count', 1, 'personnel', '[]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"LASAM, MARLON UY"}}]', 'update', 1, '2023-06-13 11:39:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (59, 'C9IY1GJ', 'tbl_physical_count_personnels', 2, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-06-13 11:39:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (60, 'K7AZGS1', 'tbl_physical_count_personnels', 2, 'physical_count_id', NULL, '1', 'update', 1, '2023-06-13 11:39:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (61, 'GTJPDV5', 'tbl_physical_count_personnels', 2, 'type', NULL, 'admin', 'update', 1, '2023-06-13 11:39:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (62, 'HRIL3D5', 'tbl_physical_count_personnels', 2, 'assigned_by', NULL, '1', 'update', 1, '2023-06-13 11:39:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (63, 'UTGC3WQ', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 2, '2023-06-14 13:53:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (64, '3O3X2GR', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 2, '2023-06-14 13:54:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (65, 'AICENB5', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 2, '2023-06-14 13:54:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (66, 'VRCHL01', 'tbl_physical_count_rcs', 1, 'count_by', '4', 'undefined', 'update', 2, '2023-06-14 14:11:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (67, '3BCKMPZ', 'tbl_physical_count_rcs', 1, 'count_by', '4', 'undefined', 'update', 2, '2023-06-14 14:12:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (68, '8XAEE4D', 'tbl_physical_count_rcs', 2, 'count_by', '4', 'undefined', 'update', 2, '2023-06-14 14:12:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (69, 'PZ86NLW', 'tbl_physical_count_rcs', 25, 'qty_mother_box', '0', '10', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (70, 'Z60E7KJ', 'tbl_physical_count_rcs', 25, 'qty_per_mother_box', '0', '100', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (71, 'DWBTA7P', 'tbl_physical_count_rcs', 25, 'qty_small_box', '0', '0', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (72, 'PMDCGX3', 'tbl_physical_count_rcs', 25, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (73, 'UN9CYB2', 'tbl_physical_count_rcs', 25, 'tingi', '0', '23', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (74, '5JBFXK5', 'tbl_physical_count_rcs', 25, 'total', '0', '1023', 'update', 4, '2023-06-14 15:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (76, 'I8OIPGT', 'tbl_physical_count_rcs', 24, 'qty_per_mother_box', '0', '100', 'update', 4, '2023-06-14 15:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (75, 'OFO7GVV', 'tbl_physical_count_rcs', 24, 'qty_mother_box', '0', '10', 'update', 4, '2023-06-14 15:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (77, 'VTIME58', 'tbl_physical_count_rcs', 24, 'qty_small_box', '0', '0', 'update', 4, '2023-06-14 15:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (78, 'JJ2QRL4', 'tbl_physical_count_rcs', 24, 'tingi', '0', '32', 'update', 4, '2023-06-14 15:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (79, 'LMTOVMW', 'tbl_physical_count_rcs', 24, 'total', '0', '1032', 'update', 4, '2023-06-14 15:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (80, 'R9VAIZ3', 'tbl_physical_count_rcs', 23, 'qty_mother_box', '0', '10', 'update', 4, '2023-06-14 15:24:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (81, 'R04BD1Z', 'tbl_physical_count_rcs', 23, 'qty_per_mother_box', '0', '40', 'update', 4, '2023-06-14 15:24:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (82, 'OKOO4RT', 'tbl_physical_count_rcs', 23, 'qty_small_box', '0', '0', 'update', 4, '2023-06-14 15:24:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (83, 'MCZH5BK', 'tbl_physical_count_rcs', 23, 'total', '0', '400', 'update', 4, '2023-06-14 15:24:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (84, 'D3P6P26', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 1, '2023-06-15 09:20:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (85, '3E77LW7', 'tbl_physical_count', 1, 'personnel', '[]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"LASAM, MARLON UY"}}]', 'update', 1, '2023-06-15 09:20:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (87, 'Y9ZTS6C', 'tbl_physical_count_personnels', 1, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-06-15 09:20:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (86, 'PD47RJH', 'tbl_physical_count_personnels', 1, 'physical_count_id', NULL, '1', 'update', 1, '2023-06-15 09:20:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (88, 'RDHL65K', 'tbl_physical_count_personnels', 1, 'type', NULL, 'admin', 'update', 1, '2023-06-15 09:20:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (89, 'ZGFOR97', 'tbl_physical_count_personnels', 1, 'assigned_by', NULL, '1', 'update', 1, '2023-06-15 09:20:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (90, 'P0X8Y5C', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 2, '2023-06-15 09:55:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (91, '01XI1IH', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 2, '2023-06-15 09:55:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (92, 'H4OHISV', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 2, '2023-06-15 09:55:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (93, '3KU3423', 'tbl_physical_count_rcs', 4, 'all', NULL, NULL, 'create', 2, '2023-06-15 09:55:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (94, 'CCHWLS7', 'tbl_physical_count_rcs', 27, 'qty_mother_box', '0', '10', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (95, 'GCRAHJG', 'tbl_physical_count_rcs', 27, 'qty_per_mother_box', '0', '100', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (96, 'J0NNPDJ', 'tbl_physical_count_rcs', 27, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (97, 'EPOLWGK', 'tbl_physical_count_rcs', 27, 'qty_small_box', '0', '0', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (98, 'MQKHAAE', 'tbl_physical_count_rcs', 27, 'tingi', '0', '32', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (99, 'IMKQULL', 'tbl_physical_count_rcs', 27, 'total', '0', '1032', 'update', 4, '2023-06-15 10:29:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (100, 'TX2XB2A', 'tbl_physical_count_rcs', 26, 'qty_mother_box', '0', '7', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (101, 'XKCQ8JZ', 'tbl_physical_count_rcs', 26, 'qty_per_mother_box', '0', '100', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (102, 'EAAETZ0', 'tbl_physical_count_rcs', 26, 'qty_small_box', '0', '0', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (103, 'IQNCBP2', 'tbl_physical_count_rcs', 26, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (104, 'MR4TCTB', 'tbl_physical_count_rcs', 26, 'tingi', '0', '23', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (105, 'P0QWW4D', 'tbl_physical_count_rcs', 26, 'total', '0', '723', 'update', 4, '2023-06-15 10:30:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (106, 'VP2DAPH', 'tbl_physical_count_rcs', 20, 'qty_per_mother_box', '0', '0', 'update', 4, '2023-06-15 10:30:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (107, 'K3AM4FJ', 'tbl_physical_count_rcs', 20, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-15 10:30:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (108, 'GJ4OB6U', 'tbl_physical_count_rcs', 20, 'qty_small_box', '0', '0', 'update', 4, '2023-06-15 10:30:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (109, 'XVT7R00', 'tbl_physical_count_rcs', 20, 'tingi', '0', '82', 'update', 4, '2023-06-15 10:30:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (110, 'SP4DEFX', 'tbl_physical_count_rcs', 20, 'total', '0', '82', 'update', 4, '2023-06-15 10:30:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (111, 'XOZHBU3', 'tbl_physical_count_rcs', 19, 'qty_per_mother_box', '0', '0', 'update', 4, '2023-06-15 10:31:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (112, 'VCFM2XR', 'tbl_physical_count_rcs', 19, 'qty_small_box', '0', '5', 'update', 4, '2023-06-15 10:31:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (113, 'D5CPA9R', 'tbl_physical_count_rcs', 19, 'qty_per_small_box', '0', '50', 'update', 4, '2023-06-15 10:31:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (114, 'PNTT1KD', 'tbl_physical_count_rcs', 19, 'tingi', '0', '43', 'update', 4, '2023-06-15 10:31:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (115, 'TWHIJNM', 'tbl_physical_count_rcs', 19, 'total', '0', '293', 'update', 4, '2023-06-15 10:31:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (116, '1AG47UA', 'tbl_physical_count_ras', 4, 'count_by', NULL, '3', 'update', 2, '2023-06-15 11:18:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (117, 'LFNQGVQ', 'tbl_physical_count_ras', 3, 'count_by', NULL, '3', 'update', 2, '2023-06-15 11:18:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (118, 'BXGILRW', 'tbl_physical_count_ras', 2, 'count_by', NULL, '3', 'update', 2, '2023-06-15 11:18:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (119, '7DI1QCJ', 'tbl_physical_count_ras', 1, 'count_by', NULL, '3', 'update', 2, '2023-06-15 11:18:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (120, '7E5UL6A', 'tbl_physical_count_ras', 26, 'tingi', '0', '0', 'update', 3, '2023-06-15 15:02:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (121, 'AHVO30T', 'tbl_physical_count_ras', 26, 'qty_mother_box', '0', '7', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (122, 'F1YCVDL', 'tbl_physical_count_ras', 26, 'qty_per_mother_box', '0', '100', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (123, 'K4955BQ', 'tbl_physical_count_ras', 26, 'qty_per_small_box', '0', '0', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (124, 'MS30GUD', 'tbl_physical_count_ras', 26, 'qty_small_box', '0', '0', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (125, 'HCDJJ5S', 'tbl_physical_count_ras', 26, 'tingi', '0', '23', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (126, 'QZ63H6X', 'tbl_physical_count_ras', 26, 'total', '0', '723', 'update', 3, '2023-06-15 15:06:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (127, 'ZV1FG2V', 'tbl_physical_count_ras', 20, 'tingi', '0', '80', 'update', 3, '2023-06-15 15:07:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (128, 'SM66UPB', 'tbl_physical_count_ras', 20, 'total', '0', '80', 'update', 3, '2023-06-15 15:07:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (129, 'JIEVNW0', 'tbl_physical_count_ras', 20, 'qty_mother_box', '0', '0', 'update', 3, '2023-06-15 15:11:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (130, '2TITSG2', 'tbl_physical_count_ras', 20, 'tingi', '0', '80', 'update', 3, '2023-06-15 15:11:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (131, 'NQQER3T', 'tbl_physical_count_ras', 20, 'total', '0', '80', 'update', 3, '2023-06-15 15:11:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (132, '73YFFS6', 'tbl_physical_count_ras', 20, 'tingi', '0', '80', 'update', 3, '2023-06-15 15:21:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (133, 'JJNQWNZ', 'tbl_physical_count_ras', 20, 'total', '0', '80', 'update', 3, '2023-06-15 15:21:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (134, 'EUFXQIB', 'tbl_physical_count_ras', 19, 'qty_small_box', '0', '5', 'update', 3, '2023-06-15 15:22:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (135, 'Z1PNO9F', 'tbl_physical_count_ras', 19, 'qty_per_small_box', '0', '50', 'update', 3, '2023-06-15 15:22:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (136, 'ZV84VMG', 'tbl_physical_count_ras', 19, 'tingi', '0', '43', 'update', 3, '2023-06-15 15:22:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (137, 'K2X2R29', 'tbl_physical_count_ras', 19, 'total', '0', '293', 'update', 3, '2023-06-15 15:22:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (138, '9AXF0VX', 'tbl_physical_count_rcs', 8, 'all', NULL, NULL, 'create', 2, '2023-06-16 08:32:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (139, 'F6WA88I', 'tbl_physical_count_rcs', 18, 'qty_mother_box', '0', '5', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (140, '9N4MOLN', 'tbl_physical_count_rcs', 18, 'qty_per_mother_box', '0', '70', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (141, 'XAYXKCY', 'tbl_physical_count_rcs', 18, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (142, '48ZC1C8', 'tbl_physical_count_rcs', 18, 'qty_small_box', '0', '0', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (143, 'PREEIKL', 'tbl_physical_count_rcs', 18, 'tingi', '0', '56', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (144, 'TLFP912', 'tbl_physical_count_rcs', 18, 'total', '0', '406', 'update', 4, '2023-06-16 08:33:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (145, 'RHEM95K', 'tbl_physical_count_ras', 5, 'count_by', NULL, '3', 'update', 2, '2023-06-16 08:33:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (146, 'HD0J3T6', 'tbl_company', 6, 'all', NULL, NULL, 'create', 1, '2023-06-16 10:03:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (147, '4LQNLRF', 'tbl_department', 8, 'all', NULL, NULL, 'create', 1, '2023-06-16 10:03:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (148, 'AX1HR5W', 'tbl_position', 10, 'all', NULL, NULL, 'create', 1, '2023-06-16 10:04:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (149, '1DDVMJK', 'tbl_users', 5, 'all', NULL, NULL, 'create', 1, '2023-06-16 10:04:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (150, '0J0NRKM', 'tbl_physical_count_des', 2, 'count_by', NULL, '5', 'update', 2, '2023-06-16 10:06:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (151, '5BVRJOQ', 'tbl_physical_count_des', 1, 'count_by', NULL, '5', 'update', 2, '2023-06-16 10:06:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (152, 'J1R2LNI', 'tbl_physical_count_des', 20, 'tingi', '0', '83', 'update', 5, '2023-06-16 11:20:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (153, '2XJN7J8', 'tbl_physical_count_des', 20, 'total', '0', '83', 'update', 5, '2023-06-16 11:20:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (154, 'DDGOQ1D', 'tbl_physical_count_des', 19, 'qty_mother_box', '0', '5', 'update', 5, '2023-06-16 11:21:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (155, '3D20UVQ', 'tbl_physical_count_des', 19, 'qty_per_mother_box', '0', '50', 'update', 5, '2023-06-16 11:21:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (156, 'IE7KZRM', 'tbl_physical_count_des', 19, 'total', '0', '250', 'update', 5, '2023-06-16 11:21:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (157, 'A7GJDIN', 'tbl_users_permissions', 1, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{},"submodule_6":{}},"module_2":{"submodule_7":{"list":true,"create":true,"update":true,"export":true},"submodule_8":{"list":false},"status":false}}', 'update', 1, '2023-06-16 11:42:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (158, 'QB74DVO', 'tbl_users_permissions', 2, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true},"submodule_6":{"list":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{},"status":true}}', 'update', 1, '2023-06-16 11:42:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (159, '593ZBTR', 'tbl_users_permissions', 4, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true},"submodule_6":{"list":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{},"status":true}}', 'update', 1, '2023-06-16 11:43:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (160, 'OHO26WI', 'tbl_users_permissions', 3, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true,"create":true,"update":false,"export":true},"submodule_6":{"list":true,"create":true,"update":true,"export":true},"status":true},"module_2":{"submodule_7":{"list":true,"create":true,"export":true},"submodule_8":{},"status":true}}', 'update', 1, '2023-06-16 11:43:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (161, 'P6ZVJ97', 'tbl_physical_count_rcs', 9, 'all', NULL, NULL, 'create', 2, '2023-06-16 14:49:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (162, 'Q1JJX8V', 'tbl_physical_count', 2, 'all', NULL, NULL, 'create', 1, '2023-06-19 08:23:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (163, '37GTRRD', 'tbl_department', 9, 'all', NULL, NULL, 'create', 1, '2023-06-19 08:31:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (164, 'UPH2XGO', 'tbl_position', 11, 'all', NULL, NULL, 'create', 1, '2023-06-19 08:31:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (165, '0S5XYL6', 'tbl_users', 6, 'all', NULL, NULL, 'create', 1, '2023-06-19 08:31:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (166, 'YGGRKZ2', 'tbl_physical_count_personnels', 1, 'physical_count_id', '1', '2', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (167, '02K2KK7', 'tbl_physical_count_personnels', 5, 'physical_count_id', NULL, '2', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (168, 'EOQR9FK', 'tbl_physical_count', 2, 'personnel', '[]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"LASAM, MARLON UY"}},{"branch":"sto_domingo","employee":{"id":6,"name":"CO, FRANCIS LIM"},"type":"admin"}]', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (169, 'CTV7OJ0', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (170, '0Q5FQZ6', 'tbl_physical_count_personnels', 5, 'branch', NULL, 'sto_domingo', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (171, 'NBZYR82', 'tbl_physical_count_personnels', 5, 'type', NULL, 'admin', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (172, 'WD6B33B', 'tbl_physical_count_personnels', 5, 'assigned_by', NULL, '1', 'update', 1, '2023-06-19 08:32:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (173, 'RAFFICI', 'tbl_users', 7, 'all', NULL, NULL, 'create', 1, '2023-06-19 09:24:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (174, 'KNBBXAC', 'tbl_physical_count_rcs', 10, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (175, '05WVQR7', 'tbl_physical_count_rcs', 11, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (176, '536SVJ7', 'tbl_physical_count_rcs', 12, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (177, 'AAMAL5T', 'tbl_physical_count_rcs', 13, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (178, '2D2QTCQ', 'tbl_physical_count_rcs', 14, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (179, '9GB19A4', 'tbl_physical_count_rcs', 15, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (180, '31SRFJM', 'tbl_physical_count_rcs', 16, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (181, 'KW33B00', 'tbl_physical_count_rcs', 17, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (182, '933YLHU', 'tbl_physical_count_rcs', 18, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (183, '87DZZCW', 'tbl_physical_count_rcs', 19, 'all', NULL, NULL, 'create', 2, '2023-06-19 09:25:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (184, 'IU7797S', 'tbl_physical_count_rcs', 14, 'count_by', '4', '7', 'update', 2, '2023-06-19 09:25:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (185, 'HRHX4UA', 'tbl_physical_count_rcs', 14, 'count_by', '7', '4', 'update', 2, '2023-06-19 09:25:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (186, 'K5PGB7R', 'tbl_physical_count_rcs', 15, 'qty_mother_box', '0', '3', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (187, '9RV1G5Z', 'tbl_physical_count_rcs', 15, 'qty_per_mother_box', '0', '100', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (188, '9IIMS1M', 'tbl_physical_count_rcs', 15, 'qty_small_box', '0', '0', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (189, 'FBBCWZS', 'tbl_physical_count_rcs', 15, 'qty_per_small_box', '0', '0', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (190, '00T5RD4', 'tbl_physical_count_rcs', 15, 'total', '0', '343', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (191, '2CZJBXE', 'tbl_physical_count_rcs', 15, 'tingi', '0', '43', 'update', 7, '2023-06-19 09:27:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (192, '6X5IF1L', 'tbl_physical_count_ras', 6, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:28:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (193, 'ISYGNVC', 'tbl_users_permissions', 5, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true,"create":true,"update":true},"submodule_6":{"list":true,"create":true,"update":true},"status":true},"module_2":{"submodule_7":{"list":true,"create":true,"update":true,"export":true},"submodule_8":{"list":true,"create":true,"update":true,"export":true},"status":true}}', 'update', 1, '2023-06-19 09:38:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (194, 'Q9ANO1P', 'tbl_physical_count_rcs', 14, 'qty_mother_box', '0', '7', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (195, '17C7KV4', 'tbl_physical_count_rcs', 14, 'qty_per_mother_box', '0', '50', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (196, 'JGEI02S', 'tbl_physical_count_rcs', 14, 'qty_small_box', '0', '4', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (197, 'BCPVO5M', 'tbl_physical_count_rcs', 14, 'qty_per_small_box', '0', '10', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (198, 'HJEMM1A', 'tbl_physical_count_rcs', 14, 'tingi', '0', '8', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (199, 'ZSZBX4W', 'tbl_physical_count_rcs', 14, 'total', '0', '398', 'update', 7, '2023-06-19 09:41:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (200, 'H412I18', 'tbl_physical_count_rcs', 13, 'qty_mother_box', '0', '0', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (201, 'RQXJZC3', 'tbl_physical_count_rcs', 13, 'qty_per_mother_box', '0', '0', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (202, '1WT7PUM', 'tbl_physical_count_rcs', 13, 'qty_small_box', '0', '7', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (203, '82KCQR4', 'tbl_physical_count_rcs', 13, 'qty_per_small_box', '0', '100', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (204, '89C3ERH', 'tbl_physical_count_rcs', 13, 'tingi', '0', '83', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (205, 'JUF7FHA', 'tbl_physical_count_rcs', 13, 'total', '0', '783', 'update', 7, '2023-06-19 09:41:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (206, 'Z8V1F55', 'tbl_physical_count_rcs', 12, 'qty_small_box', '0', '7', 'update', 7, '2023-06-19 09:42:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (207, '50T8YQK', 'tbl_physical_count_rcs', 12, 'qty_per_small_box', '0', '150', 'update', 7, '2023-06-19 09:42:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (208, '9KD28E1', 'tbl_physical_count_rcs', 12, 'total', '0', '1173', 'update', 7, '2023-06-19 09:42:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (209, '5ACKSSU', 'tbl_physical_count_rcs', 12, 'tingi', '0', '123', 'update', 7, '2023-06-19 09:42:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (210, '1OAYR1V', 'tbl_physical_count_rcs', 11, 'qty_small_box', '0', '5', 'update', 7, '2023-06-19 09:42:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (211, '9NMK3FM', 'tbl_physical_count_rcs', 11, 'qty_per_small_box', '0', '120', 'update', 7, '2023-06-19 09:42:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (212, 'WQF23Q0', 'tbl_physical_count_rcs', 11, 'tingi', '0', '63', 'update', 7, '2023-06-19 09:42:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (213, '5BO8386', 'tbl_physical_count_rcs', 11, 'total', '0', '663', 'update', 7, '2023-06-19 09:42:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (214, '2GFKA90', 'tbl_physical_count_ras', 10, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:43:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (215, 'EUITO1G', 'tbl_physical_count_ras', 9, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:43:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (216, '2ZZB2P4', 'tbl_physical_count_ras', 8, 'count_by', NULL, '5', 'update', 2, '2023-06-19 09:43:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (217, 'AC9A0CE', 'tbl_physical_count_ras', 7, 'count_by', NULL, '5', 'update', 2, '2023-06-19 09:43:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (218, 'TI54EY9', 'tbl_physical_count_rcs', 3, 'qty_small_box', '0', '10', 'update', 4, '2023-06-19 09:47:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (219, 'ZWUQT0P', 'tbl_physical_count_rcs', 3, 'qty_per_small_box', '0', '120', 'update', 4, '2023-06-19 09:47:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (220, 'OUZK5MU', 'tbl_physical_count_rcs', 3, 'tingi', '0', '66', 'update', 4, '2023-06-19 09:47:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (221, 'K6HRXR0', 'tbl_physical_count_rcs', 3, 'total', '0', '1266', 'update', 4, '2023-06-19 09:47:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (222, 'GVEZOA6', 'tbl_physical_count_rcs', 2, 'qty_mother_box', '0', '8', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (223, 'YMUUAK5', 'tbl_physical_count_rcs', 2, 'qty_per_mother_box', '0', '150', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (224, 'A9PG3Z9', 'tbl_physical_count_rcs', 2, 'qty_small_box', '0', '0', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (225, 'DHQRBLX', 'tbl_physical_count_rcs', 2, 'qty_per_small_box', '0', '0', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (226, 'FFLW738', 'tbl_physical_count_rcs', 2, 'tingi', '0', '0', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (227, '2KPFQF0', 'tbl_physical_count_rcs', 2, 'total', '0', '1200', 'update', 4, '2023-06-19 09:49:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (228, '4ZK57L8', 'tbl_physical_count_rcs', 1, 'qty_mother_box', '0', '10', 'update', 4, '2023-06-19 09:50:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (229, '8Z5GDU6', 'tbl_physical_count_rcs', 1, 'qty_per_mother_box', '0', '200', 'update', 4, '2023-06-19 09:50:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (230, 'D4R01BT', 'tbl_physical_count_rcs', 1, 'total', '0', '2000', 'update', 4, '2023-06-19 09:50:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (231, 'CZ10CYT', 'tbl_physical_count_rcs', 5, 'qty_mother_box', '0', '5', 'update', 4, '2023-06-19 09:50:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (232, 'BZRHUKZ', 'tbl_physical_count_rcs', 5, 'qty_per_mother_box', '0', '500', 'update', 4, '2023-06-19 09:50:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (233, '8CZ8TMC', 'tbl_physical_count_rcs', 5, 'total', '0', '2500', 'update', 4, '2023-06-19 09:50:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (234, 'FTBINRV', 'tbl_physical_count_rcs', 4, 'qty_small_box', '0', '50', 'update', 4, '2023-06-19 09:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (235, 'QZ28TEK', 'tbl_physical_count_rcs', 4, 'qty_per_small_box', '0', '50', 'update', 4, '2023-06-19 09:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (236, 'W7URZ38', 'tbl_physical_count_rcs', 4, 'tingi', '0', '45', 'update', 4, '2023-06-19 09:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (237, 'NPEV3IE', 'tbl_physical_count_rcs', 4, 'total', '0', '2545', 'update', 4, '2023-06-19 09:51:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (238, 'DKV71IX', 'tbl_physical_count_ras', 15, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:51:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (239, '6620KD1', 'tbl_physical_count_ras', 14, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:51:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (240, '7K99PZ2', 'tbl_physical_count_ras', 13, 'count_by', NULL, '5', 'update', 2, '2023-06-19 09:51:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (241, 'OT6BT98', 'tbl_physical_count_ras', 12, 'count_by', NULL, '5', 'update', 2, '2023-06-19 09:51:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (242, '0E3EXGQ', 'tbl_physical_count_ras', 11, 'count_by', NULL, '3', 'update', 2, '2023-06-19 09:52:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (243, '618ZUIT', 'tbl_physical_count_ras', 2, 'qty_mother_box', '0', '8', 'update', 5, '2023-06-19 10:14:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (244, 'CZG2E3G', 'tbl_physical_count_ras', 2, 'qty_per_mother_box', '0', '150', 'update', 5, '2023-06-19 10:14:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (245, '8DYHRN2', 'tbl_physical_count_ras', 2, 'total', '0', '1200', 'update', 5, '2023-06-19 10:14:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (246, 'K7GW6VQ', 'tbl_physical_count_ras', 1, 'qty_mother_box', '0', '10', 'update', 5, '2023-06-19 10:15:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (247, 'LXNZ1K6', 'tbl_physical_count_ras', 1, 'total', '0', '2000', 'update', 5, '2023-06-19 10:15:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (248, '4NBSXQD', 'tbl_physical_count_ras', 1, 'qty_per_mother_box', '0', '200', 'update', 5, '2023-06-19 10:15:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (249, '87JVDZR', 'tbl_physical_count_ras', 14, 'qty_mother_box', '0', '7', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (250, '77CZH3A', 'tbl_physical_count_ras', 14, 'qty_per_mother_box', '0', '50', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (251, '7L1MUI1', 'tbl_physical_count_ras', 14, 'qty_small_box', '0', '4', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (252, '1HECP4Z', 'tbl_physical_count_ras', 14, 'qty_per_small_box', '0', '10', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (253, 'GI6MJNB', 'tbl_physical_count_ras', 14, 'tingi', '0', '8', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (254, 'NKEWJV5', 'tbl_physical_count_ras', 14, 'total', '0', '398', 'update', 5, '2023-06-19 10:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (255, '4MBLF4R', 'tbl_physical_count_ras', 13, 'qty_small_box', '0', '7', 'update', 5, '2023-06-19 10:20:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (256, 'EG25NVC', 'tbl_physical_count_ras', 13, 'qty_per_small_box', '0', '100', 'update', 5, '2023-06-19 10:20:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (257, 'HNNRNGE', 'tbl_physical_count_ras', 13, 'total', '0', '785', 'update', 5, '2023-06-19 10:20:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (258, 'ENR4LBT', 'tbl_physical_count_ras', 13, 'tingi', '0', '85', 'update', 5, '2023-06-19 10:20:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (259, 'RKZ2G6W', 'tbl_physical_count_ras', 3, 'qty_small_box', '0', '10', 'update', 3, '2023-06-19 10:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (260, 'Z28TJI8', 'tbl_physical_count_ras', 3, 'tingi', '0', '60', 'update', 3, '2023-06-19 10:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (261, 'KHU1NWM', 'tbl_physical_count_ras', 3, 'qty_per_small_box', '0', '120', 'update', 3, '2023-06-19 10:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (262, 'Q12LEVD', 'tbl_physical_count_ras', 3, 'total', '0', '1260', 'update', 3, '2023-06-19 10:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (263, 'OIRCX7V', 'tbl_physical_count_ras', 5, 'qty_mother_box', '0', '5', 'update', 3, '2023-06-19 10:24:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (264, 'FWSBGZ9', 'tbl_physical_count_ras', 5, 'qty_per_mother_box', '0', '500', 'update', 3, '2023-06-19 10:24:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (265, 'DGU5W3C', 'tbl_physical_count_ras', 5, 'tingi', '0', '250', 'update', 3, '2023-06-19 10:24:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (266, 'QYEB5R9', 'tbl_physical_count_ras', 5, 'total', '0', '2750', 'update', 3, '2023-06-19 10:24:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (267, 'XXAW3DP', 'tbl_physical_count_ras', 4, 'qty_small_box', '0', '50', 'update', 3, '2023-06-19 10:25:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (268, '9OOCPBN', 'tbl_physical_count_ras', 4, 'qty_per_small_box', '0', '50', 'update', 3, '2023-06-19 10:25:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (269, '7YZ2NR1', 'tbl_physical_count_ras', 4, 'tingi', '0', '44', 'update', 3, '2023-06-19 10:25:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (270, '7BYMVJX', 'tbl_physical_count_ras', 4, 'total', '0', '2544', 'update', 3, '2023-06-19 10:25:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (271, '9IGHHFY', 'tbl_physical_count_ras', 15, 'qty_per_mother_box', '0', '100', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (272, 'NYUNMXQ', 'tbl_physical_count_ras', 15, 'qty_mother_box', '0', '3', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (273, '7HPPMA8', 'tbl_physical_count_ras', 15, 'qty_small_box', '0', '0', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (274, 'NSK7WMM', 'tbl_physical_count_ras', 15, 'qty_per_small_box', '0', '0', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (275, 'DUM5SX4', 'tbl_physical_count_ras', 15, 'total', '0', '343', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (276, '2HJD0DY', 'tbl_physical_count_ras', 15, 'tingi', '0', '43', 'update', 3, '2023-06-19 10:25:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (277, 'S0ABA3P', 'tbl_physical_count_ras', 12, 'qty_small_box', '0', '2', 'update', 3, '2023-06-19 10:26:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (278, '2OFLXT1', 'tbl_physical_count_ras', 12, 'qty_per_small_box', '0', '150', 'update', 3, '2023-06-19 10:26:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (279, 'SF2SJ8F', 'tbl_physical_count_ras', 12, 'tingi', '0', '123', 'update', 3, '2023-06-19 10:26:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (280, '0NEUOO9', 'tbl_physical_count_ras', 12, 'total', '0', '423', 'update', 3, '2023-06-19 10:26:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (281, 'EDJSRL0', 'tbl_physical_count_ras', 11, 'qty_mother_box', '0', '0', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (282, 'PWX5YSU', 'tbl_physical_count_ras', 11, 'qty_per_mother_box', '0', '0', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (283, '1LFRU1W', 'tbl_physical_count_ras', 11, 'qty_small_box', '0', '5', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (284, 'EZVBKO6', 'tbl_physical_count_ras', 11, 'qty_per_small_box', '0', '120', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (285, '1RY2OUZ', 'tbl_physical_count_ras', 11, 'total', '0', '663', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (286, 'NCBRZJB', 'tbl_physical_count_ras', 11, 'tingi', '0', '63', 'update', 3, '2023-06-19 10:27:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (287, '718AHFQ', 'tbl_physical_count_des', 7, 'count_by', NULL, '5', 'update', 2, '2023-06-19 10:28:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (288, 'J542NMG', 'tbl_physical_count_des', 6, 'count_by', NULL, '5', 'update', 2, '2023-06-19 10:28:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (289, 'W8NOPED', 'tbl_physical_count_des', 5, 'count_by', NULL, '5', 'update', 2, '2023-06-19 10:28:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (290, 'XQ0DQ7V', 'tbl_physical_count_des', 4, 'count_by', NULL, '5', 'update', 2, '2023-06-19 10:28:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (291, '8S45SNV', 'tbl_physical_count_des', 3, 'count_by', NULL, '3', 'update', 2, '2023-06-19 10:29:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (292, '7UGW2LH', 'tbl_physical_count_ras', 3, 'qty_small_box', '10', '10', 'update', 5, '2023-06-19 10:33:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (293, '0BA8A34', 'tbl_physical_count_ras', 3, 'qty_per_small_box', '120', '120', 'update', 5, '2023-06-19 10:33:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (294, 'OFHI7CR', 'tbl_physical_count_ras', 3, 'tingi', '60', '60', 'update', 5, '2023-06-19 10:33:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (297, 'NS7YBIT', 'tbl_physical_count_des', 3, 'qty_per_small_box', '0', '120', 'update', 5, '2023-06-19 11:38:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (296, 'X3PXZQ5', 'tbl_physical_count_des', 3, 'qty_small_box', '0', '10', 'update', 5, '2023-06-19 11:38:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (298, 'HFB1R7N', 'tbl_physical_count_des', 3, 'tingi', '0', '60', 'update', 5, '2023-06-19 11:38:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (295, '4O2RYSK', 'tbl_physical_count_des', 3, 'qty_mother_box', '0', '0', 'update', 5, '2023-06-19 11:38:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (299, 'UOR8WU0', 'tbl_physical_count_des', 3, 'total', '0', '1260', 'update', 5, '2023-06-19 11:38:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (301, '8JS0V0K', 'tbl_physical_count_des', 5, 'qty_per_mother_box', '0', '500', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (300, 'RQPYL6V', 'tbl_physical_count_des', 5, 'qty_mother_box', '0', '5', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (302, 'BDWSO4L', 'tbl_physical_count_des', 5, 'qty_small_box', '0', '0', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (303, '7TRV4PW', 'tbl_physical_count_des', 5, 'qty_per_small_box', '0', '0', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (304, '4J4AHEE', 'tbl_physical_count_des', 5, 'tingi', '0', '250', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (305, '3SRJMYP', 'tbl_physical_count_des', 5, 'total', '0', '2750', 'update', 5, '2023-06-19 11:38:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (306, 'J3Y9BJ3', 'tbl_physical_count_des', 4, 'qty_small_box', '0', '50', 'update', 5, '2023-06-19 11:39:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (307, 'UQELXU6', 'tbl_physical_count_des', 4, 'qty_per_small_box', '0', '50', 'update', 5, '2023-06-19 11:39:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (308, '5ARODYH', 'tbl_physical_count_des', 4, 'total', '0', '2544', 'update', 5, '2023-06-19 11:39:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (309, 'F6X0ZHQ', 'tbl_physical_count_des', 4, 'tingi', '0', '44', 'update', 5, '2023-06-19 11:39:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (310, '4TM78OL', 'tbl_physical_count_des', 13, 'qty_small_box', '0', '7', 'update', 5, '2023-06-19 11:40:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (311, '95EL21Q', 'tbl_physical_count_des', 13, 'qty_per_small_box', '0', '100', 'update', 5, '2023-06-19 11:40:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (312, 'HLP9ED3', 'tbl_physical_count_des', 13, 'tingi', '0', '85', 'update', 5, '2023-06-19 11:40:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (313, 'L66ELHE', 'tbl_physical_count_des', 13, 'total', '0', '785', 'update', 5, '2023-06-19 11:40:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (314, 'B3RMT1W', 'tbl_physical_count_des', 12, 'qty_small_box', '0', '7', 'update', 5, '2023-06-19 11:41:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (315, '11CSHT1', 'tbl_physical_count_des', 12, 'qty_per_small_box', '0', '150', 'update', 5, '2023-06-19 11:41:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (316, 'WG6XD0O', 'tbl_physical_count_des', 12, 'tingi', '0', '123', 'update', 5, '2023-06-19 11:41:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (317, 'BFJXS1K', 'tbl_physical_count_des', 12, 'total', '0', '1173', 'update', 5, '2023-06-19 11:41:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (318, 'IDM3F57', 'tbl_users_permissions', 6, 'permissions', NULL, '{"module_1":{"submodule_1":{"list":true,"create":true},"submodule_2":{"list":true,"create":true},"submodule_3":{"list":true,"create":true},"submodule_4":{"list":true},"submodule_5":{"list":true,"create":true,"update":true},"submodule_6":{"list":true,"create":true,"update":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{"list":true},"status":true}}', 'update', 1, '2023-06-19 16:25:49+08');

-- ----------------------------
-- Table structure for tbl_brand
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_brand";
CREATE TABLE "public"."tbl_brand" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_brand_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_brand
-- ----------------------------
INSERT INTO "public"."tbl_brand" VALUES (1, 'BRD-0000001', 'GE', 1, 1, NULL, NULL, NULL, '2023-05-11 09:19:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (2, 'BRD-0000002', 'CHINA', 1, 1, NULL, NULL, NULL, '2023-05-11 09:19:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (3, 'BRD-0000003', 'CHINT', 1, 1, NULL, NULL, NULL, '2023-05-11 09:19:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (4, 'BRD-0000004', 'FUJI', 1, 1, NULL, NULL, NULL, '2023-05-11 09:19:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (5, 'BRD-0000005', 'HYUNDAI', 1, 1, NULL, NULL, NULL, '2023-05-11 09:20:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (6, 'BRD-0000006', 'SCHNEIDER', 1, 1, NULL, NULL, NULL, '2023-05-11 09:20:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (7, 'BRD-0000007', 'SPC', 1, 1, NULL, NULL, NULL, '2023-05-11 09:20:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (8, 'BRD-0000008', 'ABB', 1, 1, NULL, NULL, NULL, '2023-05-11 09:20:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (9, 'BRD-0000009', 'GE LIGHTING', 1, 1, NULL, NULL, NULL, '2023-05-11 09:20:30+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_category";
CREATE TABLE "public"."tbl_category" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_category_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "module" varchar(20) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "tag" varchar(10) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_company";
CREATE TABLE "public"."tbl_company" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_company_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "owner_id" int4,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "address" varchar(1000) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_company
-- ----------------------------
INSERT INTO "public"."tbl_company" VALUES (2, 'CMP-0000001', 1, 'KC INDUSTRIAL CORPORATION', '#82 CORDILLERA ST. CORNER QUEZON AVE., QUEZON CITY', NULL, 1, 1, 1, NULL, NULL, '2023-05-11 08:55:00+08', '2023-05-11 08:55:10+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (3, 'CMP-0000002', 1, 'KC ELECTRICAL INNOVATION, INC.', '#82 CORDILLERA ST. CORNER QUEZON AVE., QUEZON CITY', NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:55:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (4, 'CMP-0000003', 1, 'S-POWER CORPORATION', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:55:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (5, 'CMP-0000004', 1, 'SYSTEMS POWERMARK CORPORATION', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:55:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (6, 'CMP-0000005', 1, 'KENNETH LAND HOLDINGS', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-06-16 10:03:20+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_department
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_department";
CREATE TABLE "public"."tbl_department" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_depertment_id_seq'::regclass),
  "series_no" varchar(50) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_head_id" int4,
  "name" varchar(150) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO "public"."tbl_department" VALUES (2, 'DPT-0000001', 3, 1, 'IT/MIS', NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:56:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (3, 'DPT-0000002', 2, 1, 'EXECUTIVE', NULL, 1, 1, NULL, NULL, NULL, '2023-05-12 16:01:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (4, 'DPT-0000003', 2, 1, 'HUMAN RESOURCE', NULL, 1, 1, NULL, NULL, NULL, '2023-06-08 14:22:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (5, 'DPT-0000004', 2, 1, 'ACCOUNTING', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 09:12:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (6, 'DPT-0000005', 2, 1, 'SALES - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 11:24:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (7, 'DPT-0000006', 2, 1, 'WAREHOUSE', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 11:32:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (8, 'DPT-0000007', 6, 1, 'ACCOUNTING - AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-06-16 10:03:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (9, 'DPT-0000008', 4, 1, 'LOGISTICS', NULL, 1, 1, NULL, NULL, NULL, '2023-06-19 08:31:01+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_employee
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_employee";
CREATE TABLE "public"."tbl_employee" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_employee_id_seq'::regclass),
  "user_id" int4,
  "employee_no" varchar(20) COLLATE "pg_catalog"."default",
  "rfid" varchar(20) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_id" int4,
  "position_id" int4,
  "fname" varchar(100) COLLATE "pg_catalog"."default",
  "mname" varchar(100) COLLATE "pg_catalog"."default",
  "lname" varchar(100) COLLATE "pg_catalog"."default",
  "branch" varchar(15) COLLATE "pg_catalog"."default",
  "gender" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_employee
-- ----------------------------
INSERT INTO "public"."tbl_employee" VALUES (1, 1, '00000000', '0000000000', NULL, NULL, NULL, 'SUPER', NULL, 'ADMIN', NULL, NULL);
INSERT INTO "public"."tbl_employee" VALUES (2, 2, '90100009', NULL, 2, 6, 7, 'MARLON', 'UY', 'LASAM', 'quezon_ave', 'male');
INSERT INTO "public"."tbl_employee" VALUES (3, 3, '15100066', NULL, 2, 6, 8, 'MARIA LOURICE', 'ESCOBIDO', 'SANCHEZ', 'quezon_ave', 'female');
INSERT INTO "public"."tbl_employee" VALUES (4, 4, '6100025', NULL, 2, 7, 9, 'REXLY', 'CASAR', 'CATAGGATAN', 'quezon_ave', 'male');
INSERT INTO "public"."tbl_employee" VALUES (5, 5, '11100040', NULL, 6, 8, 10, 'MILLICENT', 'ANG', 'LIU', 'quezon_ave', 'female');
INSERT INTO "public"."tbl_employee" VALUES (6, 6, '16100083', NULL, 4, 9, 11, 'FRANCIS', 'LIM', 'CO', 'sto_domingo', 'male');
INSERT INTO "public"."tbl_employee" VALUES (7, 7, '22100427', '0006318192', 3, 2, 3, 'PAUL JOHN', 'SOLANO', 'JUDAN', 'quezon_ave', 'male');

-- ----------------------------
-- Table structure for tbl_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_items";
CREATE TABLE "public"."tbl_items" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_items_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "brand_id" int4,
  "rack_id" int4,
  "item_code" varchar(100) COLLATE "pg_catalog"."default",
  "item_description" text COLLATE "pg_catalog"."default",
  "uom" varchar(50) COLLATE "pg_catalog"."default",
  "mother_box" int4,
  "qty_per_mother_box" int4,
  "small_box" int4,
  "qty_per_small_box" int4,
  "tingi" int4,
  "total" int4,
  "remarks" varchar(50) COLLATE "pg_catalog"."default",
  "photo" text COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_items
-- ----------------------------
INSERT INTO "public"."tbl_items" VALUES (6, 'ITM-0000006', 4, 7, 'EA32B 5A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:16:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (7, 'ITM-0000007', 4, 7, 'EA32B 10A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:16:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (8, 'ITM-0000008', 4, 7, 'EA32B 15A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:17:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (9, 'ITM-0000009', 4, 7, 'EA32B 20A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:17:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (10, 'ITM-0000010', 4, 7, 'EA32B 30A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:18:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (16, 'ITM-0000016', 5, 19, 'HBD51-HD 15A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:20:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (17, 'ITM-0000017', 5, 19, 'HBD51-HD 20A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (18, 'ITM-0000018', 5, 19, 'HBD51-HD 30A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (21, 'ITM-0000021', 7, 2, 'DRSP12W W/ 100A 1P BB', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:22:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (22, 'ITM-0000022', 7, 2, 'DRSP12W W/ 63A 1P BB', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:22:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (25, 'ITM-0000025', 2, 3, 'AB301-3-1.2', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:24:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (20, 'ITM-0000020', 5, 19, 'HBD51-HD 50A 1P', NULL, 'pc', 0, 0, 0, 0, 83, 83, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:21:46+08', '2023-06-16 11:20:47+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (19, 'ITM-0000019', 5, 19, 'HBD51-HD 40A 1P', NULL, 'pc', 5, 50, 0, 0, 0, 250, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:21:36+08', '2023-06-16 11:21:47+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (2, 'ITM-0000002', 1, 1, 'ES6 4A 1P', NULL, 'pc', 8, 150, 0, 0, 0, 1200, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:05:35+08', '2023-06-19 10:14:05+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (1, 'ITM-0000001', 1, 1, 'ES6 2A 1P', NULL, 'pc', 10, 200, 0, 0, 0, 2000, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:05:23+08', '2023-06-19 10:15:48+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (14, 'ITM-0000014', 3, 13, 'DZ47 4A 1P', NULL, 'pc', 7, 50, 4, 10, 8, 398, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:19:46+08', '2023-06-19 10:16:39+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (15, 'ITM-0000015', 3, 13, 'DZ47 5A 1P', NULL, 'pc', 3, 100, 0, 0, 43, 343, NULL, NULL, 1, 1, 3, NULL, NULL, '2023-05-24 11:19:59+08', '2023-06-19 10:25:48+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (11, 'ITM-0000011', 3, 13, 'DZ47 1A 1P', NULL, 'pc', 0, 0, 5, 120, 63, 663, NULL, NULL, 1, 1, 3, NULL, NULL, '2023-05-24 11:19:01+08', '2023-06-19 10:27:48+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (3, 'ITM-0000003', 1, 1, 'ES6 6A 1P', NULL, 'pc', 0, 0, 10, 120, 60, 1260, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:05:46+08', '2023-06-19 11:38:00+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (5, 'ITM-0000005', 1, 1, 'ES6 16A 1P', NULL, 'pc', 5, 500, 0, 0, 250, 2750, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:06:45+08', '2023-06-19 11:38:52+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (4, 'ITM-0000004', 1, 1, 'ES6 10A 1P', NULL, 'pc', 0, 0, 50, 50, 44, 2544, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:06:32+08', '2023-06-19 11:39:21+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (13, 'ITM-0000013', 3, 13, 'DZ47 3A 1P', NULL, 'pc', 0, 0, 7, 100, 85, 785, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:19:35+08', '2023-06-19 11:40:32+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (12, 'ITM-0000012', 3, 13, 'DZ47 2A 1P', NULL, 'pc', 0, 0, 7, 150, 123, 1173, NULL, NULL, 1, 1, 5, NULL, NULL, '2023-05-24 11:19:15+08', '2023-06-19 11:41:21+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (23, 'ITM-0000023', 2, 3, 'A19-1-1', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, 1, NULL, NULL, '2023-05-24 11:23:26+08', '2023-06-13 08:58:31+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (24, 'ITM-0000024', 2, 3, 'AB301-2-1', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, 1, NULL, NULL, '2023-05-24 11:23:43+08', '2023-06-13 08:59:39+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (27, 'ITM-0000027', 5, 1, 'UANS FBWB1B', NULL, 'pc', 10, 100, 0, 0, 32, 1032, NULL, NULL, 1, 1, 3, NULL, NULL, '2023-05-30 10:20:49+08', '2023-06-15 13:29:28+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (26, 'ITM-0000026', 6, 1, 'NSX100H 63A 3P (LV429672)', NULL, 'pc', 7, 100, 0, 0, 23, 723, NULL, NULL, 1, 1, 3, NULL, NULL, '2023-05-26 14:48:15+08', '2023-06-15 15:06:17+08', NULL, NULL);

-- ----------------------------
-- Table structure for tbl_module
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_module";
CREATE TABLE "public"."tbl_module" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_module_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_module
-- ----------------------------
INSERT INTO "public"."tbl_module" VALUES (1, '6GBCOQA', 'MAINTENANCE', 1, 1, NULL, NULL, NULL, '2023-05-11 08:53:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_module" VALUES (2, 'MZSCM5J', 'WAREHOUSE', 1, 1, NULL, NULL, NULL, '2023-05-11 09:43:10+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_physical_count
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count";
CREATE TABLE "public"."tbl_physical_count" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "branch" text COLLATE "pg_catalog"."default",
  "date_from" varchar(40) COLLATE "pg_catalog"."default",
  "date_to" varchar(40) COLLATE "pg_catalog"."default",
  "type" varchar(10) COLLATE "pg_catalog"."default",
  "brands" text COLLATE "pg_catalog"."default",
  "total_items" int4,
  "remarks" text COLLATE "pg_catalog"."default",
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6),
  "personnel" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_physical_count
-- ----------------------------
INSERT INTO "public"."tbl_physical_count" VALUES (2, 'PC-0000002', '[{"id":"quezon_ave","name":"QUEZON AVE"},{"id":"sto_domingo","name":"STO. DOMINGO"},{"id":"manila","name":"MANILA"},{"id":"cavite","name":"CAVITE"}]', '2023-6-19', '2023-6-19', 'random', '[{"items":5,"brand_id":1,"brand_name":"GE"},{"items":5,"brand_id":3,"brand_name":"CHINT"}]', 10, NULL, 1, 2, NULL, NULL, '2023-06-19 08:23:03+08', '2023-06-19 09:25:00+08', NULL, NULL, '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"LASAM, MARLON UY"}},{"branch":"sto_domingo","employee":{"id":6,"name":"CO, FRANCIS LIM"},"type":"admin"},{"branch":"quezon_ave","type":"rcs","employee":{"id":4,"name":"CATAGGATAN, REXLY CASAR"}},{"branch":"quezon_ave","type":"ras","employee":{"id":3,"name":"SANCHEZ, MARIA LOURICE ESCOBIDO"}},{"branch":"quezon_ave","type":"ras","employee":{"id":5,"name":"LIU, MILLICENT ANG"}},{"branch":"quezon_ave","type":"ras","employee":{"id":3,"name":"SANCHEZ, MARIA LOURICE ESCOBIDO"}},{"branch":"sto_domingo","type":"ras","employee":{"id":3,"name":"SANCHEZ, MARIA LOURICE ESCOBIDO"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":7,"name":"JUDAN, PAUL JOHN SOLANO"}}]');
INSERT INTO "public"."tbl_physical_count" VALUES (1, 'PC-0000001', '[{"id":"quezon_ave","name":"QUEZON AVE"}]', '2023-6-15', '2023-6-16', 'annual', '[]', 27, NULL, 1, 2, NULL, NULL, '2023-06-15 09:20:18+08', '2023-06-16 10:05:01+08', NULL, NULL, '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"LASAM, MARLON UY"}},{"branch":"quezon_ave","type":"ras","employee":{"id":3,"name":"SANCHEZ, MARIA LOURICE ESCOBIDO"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":4,"name":"CATAGGATAN, REXLY CASAR"}},{"branch":"quezon_ave","type":"ras","employee":{"id":5,"name":"LIU, MILLICENT ANG"}}]');

-- ----------------------------
-- Table structure for tbl_physical_count_dis
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count_dis";
CREATE TABLE "public"."tbl_physical_count_dis" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_des_id_seq'::regclass),
  "physical_count_id" int4,
  "item_id" int4,
  "qty_mother_box" int4,
  "qty_per_mother_box" int4,
  "qty_small_box" int4,
  "qty_per_small_box" int4,
  "tingi" int4,
  "total" int4,
  "remarks" text COLLATE "pg_catalog"."default",
  "comments" text COLLATE "pg_catalog"."default",
  "count_by" int4,
  "date_counted" timestamptz(6),
  "assigned_by" int4,
  "date_assigned" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_physical_count_dis
-- ----------------------------
INSERT INTO "public"."tbl_physical_count_dis" VALUES (1, 1, 20, 0, 0, 0, 0, 83, 83, NULL, NULL, 5, '2023-06-16 11:20:47+08', 2, '2023-06-16 10:06:24+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (2, 1, 19, 5, 50, 0, 0, 0, 250, NULL, NULL, 5, '2023-06-16 11:21:47+08', 2, '2023-06-16 10:06:18+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (4, 2, 3, 0, 0, 10, 120, 60, 1260, NULL, NULL, 5, '2023-06-19 11:38:00+08', 2, '2023-06-19 10:28:58+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (5, 2, 5, 5, 500, 0, 0, 250, 2750, NULL, NULL, 5, '2023-06-19 11:38:52+08', 2, '2023-06-19 10:28:50+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (6, 2, 4, 0, 0, 50, 50, 44, 2544, NULL, NULL, 5, '2023-06-19 11:39:21+08', 2, '2023-06-19 10:28:44+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (3, 2, 13, 0, 0, 7, 100, 85, 785, NULL, NULL, 3, '2023-06-19 11:40:32+08', 2, '2023-06-19 10:29:08+08');
INSERT INTO "public"."tbl_physical_count_dis" VALUES (7, 2, 12, 0, 0, 7, 150, 123, 1173, NULL, NULL, 5, '2023-06-19 11:41:21+08', 2, '2023-06-19 10:28:28+08');

-- ----------------------------
-- Table structure for tbl_physical_count_personnels
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count_personnels";
CREATE TABLE "public"."tbl_physical_count_personnels" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_personnels_id_seq'::regclass),
  "physical_count_id" int4,
  "user_id" int4,
  "branch" varchar(20) COLLATE "pg_catalog"."default",
  "type" varchar(10) COLLATE "pg_catalog"."default",
  "assigned_by" int4,
  "assigned_date" timestamp(6),
  "is_logged" int4,
  "status" int4
)
;

-- ----------------------------
-- Records of tbl_physical_count_personnels
-- ----------------------------
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (3, 2, 4, 'quezon_ave', 'rcs', 2, '2023-06-19 09:05:54', 0, 1);
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (2, 2, 3, 'quezon_ave', 'ras', 6, '2023-06-19 09:24:47', 0, 1);
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (4, 2, 5, 'quezon_ave', 'ras', 2, '2023-06-19 09:06:07', 0, 1);
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (6, 2, 7, 'quezon_ave', 'rcs', 2, '2023-06-19 09:25:00', 0, 1);
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (1, 2, 2, 'quezon_ave', 'admin', 1, '2023-06-19 08:32:36', 0, 1);
INSERT INTO "public"."tbl_physical_count_personnels" VALUES (5, 2, 6, 'sto_domingo', 'admin', 1, '2023-06-19 08:32:36', 1, 1);

-- ----------------------------
-- Table structure for tbl_physical_count_ras
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count_ras";
CREATE TABLE "public"."tbl_physical_count_ras" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_ras_id_seq'::regclass),
  "physical_count_id" int4,
  "item_id" int4,
  "qty_mother_box" int4,
  "qty_per_mother_box" int4,
  "qty_small_box" int4,
  "qty_per_small_box" int4,
  "tingi" int4,
  "total" int4,
  "remarks" text COLLATE "pg_catalog"."default",
  "comments" text COLLATE "pg_catalog"."default",
  "count_by" int4,
  "date_counted" timestamptz(6),
  "assigned_by" int4,
  "date_assigned" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_physical_count_ras
-- ----------------------------
INSERT INTO "public"."tbl_physical_count_ras" VALUES (1, 1, 27, 10, 100, 0, 0, 32, 1032, NULL, NULL, 3, '2023-06-15 14:58:23+08', 2, '2023-06-15 11:18:49+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (2, 1, 26, 7, 100, 0, 0, 23, 723, NULL, NULL, 3, '2023-06-15 15:06:17+08', 2, '2023-06-15 11:18:45+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (3, 1, 20, 0, 0, 0, 0, 80, 80, NULL, NULL, 3, '2023-06-15 15:21:54+08', 2, '2023-06-15 11:18:41+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (4, 1, 19, 0, 0, 5, 50, 43, 293, NULL, NULL, 3, '2023-06-15 15:22:55+08', 2, '2023-06-15 11:18:36+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (5, 1, 18, 0, 0, 0, 0, 0, 0, NULL, NULL, 3, NULL, 2, '2023-06-16 08:33:40+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (12, 2, 2, 8, 150, 0, 0, 0, 1200, NULL, NULL, 5, '2023-06-19 10:14:05+08', 2, '2023-06-19 09:51:54+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (13, 2, 1, 10, 200, 0, 0, 0, 2000, NULL, NULL, 5, '2023-06-19 10:15:48+08', 2, '2023-06-19 09:51:47+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (7, 2, 14, 7, 50, 4, 10, 8, 398, NULL, NULL, 5, '2023-06-19 10:16:39+08', 2, '2023-06-19 09:43:38+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (8, 2, 13, 0, 0, 7, 100, 85, 785, NULL, NULL, 5, '2023-06-19 10:20:30+08', 2, '2023-06-19 09:43:34+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (14, 2, 5, 5, 500, 0, 0, 250, 2750, NULL, NULL, 3, '2023-06-19 10:24:28+08', 2, '2023-06-19 09:51:40+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (15, 2, 4, 0, 0, 50, 50, 44, 2544, NULL, NULL, 3, '2023-06-19 10:25:05+08', 2, '2023-06-19 09:51:29+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (6, 2, 15, 3, 100, 0, 0, 43, 343, NULL, NULL, 3, '2023-06-19 10:25:48+08', 2, '2023-06-19 09:28:19+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (9, 2, 12, 0, 0, 2, 150, 123, 423, NULL, NULL, 3, '2023-06-19 10:26:55+08', 2, '2023-06-19 09:43:30+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (10, 2, 11, 0, 0, 5, 120, 63, 663, NULL, NULL, 3, '2023-06-19 10:27:48+08', 2, '2023-06-19 09:43:24+08');
INSERT INTO "public"."tbl_physical_count_ras" VALUES (11, 2, 3, 0, 0, 10, 120, 60, 1260, NULL, NULL, 3, '2023-06-19 10:33:23+08', 2, '2023-06-19 09:52:03+08');

-- ----------------------------
-- Table structure for tbl_physical_count_rcs
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count_rcs";
CREATE TABLE "public"."tbl_physical_count_rcs" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_rcs_id_seq'::regclass),
  "physical_count_id" int4,
  "item_id" int4,
  "qty_mother_box" int4,
  "qty_per_mother_box" int4,
  "qty_small_box" int4,
  "qty_per_small_box" int4,
  "tingi" int4,
  "total" int4,
  "remarks" text COLLATE "pg_catalog"."default",
  "comments" text COLLATE "pg_catalog"."default",
  "count_by" int4,
  "date_counted" timestamptz(6),
  "assigned_by" int4,
  "date_assigned" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_physical_count_rcs
-- ----------------------------
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (1, 1, 27, 10, 100, 0, 0, 32, 1032, NULL, NULL, 4, '2023-06-15 10:29:24+08', 2, '2023-06-15 09:56:00+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (2, 1, 26, 7, 100, 0, 0, 23, 723, NULL, NULL, 4, '2023-06-15 10:30:04+08', 2, '2023-06-15 09:55:50+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (4, 1, 19, 0, 0, 5, 50, 0, 250, NULL, NULL, 4, '2023-06-15 10:31:11+08', 2, '2023-06-15 09:55:59+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (3, 1, 20, 0, 0, 0, 0, 83, 83, NULL, NULL, 4, '2023-06-15 10:30:46+08', 2, '2023-06-15 09:55:54+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (8, 1, 18, 5, 70, 0, 0, 56, 406, NULL, NULL, 4, '2023-06-16 08:33:07+08', 2, '2023-06-16 08:32:09+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (9, 1, 17, 0, 0, 0, 0, 0, 0, NULL, NULL, 4, NULL, 2, '2023-06-16 14:49:48+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (15, 2, 15, 3, 100, 0, 0, 43, 343, NULL, NULL, 7, '2023-06-19 09:27:43+08', 2, '2023-06-19 09:25:25+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (16, 2, 14, 7, 50, 4, 10, 8, 398, NULL, NULL, 7, '2023-06-19 09:41:13+08', 2, '2023-06-19 09:25:29+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (17, 2, 13, 0, 0, 7, 100, 83, 783, NULL, NULL, 7, '2023-06-19 09:41:58+08', 2, '2023-06-19 09:25:33+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (18, 2, 12, 0, 0, 7, 150, 123, 1173, NULL, NULL, 7, '2023-06-19 09:42:28+08', 2, '2023-06-19 09:25:36+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (19, 2, 11, 0, 0, 5, 120, 63, 663, NULL, NULL, 7, '2023-06-19 09:42:56+08', 2, '2023-06-19 09:25:40+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (10, 2, 3, 0, 0, 10, 120, 66, 1266, NULL, NULL, 4, '2023-06-19 09:47:56+08', 2, '2023-06-19 09:25:06+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (11, 2, 2, 8, 150, 0, 0, 0, 1200, NULL, NULL, 4, '2023-06-19 09:49:51+08', 2, '2023-06-19 09:25:10+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (12, 2, 1, 10, 200, 0, 0, 0, 2000, NULL, NULL, 4, '2023-06-19 09:50:28+08', 2, '2023-06-19 09:25:12+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (13, 2, 5, 5, 500, 0, 0, 0, 2500, NULL, NULL, 4, '2023-06-19 09:50:55+08', 2, '2023-06-19 09:25:16+08');
INSERT INTO "public"."tbl_physical_count_rcs" VALUES (14, 2, 4, 0, 0, 50, 50, 45, 2545, NULL, NULL, 4, '2023-06-19 09:51:16+08', 2, '2023-06-19 09:25:50+08');

-- ----------------------------
-- Table structure for tbl_position
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_position";
CREATE TABLE "public"."tbl_position" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_position_id_seq'::regclass),
  "series_no" varchar(50) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_id" int4,
  "name" varchar(150) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_position
-- ----------------------------
INSERT INTO "public"."tbl_position" VALUES (2, 'PST-0000001', 3, 2, 'SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:56:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (3, 'PST-0000002', 3, 2, 'FULLSTACK DEVELOPER', NULL, 1, 1, NULL, NULL, NULL, '2023-05-11 08:57:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (4, 'PST-0000003', 2, 3, 'PRESIDENT', NULL, 1, 1, NULL, NULL, NULL, '2023-05-12 16:02:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (5, 'PST-0000004', 2, 4, 'PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-06-08 14:22:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (6, 'PST-0000005', 2, 5, 'ACCOUNTING HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 09:12:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (7, 'PST-0000006', 2, 6, 'SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 11:24:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (8, 'PST-0000007', 2, 6, 'SALES COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 11:29:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (9, 'PST-0000008', 2, 7, 'CHECKER', NULL, 1, 1, NULL, NULL, NULL, '2023-06-13 11:32:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (10, 'PST-0000009', 6, 8, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-06-16 10:04:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (11, 'PST-0000010', 4, 9, 'LOGISTICS MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-06-19 08:31:13+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_racks
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_racks";
CREATE TABLE "public"."tbl_racks" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_racks_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "branch" varchar(20) COLLATE "pg_catalog"."default",
  "floor" varchar(20) COLLATE "pg_catalog"."default",
  "code" varchar(50) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_racks
-- ----------------------------
INSERT INTO "public"."tbl_racks" VALUES (1, 'RCK-0000001', 'qa', '1f', 'A1a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (2, 'RCK-0000002', 'qa', '1f', 'A1b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (3, 'RCK-0000003', 'qa', '1f', 'A2a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (4, 'RCK-0000004', 'qa', '1f', 'A2b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (5, 'RCK-0000005', 'qa', '1f', 'A3a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (6, 'RCK-0000006', 'qa', '1f', 'A3b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:37:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (7, 'RCK-0000007', 'qa', '2f', 'A1a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:38:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (8, 'RCK-0000008', 'qa', '2f', 'A1b', 1, 1, 1, NULL, NULL, '2023-05-11 09:38:13+08', '2023-05-11 09:38:30+08', NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (9, 'RCK-0000009', 'qa', '2f', 'A2a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:39:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (10, 'RCK-0000010', 'qa', '2f', 'A2b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:39:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (11, 'RCK-0000011', 'qa', '2f', 'A3a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:39:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (12, 'RCK-0000012', 'qa', '2f', 'A3b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:39:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (13, 'RCK-0000013', 'qa', '3f', 'A1a', 1, 1, 1, NULL, NULL, '2023-05-11 09:40:10+08', '2023-05-11 09:40:15+08', NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (14, 'RCK-0000014', 'qa', '3f', 'A1b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (15, 'RCK-0000015', 'qa', '3f', 'A2a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (16, 'RCK-0000016', 'qa', '3f', 'A2b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (17, 'RCK-0000017', 'qa', '3f', 'A3a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (18, 'RCK-0000018', 'qa', '3f', 'A3b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (19, 'RCK-0000019', 'qa', '4f', 'A1a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:40:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (20, 'RCK-0000020', 'qa', '4f', 'A1b', 1, 1, 1, NULL, NULL, '2023-05-11 09:40:44+08', '2023-05-11 09:40:57+08', NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (21, 'RCK-0000021', 'qa', '4f', 'A2a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:41:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (22, 'RCK-0000022', 'qa', '4f', 'A2b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:41:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (23, 'RCK-0000023', 'qa', '4f', 'A3a', 1, 1, NULL, NULL, NULL, '2023-05-11 09:41:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (24, 'RCK-0000024', 'qa', '4f', 'A3b', 1, 1, NULL, NULL, NULL, '2023-05-11 09:41:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (25, 'RCK-0000025', 'sd', '1f', 'A1a', 1, 1, NULL, NULL, NULL, '2023-05-30 10:18:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (26, 'RCK-0000026', 'sd', '1f', 'A1b', 1, 1, NULL, NULL, NULL, '2023-05-30 10:18:57+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_services
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services";
CREATE TABLE "public"."tbl_services" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "service_request_no" varchar(50) COLLATE "pg_catalog"."default",
  "date_prepared" varchar(20) COLLATE "pg_catalog"."default",
  "date_requested" varchar(20) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default",
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_services
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_services_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_report";
CREATE TABLE "public"."tbl_services_report" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_report_id_seq'::regclass),
  "service_id" int4,
  "work_done" text COLLATE "pg_catalog"."default",
  "personnel_deployed" text COLLATE "pg_catalog"."default",
  "sub_contractors" text COLLATE "pg_catalog"."default",
  "recommendation" text COLLATE "pg_catalog"."default",
  "recommendation_signature" text COLLATE "pg_catalog"."default",
  "recommendation_date" timestamptz(6),
  "comments" text COLLATE "pg_catalog"."default",
  "comments_signature" text COLLATE "pg_catalog"."default",
  "comments_date" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_services_report
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_services_sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_sales";
CREATE TABLE "public"."tbl_services_sales" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_sales_id_seq'::regclass),
  "service_id" int4,
  "so_no" varchar(100) COLLATE "pg_catalog"."default",
  "po_no" varchar(100) COLLATE "pg_catalog"."default",
  "customer" text COLLATE "pg_catalog"."default",
  "project" text COLLATE "pg_catalog"."default",
  "service_location" text COLLATE "pg_catalog"."default",
  "contact_person" varchar(200) COLLATE "pg_catalog"."default",
  "position" text COLLATE "pg_catalog"."default",
  "requested_by" text COLLATE "pg_catalog"."default",
  "requested_by_signature" text COLLATE "pg_catalog"."default",
  "requested_by_date" timestamptz(6),
  "noted_by_sup" text COLLATE "pg_catalog"."default",
  "noted_by_sup_signature" text COLLATE "pg_catalog"."default",
  "noted_by_sup_date" timestamptz(6),
  "date_needed" varchar(20) COLLATE "pg_catalog"."default",
  "time_expected" varchar(20) COLLATE "pg_catalog"."default",
  "warranty" varchar(20) COLLATE "pg_catalog"."default",
  "up_to" varchar(50) COLLATE "pg_catalog"."default",
  "for_billing" varchar(10) COLLATE "pg_catalog"."default",
  "contact_number" varchar(20) COLLATE "pg_catalog"."default",
  "requests" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_services_sales
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_services_technical
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_technical";
CREATE TABLE "public"."tbl_services_technical" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_technical_id_seq'::regclass),
  "service_id" int4,
  "evaluated_by" text COLLATE "pg_catalog"."default",
  "evaluated_by_signature" text COLLATE "pg_catalog"."default",
  "evaluated_by_date" timestamptz(6),
  "eval_noted_by_sup" text COLLATE "pg_catalog"."default",
  "eval_noted_by_sup_signature" text COLLATE "pg_catalog"."default",
  "eval_noted_by_sup_date" timestamptz(6),
  "deliveries_to_customer" int4,
  "tools_equipment" int4,
  "manpower" int4,
  "consumables" int4,
  "others" int4,
  "regular_delivery" int4,
  "to_be_rented" int4,
  "for_completion" int4,
  "for_rectification" int4,
  "supplemental_manning" int4,
  "other_purpose" int4,
  "prepared_by" text COLLATE "pg_catalog"."default",
  "prepared_by_signature" text COLLATE "pg_catalog"."default",
  "prepared_by_date" timestamptz(6),
  "noted_by" text COLLATE "pg_catalog"."default",
  "noted_by_signature" text COLLATE "pg_catalog"."default",
  "noted_by_date" timestamptz(6),
  "authorized_by" text COLLATE "pg_catalog"."default",
  "authorized_by_signature" text COLLATE "pg_catalog"."default",
  "authorized_by_date" timestamptz(6),
  "approved_by" text COLLATE "pg_catalog"."default",
  "approved_by_signature" text COLLATE "pg_catalog"."default",
  "approved_by_date" timestamptz(6),
  "released_by" text COLLATE "pg_catalog"."default",
  "released_by_signature" text COLLATE "pg_catalog"."default",
  "released_by_date" timestamptz(6),
  "received_by" text COLLATE "pg_catalog"."default",
  "received_by_signature" text COLLATE "pg_catalog"."default",
  "received_by_date" timestamptz(6),
  "items" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_services_technical
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sub_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sub_category";
CREATE TABLE "public"."tbl_sub_category" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_sub_category_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "category_id" int4,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "tag" varchar(10) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_sub_category
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sub_module
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sub_module";
CREATE TABLE "public"."tbl_sub_module" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_sub_module_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "module_id" int4,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "path" varchar(120) COLLATE "pg_catalog"."default",
  "is_maintenance" int4,
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_sub_module
-- ----------------------------
INSERT INTO "public"."tbl_sub_module" VALUES (1, 'SUB-MDL-0000001', 1, 'COMPANY', '/company', 0, 1, 1, NULL, NULL, NULL, '2023-05-11 08:54:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (2, 'SUB-MDL-0000002', 1, 'DEPARTMENT', '/department', 0, 1, 1, 1, NULL, NULL, '2023-05-11 08:55:59+08', '2023-05-11 08:56:02+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (3, 'SUB-MDL-0000003', 1, 'POSITION', '/position', 0, 1, 1, NULL, NULL, NULL, '2023-05-11 08:56:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (4, 'SUB-MDL-0000004', 1, 'USERS', '/users', 0, 1, 1, 1, NULL, NULL, '2023-05-11 09:04:43+08', '2023-05-11 09:04:48+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (5, 'SUB-MDL-0000005', 1, 'BRAND', '/brand', 0, 1, 1, 1, NULL, NULL, '2023-05-11 09:18:40+08', '2023-05-11 09:18:44+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (6, 'SUB-MDL-0000006', 1, 'RACKS', '/racks', 0, 1, 1, NULL, NULL, NULL, '2023-05-11 09:18:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (7, 'SUB-MDL-0000007', 2, 'ITEM', '/item', 0, 1, 1, 1, NULL, NULL, '2023-05-11 09:43:31+08', '2023-05-11 09:43:36+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (8, 'SUB-MDL-0000008', 2, 'PHYSICAL COUNT', '/physical-count', 0, 1, 1, NULL, NULL, NULL, '2023-05-11 10:10:25+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_supplies
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_supplies";
CREATE TABLE "public"."tbl_supplies" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_supplies_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "category" varchar(50) COLLATE "pg_catalog"."default",
  "type" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "stock" int4,
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_supplies
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_supplies_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_supplies_info";
CREATE TABLE "public"."tbl_supplies_info" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_supplies_info_id_seq'::regclass),
  "supply_id" int4,
  "brand" varchar(50) COLLATE "pg_catalog"."default",
  "no_of_seat" int4,
  "weight" varchar(50) COLLATE "pg_catalog"."default",
  "dimension" varchar(100) COLLATE "pg_catalog"."default",
  "assembly_required" varchar(20) COLLATE "pg_catalog"."default",
  "mount_type" varchar(30) COLLATE "pg_catalog"."default",
  "no_of_drawers" int4
)
;

-- ----------------------------
-- Records of tbl_supplies_info
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_tracker
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_tracker";
CREATE TABLE "public"."tbl_tracker" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_tracker_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "name" varchar(200) COLLATE "pg_catalog"."default",
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_tracker
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_users";
CREATE TABLE "public"."tbl_users" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_users_id_seq'::regclass),
  "series_no" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(150) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "contact_no" varchar(20) COLLATE "pg_catalog"."default",
  "user_level" varchar(20) COLLATE "pg_catalog"."default",
  "is_logged" int4,
  "status" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "imported_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6),
  "date_imported" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
INSERT INTO "public"."tbl_users" VALUES (2, 'USR-0000001', 'marlonuylasam@yahoo.com', 'QFNhbGVzMDAwMA==', '9175152668', 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-06-13 11:25:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (3, 'USR-0000002', 'slourice@yahoo.com.ph', 'QFNhbGVzMDAwMA==', '9058703068', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-06-13 11:30:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (5, 'USR-0000004', 'liumillie@yahoo.com.hk', 'QEFjY291bnRpbmcwMDAw', '9228027771', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-06-16 10:04:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (4, 'USR-0000003', 'cataggatanrexly@gmail.com', 'QFdhcmVob3VzZTAwMDA=', '9301056774', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-06-13 11:33:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (1, 'USR-0000000', 'superadmin@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '0000000000', 'superadmin', 1, 1, 1, NULL, NULL, NULL, '2022-12-21 11:13:47.452153+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (6, 'USR-0000005', NULL, '', '9175273646', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-06-19 08:31:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (7, 'USR-0000006', 'judan.pauljohn@gmail.com', 'QElUMDAwMA==', '9502099508', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-06-19 09:24:23+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_users_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_users_permissions";
CREATE TABLE "public"."tbl_users_permissions" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_users_permissions_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "permissions" text COLLATE "pg_catalog"."default",
  "updated_by" int4,
  "date_updated" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_users_permissions
-- ----------------------------
INSERT INTO "public"."tbl_users_permissions" VALUES (1, '5JK9PEN', 2, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{},"submodule_6":{}},"module_2":{"submodule_7":{"list":true,"create":true,"update":true,"export":true},"submodule_8":{"list":false},"status":false}}', 1, '2023-06-16 11:42:31+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (2, 'AQG8K68', 3, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true},"submodule_6":{"list":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{},"status":true}}', 1, '2023-06-16 11:42:53+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (4, 'MQGTT9V', 5, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true},"submodule_6":{"list":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{},"status":true}}', 1, '2023-06-16 11:43:02+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (3, '4VN2ZBL', 4, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true,"create":true,"update":false,"export":true},"submodule_6":{"list":true,"create":true,"update":true,"export":true},"status":true},"module_2":{"submodule_7":{"list":true,"create":true,"export":true},"submodule_8":{},"status":true}}', 1, '2023-06-16 11:43:34+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (5, '62BDGWS', 6, '{"module_1":{"submodule_1":{"list":null},"submodule_2":{},"submodule_3":{},"submodule_4":{},"submodule_5":{"list":true,"create":true,"update":true},"submodule_6":{"list":true,"create":true,"update":true},"status":true},"module_2":{"submodule_7":{"list":true,"create":true,"update":true,"export":true},"submodule_8":{"list":true,"create":true,"update":true,"export":true},"status":true}}', 1, '2023-06-19 09:38:43+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (6, 'I3X3T27', 7, '{"module_1":{"submodule_1":{"list":true,"create":true},"submodule_2":{"list":true,"create":true},"submodule_3":{"list":true,"create":true},"submodule_4":{"list":true},"submodule_5":{"list":true,"create":true,"update":true},"submodule_6":{"list":true,"create":true,"update":true},"status":true},"module_2":{"submodule_7":{"list":true},"submodule_8":{"list":true},"status":true}}', 1, '2023-06-19 16:25:49+08');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_assets_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_assets_info_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_assign_asset_id_seq"
OWNED BY "public"."tbl_assign_asset"."id";
SELECT setval('"public"."tbl_assign_asset_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_audit_trail_id_seq"', 319, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_brand_id_seq"
OWNED BY "public"."tbl_brand"."id";
SELECT setval('"public"."tbl_brand_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_category_id_seq"
OWNED BY "public"."tbl_category"."id";
SELECT setval('"public"."tbl_category_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_company_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_depertment_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_employee_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_items_id_seq"
OWNED BY "public"."tbl_items"."id";
SELECT setval('"public"."tbl_items_id_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_module_id_seq"
OWNED BY "public"."tbl_module"."id";
SELECT setval('"public"."tbl_module_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_des_id_seq"
OWNED BY "public"."tbl_physical_count_dis"."id";
SELECT setval('"public"."tbl_physical_count_des_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_id_seq"
OWNED BY "public"."tbl_physical_count"."id";
SELECT setval('"public"."tbl_physical_count_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_personnels_id_seq"
OWNED BY "public"."tbl_physical_count_personnels"."id";
SELECT setval('"public"."tbl_physical_count_personnels_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_ras_id_seq"
OWNED BY "public"."tbl_physical_count_ras"."id";
SELECT setval('"public"."tbl_physical_count_ras_id_seq"', 16, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_rcs_id_seq"
OWNED BY "public"."tbl_physical_count_rcs"."id";
SELECT setval('"public"."tbl_physical_count_rcs_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_position_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_racks_id_seq"
OWNED BY "public"."tbl_racks"."id";
SELECT setval('"public"."tbl_racks_id_seq"', 27, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_id_seq"
OWNED BY "public"."tbl_services"."id";
SELECT setval('"public"."tbl_services_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_report_id_seq"
OWNED BY "public"."tbl_services_report"."id";
SELECT setval('"public"."tbl_services_report_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_sales_id_seq"
OWNED BY "public"."tbl_services_sales"."id";
SELECT setval('"public"."tbl_services_sales_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_technical_id_seq"
OWNED BY "public"."tbl_services_technical"."id";
SELECT setval('"public"."tbl_services_technical_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_sub_category_id_seq"
OWNED BY "public"."tbl_sub_category"."id";
SELECT setval('"public"."tbl_sub_category_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_sub_module_id_seq"
OWNED BY "public"."tbl_sub_module"."id";
SELECT setval('"public"."tbl_sub_module_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_supplies_id_seq"
OWNED BY "public"."tbl_supplies"."id";
SELECT setval('"public"."tbl_supplies_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_supplies_info_id_seq"
OWNED BY "public"."tbl_supplies_info"."id";
SELECT setval('"public"."tbl_supplies_info_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_tracker_id_seq"
OWNED BY "public"."tbl_tracker"."id";
SELECT setval('"public"."tbl_tracker_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_users_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_users_permissions_id_seq"
OWNED BY "public"."tbl_users_permissions"."id";
SELECT setval('"public"."tbl_users_permissions_id_seq"', 7, true);

-- ----------------------------
-- Primary Key structure for table tbl_assets
-- ----------------------------
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_assign_asset
-- ----------------------------
ALTER TABLE "public"."tbl_assign_asset" ADD CONSTRAINT "tbl_assign_asset_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_audit_trail
-- ----------------------------
ALTER TABLE "public"."tbl_audit_trail" ADD CONSTRAINT "tbl_audit_trail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_brand
-- ----------------------------
ALTER TABLE "public"."tbl_brand" ADD CONSTRAINT "tbl_brand_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_category
-- ----------------------------
ALTER TABLE "public"."tbl_category" ADD CONSTRAINT "tbl_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_company
-- ----------------------------
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_department
-- ----------------------------
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_employee
-- ----------------------------
ALTER TABLE "public"."tbl_employee" ADD CONSTRAINT "tbl_employee_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_items
-- ----------------------------
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_module
-- ----------------------------
ALTER TABLE "public"."tbl_module" ADD CONSTRAINT "tbl_module_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_physical_count
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count" ADD CONSTRAINT "tbl_physical_count_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_physical_count_dis
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_dis" ADD CONSTRAINT "tbl_physical_count_des_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_physical_count_personnels
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_personnels" ADD CONSTRAINT "tbl_physical_count_personnels_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_physical_count_ras
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_ras" ADD CONSTRAINT "tbl_physical_count_ras_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_physical_count_rcs
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_rcs" ADD CONSTRAINT "tbl_physical_count_rcs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_position
-- ----------------------------
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_racks
-- ----------------------------
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_services
-- ----------------------------
ALTER TABLE "public"."tbl_services" ADD CONSTRAINT "tbl_services_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_services_report
-- ----------------------------
ALTER TABLE "public"."tbl_services_report" ADD CONSTRAINT "tbl_services_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_services_technical
-- ----------------------------
ALTER TABLE "public"."tbl_services_technical" ADD CONSTRAINT "tbl_services_technical_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_sub_category
-- ----------------------------
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_sub_module
-- ----------------------------
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_supplies
-- ----------------------------
ALTER TABLE "public"."tbl_supplies" ADD CONSTRAINT "tbl_supplies_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_supplies_info
-- ----------------------------
ALTER TABLE "public"."tbl_supplies_info" ADD CONSTRAINT "tbl_supplies_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbl_users_permissions
-- ----------------------------
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_assets
-- ----------------------------
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_assets_id_fkey" FOREIGN KEY ("asset_id") REFERENCES "public"."tbl_assets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_audit_trail
-- ----------------------------
ALTER TABLE "public"."tbl_audit_trail" ADD CONSTRAINT "tbl_audit_trail_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_brand
-- ----------------------------
ALTER TABLE "public"."tbl_brand" ADD CONSTRAINT "tbl_brand_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_brand" ADD CONSTRAINT "tbl_brand_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_brand" ADD CONSTRAINT "tbl_brand_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_brand" ADD CONSTRAINT "tbl_brand_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_category
-- ----------------------------
ALTER TABLE "public"."tbl_category" ADD CONSTRAINT "tbl_category_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_category" ADD CONSTRAINT "tbl_category_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_category" ADD CONSTRAINT "tbl_category_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_category" ADD CONSTRAINT "tbl_category_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_company
-- ----------------------------
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_department
-- ----------------------------
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_department_head_id_fkey" FOREIGN KEY ("department_head_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_employee
-- ----------------------------
ALTER TABLE "public"."tbl_employee" ADD CONSTRAINT "tbl_employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee" ADD CONSTRAINT "tbl_employee_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."tbl_department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee" ADD CONSTRAINT "tbl_employee_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "public"."tbl_position" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee" ADD CONSTRAINT "tbl_employee_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_items
-- ----------------------------
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "public"."tbl_brand" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_rack_id_fkey" FOREIGN KEY ("rack_id") REFERENCES "public"."tbl_racks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_module
-- ----------------------------
ALTER TABLE "public"."tbl_module" ADD CONSTRAINT "tbl_module_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_module" ADD CONSTRAINT "tbl_module_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_module" ADD CONSTRAINT "tbl_module_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_module" ADD CONSTRAINT "tbl_module_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_physical_count
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count" ADD CONSTRAINT "tbl_physical_count_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count" ADD CONSTRAINT "tbl_physical_count_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count" ADD CONSTRAINT "tbl_physical_count_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count" ADD CONSTRAINT "tbl_physical_count_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_physical_count_dis
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_dis" ADD CONSTRAINT "tbl_physical_count_des_assigned_by_fkey" FOREIGN KEY ("assigned_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_dis" ADD CONSTRAINT "tbl_physical_count_des_count_by_fkey" FOREIGN KEY ("count_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_dis" ADD CONSTRAINT "tbl_physical_count_des_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."tbl_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_dis" ADD CONSTRAINT "tbl_physical_count_des_physical_count_id_fkey" FOREIGN KEY ("physical_count_id") REFERENCES "public"."tbl_physical_count" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_physical_count_personnels
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_personnels" ADD CONSTRAINT "tbl_physical_count_personnels_assigned_by_fkey" FOREIGN KEY ("assigned_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_personnels" ADD CONSTRAINT "tbl_physical_count_personnels_physical_count_id_fkey" FOREIGN KEY ("physical_count_id") REFERENCES "public"."tbl_physical_count" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_personnels" ADD CONSTRAINT "tbl_physical_count_personnels_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_physical_count_ras
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_ras" ADD CONSTRAINT "tbl_physical_count_ras_assigned_by_fkey" FOREIGN KEY ("assigned_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_ras" ADD CONSTRAINT "tbl_physical_count_ras_count_by_fkey" FOREIGN KEY ("count_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_ras" ADD CONSTRAINT "tbl_physical_count_ras_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."tbl_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_ras" ADD CONSTRAINT "tbl_physical_count_ras_physical_count_id_fkey" FOREIGN KEY ("physical_count_id") REFERENCES "public"."tbl_physical_count" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_physical_count_rcs
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_rcs" ADD CONSTRAINT "tbl_physical_count_rcs_assigned_by_fkey" FOREIGN KEY ("assigned_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_rcs" ADD CONSTRAINT "tbl_physical_count_rcs_count_by_fkey" FOREIGN KEY ("count_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_rcs" ADD CONSTRAINT "tbl_physical_count_rcs_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."tbl_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_rcs" ADD CONSTRAINT "tbl_physical_count_rcs_physical_count_id_fkey" FOREIGN KEY ("physical_count_id") REFERENCES "public"."tbl_physical_count" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_position
-- ----------------------------
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."tbl_department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_racks
-- ----------------------------
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_services_report
-- ----------------------------
ALTER TABLE "public"."tbl_services_report" ADD CONSTRAINT "tbl_services_report_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_services_technical
-- ----------------------------
ALTER TABLE "public"."tbl_services_technical" ADD CONSTRAINT "tbl_services_technical_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_sub_category
-- ----------------------------
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."tbl_category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_sub_module
-- ----------------------------
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "public"."tbl_module" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_supplies
-- ----------------------------
ALTER TABLE "public"."tbl_supplies" ADD CONSTRAINT "tbl_supplies_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_supplies" ADD CONSTRAINT "tbl_supplies_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_supplies" ADD CONSTRAINT "tbl_supplies_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_supplies" ADD CONSTRAINT "tbl_supplies_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_supplies_info
-- ----------------------------
ALTER TABLE "public"."tbl_supplies_info" ADD CONSTRAINT "tbl_supplies_info_supply_id_fkey" FOREIGN KEY ("supply_id") REFERENCES "public"."tbl_supplies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tbl_users_permissions
-- ----------------------------
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
