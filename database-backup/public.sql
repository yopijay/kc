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

 Date: 06/06/2023 08:02:40
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
-- Sequence structure for tbl_physical_count_descrepancy_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_physical_count_descrepancy_id_seq";
CREATE SEQUENCE "public"."tbl_physical_count_descrepancy_id_seq" 
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
INSERT INTO "public"."tbl_audit_trail" VALUES (2, 'VD7RTNL', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-05-24 10:54:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (3, 'Z8Y0NLY', 'tbl_users', 3, 'all', NULL, NULL, 'create', 1, '2023-05-24 10:59:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (4, 'T0W0VSP', 'tbl_items', 1, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:05:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (5, 'VF9EGRP', 'tbl_items', 2, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:05:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (6, 'M3PCXVQ', 'tbl_items', 3, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:05:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (7, 'U0HKL7W', 'tbl_items', 4, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:06:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (8, '8V4RS1R', 'tbl_items', 5, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:06:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (9, 'LJYPLIA', 'tbl_items', 6, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:16:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (10, '8Y45599', 'tbl_items', 7, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:16:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (11, 'C4ACWOJ', 'tbl_items', 8, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:17:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (12, '8B87W0Z', 'tbl_items', 9, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:17:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (13, 'KD9J9N1', 'tbl_items', 10, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:18:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (14, 'QCR459O', 'tbl_items', 11, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:19:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (15, '138CZFL', 'tbl_items', 12, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:19:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (16, 'Y6PGJ4U', 'tbl_items', 13, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:19:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (17, 'HWZVTPA', 'tbl_items', 14, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:19:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (18, 'JC97339', 'tbl_items', 15, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:19:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (19, 'PAURMMA', 'tbl_items', 16, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:20:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (20, 'C9NWXT2', 'tbl_items', 17, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:21:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (21, 'NCCMH92', 'tbl_items', 18, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:21:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (22, 'O8CPGIT', 'tbl_items', 19, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:21:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (23, 'ZGSZ9NX', 'tbl_items', 20, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:21:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (24, 'IZQTX7N', 'tbl_items', 21, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:22:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (25, 'W5P6HU6', 'tbl_items', 22, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:22:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (26, 'THI4BO7', 'tbl_items', 23, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (27, 'OUM6Z3Z', 'tbl_items', 24, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:23:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (28, '8KH3FWS', 'tbl_items', 25, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:24:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (29, 'DOHKUC3', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 1, '2023-05-24 11:24:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (30, '6U0RXCC', 'tbl_physical_count', 1, 'personnel', '[]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}}]', 'update', 1, '2023-05-24 11:25:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (31, 'EBWM1IN', 'tbl_physical_count_personnels', 1, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-05-24 11:25:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (32, 'GKSGZOW', 'tbl_physical_count_personnels', 1, 'physical_count_id', NULL, '1', 'update', 1, '2023-05-24 11:25:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (33, 'SI9SWGU', 'tbl_physical_count_personnels', 1, 'type', NULL, 'admin', 'update', 1, '2023-05-24 11:25:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (34, 'XJ9E3KV', 'tbl_physical_count_personnels', 1, 'assigned_by', NULL, '1', 'update', 1, '2023-05-24 11:25:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (35, '9KGSB72', 'tbl_physical_count', 1, 'date_from', '2023-5-24', '2023-5-25', 'update', 1, '2023-05-25 08:10:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (36, 'P5MIMKY', 'tbl_physical_count', 1, 'date_to', '2023-5-24', '2023-5-25', 'update', 1, '2023-05-25 08:10:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (37, 'R2BAAPI', 'tbl_physical_count', 1, 'date_from', '2023-5-25', '2023-5-26', 'update', 1, '2023-05-26 08:06:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (38, '67EFE1T', 'tbl_physical_count', 1, 'date_to', '2023-5-25', '2023-5-26', 'update', 1, '2023-05-26 08:06:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (39, 'O3YI5AK', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 08:52:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (40, 'GEWQFB4', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (41, 'TTI9ZFI', 'tbl_physical_count_personnels', 2, 'physical_count_id', NULL, '1', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (42, 'GCOBD46', 'tbl_physical_count', 1, 'personnel', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}}]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":3,"name":"UY, CONSTANCIA FRANCISCO"}}]', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (43, 'JZTUT5I', 'tbl_physical_count_personnels', 2, 'type', NULL, 'rcs', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (44, 'XEGPH85', 'tbl_physical_count_personnels', 2, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (45, 'Q1G8F2P', 'tbl_physical_count_personnels', 2, 'assigned_by', NULL, '1', 'update', 1, '2023-05-26 08:52:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (46, 'L62CW03', 'tbl_physical_count', 1, 'personnel', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":3,"name":"UY, CONSTANCIA FRANCISCO"}}]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}}]', 'update', 1, '2023-05-26 08:52:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (47, 'B70OT7D', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 08:52:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (48, 'Q8VCBQP', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 08:52:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (49, '119CFIM', 'tbl_physical_count', 1, 'personnel', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":3,"name":"UY, CONSTANCIA FRANCISCO"}}]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}}]', 'update', 1, '2023-05-26 08:58:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (50, '7MNKWL3', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 08:58:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (51, '8SS8CP8', 'tbl_users', 4, 'all', NULL, NULL, 'create', 1, '2023-05-26 13:24:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (52, 'EREEBEJ', 'tbl_physical_count_personnels', 1, 'assigned_by', '1', '1', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (53, '7E134G6', 'tbl_physical_count_personnels', 2, 'type', 'rcs', 'ras', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (54, 'E96E50K', 'tbl_physical_count_personnels', 2, 'assigned_by', '2', '1', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (56, 'HFO9GOS', 'tbl_physical_count_personnels', 3, 'branch', NULL, 'quezon_ave', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (57, 'M8EAR0B', 'tbl_physical_count_personnels', 3, 'type', NULL, 'rcs', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (58, '0LFJ1LO', 'tbl_physical_count_personnels', 3, 'assigned_by', NULL, '1', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (55, '63GDDQ7', 'tbl_physical_count_personnels', 3, 'physical_count_id', NULL, '1', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (59, '9YD78LT', 'tbl_physical_count', 1, 'personnel', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":3,"name":"UY, CONSTANCIA FRANCISCO"}}]', '[{"branch":"quezon_ave","type":"admin","employee":{"id":2,"name":"UY, AGUSTIN TAN"}},{"branch":"quezon_ave","type":"ras","employee":{"id":3,"name":"UY, CONSTANCIA FRANCISCO"}},{"branch":"quezon_ave","type":"rcs","employee":{"id":4,"name":"JUDAN, PAUL JOHN SOLANO"}}]', 'update', 1, '2023-05-26 13:25:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (60, 'UCBKBGO', 'tbl_items', 26, 'all', NULL, NULL, 'create', 2, '2023-05-26 14:48:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (61, '4FMKZ3V', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 2, '2023-05-26 14:48:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (62, 'RFNXZGM', 'tbl_physical_count', 1, 'date_to', '2023-5-26', '2023-5-29', 'update', 1, '2023-05-29 08:04:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (63, 'VO2OEY0', 'tbl_physical_count', 1, 'date_from', '2023-5-26', '2023-5-29', 'update', 1, '2023-05-29 08:04:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (64, 'Y70CKMB', 'tbl_physical_count', 1, 'total_items', '25', '26', 'update', 1, '2023-05-29 08:04:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (65, 'PL4C09W', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:20:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (66, 'IO09VFD', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:22:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (67, '0ANP2IH', 'tbl_physical_count_rcs', 4, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:30:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (68, 'DAERCIA', 'tbl_physical_count_rcs', 5, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:31:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (69, 'DC7YPK9', 'tbl_physical_count_rcs', 6, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:31:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (70, 'XNM5Y97', 'tbl_physical_count_rcs', 6, 'count_by', '4', '4', 'update', 2, '2023-05-29 11:33:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (71, 'SHGXLPH', 'tbl_physical_count_rcs', 6, 'count_by', '4', '3', 'update', 2, '2023-05-29 11:35:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (72, '1U51SOD', 'tbl_physical_count_rcs', 6, 'count_by', '3', '4', 'update', 2, '2023-05-29 11:35:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (73, 'WYARMB3', 'tbl_physical_count_rcs', 7, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:44:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (74, '7THU5WE', 'tbl_physical_count_rcs', 8, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:50:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (75, 'OQKDD12', 'tbl_physical_count_rcs', 9, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:50:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (76, '51HN47L', 'tbl_physical_count_rcs', 10, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:50:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (77, 'JPE5SJ7', 'tbl_physical_count_rcs', 11, 'all', NULL, NULL, 'create', 2, '2023-05-29 11:50:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (78, 'ZU4AUL7', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:49:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (79, 'V45ADGR', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:49:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (80, 'CJHA7AG', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:50:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (81, 'DLFRZI8', 'tbl_physical_count_rcs', 4, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:57:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (82, 'EBECRYG', 'tbl_physical_count_rcs', 5, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:57:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (83, 'TL0YA6I', 'tbl_physical_count_rcs', 6, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:57:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (84, 'UXALQFU', 'tbl_physical_count_rcs', 7, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:58:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (85, 'W2Z05PX', 'tbl_physical_count_rcs', 8, 'all', NULL, NULL, 'create', 2, '2023-05-29 16:58:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (86, 'ZTN027X', 'tbl_physical_count_rcs', 7, 'count_by', '4', '4', 'update', 2, '2023-05-29 16:58:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (88, '799UNQJ', 'tbl_physical_count', 1, 'date_from', '2023-5-29', '2023-5-30', 'update', 1, '2023-05-30 08:08:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (87, 'WQG1TI3', 'tbl_physical_count', 1, 'date_to', '2023-5-29', '2023-5-30', 'update', 1, '2023-05-30 08:08:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (89, 'IH0VAEI', 'tbl_physical_count_rcs', 9, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (90, '1PB3AJS', 'tbl_physical_count_rcs', 10, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (91, 'EIS2F5Q', 'tbl_physical_count_rcs', 11, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (92, '7L8Y7HZ', 'tbl_physical_count_rcs', 12, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (93, 'U5SWNV7', 'tbl_physical_count_rcs', 13, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (94, 'YFNZRXP', 'tbl_physical_count_rcs', 14, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (95, 'VFQ1W85', 'tbl_physical_count_rcs', 15, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (96, 'YUPPM3Z', 'tbl_physical_count_rcs', 16, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (97, 'HI3HAN1', 'tbl_physical_count_rcs', 17, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:43:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (98, '25SJIIU', 'tbl_physical_count_rcs', 18, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (99, 'J07SRDD', 'tbl_physical_count_rcs', 19, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (100, 'FDXKOGB', 'tbl_physical_count_rcs', 19, 'count_by', '4', '4', 'update', 2, '2023-05-30 08:44:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (101, 'XPSIOMZ', 'tbl_physical_count_rcs', 20, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (102, 'E17WUD5', 'tbl_physical_count_rcs', 21, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (103, '2GS00L5', 'tbl_physical_count_rcs', 22, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (104, 'UIEZ907', 'tbl_physical_count_rcs', 23, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (105, 'B0UWUH4', 'tbl_physical_count_rcs', 24, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (106, 'WQRFLQB', 'tbl_physical_count_rcs', 25, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (107, 'PWB6T2C', 'tbl_physical_count_rcs', 26, 'all', NULL, NULL, 'create', 2, '2023-05-30 08:44:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (108, 'R80UU3H', 'tbl_racks', 25, 'all', NULL, NULL, 'create', 1, '2023-05-30 10:18:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (109, 'E929R79', 'tbl_racks', 26, 'all', NULL, NULL, 'create', 1, '2023-05-30 10:18:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (110, 'D9AHZQH', 'tbl_items', 27, 'all', NULL, NULL, 'create', 1, '2023-05-30 10:20:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (111, '30CX4XO', 'tbl_physical_count_rcs', 1, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:23:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (112, '94QPLQ2', 'tbl_physical_count_rcs', 2, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:27:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (113, '48ULANC', 'tbl_physical_count_rcs', 3, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:27:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (114, 'TZUSPP2', 'tbl_physical_count_rcs', 4, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:27:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (115, 'ZBRUCZ9', 'tbl_physical_count_rcs', 5, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:27:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (116, 'L1L99G0', 'tbl_physical_count_rcs', 6, 'all', NULL, NULL, 'create', 2, '2023-05-30 11:27:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (117, 'RHYJN6A', 'tbl_physical_count_rcs', 7, 'all', NULL, NULL, 'create', 2, '2023-05-30 13:10:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (118, 'ENLBSD9', 'tbl_physical_count_rcs', 8, 'all', NULL, NULL, 'create', 2, '2023-05-30 13:10:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (119, '3GF5K71', 'tbl_physical_count_rcs', 9, 'all', NULL, NULL, 'create', 2, '2023-05-30 13:10:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (120, 'SXYFZ0L', 'tbl_physical_count_rcs', 10, 'all', NULL, NULL, 'create', 2, '2023-05-30 13:10:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (121, '5S08VH3', 'tbl_physical_count_rcs', 11, 'all', NULL, NULL, 'create', 2, '2023-05-30 13:11:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (122, '3CGKCIM', 'tbl_physical_count', 1, 'date_from', '2023-5-30', '2023-5-31', 'update', 1, '2023-05-30 16:25:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (123, 'OTG88H6', 'tbl_physical_count', 1, 'date_to', '2023-5-30', '2023-5-31', 'update', 1, '2023-05-30 16:25:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (124, '830ZLRU', 'tbl_physical_count', 1, 'total_items', '26', '27', 'update', 1, '2023-05-30 16:25:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (125, 'UW5EZ7W', 'tbl_physical_count', 1, 'date_from', '2023-5-31', '2023-5-30', 'update', 1, '2023-05-30 16:26:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (126, 'ENRPKIV', 'tbl_physical_count', 1, 'date_to', '2023-5-31', '2023-5-30', 'update', 1, '2023-05-30 16:26:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (127, '8NOMTSD', 'tbl_physical_count', 1, 'date_from', '2023-5-30', '2023-5-31', 'update', 1, '2023-05-31 08:33:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (128, '22AG5WH', 'tbl_physical_count', 1, 'date_to', '2023-5-30', '2023-5-31', 'update', 1, '2023-05-31 08:33:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (129, 'D1JE5GJ', 'tbl_items', 27, 'rack_id', '25', '1', 'update', 1, '2023-05-31 14:45:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (131, 'D3N0GGP', 'tbl_physical_count', 1, 'date_to', '2023-5-31', '2023-6-1', 'update', 1, '2023-06-01 08:41:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (130, 'FQ56OYS', 'tbl_physical_count', 1, 'date_from', '2023-5-31', '2023-6-1', 'update', 1, '2023-06-01 08:41:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (132, 'VK5CWBK', 'tbl_physical_count_rcs', 2, 'qty_per_mother_box', '0', '100', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (133, 'CUEVEHU', 'tbl_physical_count_rcs', 2, 'qty_mother_box', '0', '5', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (134, '4USZUVE', 'tbl_physical_count_rcs', 2, 'qty_small_box', '0', '12', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (135, 'VEFDUYW', 'tbl_physical_count_rcs', 2, 'qty_per_small_box', '0', '10', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (136, 'JALZ67I', 'tbl_physical_count_rcs', 2, 'tingi', '0', '8', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (137, 'KP5A9SN', 'tbl_physical_count_rcs', 2, 'total', '0', '628', 'update', 4, '2023-06-01 16:59:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (138, 'XERGQQ0', 'tbl_physical_count', 1, 'date_from', '2023-6-1', '2023-6-2', 'update', 1, '2023-06-02 08:41:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (139, 'GB8XLJN', 'tbl_physical_count', 1, 'date_to', '2023-6-1', '2023-6-2', 'update', 1, '2023-06-02 08:41:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (140, 'C3G5N78', 'tbl_physical_count_rcs', 12, 'all', NULL, NULL, 'create', 2, '2023-06-02 09:30:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (142, 'ML42FVP', 'tbl_physical_count_rcs', 3, 'qty_per_mother_box', '0', '10', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (141, 'I3HHIEJ', 'tbl_physical_count_rcs', 3, 'qty_mother_box', '0', '5', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (143, 'OBFLK75', 'tbl_physical_count_rcs', 3, 'qty_small_box', '0', '7', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (144, 'ODG6UNG', 'tbl_physical_count_rcs', 3, 'qty_per_small_box', '0', '100', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (145, 'WAYJXBS', 'tbl_physical_count_rcs', 3, 'total', '0', '753', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (146, 'IS5BJTI', 'tbl_physical_count_rcs', 3, 'tingi', '0', '3', 'update', 4, '2023-06-02 09:53:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (147, 'HQITZUU', 'tbl_physical_count_rcs', 4, 'qty_small_box', '0', '5', 'update', 4, '2023-06-02 09:57:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (148, 'QH0QDYJ', 'tbl_physical_count_rcs', 4, 'qty_per_small_box', '0', '100', 'update', 4, '2023-06-02 09:57:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (149, '5RXVTS2', 'tbl_physical_count_rcs', 4, 'tingi', '0', '78', 'update', 4, '2023-06-02 09:57:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (150, 'ZLMA83S', 'tbl_physical_count_rcs', 4, 'total', '0', '578', 'update', 4, '2023-06-02 09:57:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (151, '6LRG1A2', 'tbl_physical_count', 2, 'all', NULL, NULL, 'create', 1, '2023-06-02 14:02:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (152, '947DFT1', 'tbl_physical_count', 3, 'all', NULL, NULL, 'create', 1, '2023-06-02 14:18:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (153, 'DAWQ85O', 'tbl_physical_count', 1, 'date_to', '2023-6-2', '2023-6-5', 'update', 1, '2023-06-02 14:25:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (154, '76JONNI', 'tbl_physical_count', 4, 'all', NULL, NULL, 'create', 1, '2023-06-02 14:58:25+08');

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
INSERT INTO "public"."tbl_employee" VALUES (2, 2, '77100001', NULL, 2, 3, 4, 'AGUSTIN', 'TAN', 'UY', 'sto_domingo', 'male');
INSERT INTO "public"."tbl_employee" VALUES (3, 3, '77100002', NULL, 2, 3, 4, 'CONSTANCIA', 'FRANCISCO', 'UY', 'sto_domingo', 'female');
INSERT INTO "public"."tbl_employee" VALUES (4, 4, '22100427', '0006318192', 3, 2, 3, 'PAUL JOHN', 'SOLANO', 'JUDAN', 'quezon_ave', 'male');

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
INSERT INTO "public"."tbl_items" VALUES (2, 'ITM-0000002', 1, 1, 'ES6 4A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:05:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (3, 'ITM-0000003', 1, 1, 'ES6 6A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:05:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (4, 'ITM-0000004', 1, 1, 'ES6 10A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:06:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (5, 'ITM-0000005', 1, 1, 'ES6 16A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:06:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (6, 'ITM-0000006', 4, 7, 'EA32B 5A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:16:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (7, 'ITM-0000007', 4, 7, 'EA32B 10A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:16:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (8, 'ITM-0000008', 4, 7, 'EA32B 15A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:17:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (9, 'ITM-0000009', 4, 7, 'EA32B 20A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:17:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (10, 'ITM-0000010', 4, 7, 'EA32B 30A 2P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:18:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (11, 'ITM-0000011', 3, 13, 'DZ47 1A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:19:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (12, 'ITM-0000012', 3, 13, 'DZ47 2A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:19:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (13, 'ITM-0000013', 3, 13, 'DZ47 3A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:19:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (14, 'ITM-0000014', 3, 13, 'DZ47 4A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:19:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (15, 'ITM-0000015', 3, 13, 'DZ47 5A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:19:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (16, 'ITM-0000016', 5, 19, 'HBD51-HD 15A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:20:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (17, 'ITM-0000017', 5, 19, 'HBD51-HD 20A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (18, 'ITM-0000018', 5, 19, 'HBD51-HD 30A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (19, 'ITM-0000019', 5, 19, 'HBD51-HD 40A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (21, 'ITM-0000021', 7, 2, 'DRSP12W W/ 100A 1P BB', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:22:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (22, 'ITM-0000022', 7, 2, 'DRSP12W W/ 63A 1P BB', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:22:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (23, 'ITM-0000023', 2, 3, 'A19-1-1', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:23:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (24, 'ITM-0000024', 2, 3, 'AB301-2-1', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:23:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (25, 'ITM-0000025', 2, 3, 'AB301-3-1.2', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:24:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (26, 'ITM-0000026', 6, 1, 'NSX100H 63A 3P (LV429672)', NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 2, NULL, NULL, NULL, '2023-05-26 14:48:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (20, 'ITM-0000020', 5, 19, 'HBD51-HD 50A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:21:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (1, 'ITM-0000001', 1, 1, 'ES6 2A 1P', NULL, 'pc', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-05-24 11:05:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (27, 'ITM-0000027', 5, 1, 'UANS FBWB1B', NULL, 'undefined', 0, 0, 0, 0, 0, 0, NULL, NULL, 1, 1, 1, NULL, NULL, '2023-05-30 10:20:49+08', '2023-05-31 14:45:03+08', NULL, NULL);

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

-- ----------------------------
-- Table structure for tbl_physical_count_descrepancy
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_physical_count_descrepancy";
CREATE TABLE "public"."tbl_physical_count_descrepancy" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_physical_count_descrepancy_id_seq'::regclass),
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
-- Records of tbl_physical_count_descrepancy
-- ----------------------------

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
INSERT INTO "public"."tbl_users" VALUES (1, 'USR-0000000', 'superadmin@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '0000000000', 'superadmin', 1, 1, 1, NULL, NULL, NULL, '2022-12-21 11:13:47.452153+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (2, 'USR-0000001', 'agustin_uy@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '9178380071', 'superadmin', 0, 1, 1, NULL, NULL, NULL, '2023-05-24 10:54:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (3, 'USR-0000002', 'constancia_uy@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '9178110071', 'superadmin', 0, 1, 1, NULL, NULL, NULL, '2023-05-24 10:59:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (4, 'USR-0000003', 'judan.pauljohn@gmail.com', 'QElUMDAwMA==', '9502099508', 'user', 0, 1, 1, NULL, NULL, NULL, '2023-05-26 13:24:58+08', NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_users_permissions" VALUES (1, 'SCQL0YW', 2, NULL, 1, '2023-05-24 10:54:44+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (2, 'YEYFD52', 3, NULL, 1, '2023-05-24 10:59:06+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (3, 'RT64N6A', 4, NULL, 1, '2023-05-26 13:24:58+08');

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
SELECT setval('"public"."tbl_audit_trail_id_seq"', 155, true);

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
SELECT setval('"public"."tbl_company_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_depertment_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_employee_id_seq"', 5, true);

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
ALTER SEQUENCE "public"."tbl_physical_count_descrepancy_id_seq"
OWNED BY "public"."tbl_physical_count_descrepancy"."id";
SELECT setval('"public"."tbl_physical_count_descrepancy_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_id_seq"
OWNED BY "public"."tbl_physical_count"."id";
SELECT setval('"public"."tbl_physical_count_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_personnels_id_seq"
OWNED BY "public"."tbl_physical_count_personnels"."id";
SELECT setval('"public"."tbl_physical_count_personnels_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_ras_id_seq"
OWNED BY "public"."tbl_physical_count_ras"."id";
SELECT setval('"public"."tbl_physical_count_ras_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_rcs_id_seq"
OWNED BY "public"."tbl_physical_count_rcs"."id";
SELECT setval('"public"."tbl_physical_count_rcs_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_position_id_seq"', 5, true);

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
SELECT setval('"public"."tbl_users_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_users_permissions_id_seq"
OWNED BY "public"."tbl_users_permissions"."id";
SELECT setval('"public"."tbl_users_permissions_id_seq"', 4, true);

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
-- Primary Key structure for table tbl_physical_count_descrepancy
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_descrepancy" ADD CONSTRAINT "tbl_physical_count_descrepancy_pkey" PRIMARY KEY ("id");

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
-- Foreign Keys structure for table tbl_physical_count_descrepancy
-- ----------------------------
ALTER TABLE "public"."tbl_physical_count_descrepancy" ADD CONSTRAINT "tbl_physical_count_descrepancy_assigned_by_fkey" FOREIGN KEY ("assigned_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_descrepancy" ADD CONSTRAINT "tbl_physical_count_descrepancy_count_by_fkey" FOREIGN KEY ("count_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_descrepancy" ADD CONSTRAINT "tbl_physical_count_descrepancy_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "public"."tbl_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_physical_count_descrepancy" ADD CONSTRAINT "tbl_physical_count_descrepancy_physical_count_id_fkey" FOREIGN KEY ("physical_count_id") REFERENCES "public"."tbl_physical_count" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
