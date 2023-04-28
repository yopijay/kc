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

 Date: 28/04/2023 16:59:20
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
-- Sequence structure for tbl_employee_tracker_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_employee_tracker_id_seq";
CREATE SEQUENCE "public"."tbl_employee_tracker_id_seq" 
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
INSERT INTO "public"."tbl_assign_asset" VALUES (1, 'ISSUANCE-0000001', 2, 22, 3, 13, 1, 107, NULL, 1, 1, NULL, NULL, NULL, '2023-02-23 15:54:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (2, 'ISSUANCE-0000002', 2, 22, 3, 14, 4, 107, NULL, 1, 1, NULL, NULL, NULL, '2023-02-23 16:04:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (3, 'ISSUANCE-0000003', 2, 22, 3, 16, 9, 104, NULL, 1, 1, 1, NULL, NULL, '2023-02-23 16:26:25+08', '2023-02-27 14:11:09+08', NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (4, 'ISSUANCE-0000004', 1, 5, 4, 21, 27, 8, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 15:03:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (5, 'ISSUANCE-0000005', 2, 22, 4, 17, 12, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:00:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (6, 'ISSUANCE-0000006', 2, 22, 4, 20, 15, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (7, 'ISSUANCE-0000007', 2, 22, 4, 22, 17, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (8, 'ISSUANCE-0000008', 2, 22, 4, 22, 18, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (9, 'ISSUANCE-0000009', 2, 22, 3, 13, 2, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:02:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (10, 'ISSUANCE-0000010', 2, 22, 3, 14, 5, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:02:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (11, 'ISSUANCE-0000011', 2, 39, 4, 21, 28, 341, NULL, 1, 1, NULL, NULL, NULL, '2023-03-01 11:35:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (12, 'ISSUANCE-0000012', 2, 22, 4, 19, 29, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-03-01 14:11:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (13, 'ISSUANCE-0000013', 1, 4, 4, 21, 30, 12, NULL, 1, 1, NULL, NULL, NULL, '2023-03-02 16:04:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (14, 'ISSUANCE-0000014', 1, 6, 4, 21, 31, 10, NULL, 1, 1, NULL, NULL, NULL, '2023-03-06 10:21:00+08', NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_audit_trail" VALUES (1, 'YVB3U0Z', 'tbl_module', 1, 'all', NULL, NULL, 'create', 1, '2023-04-12 09:35:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (2, 'YNO60CJ', 'tbl_module', 2, 'all', NULL, NULL, 'create', 1, '2023-04-12 09:35:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (3, 'COMG9ZF', 'tbl_sub_module', 1, 'all', NULL, NULL, 'create', 1, '2023-04-12 10:15:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (4, 'PAB43RE', 'tbl_sub_module', 1, 'is_maintenance', '0', '1', 'update', 1, '2023-04-12 10:25:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (5, 'WZCQKP2', 'tbl_sub_module', 1, 'is_maintenance', '1', '0', 'update', 1, '2023-04-12 10:25:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (6, 'VFR7SDZ', 'tbl_sub_module', 2, 'all', NULL, NULL, 'create', 1, '2023-04-12 10:49:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (7, 'C2N29W5', 'tbl_sub_module', 3, 'all', NULL, NULL, 'create', 1, '2023-04-12 10:49:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (8, 'KO4LPVV', 'tbl_sub_module', 1, 'is_maintenance', '0', '1', 'update', 1, '2023-04-12 14:04:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (9, 'YDFY3TH', 'tbl_company', 2, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:28:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (10, 'MIDDSMG', 'tbl_company', 3, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:28:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (11, 'DXE7O9U', 'tbl_company', 4, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:28:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (12, 'UHDHMOI', 'tbl_department', 2, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:31:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (13, 'UCN46KF', 'tbl_position', 2, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:32:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (14, '9R384IN', 'tbl_position', 3, 'all', NULL, NULL, 'create', 1, '2023-04-13 08:32:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (15, 'QXM4W0Y', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-04-13 09:46:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (16, 'K9ECR1E', 'tbl_users', 3, 'all', NULL, NULL, 'create', 1, '2023-04-13 09:51:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (17, 'CA4NR2L', 'tbl_sub_module', 4, 'all', NULL, NULL, 'create', 1, '2023-04-13 14:26:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (18, '6LW0NO5', 'tbl_users_permissions', 1, 'permissions', NULL, '{"module_2":[{"sub_module":1,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}},{"sub_module":2,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}},{"sub_module":3,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}}]}', 'update', 1, '2023-04-13 15:18:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (19, 'IP92KS8', 'tbl_users_permissions', 1, 'permissions', '{"module_2":[{"sub_module":1,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}},{"sub_module":2,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}},{"sub_module":3,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":false,"add":false,"update":false,"export":false,"print":false}}]}', '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":2,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":3,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}]}', 'update', 1, '2023-04-13 15:29:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (20, 'N7ZN0IH', 'tbl_department', 3, 'all', NULL, NULL, 'create', 1, '2023-04-13 16:54:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (21, 'I4HILGL', 'tbl_position', 4, 'all', NULL, NULL, 'create', 1, '2023-04-13 16:54:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (22, 'UVUST3H', 'tbl_users', 4, 'all', NULL, NULL, 'create', 1, '2023-04-13 16:55:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (23, 'C5BTBQ0', 'tbl_users_permissions', 3, 'permissions', NULL, '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":false,"update":false,"export":true,"print":false}},{"sub_module":2,"actions":{"view":true,"add":false,"update":false,"export":true,"print":false}},{"sub_module":3,"actions":{"view":true,"add":false,"update":false,"export":true,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":false,"update":false,"export":true,"print":false}}]}', 'update', 1, '2023-04-13 16:57:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (24, 'ADK012F', 'tbl_users_permissions', 1, 'permissions', '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":2,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":3,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}]}', '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}},{"sub_module":2,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}},{"sub_module":3,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}}]}', 'update', 1, '2023-04-14 08:03:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (25, 'M6B01IH', 'tbl_users_permissions', 1, 'permissions', '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}},{"sub_module":2,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}},{"sub_module":3,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":true,"update":true,"export":false,"print":false}}]}', '{"module_2":[{"sub_module":1,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":2,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}},{"sub_module":3,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}],"module_1":[{"sub_module":4,"actions":{"view":true,"add":true,"update":true,"export":true,"print":false}}]}', 'update', 1, '2023-04-14 08:03:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (26, 'MIDJMF5', 'tbl_users', 3, 'password', 'QEFkbWluMDAwMA==', 'UUVGa2JXbHVNREF3TUE9PQ==', 'update', 1, '2023-04-14 09:15:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (27, '8GJAHHE', 'tbl_users', 3, 'password', 'UUVGa2JXbHVNREF3TUE9PQ==', 'UUVGa2JXbHVNREF3TUE9PQ==', 'update', 1, '2023-04-14 09:16:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (28, 'QFY0E5R', 'tbl_users', 3, 'mname', NULL, 'CHUA', 'update', 1, '2023-04-14 09:18:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (29, 'WUMKZFD', 'tbl_module', 3, 'all', NULL, NULL, 'create', 1, '2023-04-14 10:46:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (30, 'G05NISR', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-04-14 10:56:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (31, 'Z8FBIYP', 'tbl_users_permissions', 1, 'permissions', NULL, '[]', 'update', 1, '2023-04-14 11:22:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (32, 'ICQU1TO', 'tbl_users_permissions', 1, 'permissions', '[]', '"[]"', 'update', 1, '2023-04-14 11:23:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (33, 'IHENFI8', 'tbl_users_permissions', 1, 'permissions', '', '"{\"module_2\":{},\"module_3\":{},\"module_1\":{}}"', 'update', 1, '2023-04-14 11:25:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (34, 'NMHGH23', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{},\"module_3\":{},\"module_1\":{}}"', '"{\"module_2\":{\"status\":true},\"module_3\":{},\"module_1\":{}}"', 'update', 1, '2023-04-14 11:25:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (35, 'ZRXMP0Q', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":true},\"module_3\":{},\"module_1\":{}}"', '"{\"module_2\":{\"status\":false},\"module_3\":{},\"module_1\":{}}"', 'update', 1, '2023-04-14 11:50:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (36, 'GY8BUG2', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":false},\"module_3\":{},\"module_1\":{}}"', '"{\"module_2\":{\"status\":true},\"module_3\":{},\"module_1\":{}}"', 'update', 1, '2023-04-14 11:52:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (37, 'UOFDURS', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":true},\"module_3\":{},\"module_1\":{}}"', '"{\"module_2\":{\"status\":true},\"module_3\":{\"status\":true},\"module_1\":{\"status\":true}}"', 'update', 1, '2023-04-14 11:54:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (38, 'H93ZX8P', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":true},\"module_3\":{\"status\":true},\"module_1\":{\"status\":true}}"', '"{\"module_2\":{\"status\":false},\"module_3\":{\"status\":false},\"module_1\":{\"status\":false}}"', 'update', 1, '2023-04-14 11:54:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (53, 'B9X65SS', 'tbl_sub_module', 5, 'all', NULL, NULL, 'create', 1, '2023-04-14 17:03:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (54, 'AZDGFEP', 'tbl_sub_module', 6, 'all', NULL, NULL, 'create', 1, '2023-04-17 09:08:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (39, '3MAOPHM', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":false},\"module_3\":{\"status\":false},\"module_1\":{\"status\":false}}"', '"{\"module_2\":{\"status\":true,\"submodule_1\":{},\"submodule_2\":{},\"submodule_3\":{}},\"module_3\":{\"status\":false},\"module_1\":{\"status\":false,\"submodule_4\":{}}}"', 'update', 1, '2023-04-14 13:15:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (40, 'YL94CGB', 'tbl_users_permissions', 1, 'permissions', '"{\"module_2\":{\"status\":true,\"submodule_1\":{},\"submodule_2\":{},\"submodule_3\":{}},\"module_3\":{\"status\":false},\"module_1\":{\"status\":false,\"submodule_4\":{}}}"', '"{\"module_2\":{\"status\":false,\"submodule_1\":{},\"submodule_2\":{},\"submodule_3\":{}},\"module_3\":{\"status\":false},\"module_1\":{\"status\":false,\"submodule_4\":{}}}"', 'update', 1, '2023-04-14 13:15:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (41, 'CHXRKUA', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-04-14 13:28:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (42, 'VVRENW1', 'tbl_users_permissions', 1, 'permissions', NULL, '"{\"module_2\":{\"status\":true,\"submodule_1\":{\"status\":true,\"list\":true,\"create\":true,\"update\":true,\"export\":true},\"submodule_2\":{\"status\":true,\"list\":true,\"create\":true,\"update\":true,\"export\":true},\"submodule_3\":{\"status\":true,\"list\":true,\"create\":true,\"update\":true,\"export\":true}},\"module_3\":{},\"module_1\":{\"status\":false,\"submodule_4\":{}}}"', 'update', 1, '2023-04-14 14:03:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (43, 'PRBY8F0', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-04-14 14:11:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (44, 'O6UD3JM', 'tbl_users_permissions', 1, 'permissions', NULL, '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 14:11:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (45, '6NP3307', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_3":{"status":false,"list":false,"create":false,"update":false,"export":false}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 14:19:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (46, '7QHD0DE', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_3":{"status":false,"list":false,"create":false,"update":false,"export":false}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 14:24:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (47, '7U59SBA', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 14:58:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (48, 'NHJYS3I', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":false,"update":true,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 15:00:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (49, 'ZAHMFDD', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":false,"update":true,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 15:00:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (50, 'BJ1ZHAO', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 15:05:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (51, 'RQGKW6Z', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":false,"export":false},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 15:25:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (52, 'LCMCJAM', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":false,"update":false,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-14 15:32:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (55, '4O8LBNI', 'tbl_sub_module', 7, 'all', NULL, NULL, 'create', 1, '2023-04-17 09:09:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (56, 'QGE81V3', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{}},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-17 10:40:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (57, 'EKJ5B4B', 'tbl_users', 3, 'all', NULL, NULL, 'create', 2, '2023-04-17 11:19:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (58, 'AX5H9YL', 'tbl_users_permissions', 2, 'permissions', NULL, '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"permission":true,"export":true}},"module_3":{"status":true,"submodule_6":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_1":{"status":false,"submodule_4":{}}}', 'update', 1, '2023-04-17 11:28:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (59, 'SWWL3BP', 'tbl_users', 3, 'user_level', 'admin', 'superadmin', 'update', 1, '2023-04-17 11:29:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (60, 'VB9QB4T', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{}},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{"status":true,"list":true,"export":true},"status":true},"module_1":{"submodule_4":{}}}', 'update', 1, '2023-04-17 11:36:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (61, '4GCLK8M', 'tbl_sub_module', 6, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (62, 'S2TQRXO', 'tbl_sub_module', 5, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (63, 'Q9JGHOZ', 'tbl_sub_module', 4, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (64, '2OJOUVP', 'tbl_sub_module', 3, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (65, '31XSTVN', 'tbl_sub_module', 2, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (66, 'QK2NNB8', 'tbl_sub_module', 1, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 15:59:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (67, 'SCLYKNA', 'tbl_users_permissions', 1, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{"status":true,"list":true,"export":true},"status":true},"module_1":{"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{"status":false,"list":false,"export":false},"status":false},"module_1":{"submodule_4":{}}}', 'update', 3, '2023-04-17 16:02:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (68, 'MVWD5A5', 'tbl_sub_module', 7, 'all', NULL, NULL, 'create', 3, '2023-04-17 16:04:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (69, 'L4ND88A', 'tbl_sub_module', 7, 'is_maintenance', '1', '0', 'update', 3, '2023-04-17 16:04:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (70, 'AFWU2YD', 'tbl_users_permissions', 2, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"permission":true,"export":true}},"module_3":{"status":true,"submodule_6":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_1":{"status":false,"submodule_4":{}}}', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"permission":true,"export":true}},"module_3":{"status":true,"submodule_6":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_7":{"status":true,"list":true,"update":true,"export":true}},"module_1":{"status":false,"submodule_4":{}}}', 'update', 1, '2023-04-17 16:09:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (71, '53Z5RUQ', 'tbl_services', 1, 'all', NULL, NULL, 'create', 1, '2023-04-17 16:22:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (72, 'MLWBYUV', 'tbl_services', 1, 'requested_by', NULL, 'PAUL JOHN SOLANO JUDAN', 'update', 1, '2023-04-17 16:45:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (74, '4BB61DY', 'tbl_services', 1, 'noted_by_sup', NULL, 'CALVIN SY', 'update', 1, '2023-04-17 16:45:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (73, 'F3Z43QV', 'tbl_services', 1, 'requested_by_signature', NULL, 'data:image/png;base64,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', 'update', 1, '2023-04-17 16:45:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (75, 'ZEYNK1O', 'tbl_module', 4, 'all', NULL, NULL, 'create', 3, '2023-04-18 10:18:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (76, 'C4V8ZY1', 'tbl_sub_module', 8, 'all', NULL, NULL, 'create', 3, '2023-04-18 10:18:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (77, 'Y4LRHO7', 'tbl_sub_module', 8, 'is_maintenance', '1', '0', 'update', 3, '2023-04-18 10:18:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (78, 'USVTQOC', 'tbl_users_permissions', 2, 'permissions', '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"permission":true,"export":true}},"module_3":{"status":true,"submodule_6":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_7":{"status":true,"list":true,"update":true,"export":true}},"module_1":{"status":false,"submodule_4":{}}}', '{"module_2":{"status":false,"submodule_1":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_2":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_3":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_5":{"status":false,"list":false,"create":false,"update":false,"permission":false,"export":false}},"module_3":{"status":false,"submodule_6":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_7":{"status":false,"list":false,"update":false,"export":false}},"module_1":{"status":false,"submodule_4":{}},"module_4":{"submodule_8":{}}}', 'update', 1, '2023-04-18 10:33:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (79, 'VLDVVBR', 'tbl_sub_module', 9, 'all', NULL, NULL, 'create', 3, '2023-04-18 11:04:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (80, 'IQI6PXE', 'tbl_module', 4, 'name', 'PRODUCTS', 'WAREHOUSE', 'update', 3, '2023-04-19 09:38:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (81, 'ETRVV39', 'tbl_sub_module', 10, 'all', NULL, NULL, 'create', 3, '2023-04-19 09:43:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (82, 'GEJ911H', 'tbl_brand', 1, 'all', NULL, NULL, 'create', 3, '2023-04-19 10:20:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (83, 'QPK56V5', 'tbl_brand', 2, 'all', NULL, NULL, 'create', 3, '2023-04-19 10:20:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (84, '7KCRVN5', 'tbl_brand', 1, 'status', '1', '0', 'update', 3, '2023-04-19 10:20:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (85, 'FK9ZQ04', 'tbl_brand', 1, 'status', '0', '1', 'update', 3, '2023-04-19 10:20:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (86, 'B6WH5HN', 'tbl_brand', 3, 'all', NULL, NULL, 'create', 3, '2023-04-19 11:30:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (87, 'R2FRM7I', 'tbl_sub_module', 11, 'all', NULL, NULL, 'create', 3, '2023-04-19 12:00:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (88, '3YFMYFE', 'tbl_sub_module', 11, 'is_maintenance', '1', '0', 'update', 3, '2023-04-19 12:00:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (89, '6XL2RF5', 'tbl_sub_module', 12, 'all', NULL, NULL, 'create', 3, '2023-04-19 12:00:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (90, 'D216C5K', 'tbl_sub_module', 12, 'is_maintenance', '1', '0', 'update', 3, '2023-04-19 12:00:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (91, 'LSCTP78', 'tbl_sub_module', 13, 'all', NULL, NULL, 'create', 3, '2023-04-19 12:01:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (92, '557QDB1', 'tbl_company', 4, 'status', '1', '0', 'update', 3, '2023-04-19 13:28:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (93, 'NVVLVSM', 'tbl_company', 4, 'status', '0', '1', 'update', 3, '2023-04-19 13:28:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (94, 'C70289G', 'tbl_racks', 1, 'all', NULL, NULL, 'create', 3, '2023-04-20 09:02:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (95, 'XRK3VNU', 'tbl_racks', 2, 'all', NULL, NULL, 'create', 3, '2023-04-20 09:23:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (96, 'I7E65JF', 'tbl_racks', 1, 'status', '1', '0', 'update', 3, '2023-04-20 09:26:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (97, '4WDWIC1', 'tbl_racks', 1, 'status', '0', '1', 'update', 3, '2023-04-20 09:27:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (98, '7R4XDUK', 'tbl_racks', 1, 'code', 'A1a', 'A1b', 'update', 3, '2023-04-20 09:27:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (99, '0KH122X', 'tbl_racks', 1, 'code', 'A1b', 'A1a', 'update', 3, '2023-04-20 09:27:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (100, 'Y3O69TM', 'tbl_position', 5, 'all', NULL, NULL, 'create', 3, '2023-04-20 10:12:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (101, 'E2MFIIE', 'tbl_position', 5, 'status', '1', '0', 'update', 3, '2023-04-20 10:13:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (102, 'ZK1AOAG', 'tbl_position', 5, 'status', '0', '1', 'update', 3, '2023-04-20 10:13:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (103, 'PNHDZ0E', 'tbl_brand', 4, 'all', NULL, NULL, 'create', 3, '2023-04-20 10:24:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (104, 'AR3478N', 'tbl_brand', 4, 'status', '1', '0', 'update', 3, '2023-04-20 10:24:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (105, 'Q52FFCZ', 'tbl_brand', 4, 'status', '0', '1', 'update', 3, '2023-04-20 10:24:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (106, 'W8SCPUR', 'tbl_racks', 3, 'all', NULL, NULL, 'create', 3, '2023-04-24 08:08:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (107, 'X1OB1BB', 'tbl_items', 1, 'all', NULL, NULL, 'create', 3, '2023-04-25 09:43:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (108, 'AR1RR8T', 'tbl_items', 2, 'all', NULL, NULL, 'create', 3, '2023-04-25 10:34:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (109, 'Z2TUUIO', 'tbl_items', 3, 'all', NULL, NULL, 'create', 3, '2023-04-25 10:36:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (110, 'QYIUR0Y', 'tbl_items', 2, 'item_description', 'NB1-63H 16A 2P', 'NB1-63H 16A 2P1', 'update', 3, '2023-04-25 11:09:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (111, 'LAE03FI', 'tbl_items', 2, 'item_description', 'NB1-63H 16A 2P1', 'NB1-63H 16A 2P', 'update', 3, '2023-04-25 11:11:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (112, 'XRTSCS1', 'tbl_items', 1, 'item_description', 'NB1-63H 1A 2P', 'NB1-63H 1A 2P1', 'update', 3, '2023-04-25 11:11:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (113, '4R126C1', 'tbl_items', 1, 'item_description', 'NB1-63H 1A 2P1', 'NB1-63H 1A 2P', 'update', 3, '2023-04-25 11:11:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (114, '1RPS7JT', 'tbl_items', 1, 'status', '1', '0', 'update', 3, '2023-04-25 11:11:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (115, '7U2J7MH', 'tbl_items', 1, 'status', '1', '0', 'update', 3, '2023-04-25 11:12:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (116, 'HLE9FVI', 'tbl_items', 1, 'status', '0', '1', 'update', 3, '2023-04-25 11:12:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (117, 'BBKYQXN', 'tbl_sub_module', 14, 'all', NULL, NULL, 'create', 3, '2023-04-25 11:57:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (118, 'CVV11M5', 'tbl_sub_module', 14, 'is_maintenance', '1', '0', 'update', 3, '2023-04-25 11:57:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (119, 'L8KIT7H', 'tbl_sub_module', 14, 'name', 'INVENTORY COUNT', 'INVENTORY', 'update', 3, '2023-04-25 13:31:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (120, 'T3K2A7V', 'tbl_sub_module', 14, 'path', '/inventory-count', '/inventory', 'update', 3, '2023-04-25 13:31:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (121, 'FSJLPN3', 'tbl_items', 3, 'brand_id', '1', '2', 'update', 3, '2023-04-26 10:23:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (122, 'NXHERXQ', 'tbl_inventory', 1, 'all', NULL, NULL, 'create', 3, '2023-04-26 11:59:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (123, 'L5INDCK', 'tbl_inventory', 2, 'all', NULL, NULL, 'create', 3, '2023-04-26 13:21:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (124, 'VBYG0D4', 'tbl_inventory', 1, 'all', NULL, NULL, 'create', 3, '2023-04-26 13:23:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (125, 'J0H78A0', 'tbl_inventory', 2, 'all', NULL, NULL, 'create', 3, '2023-04-26 13:27:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (127, 'M24HBC5', 'tbl_sub_module', 14, 'path', '/inventory', '/physical-count', 'update', 3, '2023-04-28 08:25:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (126, 'E2TZHUN', 'tbl_sub_module', 14, 'name', 'INVENTORY', 'PHYSICAL COUNT', 'update', 3, '2023-04-28 08:25:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (128, 'ANCXL2H', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 3, '2023-04-28 11:26:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (129, 'U0JO4A7', 'tbl_physical_count', 1, 'all', NULL, NULL, 'create', 3, '2023-04-28 15:03:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (130, 'TAC4D32', 'tbl_physical_count', 2, 'all', NULL, NULL, 'create', 3, '2023-04-28 15:20:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (131, '4IYKFE5', 'tbl_physical_count', 3, 'all', NULL, NULL, 'create', 3, '2023-04-28 15:39:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (132, '8ZDV2QJ', 'tbl_physical_count', 3, 'remarks', NULL, 'SAMPLE', 'update', 3, '2023-04-28 16:20:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (133, 'WS89FW7', 'tbl_physical_count', 3, 'remarks', NULL, 'SAMPLE', 'update', 3, '2023-04-28 16:21:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (134, 'HHXRDV6', 'tbl_physical_count', 3, 'type', 'annual', 'random', 'update', 3, '2023-04-28 16:31:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (135, 'BR33ZRK', 'tbl_physical_count', 3, 'total_items', '3', '2', 'update', 3, '2023-04-28 16:31:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (136, '5YUI1FL', 'tbl_physical_count', 3, 'brands', '[]', '[{"id":"quezon_ave","name":"QUEZON AVE"}]', 'update', 3, '2023-04-28 16:31:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (137, '6FEB0G9', 'tbl_physical_count', 3, 'branch', '[{"id":"quezon_ave","name":"QUEZON AVE"}]', '[{"id":"quezon_ave","name":"QUEZON AVE"},{"id":"manila","name":"MANILA"},{"id":"sto_domingo","name":"STO. DOMINGO"}]', 'update', 3, '2023-04-28 16:32:28+08');

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
INSERT INTO "public"."tbl_brand" VALUES (2, 'BRD-0000002', 'GE', 1, 3, NULL, NULL, NULL, '2023-04-19 10:20:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (1, 'BRD-0000001', 'ABB', 1, 3, 3, NULL, NULL, '2023-04-19 10:20:19+08', '2023-04-19 10:20:49+08', NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (3, 'BRD-0000003', 'CHINT', 1, 3, NULL, NULL, NULL, '2023-04-19 11:30:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_brand" VALUES (4, 'BRD-0000004', 'CHINA', 1, 3, 3, NULL, NULL, '2023-04-20 10:24:53+08', '2023-04-20 10:24:58+08', NULL, NULL);

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
INSERT INTO "public"."tbl_company" VALUES (2, 'CMP-0000001', 1, 'KC INDUSTRIAL CORPORATION', '#82 CORDILLERA ST. CORNER QUEZON AVE., QUEZON CITY', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 08:28:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (3, 'CMP-0000002', 1, 'KC ELECTRICAL INNOVATION', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 08:28:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (4, 'CMP-0000003', 1, 'S-POWER CORPORATION', NULL, NULL, 1, 1, 3, NULL, NULL, '2023-04-13 08:28:29+08', '2023-04-19 13:28:13+08', NULL, NULL);

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
INSERT INTO "public"."tbl_department" VALUES (2, 'DPT-0000001', 3, 1, 'IT/MIS', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 08:31:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (3, 'DPT-0000002', 2, 1, 'HUMAN RESOURCE - PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 16:54:04+08', NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_employee" VALUES (2, 2, '22100427', '0006318192', 3, 2, 3, 'PAUL JOHN', 'SOLANO', 'JUDAN', 'quezon_ave', 'male');
INSERT INTO "public"."tbl_employee" VALUES (3, 3, NULL, NULL, 3, 2, 2, 'CALVIN', NULL, 'SY', 'quezon_ave', 'male');

-- ----------------------------
-- Table structure for tbl_employee_tracker
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_employee_tracker";
CREATE TABLE "public"."tbl_employee_tracker" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_employee_tracker_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "tracker_id" int4,
  "branch" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "date_in" varchar(20) COLLATE "pg_catalog"."default",
  "date_out" varchar(20) COLLATE "pg_catalog"."default",
  "time_in" varchar(20) COLLATE "pg_catalog"."default",
  "time_out" varchar(20) COLLATE "pg_catalog"."default",
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_employee_tracker
-- ----------------------------

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
INSERT INTO "public"."tbl_items" VALUES (2, 'ITM-0000002', 1, 1, 'NB1-63H 16A 2P', 'NB1-63H 16A 2P', 'pc', 10, 20, 0, 0, 0, 200, NULL, '"data:image/png;base64,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"', 1, 3, 3, NULL, NULL, '2023-04-25 10:34:52+08', '2023-04-25 11:13:03+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (1, 'ITM-0000001', 1, 1, 'NB1-63H 1A 2P', 'NB1-63H 1A 2P', 'pc', 2, 1000, 0, 0, 0, 2000, NULL, '"data:image/png;base64,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"', 1, 3, 3, NULL, NULL, '2023-04-25 09:43:59+08', '2023-04-25 11:13:07+08', NULL, NULL);
INSERT INTO "public"."tbl_items" VALUES (3, 'ITM-0000003', 2, 1, 'NB1-63H 32A 2P', 'NB1-63H 32A 2P', 'pc', 10, 10, 0, 0, 0, 100, NULL, '"data:image/png;base64,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"', 1, 3, 3, NULL, NULL, '2023-04-25 10:36:24+08', '2023-04-26 10:23:48+08', NULL, NULL);

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
INSERT INTO "public"."tbl_module" VALUES (1, '5HQVUO2', 'TOOLS', 1, 1, NULL, NULL, NULL, '2023-04-12 09:35:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_module" VALUES (2, 'QLRC6YV', 'MAINTENANCE', 1, 1, NULL, NULL, NULL, '2023-04-12 09:35:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_module" VALUES (3, '0YJV4YM', 'SERVICING', 1, 1, NULL, NULL, NULL, '2023-04-14 10:46:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_module" VALUES (4, '3S6W8MX', 'WAREHOUSE', 1, 3, 3, NULL, NULL, '2023-04-18 10:18:07+08', '2023-04-19 09:38:02+08', NULL, NULL);

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
  "status" varchar(20) COLLATE "pg_catalog"."default",
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
-- Records of tbl_physical_count
-- ----------------------------
INSERT INTO "public"."tbl_physical_count" VALUES (1, 'PC-0000001', '[{"id":"quezon_ave","name":"QUEZON AVE"}]', '2023-4-29', '2023-4-29', 'random', '[{"items":2,"brand_id":1,"brand_name":"ABB"}]', 2, NULL, 'ongoing', 3, NULL, NULL, NULL, '2023-04-28 15:03:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_physical_count" VALUES (2, 'PC-0000002', '[{"id":"quezon_ave","name":"QUEZON AVE"}]', '2023-12-9', '2023-12-9', 'annual', '[]', 3, NULL, 'ongoing', 3, NULL, NULL, NULL, '2023-04-28 15:20:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_physical_count" VALUES (3, 'PC-0000003', '[{"id":"quezon_ave","name":"QUEZON AVE"},{"id":"manila","name":"MANILA"},{"id":"sto_domingo","name":"STO. DOMINGO"}]', '2023-6-3', '2023-6-3', 'random', '[{"items":2,"brand_id":1,"brand_name":"ABB"}]', 2, 'SAMPLE', 'ongoing', 3, 3, NULL, NULL, '2023-04-28 15:39:52+08', '2023-04-28 16:32:28+08', NULL, NULL);

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
INSERT INTO "public"."tbl_position" VALUES (2, 'PST-0000001', 3, 2, 'IT SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 08:32:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (3, 'PST-0000002', 3, 2, 'IT PROGRAMMER', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 08:32:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (4, 'PST-0000003', 2, 3, 'PAYROLL ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-04-13 16:54:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (5, 'PST-0000004', 3, 2, 'IT STAFF', NULL, 1, 3, 3, NULL, NULL, '2023-04-20 10:12:57+08', '2023-04-20 10:13:04+08', NULL, NULL);

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
INSERT INTO "public"."tbl_racks" VALUES (2, 'RCK-0000002', 'qa', '2f', 'A1a', 1, 3, NULL, NULL, NULL, '2023-04-20 09:23:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (1, 'RCK-0000001', 'qa', '1f', 'A1a', 1, 3, 3, NULL, NULL, '2023-04-20 09:02:58+08', '2023-04-20 09:27:15+08', NULL, NULL);
INSERT INTO "public"."tbl_racks" VALUES (3, 'RCK-0000003', 'sd', '1f', 'A1a', 1, 3, NULL, NULL, NULL, '2023-04-24 08:08:50+08', NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_services" VALUES (1, 'SRVC-0000001', '2304-001', '2023-2-9', '2023-2-9', 'approved', 1, 1, NULL, '2023-04-17 16:22:54+08', '2023-04-17 16:45:45+08', NULL);

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
INSERT INTO "public"."tbl_services_report" VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_services_sales" VALUES (1, 1, '2023-ZSP-025', NULL, 'TPSC PHILIPPINES CORPORATION', 'TOSHIBA ANNEX', 'TOSHIBA, LTI STA ROSA LAGUNA', 'MR. CARLO BATOON', 'PROJECT MANAGER / ASSISTANT ENGINEERING & CONSTRUCTION MANAGER', 'PAUL JOHN SOLANO JUDAN', 'data:image/png;base64,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', '2023-04-17 16:45:45.34676+08', 'CALVIN SY', NULL, '2023-04-17 16:45:45.34676+08', '2023-2-9', '2PM AT SITE', NULL, NULL, 'yes', '0917-651-5923', '[{"request":"inspection of ats","personnel":"kc servicing","time_from":"2pm","time_to":"onwards","date_from":"2023-2-9","date_to":"2023-2-9"}]');

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
INSERT INTO "public"."tbl_services_technical" VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_sub_module" VALUES (6, 'SUB-MDL-0000006', 3, 'REQUEST', '/request', 0, 1, 1, 3, NULL, NULL, '2023-04-17 09:08:56+08', '2023-04-17 15:59:23+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (5, 'SUB-MDL-0000005', 2, 'USERS', '/users', 0, 1, 1, 3, NULL, NULL, '2023-04-14 17:03:00+08', '2023-04-17 15:59:26+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (4, 'SUB-MDL-0000004', 1, 'EMPLOYEE MONITORING', '/employee-monitoring', 0, 1, 1, 3, NULL, NULL, '2023-04-13 14:26:13+08', '2023-04-17 15:59:29+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (3, 'SUB-MDL-0000003', 2, 'POSITION', '/position', 0, 1, 1, 3, NULL, NULL, '2023-04-12 10:49:55+08', '2023-04-17 15:59:32+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (2, 'SUB-MDL-0000002', 2, 'DEPARTMENT', '/department', 0, 1, 1, 3, NULL, NULL, '2023-04-12 10:49:48+08', '2023-04-17 15:59:35+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (1, 'SUB-MDL-0000001', 2, 'COMPANY', '/company', 0, 1, 1, 3, NULL, NULL, '2023-04-12 10:15:58+08', '2023-04-17 15:59:38+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (7, 'SUB-MDL-0000007', 3, 'EVALUATION', '/evaluation', 0, 1, 3, 3, NULL, NULL, '2023-04-17 16:04:38+08', '2023-04-17 16:04:40+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (9, 'SUB-MDL-0000009', 2, 'RACKS', '/racks', 0, 1, 3, NULL, NULL, NULL, '2023-04-18 11:04:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (8, 'SUB-MDL-0000008', 4, 'ITEM', '/item', 0, 1, 3, 3, NULL, NULL, '2023-04-18 10:18:28+08', '2023-04-19 09:38:22+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (10, 'SUB-MDL-0000010', 2, 'BRAND', '/brand', 0, 1, 3, NULL, NULL, NULL, '2023-04-19 09:43:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (11, 'SUB-MDL-0000011', 3, 'DISPATCH', '/dispatch', 0, 1, 3, 3, NULL, NULL, '2023-04-19 12:00:37+08', '2023-04-19 12:00:40+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (12, 'SUB-MDL-0000012', 3, 'REPORT', '/report', 0, 1, 3, 3, NULL, NULL, '2023-04-19 12:00:48+08', '2023-04-19 12:00:51+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (13, 'SUB-MDL-0000013', 3, 'REPORT EVALUATION', '/report-evaluation', 0, 1, 3, NULL, NULL, NULL, '2023-04-19 12:01:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (14, 'SUB-MDL-0000014', 4, 'PHYSICAL COUNT', '/physical-count', 0, 1, 3, 3, NULL, NULL, '2023-04-25 11:57:49+08', '2023-04-28 08:25:43+08', NULL, NULL);

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
INSERT INTO "public"."tbl_users" VALUES (2, 'USR-0000001', 'judan.pauljohn@gmail.com', 'QElUMDAwMA==', '9502099508', 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-04-14 14:11:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (1, 'USR-0000000', 'superadmin@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '0000000000', 'superadmin', 1, 1, 1, NULL, NULL, NULL, '2022-12-21 11:13:47.452153+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (3, 'USR-0000002', 'calvin_sy@kcic.com.ph', 'QElUMDAwMA==', NULL, 'superadmin', 1, 1, 2, 1, NULL, NULL, '2023-04-17 11:19:40+08', '2023-04-17 11:29:57+08', NULL, NULL);

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
INSERT INTO "public"."tbl_users_permissions" VALUES (1, 'TDZOWH7', 2, '{"module_2":{"status":true,"submodule_1":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_2":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_3":{"status":true,"list":true,"create":true,"update":true,"export":true},"submodule_5":{"status":true,"list":true,"create":true,"update":true,"export":true}},"module_3":{"submodule_6":{"status":false,"list":false,"export":false},"status":false},"module_1":{"submodule_4":{}}}', 3, '2023-04-17 16:02:45+08');
INSERT INTO "public"."tbl_users_permissions" VALUES (2, 'VV3I61S', 3, '{"module_2":{"status":false,"submodule_1":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_2":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_3":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_5":{"status":false,"list":false,"create":false,"update":false,"permission":false,"export":false}},"module_3":{"status":false,"submodule_6":{"status":false,"list":false,"create":false,"update":false,"export":false},"submodule_7":{"status":false,"list":false,"update":false,"export":false}},"module_1":{"status":false,"submodule_4":{}},"module_4":{"submodule_8":{}}}', 1, '2023-04-18 10:33:56+08');

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
SELECT setval('"public"."tbl_assign_asset_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_audit_trail_id_seq"', 138, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_brand_id_seq"
OWNED BY "public"."tbl_brand"."id";
SELECT setval('"public"."tbl_brand_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_category_id_seq"
OWNED BY "public"."tbl_category"."id";
SELECT setval('"public"."tbl_category_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_company_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_depertment_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_employee_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_employee_tracker_id_seq"
OWNED BY "public"."tbl_employee_tracker"."id";
SELECT setval('"public"."tbl_employee_tracker_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_items_id_seq"
OWNED BY "public"."tbl_items"."id";
SELECT setval('"public"."tbl_items_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_module_id_seq"
OWNED BY "public"."tbl_module"."id";
SELECT setval('"public"."tbl_module_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_physical_count_id_seq"
OWNED BY "public"."tbl_physical_count"."id";
SELECT setval('"public"."tbl_physical_count_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_position_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_racks_id_seq"
OWNED BY "public"."tbl_racks"."id";
SELECT setval('"public"."tbl_racks_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_id_seq"
OWNED BY "public"."tbl_services"."id";
SELECT setval('"public"."tbl_services_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_report_id_seq"
OWNED BY "public"."tbl_services_report"."id";
SELECT setval('"public"."tbl_services_report_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_sales_id_seq"
OWNED BY "public"."tbl_services_sales"."id";
SELECT setval('"public"."tbl_services_sales_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_services_technical_id_seq"
OWNED BY "public"."tbl_services_technical"."id";
SELECT setval('"public"."tbl_services_technical_id_seq"', 2, true);

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
SELECT setval('"public"."tbl_sub_module_id_seq"', 15, true);

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
SELECT setval('"public"."tbl_users_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_users_permissions_id_seq"
OWNED BY "public"."tbl_users_permissions"."id";
SELECT setval('"public"."tbl_users_permissions_id_seq"', 3, true);

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
-- Primary Key structure for table tbl_employee_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_pkey" PRIMARY KEY ("id");

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
-- Foreign Keys structure for table tbl_employee_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_tracker_id_fkey" FOREIGN KEY ("tracker_id") REFERENCES "public"."tbl_tracker" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
