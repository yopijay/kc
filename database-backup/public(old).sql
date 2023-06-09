/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 150001
 Source Host           : localhost:5432
 Source Catalog        : db_kc
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150001
 File Encoding         : 65001

 Date: 30/04/2023 06:06:18
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
INSERT INTO "public"."tbl_assets" VALUES (6, 'QIM-0000006', 3, 15, 'ASSTS-FURN-BRDS-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:16:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (7, 'QIM-0000007', 3, 15, 'ASSTS-FURN-BRDS-0000002', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:18:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (8, 'QIM-0000008', 3, 16, 'ASSTS-FURN-FC-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:28:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (10, 'QIM-0000010', 3, 16, 'ASSTS-FURN-FC-0000003', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:59:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (19, 'QIM-0000019', 4, 23, 'ASSTS-TECH-NTWK-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 13:55:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (20, 'QIM-0000020', 4, 23, 'ASSTS-TECH-NTWK-0000002', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:29:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (21, 'QIM-0000021', 4, 23, 'ASSTS-TECH-NTWK-0000003', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:34:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (22, 'QIM-0000022', 4, 23, 'ASSTS-TECH-NTWK-0000004', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:36:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (23, 'QIM-0000023', 4, 25, 'ASSTS-TECH-HD-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 15:15:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (3, 'QIM-0000003', 3, 13, 'ASSTS-FURN-DSK-0000003', 0, 1, 1, 1, NULL, NULL, '2023-02-15 09:19:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (26, 'QIM-0000026', 4, 23, 'ASSTS-TECH-NTWK-0000005', 0, 1, 1, 1, NULL, NULL, '2023-02-21 11:02:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (24, 'QIM-0000024', 4, 25, 'ASSTS-TECH-HD-0000002', 0, 1, 1, 1, NULL, NULL, '2023-02-17 15:16:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (11, 'QIM-0000011', 3, 15, 'ASSTS-FURN-BRDS-0000003', 0, 1, 1, 1, NULL, NULL, '2023-02-16 11:16:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (25, 'QIM-0000025', 4, 26, 'ASSTS-TECH-PHNS-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 15:31:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (1, 'QIM-0000001', 3, 13, 'ASSTS-FURN-DSK-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:16:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (13, 'QIM-0000013', 4, 18, 'ASSTS-TECH-LT-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 09:35:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (14, 'QIM-0000014', 4, 19, 'ASSTS-TECH-MSE-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 10:22:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (4, 'QIM-0000004', 3, 14, 'ASSTS-FURN-CHR-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:46:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (9, 'QIM-0000009', 3, 16, 'ASSTS-FURN-FC-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-16 10:29:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (16, 'QIM-0000016', 4, 21, 'ASSTS-TECH-PRTR-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 11:35:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (27, 'QIM-0000027', 4, 21, 'ASSTS-TECH-PRTR-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-27 15:02:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (12, 'QIM-0000012', 4, 17, 'ASSTS-TECH-SU-0000001', 1, 1, 1, 1, NULL, NULL, '2023-02-17 08:56:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (15, 'QIM-0000015', 4, 20, 'ASSTS-TECH-KB-0000001', 1, 1, 1, 1, NULL, NULL, '2023-02-17 10:40:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (17, 'QIM-0000017', 4, 22, 'ASSTS-TECH-MNTR-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-17 12:00:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (18, 'QIM-0000018', 4, 22, 'ASSTS-TECH-MNTR-0000002', 1, 1, 1, 1, NULL, NULL, '2023-02-17 12:01:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (2, 'QIM-0000002', 3, 13, 'ASSTS-FURN-DSK-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:18:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (5, 'QIM-0000005', 3, 14, 'ASSTS-FURN-CHR-0000002', 1, 1, 1, 1, NULL, NULL, '2023-02-15 14:28:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (28, 'QIM-0000028', 4, 21, 'ASSTS-TECH-PRTR-0000003', 1, 1, 1, NULL, NULL, NULL, '2023-03-01 11:33:14+08', NULL, NULL, NULL);

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
INSERT INTO "public"."tbl_assets_info" VALUES (1, 1, NULL, 'LIGHT BROWN', NULL, '70 X 120', 'good', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (2, 2, NULL, 'LIGHT BROWN', NULL, '70 X 120', 'good', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (4, 4, NULL, 'BLACK', NULL, '62 X 140 CM', 'good', NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (7, 7, 'DELI', NULL, NULL, '90 X 150 CM', 'good', NULL, NULL, NULL, 'free-standing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (8, 8, 'FURNLITE', NULL, NULL, '40 X 24 X 132 CM', 'good', NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (9, 9, 'FURNLITE', NULL, NULL, '40 X 23.8 X 80 CM', 'good', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (13, 13, 'DELL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '00325-82199-61589-AAOEM', 'DELL G15 5511', 'WINDOWS 10 HOME 64-BIT (10.0, 19044)', '11TH GEN INTEL(R) CORE(TM) I5-11400H @ 2.70GHZ (12 CPUS), ~2.7GHZ', 'INTEL(R) UHD GRAPHICS, NVIDIA GEFORCE RTX 3050 LAPTOP GPU', '8GB', '', '500GB', '[{"id":"hdmi","name":"HDMI"}]', 1, '2023-2-17', '1920 X 1080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (10, 10, 'FURNLITE', NULL, NULL, '40 X 23.8 X 80 CM', 'good', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (6, 6, 'LEGAMASTER', NULL, NULL, '150 X 100 CM', 'good', NULL, NULL, NULL, 'wall-mounted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (14, 14, 'RAPOO', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3005N1820KUS0274', 'N1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, 'usb', 'right-handed', 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (15, 15, 'IBUYPOWER', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '51720018937510', 'IBP-ARES E1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, 'usb', NULL, NULL, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (16, 16, 'EPSON', 'BLACK', NULL, '375 X 347 X 179 MM', NULL, NULL, NULL, NULL, NULL, NULL, 'X5DY400529', 'L3110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-2-17', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (18, 18, 'AOC', 'BLACK', NULL, '358.3(H) X 477.6(W) X 179.5(D)', NULL, NULL, NULL, NULL, NULL, NULL, 'GCDG7HA097603', 'M2060SW', NULL, NULL, NULL, NULL, NULL, NULL, '[{"id":"dvi","name":"DVI"},{"id":"vga","name":"VGA"}]', 2, '2023-2-17', '1920 X 1080', NULL, NULL, NULL, NULL, NULL, '19.5"', '16:9', '60HZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (17, 17, 'AOC', 'BLACK', NULL, '358.3(H) X 477.6(W) X 179.5(D)', NULL, NULL, NULL, NULL, NULL, NULL, 'GCDLAHA236824', 'M2060SW', NULL, NULL, NULL, NULL, NULL, NULL, '[{"id":"vga","name":"VGA"},{"id":"dvi","name":"DVI"}]', 2, '2023-2-17', '1920 X 1080', NULL, NULL, NULL, NULL, NULL, '19.5"', '16:9', '60HZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (19, 19, 'D-LINK', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QB2O1B4019914', 'DES-1008A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'switch', 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (20, 20, 'LINKSYS', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13K121C83701870', 'LGS108', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'switch', 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (21, 21, 'D-LINK', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'R0102F2001149', 'DWR-116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'router', 4, NULL, '2.4GHZ', NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (23, 23, 'SEAGATE', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NABK1RJ5', 'SRD0VN2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1TB', NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (3, 3, '', 'LIGHT BROWN', '', '60 X 120', 'good', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tools', NULL, NULL, NULL, 'RJ-45', 5, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (5, 5, '', 'BLACK', '', '', 'good', NULL, 'no', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (11, 11, 'LEGAMASTER', NULL, NULL, '45 X 60 CM', 'good', NULL, NULL, NULL, 'wall-mounted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (26, 26, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tools', NULL, NULL, NULL, 'NETWORK CABLE TESTER', 1, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (12, 12, 'DELL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '00342-20758-26808-AAOEM', 'XPS 8940', 'WINDOWS 11 HOME 64-BIT (10.0, BUILD 22621)', '11TH GEN INTEL(R) CORE(TM) I7-11700 @ 2.50GHZ (16 CPUS), ~2.5GHZ', 'INTEL(R) UHD GRAPHICS 750 / NVIDIA GEFORECE GTX 1660 TI', '16GB', '1TB', '250GB', '[{"id":"hdmi","name":"HDMI"},{"id":"dvi","name":"DVI"}]', 2, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (24, 24, 'SEAGATE', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NABK1RJ9', 'SRD0VN2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1TB', NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (25, 25, 'YEALINK', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2119519091518404', 'SIP-T19P E2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-2-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 667);
INSERT INTO "public"."tbl_assets_info" VALUES (27, 27, 'EPSON', 'BLACK', NULL, '375 X 347 X 179 MM', NULL, NULL, NULL, NULL, NULL, NULL, 'X93P014607', 'L3110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2020-8-4', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (28, 28, 'EPSON', 'BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VGFK187882', 'L360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-3-1', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  "previous" varchar(1000) COLLATE "pg_catalog"."default",
  "current" varchar(1000) COLLATE "pg_catalog"."default",
  "action" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "date" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_audit_trail
-- ----------------------------
INSERT INTO "public"."tbl_audit_trail" VALUES (1, 'G5L9PLA', 'tbl_users', 2, 'all', NULL, NULL, 'create', 1, '2023-01-31 15:37:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (2, 'R1KW18H', 'tbl_users', 3, 'all', NULL, NULL, 'create', 1, '2023-01-31 16:34:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (3, 'V7GS6EH', 'tbl_users', 4, 'all', NULL, NULL, 'create', 1, '2023-01-31 16:50:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (4, '7K9W212', 'tbl_users', 4, 'fname', 'PATERSON', 'PATERSON1', 'update', 1, '2023-02-02 11:43:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (5, '03A1RBI', 'tbl_users', 4, 'lname', 'NAVARRO', 'NAVARRO1', 'update', 1, '2023-02-02 11:43:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (6, '3Z9DM68', 'tbl_users', 4, 'mname', 'LUZON', 'LUZON1', 'update', 1, '2023-02-02 11:43:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (7, '5DS03FC', 'tbl_users', 4, 'fname', 'PATERSON1', 'PATERSON', 'update', 1, '2023-02-02 11:43:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (8, '8QARR8Y', 'tbl_users', 4, 'mname', 'LUZON1', 'LUZON', 'update', 1, '2023-02-02 11:43:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (9, 'P7SBJTO', 'tbl_users', 4, 'lname', 'NAVARRO1', 'NAVARRO', 'update', 1, '2023-02-02 11:43:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (10, 'PQ9EZ31', 'tbl_users', 5, 'all', NULL, NULL, 'create', 1, '2023-02-02 11:51:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (11, 'UQE9RJC', 'tbl_users', 6, 'all', NULL, NULL, 'create', 1, '2023-02-02 13:35:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (12, 'LOO1AAG', 'tbl_position', 148, 'all', NULL, NULL, 'create', 1, '2023-02-02 13:44:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (13, 'YN1LYKS', 'tbl_users', 7, 'all', NULL, NULL, 'create', 1, '2023-02-02 13:45:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (14, 'V85Q41A', 'tbl_users', 8, 'all', NULL, NULL, 'create', 1, '2023-02-02 13:49:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (15, 'S2TNP78', 'tbl_users', 9, 'all', NULL, NULL, 'create', 1, '2023-02-02 13:50:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (16, 'W1ASLRB', 'tbl_users', 9, 'contact_no', 'undefined', '9290887778', 'update', 1, '2023-02-02 14:02:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (17, 'WTVKUPS', 'tbl_users', 9, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:02:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (18, '3HPTHC7', 'tbl_users', 8, 'contact_no', 'undefined', '9175208578', 'update', 1, '2023-02-02 14:02:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (19, 'EUEB33O', 'tbl_users', 8, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:02:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (21, 'PIWQ4VV', 'tbl_users', 7, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:03:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (20, 'MJWAD49', 'tbl_users', 7, 'contact_no', 'undefined', '9175152668', 'update', 1, '2023-02-02 14:03:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (22, 'QMK80GS', 'tbl_users', 6, 'contact_no', 'undefined', '9237393855', 'update', 1, '2023-02-02 14:03:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (23, 'K3G1PH3', 'tbl_users', 6, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:03:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (24, 'KPPQS9A', 'tbl_users', 5, 'contact_no', 'undefined', '9178146140', 'update', 1, '2023-02-02 14:03:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (25, 'Y24SEHX', 'tbl_users', 5, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:03:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (26, '2IONSF0', 'tbl_users', 4, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:03:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (27, '8TD75N9', 'tbl_users', 3, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:03:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (28, 'K9A5IBN', 'tbl_users', 2, 'rfid', '-', NULL, 'update', 1, '2023-02-02 14:04:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (29, 'XTVPIPO', 'tbl_users', 10, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:05:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (30, '161VZMP', 'tbl_users', 11, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:07:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (31, 'SHNVNNB', 'tbl_users', 12, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:08:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (32, 'BY42RDJ', 'tbl_users', 13, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:24:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (33, 'I4SCV3I', 'tbl_users', 14, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:25:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (34, '38GW46V', 'tbl_users', 15, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:26:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (35, '2OGU49N', 'tbl_users', 16, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:27:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (36, 'SHG39PT', 'tbl_users', 17, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:33:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (37, 'DBQV8SY', 'tbl_users', 18, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:35:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (38, '4I6DO4M', 'tbl_users', 19, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:38:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (39, 'PUJIBET', 'tbl_users', 20, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:39:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (40, 'DKATWM7', 'tbl_users', 21, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:40:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (41, 'PGL68U5', 'tbl_users', 18, 'contact_no', 'undefined', '9175366659', 'update', 1, '2023-02-02 14:41:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (42, '2V2AT6E', 'tbl_users', 19, 'contact_no', 'undefined', '9178961908', 'update', 1, '2023-02-02 14:41:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (43, 'V8P0FQF', 'tbl_users', 20, 'contact_no', 'undefined', '9756742073', 'update', 1, '2023-02-02 14:41:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (44, 'G3PBW6E', 'tbl_users', 21, 'contact_no', 'undefined', '9291008698', 'update', 1, '2023-02-02 14:41:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (45, '6LPPO3L', 'tbl_users', 11, 'contact_no', 'undefined', '9178336166', 'update', 1, '2023-02-02 14:43:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (46, 'LZAXVMH', 'tbl_users', 12, 'contact_no', 'undefined', '9178360071', 'update', 1, '2023-02-02 14:43:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (47, 'PCZ4E0H', 'tbl_users', 13, 'contact_no', 'undefined', '9281049321', 'update', 1, '2023-02-02 14:44:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (48, 'XZPMUBH', 'tbl_users', 14, 'contact_no', 'undefined', '9228027771', 'update', 1, '2023-02-02 14:45:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (49, 'MTB08RL', 'tbl_users', 15, 'contact_no', 'undefined', '9154462511', 'update', 1, '2023-02-02 14:45:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (50, 'Q5X9KPT', 'tbl_users', 16, 'contact_no', 'undefined', '9772902845', 'update', 1, '2023-02-02 14:45:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (51, 'V88EG0H', 'tbl_users', 17, 'contact_no', 'undefined', '9976034139', 'update', 1, '2023-02-02 14:45:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (52, 'H8XRUXO', 'tbl_users', 22, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:49:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (53, 'TSB323G', 'tbl_users', 23, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:50:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (54, '44Z6M5L', 'tbl_users', 24, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:54:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (55, 'NY1QJ9X', 'tbl_users', 25, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:55:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (56, 'VYWND6G', 'tbl_users', 26, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:56:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (57, '906Z9L0', 'tbl_users', 27, 'all', NULL, NULL, 'create', 1, '2023-02-02 14:57:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (58, 'YQUUOS9', 'tbl_users', 28, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:00:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (59, 'RJW0Q1Z', 'tbl_users', 28, 'employment_status', 'regular', 'intern', 'update', 1, '2023-02-02 15:16:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (60, 'JA16Q0Y', 'tbl_users', 29, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:17:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (61, 'YUEN24I', 'tbl_users', 30, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:18:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (62, 'HL5PC8P', 'tbl_users', 31, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:19:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (63, '9AN7OSJ', 'tbl_users', 30, 'branch', 'sto_domingo', 'cavite', 'update', 1, '2023-02-02 15:19:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (64, '7U0ED8B', 'tbl_users', 29, 'branch', 'sto_domingo', 'cavite', 'update', 1, '2023-02-02 15:19:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (65, 'NSEVS1G', 'tbl_users', 32, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:25:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (66, '8GIBQEG', 'tbl_users', 33, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:26:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (67, 'CSTPLB7', 'tbl_users', 34, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:27:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (68, 'GJU2552', 'tbl_users', 35, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:28:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (69, 'MW59YFD', 'tbl_users', 36, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:29:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (70, 'HSIZ6C9', 'tbl_users', 37, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:30:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (71, '6QANOW2', 'tbl_users', 38, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:36:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (72, 'T38CIWZ', 'tbl_users', 39, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:36:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (73, '2FA1WHE', 'tbl_users', 40, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:37:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (74, 'JP9I8MQ', 'tbl_users', 41, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:39:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (75, 'TS1W98R', 'tbl_users', 42, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:40:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (76, 'WZWUU1A', 'tbl_users', 43, 'all', NULL, NULL, 'create', 1, '2023-02-02 15:41:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (77, '1JIO6NV', 'tbl_users', 44, 'all', NULL, NULL, 'create', 1, '2023-02-02 16:47:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (78, 'RZ8LSUV', 'tbl_users', 45, 'all', NULL, NULL, 'create', 1, '2023-02-02 16:48:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (79, 'LJB40ZY', 'tbl_users', 45, 'address', 'BLK 3 LOT 12 MAGNAGON, MAGUYAM, SILANG CAVITE', 'BLK 18 LOT 12 PHASE 5 MABUHAY HOMES 2000, SALAWAG DASMARINAS CAVITE', 'update', 1, '2023-02-02 16:49:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (80, '6MKSI32', 'tbl_users', 45, 'position_id', '27', '26', 'update', 1, '2023-02-02 16:49:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (81, 'W5B3IRG', 'tbl_users', 45, 'employee_no', '21100309', '21100308', 'update', 1, '2023-02-02 16:49:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (82, 'J7NNMRU', 'tbl_users', 46, 'all', NULL, NULL, 'create', 1, '2023-02-02 16:49:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (83, 'N4WNWKE', 'tbl_users', 47, 'all', NULL, NULL, 'create', 1, '2023-02-02 16:52:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (84, 'C8V3Y81', 'tbl_users', 48, 'all', NULL, NULL, 'create', 1, '2023-02-02 16:53:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (85, 'OEW81IF', 'tbl_users', 49, 'all', NULL, NULL, 'create', 1, '2023-02-03 08:39:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (86, 'IXXJHYT', 'tbl_users', 50, 'all', NULL, NULL, 'create', 1, '2023-02-03 08:48:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (87, 'XD6IA0G', 'tbl_users', 51, 'all', NULL, NULL, 'create', 1, '2023-02-03 08:53:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (88, 'VTXGNAZ', 'tbl_users', 52, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:03:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (89, 'HX2ZTAF', 'tbl_users', 53, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:04:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (90, '9FYF23W', 'tbl_users', 54, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:04:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (91, '57JJN2U', 'tbl_users', 55, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:05:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (92, 'K1O3PJJ', 'tbl_users', 56, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:06:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (93, 'JI7HZS8', 'tbl_users', 57, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:06:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (94, '9ZK6W99', 'tbl_users', 58, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:07:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (95, 'MMLRTMD', 'tbl_users', 59, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:08:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (96, 'S2CYYQH', 'tbl_users', 60, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:09:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (97, '5QMFXHA', 'tbl_users', 61, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:09:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (98, 'UNXTG37', 'tbl_users', 62, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:11:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (99, 'RL3OVDB', 'tbl_users', 63, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:11:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (100, 'BYX0WX8', 'tbl_users', 64, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:12:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (101, 'EKG76CR', 'tbl_users', 65, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:32:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (102, 'TYDBVTX', 'tbl_users', 64, 'position_id', '36', '35', 'update', 1, '2023-02-03 09:33:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (103, 'RX84L5C', 'tbl_users', 66, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:33:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (104, 'EH0ZA7X', 'tbl_users', 67, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:34:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (105, 'IYDM3NH', 'tbl_users', 68, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:34:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (106, 'ISBX9HE', 'tbl_users', 69, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:36:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (107, 'ZF8EC60', 'tbl_users', 70, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:38:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (108, '3LEN9CS', 'tbl_users', 71, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:39:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (109, 'H3ZRERE', 'tbl_users', 72, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:39:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (110, 'VLN3HVO', 'tbl_users', 73, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:40:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (111, '1REHQHM', 'tbl_users', 74, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:41:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (112, '7LZJP3Q', 'tbl_users', 75, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:42:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (113, 'QSZFG88', 'tbl_users', 76, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:47:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (114, '4NKGOD9', 'tbl_users', 77, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:48:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (115, '83FBC2K', 'tbl_users', 78, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:48:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (116, '5CQI9IF', 'tbl_users', 79, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:49:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (117, 'ZF8JLQI', 'tbl_users', 80, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:50:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (118, 'TZXR100', 'tbl_users', 81, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:50:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (119, 'WA8DZK9', 'tbl_users', 82, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:57:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (120, '3BLUJTE', 'tbl_users', 83, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:58:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (121, '16NUP2Z', 'tbl_users', 84, 'all', NULL, NULL, 'create', 1, '2023-02-03 09:59:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (122, 'VGJMU6L', 'tbl_users', 85, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:00:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (123, 'QUO10HJ', 'tbl_users', 86, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:06:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (124, 'LACKYTT', 'tbl_users', 87, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:06:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (125, 'RNB6Y08', 'tbl_users', 88, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:07:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (126, 'TKXIJ50', 'tbl_users', 89, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:08:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (127, 'IWECCIQ', 'tbl_users', 90, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:09:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (128, 'TW64CZI', 'tbl_users', 91, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:10:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (129, 'IJBXWUA', 'tbl_users', 92, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:11:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (130, 'NON31TH', 'tbl_users', 93, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:12:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (131, 'AP6DGK7', 'tbl_users', 94, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:13:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (132, 'RZ1MUGR', 'tbl_users', 95, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:14:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (133, 'VR8XSVM', 'tbl_users', 96, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:15:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (134, 'HBEXTWO', 'tbl_users', 97, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:15:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (135, 'OVDJ24Z', 'tbl_users', 98, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:16:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (136, '0DTF9TA', 'tbl_users', 99, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:16:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (137, 'W868ZSN', 'tbl_users', 100, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:18:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (138, 'YPVEQIW', 'tbl_users', 101, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:19:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (139, 'ZGFW0KR', 'tbl_users', 102, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:20:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (140, '6T0PQI8', 'tbl_users', 103, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:24:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (141, '14MPCD7', 'tbl_users', 104, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:25:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (142, '9HO353N', 'tbl_users', 103, 'user_level', 'user', 'admin', 'update', 1, '2023-02-03 10:25:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (143, 'L1Z6PUH', 'tbl_users', 103, 'gender', 'male', 'female', 'update', 1, '2023-02-03 10:25:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (144, 'C1MK9BW', 'tbl_users', 104, 'gender', 'male', 'female', 'update', 1, '2023-02-03 10:25:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (145, 'TAW5AIZ', 'tbl_users', 105, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:30:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (146, '15230X9', 'tbl_users', 106, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:31:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (147, '27QSVS9', 'tbl_users', 107, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:31:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (148, 'VC0AD5Z', 'tbl_users', 108, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:32:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (149, 'YSLG45R', 'tbl_users', 109, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:37:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (150, 'IDQY6X8', 'tbl_users', 110, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:39:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (151, '0J9Q52I', 'tbl_users', 111, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:40:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (152, '62NA8V3', 'tbl_users', 112, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:40:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (153, 'TJXJXGO', 'tbl_users', 113, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:41:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (154, 'AA2T6ER', 'tbl_users', 114, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:42:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (155, 'S75SBFD', 'tbl_users', 115, 'all', NULL, NULL, 'create', 1, '2023-02-03 10:44:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (156, 'WS2GQ0H', 'tbl_company', 1, 'owner_id', '1', '2', 'update', 1, '2023-02-07 11:11:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (157, '2V9D3RP', 'tbl_users', 116, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:24:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (158, 'C32HS8O', 'tbl_users', 117, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:25:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (159, 'OQYQJMB', 'tbl_users', 118, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:26:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (160, '0SI2RKM', 'tbl_users', 119, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:27:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (161, 'T5QCE2O', 'tbl_users', 120, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:28:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (162, '8FF13ZI', 'tbl_users', 121, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:29:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (163, 'RDRT759', 'tbl_users', 122, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:32:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (164, 'G8QOX94', 'tbl_users', 123, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:34:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (165, 'SLQN4K4', 'tbl_users', 124, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:35:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (166, 'X21K0OQ', 'tbl_users', 125, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:35:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (167, 'BRAZ0XR', 'tbl_users', 126, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:36:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (168, 'FLFW1W8', 'tbl_users', 127, 'all', NULL, NULL, 'create', 1, '2023-02-09 10:38:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (169, 'BLMUPQZ', 'tbl_users', 128, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:15:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (170, 'T8BY0G9', 'tbl_users', 129, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:16:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (171, 'S7MVPIK', 'tbl_users', 130, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:17:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (172, 'U4JGY1K', 'tbl_users', 131, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:18:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (173, 'XAQ3Y3U', 'tbl_users', 132, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:18:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (174, 'PD4D4LQ', 'tbl_users', 133, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:19:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (175, 'DIAR16K', 'tbl_users', 134, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:19:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (176, '6QQ5ZOC', 'tbl_users', 135, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:20:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (177, 'BGDCUSN', 'tbl_users', 136, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:21:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (178, '60VAY47', 'tbl_users', 137, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:21:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (179, 'J8DZ79C', 'tbl_users', 138, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:22:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (180, 'M1YP525', 'tbl_users', 139, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:22:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (181, 'O74W3NO', 'tbl_users', 140, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (182, 'D9RSR1Y', 'tbl_users', 141, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:24:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (183, 'BCYY381', 'tbl_users', 142, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:24:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (184, 'V7LQAHS', 'tbl_users', 143, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:25:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (185, 'MUX2V9J', 'tbl_users', 144, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:28:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (186, 'E537K65', 'tbl_users', 145, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:28:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (187, '4J4ILFU', 'tbl_users', 146, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:29:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (188, 'Y5OLGXP', 'tbl_users', 147, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:30:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (189, 'RS3IVHQ', 'tbl_users', 148, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:30:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (190, '48FEFL6', 'tbl_users', 149, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:31:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (191, 'NKAWI31', 'tbl_users', 150, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:31:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (192, '28Y7JPQ', 'tbl_users', 151, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:36:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (193, 'UN0F4Z9', 'tbl_users', 152, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:37:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (194, 'RRSHPWE', 'tbl_users', 153, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:37:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (195, 'CEYLNON', 'tbl_users', 154, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:38:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (196, 'HJGIEDB', 'tbl_users', 155, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:39:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (197, 'IMO3FJN', 'tbl_users', 156, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:39:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (198, 'N66QOG4', 'tbl_users', 157, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:40:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (199, '4TU4NQX', 'tbl_users', 158, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:41:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (200, 'MFD8GUU', 'tbl_users', 158, 'gender', 'male', 'female', 'update', 1, '2023-02-09 11:41:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (201, '4NZM52J', 'tbl_users', 159, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:42:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (202, 'YPP2WJQ', 'tbl_users', 160, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:42:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (203, 'SSYCGGT', 'tbl_users', 161, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:43:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (204, 'H82Q2T9', 'tbl_users', 162, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:43:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (205, 'H3JF419', 'tbl_users', 163, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:44:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (206, 'NJ6K8JU', 'tbl_users', 164, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:45:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (207, '48NDSHC', 'tbl_users', 165, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:45:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (208, 'IVGQZDP', 'tbl_users', 166, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:46:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (209, 'QUTYXWN', 'tbl_users', 167, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:46:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (210, 'UZ003AT', 'tbl_users', 168, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:47:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (211, 'I3Z660A', 'tbl_users', 169, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:48:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (212, '6I5D5EP', 'tbl_users', 170, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:48:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (213, 'EQ0JH95', 'tbl_users', 171, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:49:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (214, 'ENORAYC', 'tbl_users', 172, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:49:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (215, '4RXKWU5', 'tbl_users', 173, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:50:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (216, 'RHLOW9M', 'tbl_users', 174, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:51:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (217, '14JK6RH', 'tbl_users', 175, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:52:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (218, 'FBMHD9U', 'tbl_users', 176, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:53:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (219, 'WR55XF9', 'tbl_users', 177, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:54:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (220, 'X8HGYPR', 'tbl_users', 178, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:54:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (221, 'ZED1L1O', 'tbl_users', 179, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:55:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (222, 'RFNLHTK', 'tbl_users', 180, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:56:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (223, 'RCATBN5', 'tbl_users', 181, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:57:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (224, 'S3NJC2B', 'tbl_users', 182, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:57:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (225, 'FYU7K7M', 'tbl_users', 183, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:58:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (226, '3TCHGDM', 'tbl_users', 184, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:59:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (227, 'IUIG0M5', 'tbl_users', 185, 'all', NULL, NULL, 'create', 1, '2023-02-09 11:59:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (228, '1GK96V0', 'tbl_users', 186, 'all', NULL, NULL, 'create', 1, '2023-02-09 12:00:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (229, 'FTRTBRC', 'tbl_users', 187, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:01:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (230, '5Y67YSW', 'tbl_users', 188, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:01:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (231, 'ZMJ1XHR', 'tbl_users', 146, 'birthdate', '2023-2-9', '2001-6-27', 'update', 1, '2023-02-09 13:04:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (232, 'HFDQO04', 'tbl_users', 150, 'birthdate', '2023-2-9', '1999-11-3', 'update', 1, '2023-02-09 13:04:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (233, 'MYAMD34', 'tbl_users', 189, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:05:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (234, 'X51B4R3', 'tbl_users', 190, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:06:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (235, '5UKCCLS', 'tbl_users', 191, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:06:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (236, 'TZ4ZPSB', 'tbl_users', 192, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:07:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (237, '4PUSYVD', 'tbl_users', 193, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:08:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (238, 'CQUIGEB', 'tbl_users', 194, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:08:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (239, 'NDCX01T', 'tbl_users', 195, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:09:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (240, 'IOBXBAU', 'tbl_users', 196, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:10:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (241, '71M59FW', 'tbl_users', 197, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:14:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (242, 'BS0N1TN', 'tbl_users', 198, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:16:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (243, 'Q2FU14D', 'tbl_users', 199, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:17:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (244, 'MITKQYR', 'tbl_users', 199, 'employment_status', 'regular', 'agency', 'update', 1, '2023-02-09 13:17:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (245, 'GCQ2F6Z', 'tbl_users', 200, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:18:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (246, 'QG5TFGP', 'tbl_users', 201, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:18:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (247, 'IGIM5H8', 'tbl_users', 202, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:19:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (248, 'P4WB8BI', 'tbl_users', 203, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:22:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (249, 'KNXVI4A', 'tbl_users', 204, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:22:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (250, 'R2A4HV4', 'tbl_users', 205, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:23:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (251, 'ZZBI359', 'tbl_users', 206, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:23:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (252, 'IQ9GROZ', 'tbl_users', 207, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:24:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (253, '1Y55LS1', 'tbl_users', 208, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:25:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (254, 'QOJ8QYJ', 'tbl_users', 209, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:25:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (255, '2HR3V45', 'tbl_users', 210, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:26:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (256, 'RGFQQSR', 'tbl_users', 211, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:27:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (257, 'YY9T1FL', 'tbl_users', 212, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:28:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (258, '5O9K9LE', 'tbl_users', 213, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:33:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (259, 'J4A9FMP', 'tbl_users', 214, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:33:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (260, 'SUM1KKY', 'tbl_users', 215, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:34:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (261, 'PN48OT8', 'tbl_users', 216, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:34:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (262, 'D60ICHX', 'tbl_users', 217, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:34:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (263, '53ODKPA', 'tbl_users', 218, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:35:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (264, '4ONRGMO', 'tbl_users', 219, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:35:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (265, 'B5QO4EG', 'tbl_users', 220, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:36:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (266, 'TZK358A', 'tbl_users', 221, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:36:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (267, 'URAF02W', 'tbl_users', 222, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:37:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (268, 'JZ8KZ7Q', 'tbl_users', 223, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:38:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (269, 'X0MRC1G', 'tbl_users', 224, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:38:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (270, 'T6V26CX', 'tbl_users', 225, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:39:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (271, 'BAHTU4L', 'tbl_users', 226, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:39:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (272, 'LQ1VT4E', 'tbl_users', 227, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:40:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (273, 'YE6RDX6', 'tbl_users', 228, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:40:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (274, 'TB7197G', 'tbl_users', 229, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:41:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (275, 'Z78MOSC', 'tbl_users', 230, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:43:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (276, '7XQA6OD', 'tbl_users', 231, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:44:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (277, '2FKWA25', 'tbl_users', 232, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:45:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (278, 'B3P4DRJ', 'tbl_users', 233, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:47:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (279, '4N9RFAO', 'tbl_users', 234, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:48:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (280, 'KH1B8H6', 'tbl_users', 235, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:50:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (281, 'IQ8AQ04', 'tbl_users', 236, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:51:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (282, 'KSQX5OO', 'tbl_users', 237, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:52:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (283, 'GL7L95Y', 'tbl_users', 238, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:52:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (284, '5SPKTCZ', 'tbl_users', 239, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:53:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (285, 'FFJ70D5', 'tbl_users', 240, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:53:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (286, '525QONQ', 'tbl_users', 241, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:54:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (287, '4RJMOHG', 'tbl_users', 242, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:54:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (288, 'I1JAW75', 'tbl_users', 243, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:55:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (289, 'RS53SV6', 'tbl_users', 244, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:56:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (290, 'GR9DHEE', 'tbl_users', 245, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:56:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (291, '6SC1XQ0', 'tbl_users', 246, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:57:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (292, '6G2BT1Q', 'tbl_users', 247, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:57:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (293, 'G6OS9DU', 'tbl_users', 248, 'all', NULL, NULL, 'create', 1, '2023-02-09 13:58:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (294, '5YOUDF9', 'tbl_users', 249, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:03:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (295, 'AP6HHMZ', 'tbl_users', 250, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:04:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (296, 'NJJSQJD', 'tbl_users', 251, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:05:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (297, 'CREOKE5', 'tbl_users', 252, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:06:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (298, 'Y1ZOTZO', 'tbl_users', 253, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:06:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (299, 'TNBNMMR', 'tbl_users', 254, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:07:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (300, 'Q9BKSN5', 'tbl_users', 255, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:08:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (301, 'IL0BIEE', 'tbl_users', 256, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:08:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (302, 'AK5I017', 'tbl_position', 91, 'name', 'PPIC ASSISTANT', 'PRODUCTION ENGINEER', 'update', 1, '2023-02-09 14:10:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (303, 'IBLJNSA', 'tbl_users', 257, 'all', NULL, NULL, 'create', 1, '2023-02-09 14:11:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (304, 'GGYYFP9', 'tbl_users', 98, 'birthdate', '2023-2-3', '1993-1-6', 'update', 1, '2023-02-09 14:13:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (305, '7IDTL6I', 'tbl_users', 258, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:02:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (306, 'BQNVPC0', 'tbl_users', 259, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:04:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (307, 'CMT58XM', 'tbl_users', 260, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:05:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (308, 'ZUE51OG', 'tbl_users', 261, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:06:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (309, '5UNWIQZ', 'tbl_users', 262, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:06:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (310, 'DRKGHKJ', 'tbl_users', 263, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:07:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (311, 'BUI8Q88', 'tbl_users', 264, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:07:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (312, '6KA4X2D', 'tbl_users', 265, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:35:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (313, '5CJ4IB5', 'tbl_users', 266, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:37:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (314, 'MTVHI78', 'tbl_users', 267, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:39:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (315, 'C79QNOL', 'tbl_users', 268, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:39:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (316, 'Q2FR1R6', 'tbl_users', 269, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:40:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (317, '59I1EDE', 'tbl_users', 270, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:53:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (318, 'VG0HA4U', 'tbl_users', 271, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:53:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (319, '4W3VFAD', 'tbl_users', 272, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:54:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (320, 'GCU9JK1', 'tbl_users', 273, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:54:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (321, '82GAWSR', 'tbl_users', 274, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:55:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (322, 'PD0T4VF', 'tbl_users', 271, 'birthdate', '2023-2-9', '1987-10-25', 'update', 1, '2023-02-09 15:56:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (323, 'VN259TG', 'tbl_users', 270, 'birthdate', '2023-2-9', '1995-4-17', 'update', 1, '2023-02-09 15:56:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (324, 'FE437XW', 'tbl_users', 275, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:57:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (325, 'SAE3F6V', 'tbl_users', 276, 'all', NULL, NULL, 'create', 1, '2023-02-09 15:58:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (326, 'XIM8BV9', 'tbl_users', 277, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:30:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (327, 'N65S9L9', 'tbl_users', 278, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:32:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (328, '180VJ49', 'tbl_users', 279, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:33:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (329, 'JGUTDYS', 'tbl_users', 280, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:33:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (330, '70NSGFP', 'tbl_users', 281, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:34:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (331, 'U0OD7SX', 'tbl_users', 282, 'all', NULL, NULL, 'create', 1, '2023-02-09 16:35:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (332, 'H5HTP4Z', 'tbl_users', 283, 'all', NULL, NULL, 'create', 1, '2023-02-10 09:36:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (333, '7VFZJER', 'tbl_category', 1, 'all', NULL, NULL, 'create', 1, '2023-02-10 11:30:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (334, 'EN6YXHC', 'tbl_category', 2, 'all', NULL, NULL, 'create', 1, '2023-02-10 11:32:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (335, 'LJYPK6Z', 'tbl_category', 1, 'all', NULL, NULL, 'create', 1, '2023-02-10 13:33:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (336, '41JO7X3', 'tbl_category', 2, 'all', NULL, NULL, 'create', 1, '2023-02-10 13:33:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (337, '8U5QUWF', 'tbl_category', 3, 'all', NULL, NULL, 'create', 1, '2023-02-10 13:33:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (338, 'HYOBJL8', 'tbl_category', 4, 'all', NULL, NULL, 'create', 1, '2023-02-10 13:33:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (339, 'XPFLK0O', 'tbl_category', 5, 'all', NULL, NULL, 'create', 1, '2023-02-10 13:34:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (340, '7D4E3WF', 'tbl_brand', 1, 'all', NULL, NULL, 'create', 1, '2023-02-10 16:22:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (341, 'XLABYHF', 'tbl_brand', 2, 'all', NULL, NULL, 'create', 1, '2023-02-10 16:23:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (342, 'OPVTHFY', 'tbl_category', 5, 'module', 'supplies', 'assets', 'update', 1, '2023-02-13 13:19:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (343, 'HUT2Z8Z', 'tbl_category', 5, 'module', 'assets', 'supplies', 'update', 1, '2023-02-13 13:19:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (344, 'N3IPW56', 'tbl_category', 5, 'status', '1', '0', 'update', 1, '2023-02-13 13:19:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (345, 'QZ22WUZ', 'tbl_category', 5, 'status', '0', '1', 'update', 1, '2023-02-13 13:20:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (346, 'QJO7Z4F', 'tbl_category', 6, 'all', NULL, NULL, 'create', 1, '2023-02-13 13:41:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (347, 'NNISHBM', 'tbl_brand', 3, 'all', NULL, NULL, 'create', 1, '2023-02-13 13:41:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (348, 'T2KJYGT', 'tbl_brand', 1, 'name', '3', '6', 'update', 1, '2023-02-13 13:47:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (349, 'HRAU9CZ', 'tbl_brand', 1, 'name', 'YEALINK', 'HP', 'update', 1, '2023-02-13 13:47:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (350, '31W7X9N', 'tbl_brand', 1, 'status', '1', '0', 'update', 1, '2023-02-13 13:47:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (351, 'EA751TG', 'tbl_brand', 1, 'status', '0', '1', 'update', 1, '2023-02-13 13:47:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (352, 'Y51OL04', 'tbl_brand', 1, 'name', '6', '3', 'update', 1, '2023-02-13 13:47:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (353, '2WGFGVU', 'tbl_brand', 1, 'name', 'HP', 'YEALINK', 'update', 1, '2023-02-13 13:47:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (354, 'WGZHAEL', 'tbl_category', 6, 'name', 'LAPTOP', 'OFFICE FURNITURE', 'update', 1, '2023-02-13 15:52:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (355, 'E09RW75', 'tbl_category', 7, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:53:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (356, 'HIUM5ZH', 'tbl_category', 2, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:53:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (357, '4943XMK', 'tbl_category', 3, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:54:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (358, 'QEJFVLY', 'tbl_category', 4, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:54:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (359, 'A7X0NLW', 'tbl_items', 4, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:54:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (360, 'R1K30E2', 'tbl_items', 2, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:55:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (361, 'UF78ORQ', 'tbl_items', 3, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:56:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (362, 'S4DDZC2', 'tbl_items', 4, 'all', NULL, NULL, 'create', 1, '2023-02-13 15:56:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (363, 'F272049', 'tbl_items', 5, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:06:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (364, 'KDDQ7AY', 'tbl_items', 6, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:07:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (365, 'ZT4BKGQ', 'tbl_items', 7, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:07:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (366, 'KOSWHAM', 'tbl_items', 8, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:07:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (367, 'W4O330B', 'tbl_items', 9, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:07:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (368, 'F7VM96T', 'tbl_items', 10, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:07:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (369, '7NCMK2K', 'tbl_items', 11, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (370, '71YUYPO', 'tbl_items', 12, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (371, 'EGN0WFL', 'tbl_items', 13, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (372, '1UPTU7L', 'tbl_items', 14, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (373, 'H5LDR0N', 'tbl_items', 15, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (374, 'U1VLOTO', 'tbl_items', 16, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:08:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (375, '0NTUUT4', 'tbl_items', 17, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (376, '720TNBH', 'tbl_items', 18, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (377, '73D25GZ', 'tbl_items', 19, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (378, 'Y468NRJ', 'tbl_items', 20, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (379, '3Z7Z4IF', 'tbl_items', 21, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (380, 'Z2BFENF', 'tbl_items', 22, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:09:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (381, 'HRDLKG8', 'tbl_items', 23, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:10:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (382, 'RNXNW9L', 'tbl_items', 24, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:10:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (383, '3MVVNKA', 'tbl_items', 25, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:10:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (384, 'VMO0ZGQ', 'tbl_items', 26, 'all', NULL, NULL, 'create', 1, '2023-02-13 16:11:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (385, '2ASBKVH', 'tbl_category', 1, 'all', NULL, NULL, 'create', 1, '2023-02-14 10:54:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (386, 'LX8P6X0', 'tbl_category', 2, 'all', NULL, NULL, 'create', 1, '2023-02-14 10:55:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (387, '5ZU44SI', 'tbl_category', 3, 'all', NULL, NULL, 'create', 1, '2023-02-14 10:55:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (388, 'U46SGXZ', 'tbl_category', 4, 'all', NULL, NULL, 'create', 1, '2023-02-14 10:55:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (389, 'AA7GTLS', 'tbl_sub_category', 1, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:07:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (390, '7248KP2', 'tbl_sub_category', 2, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:09:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (391, '9Y978N5', 'tbl_sub_category', 3, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:09:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (392, 'O58REXR', 'tbl_sub_category', 4, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:09:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (393, 'UUUPAYL', 'tbl_sub_category', 5, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:10:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (394, 'V1DKW0Z', 'tbl_sub_category', 6, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:10:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (395, 'X7QRSFB', 'tbl_sub_category', 7, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:12:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (396, 'BW7IKCL', 'tbl_sub_category', 8, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:12:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (397, 'X7MFXS7', 'tbl_sub_category', 9, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:13:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (398, 'P5FCV5F', 'tbl_sub_category', 10, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:13:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (399, 'MV2BTHY', 'tbl_sub_category', 11, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:13:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (400, 'V8MJFWI', 'tbl_sub_category', 12, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:14:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (401, 'CL7XJ02', 'tbl_sub_category', 13, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:14:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (402, '08TD8T4', 'tbl_sub_category', 14, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:14:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (403, 'DLKOTS3', 'tbl_sub_category', 15, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:14:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (404, 'OBZW218', 'tbl_sub_category', 16, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:15:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (405, 'IXFXN1V', 'tbl_sub_category', 17, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:15:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (406, '9HVSYGX', 'tbl_sub_category', 18, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:15:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (407, 'JXMZFKN', 'tbl_sub_category', 19, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:15:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (408, '5T7K1M6', 'tbl_sub_category', 20, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:15:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (409, 'XB9IZ24', 'tbl_sub_category', 21, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:16:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (410, 'D4T5WRM', 'tbl_sub_category', 22, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:16:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (411, 'XYXPPGF', 'tbl_sub_category', 23, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:16:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (412, 'EL6Z2S0', 'tbl_sub_category', 24, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:16:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (413, 'UGUIJKD', 'tbl_sub_category', 25, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:17:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (414, 'E70JCDA', 'tbl_sub_category', 26, 'all', NULL, NULL, 'create', 1, '2023-02-14 11:17:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (417, '8UZKXIV', 'tbl_category', 1, 'tag', 'OS', 'ESTL', 'update', 1, '2023-02-14 11:21:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (416, '6HP7XJL', 'tbl_category', 3, 'tag', 'OFR', 'FURN', 'update', 1, '2023-02-14 11:21:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (415, 'QKD85W2', 'tbl_category', 3, 'tag', 'OF', 'OFR', 'update', 1, '2023-02-14 11:20:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (418, 'FNW2MFG', 'tbl_sub_category', 3, 'tag', 'MRKR', 'DEMH', 'update', 1, '2023-02-14 11:26:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (419, 'E1FXKEO', 'tbl_sub_category', 2, 'tag', 'PPR', 'PEN', 'update', 1, '2023-02-14 11:26:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (420, 'K78MWQ2', 'tbl_sub_category', 14, 'name', '4', '3', 'update', 1, '2023-02-14 11:53:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (421, 'UNBRV5I', 'tbl_assets', 1, 'all', NULL, NULL, 'create', 1, '2023-02-15 09:16:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (422, '2BE9MBK', 'tbl_assets', 2, 'all', NULL, NULL, 'create', 1, '2023-02-15 09:18:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (423, 'GB9U5HH', 'tbl_assets', 3, 'all', NULL, NULL, 'create', 1, '2023-02-15 09:19:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (424, '5QVEGRM', 'tbl_assets', 4, 'all', NULL, NULL, 'create', 1, '2023-02-15 09:46:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (425, 'A1H1X6P', 'tbl_assets', 5, 'all', NULL, NULL, 'create', 1, '2023-02-15 14:28:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (426, 'KA4J5SM', 'tbl_assets', 6, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:16:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (427, 'KBF7JN3', 'tbl_assets', 7, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:18:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (428, '6H7CQEG', 'tbl_assets', 9, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:29:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (429, 'RUMSZ7Q', 'tbl_assets', 10, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:34:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (430, '0C57JSW', 'tbl_assets', 110, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:40:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (431, 'U0GCH7C', 'tbl_assets', 10, 'all', NULL, NULL, 'create', 1, '2023-02-16 10:59:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (432, '9QLS16H', 'tbl_assets', 11, 'all', NULL, NULL, 'create', 1, '2023-02-16 11:16:39+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (433, '1OG7948', 'tbl_assets', 12, 'all', NULL, NULL, 'create', 1, '2023-02-17 08:56:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (434, 'DF750UU', 'tbl_assets', 13, 'all', NULL, NULL, 'create', 1, '2023-02-17 09:35:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (435, '3AWGK3T', 'tbl_assets', 14, 'all', NULL, NULL, 'create', 1, '2023-02-17 10:22:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (436, 'DXPWMUD', 'tbl_assets', 15, 'all', NULL, NULL, 'create', 1, '2023-02-17 10:40:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (437, 'GE0NYP1', 'tbl_assets', 16, 'all', NULL, NULL, 'create', 1, '2023-02-17 11:35:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (438, 'EYMTLH6', 'tbl_assets', 23, 'all', NULL, NULL, 'create', 1, '2023-02-17 13:06:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (439, 'SL60UYU', 'tbl_assets', 24, 'all', NULL, NULL, 'create', 1, '2023-02-17 13:09:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (440, 'ZDCGKGP', 'tbl_assets', 26, 'all', NULL, NULL, 'create', 1, '2023-02-17 14:21:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (441, 'XEA7WKA', 'tbl_assets', 20, 'all', NULL, NULL, 'create', 1, '2023-02-17 14:29:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (442, 'TT28SJW', 'tbl_assets', 21, 'all', NULL, NULL, 'create', 1, '2023-02-17 14:34:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (443, 'UVV5RFO', 'tbl_assets', 22, 'all', NULL, NULL, 'create', 1, '2023-02-17 14:36:57+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (444, 'GO7K900', 'tbl_sub_category', 24, 'status', '1', '0', 'update', 1, '2023-02-17 14:57:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (445, 'AVMT3PF', 'tbl_assets', 23, 'all', NULL, NULL, 'create', 1, '2023-02-17 15:15:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (446, 'V0Q53DG', 'tbl_assets', 24, 'all', NULL, NULL, 'create', 1, '2023-02-17 15:16:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (447, 'Z62G7JQ', 'tbl_assets', 25, 'all', NULL, NULL, 'create', 1, '2023-02-17 15:31:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (448, '299J8N2', 'tbl_assets', 3, 'brand', 'undefined', 'SAMPLE', 'update', 1, '2023-02-20 10:15:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (449, 'FPB79A3', 'tbl_assets', 3, 'brand', 'undefined', '', 'update', 1, '2023-02-20 10:15:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (450, '1CYZT7U', 'tbl_assets', 5, 'brand', NULL, 'SAMPLE', 'update', 1, '2023-02-20 10:38:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (451, 'T8Z4FO4', 'tbl_assets', 5, 'brand', 'SAMPLE', '', 'update', 1, '2023-02-20 10:39:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (452, '65B92B2', 'tbl_assets', 5, 'status', '1', '0', 'update', 1, '2023-02-20 10:39:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (453, '7YGVDLY', 'tbl_assets', 5, 'status', '0', '1', 'update', 1, '2023-02-20 10:39:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (454, 'ZUKBB5R', 'tbl_assets', 12, 'status', '1', '0', 'update', 1, '2023-02-20 14:31:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (455, 'YGG2H0T', 'tbl_assets', 12, 'input_connectivity', '[{"id":"hdmi","name":"HDMI"},{"id":"dvi","name":"DVI"}]', '[{"id":"hdmi","name":"HDMI"}]', 'update', 1, '2023-02-20 14:31:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (456, 'DBCVP8D', 'tbl_assets', 12, 'status', '0', '1', 'update', 1, '2023-02-20 14:31:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (457, 'JG9KYHC', 'tbl_assets', 12, 'input_connectivity', '[{"id":"hdmi","name":"HDMI"}]', '[{"id":"hdmi","name":"HDMI"},{"id":"dvi","name":"DVI"}]', 'update', 1, '2023-02-20 14:31:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (458, 'FD7ZQBX', 'tbl_assets', 13, 'status', '1', '0', 'update', 1, '2023-02-20 14:41:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (459, 'RLT8KUX', 'tbl_assets', 13, 'warranty', '1', '2', 'update', 1, '2023-02-20 14:41:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (460, 'UDGTLA2', 'tbl_assets', 13, 'status', '0', '1', 'update', 1, '2023-02-20 14:41:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (461, '0D72IJ9', 'tbl_assets', 13, 'warranty', '2', '1', 'update', 1, '2023-02-20 14:41:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (462, '8NDTRX6', 'tbl_assets', 14, 'color', 'BLACK', 'WHITE', 'update', 1, '2023-02-20 14:49:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (464, 'G2YOHJP', 'tbl_assets', 14, 'status', '1', '0', 'update', 1, '2023-02-20 14:49:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (463, 'EBZKMUG', 'tbl_assets', 14, 'dpi', '800', '800', 'update', 1, '2023-02-20 14:49:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (466, '3FSMMFQ', 'tbl_assets', 14, 'status', '0', '1', 'update', 1, '2023-02-20 14:49:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (465, 'XVZC3LX', 'tbl_assets', 14, 'color', 'WHITE', 'BLACK', 'update', 1, '2023-02-20 14:49:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (467, 'G8SAKBL', 'tbl_assets', 15, 'interface', 'usb', 'bluetooth', 'update', 1, '2023-02-20 14:55:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (468, 'SRVZFGX', 'tbl_assets', 15, 'no_of_keys', '113', '113', 'update', 1, '2023-02-20 14:55:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (469, '549MPV2', 'tbl_assets', 15, 'status', '1', '0', 'update', 1, '2023-02-20 14:55:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (470, 'VZ3V1AR', 'tbl_assets', 15, 'interface', 'bluetooth', 'usb', 'update', 1, '2023-02-20 14:55:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (471, 'II73MZ0', 'tbl_assets', 15, 'status', '0', '1', 'update', 1, '2023-02-20 14:55:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (472, 'QC25HYT', 'tbl_assets', 16, 'color', 'BLACK', 'WHITE', 'update', 1, '2023-02-20 15:15:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (473, '9RAA7LX', 'tbl_assets', 16, 'printer_type', 'inkjet', 'laser', 'update', 1, '2023-02-20 15:15:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (474, 'DM71LR8', 'tbl_assets', 16, 'printer_type', 'laser', 'inkjet', 'update', 1, '2023-02-20 15:15:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (475, 'ITN0LXP', 'tbl_assets', 16, 'color', 'WHITE', 'BLACK', 'update', 1, '2023-02-20 15:15:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (476, '8ILMNPK', 'tbl_assets', 18, 'screen_size', '19.5"', '19.6"', 'update', 1, '2023-02-21 09:16:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (477, 'HZA2MH9', 'tbl_assets', 18, 'screen_size', '19.6"', '19.5"', 'update', 1, '2023-02-21 09:16:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (478, 'LB24RDW', 'tbl_assets', 26, 'all', NULL, NULL, 'create', 1, '2023-02-21 10:59:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (479, 'CPPQ6ET', 'tbl_assets', 26, 'all', NULL, NULL, 'create', 1, '2023-02-21 11:02:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (480, 'A3LKRNV', 'tbl_assets', 26, 'tool', 'NETWORK CABLE TESTER', 'NETWORK CABLE TESTER1', 'update', 1, '2023-02-21 11:10:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (481, 'HHSGCAE', 'tbl_assets', 26, 'stock', '1', '12', 'update', 1, '2023-02-21 11:10:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (482, 'II9SHQR', 'tbl_assets', 26, 'stock', '12', '1', 'update', 1, '2023-02-21 11:11:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (484, '3JESSEC', 'tbl_assets', 26, 'status', '0', '1', 'update', 1, '2023-02-21 11:11:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (483, 'ST30AWQ', 'tbl_assets', 26, 'tool', 'NETWORK CABLE TESTER1', 'NETWORK CABLE TESTER', 'update', 1, '2023-02-21 11:11:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (485, 'A3Q2JB3', 'tbl_assets', 24, 'model', 'SRD0VN2', 'SRD0VN21', 'update', 1, '2023-02-21 11:16:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (486, 'AWOIRPO', 'tbl_assets', 24, 'capacity', '1TB', '2TB', 'update', 1, '2023-02-21 11:16:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (487, 'LEQF1ST', 'tbl_assets', 24, 'color', 'BLACK', 'BLACK1', 'update', 1, '2023-02-21 11:16:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (488, 'IQXFF5J', 'tbl_assets', 24, 'model', 'SRD0VN21', 'SRD0VN2', 'update', 1, '2023-02-21 11:16:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (489, 'NYGW8BZ', 'tbl_assets', 24, 'color', 'BLACK1', 'BLACK', 'update', 1, '2023-02-21 11:16:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (490, 'FS4NZY6', 'tbl_assets', 24, 'capacity', '2TB', '1TB', 'update', 1, '2023-02-21 11:16:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (491, '0AYQWAO', 'tbl_assets', 25, 'color', 'BLACK', 'BLACK1', 'update', 1, '2023-02-21 11:20:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (492, '5YFHS9U', 'tbl_assets', 25, 'extension', '667', '6671', 'update', 1, '2023-02-21 11:20:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (493, '45ZC6B2', 'tbl_assets', 25, 'color', 'BLACK1', 'BLACK', 'update', 1, '2023-02-21 11:21:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (494, 'ANMCRKJ', 'tbl_assets', 25, 'extension', '6671', '667', 'update', 1, '2023-02-21 11:21:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (495, '21QWHJC', 'tbl_company', 5, 'status', '1', '0', 'update', 1, '2023-02-23 10:14:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (496, 'XJ4VMXO', 'tbl_company', 3, 'status', '1', '0', 'update', 1, '2023-02-23 10:14:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (497, '22K5T2Q', 'tbl_company', 4, 'status', '1', '0', 'update', 1, '2023-02-23 10:15:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (499, 'BD8ZW7F', 'tbl_assign_asset', 1, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-23 15:43:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (498, 'BG95Y2Q', 'tbl_assign_asset', 1, 'all', NULL, NULL, 'create', 1, '2023-02-23 15:43:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (500, 'PYUQVUJ', 'tbl_assign_asset', 2, 'all', NULL, NULL, 'create', 1, '2023-02-23 15:54:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (501, 'IYPQEVF', 'tbl_assign_asset', 1, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-23 15:54:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (502, '1FWGJTH', 'tbl_assign_asset', 2, 'all', NULL, NULL, 'create', 1, '2023-02-23 16:04:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (503, 'YPKRXIV', 'tbl_assign_asset', 4, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-23 16:04:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (504, '98BBMHZ', 'tbl_assign_asset', 3, 'all', NULL, NULL, 'create', 1, '2023-02-23 16:04:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (505, 'QXDP3O4', 'tbl_assign_asset', 4, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-23 16:04:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (506, '0M6LLX0', 'tbl_assign_asset', 3, 'all', NULL, NULL, 'create', 1, '2023-02-23 16:26:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (507, '83CFRZZ', 'tbl_assign_asset', 9, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-23 16:26:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (508, 'L4GJY69', 'tbl_assign_asset', 3, 'status', '1', '0', 'update', 1, '2023-02-27 14:04:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (509, 'GO4J27Y', 'tbl_assign_asset', 3, 'status', '0', '1', 'update', 1, '2023-02-27 14:04:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (510, '843IQ9Z', 'tbl_assign_asset', 3, 'issued_to', '107', '104', 'update', 1, '2023-02-27 14:05:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (511, 'U51M816', 'tbl_assign_asset', 3, 'issued_to', '104', '107', 'update', 1, '2023-02-27 14:05:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (512, '5YQRH0D', 'tbl_assign_asset', 3, 'issued_to', '107', '104', 'update', 1, '2023-02-27 14:11:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (513, 'ZN6EB61', 'tbl_assets', 27, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:02:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (514, '5WGFOF8', 'tbl_assign_asset', 4, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:03:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (515, 'NY9ZG7M', 'tbl_assign_asset', 27, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 15:03:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (516, 'TMJ868H', 'tbl_users', 284, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:06:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (517, 'IKJKC4B', 'tbl_users', 285, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:07:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (518, 'AG6483V', 'tbl_users', 286, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:08:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (519, '8CQTTPL', 'tbl_users', 287, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:08:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (520, '54Z1H55', 'tbl_users', 288, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:09:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (521, '0FOH505', 'tbl_users', 289, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:09:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (522, 'JBW5L54', 'tbl_users', 290, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:10:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (523, 'U8JR04W', 'tbl_users', 291, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:11:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (524, 'RR5IPO1', 'tbl_users', 292, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:11:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (525, '5C6DB3A', 'tbl_users', 293, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:12:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (526, 'WSEBJNT', 'tbl_users', 294, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:19:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (527, 'E1GD04T', 'tbl_users', 295, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:21:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (528, '4RVNTE1', 'tbl_users', 296, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:23:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (529, 'B5BUMZ1', 'tbl_users', 297, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:24:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (530, '6MH2GCX', 'tbl_position', 149, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:26:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (531, 'XQS6QBF', 'tbl_users', 298, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:27:27+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (532, 'V0LEF29', 'tbl_users', 299, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:28:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (533, 'TH9Y875', 'tbl_users', 300, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:29:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (534, 'AZI73KY', 'tbl_users', 301, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:29:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (535, 'GKGI4OG', 'tbl_users', 302, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:30:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (536, 'D85T1S7', 'tbl_users', 303, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:31:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (537, 'IGM37EV', 'tbl_users', 304, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:31:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (538, 'BJUJSPZ', 'tbl_users', 305, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:32:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (539, 'B0DRAM0', 'tbl_users', 306, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:33:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (540, 'P5C6TF0', 'tbl_users', 307, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:34:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (541, 'Y7KVU0O', 'tbl_users', 308, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:34:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (542, '6OYB9EL', 'tbl_users', 309, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:35:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (543, 'Z6DM5VR', 'tbl_users', 310, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:36:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (544, 'WVFB9QT', 'tbl_users', 311, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:37:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (545, 'Y3GZM37', 'tbl_users', 312, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:38:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (546, 'HGT47K0', 'tbl_users', 313, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:38:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (547, 'UEN2H3O', 'tbl_users', 314, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:39:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (548, 'NIJAFIF', 'tbl_users', 315, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:40:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (549, 'PB4O8F1', 'tbl_users', 316, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:40:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (550, 'OSKZKR5', 'tbl_users', 317, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:41:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (551, 'AMBXWJ2', 'tbl_users', 318, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:42:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (552, 'O7CUV19', 'tbl_users', 319, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:47:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (553, 'Z187037', 'tbl_users', 320, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:47:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (554, '3244GUK', 'tbl_users', 321, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:48:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (555, 'GNN9F05', 'tbl_users', 322, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:49:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (556, 'D9LBQK2', 'tbl_users', 323, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:49:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (557, 'DKCK23E', 'tbl_users', 324, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:50:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (558, 'V2USYGD', 'tbl_users', 325, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:50:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (559, 'YCMVERS', 'tbl_users', 326, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:51:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (560, 'LFZX35X', 'tbl_users', 327, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:51:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (561, 'AGOLJGW', 'tbl_users', 328, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:52:29+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (562, 'EQQFL3H', 'tbl_users', 329, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:53:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (563, 'AR4RM0W', 'tbl_users', 330, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:54:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (564, '3R1TMFE', 'tbl_position', 150, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:55:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (565, '8A0SGP5', 'tbl_users', 331, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:55:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (566, 'S7RKDTD', 'tbl_users', 332, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:55:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (567, 'RBAZG3D', 'tbl_users', 333, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:56:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (568, 'M1HUEP9', 'tbl_users', 334, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:56:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (569, '67EY0B5', 'tbl_users', 335, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:57:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (570, 'J40L3A4', 'tbl_users', 336, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:57:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (571, 'P98ZERL', 'tbl_users', 337, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:58:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (572, 'U9YZCXV', 'tbl_users', 338, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:58:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (573, '40ZAVH0', 'tbl_users', 339, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:59:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (574, 'AI0CU3F', 'tbl_users', 340, 'all', NULL, NULL, 'create', 1, '2023-02-27 15:59:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (575, 'S1RU4V0', 'tbl_users', 341, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:11:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (576, 'IU5BWK1', 'tbl_users', 342, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:12:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (577, '4NVEYJW', 'tbl_users', 343, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:13:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (578, 'AGUVWQS', 'tbl_users', 344, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:14:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (579, 'T63WJI1', 'tbl_users', 345, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:15:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (580, 'HZVUXS2', 'tbl_users', 346, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:16:36+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (581, 'D1GRYUL', 'tbl_users', 347, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:18:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (582, '0M9C2L0', 'tbl_users', 348, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:21:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (583, 'BU8XS9H', 'tbl_users', 349, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:22:21+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (584, 'VD0EE1T', 'tbl_users', 350, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:22:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (585, 'J1OPS0B', 'tbl_users', 351, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:23:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (586, '3YZP3S5', 'tbl_users', 350, 'user_level', 'user', 'admin', 'update', 1, '2023-02-27 16:23:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (587, 'KXGTM8L', 'tbl_users', 349, 'user_level', 'user', 'admin', 'update', 1, '2023-02-27 16:23:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (588, 'YCOXK7J', 'tbl_users', 351, 'user_level', 'user', 'admin', 'update', 1, '2023-02-27 16:23:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (589, '977RYBD', 'tbl_users', 352, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:24:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (590, 'E6BBI6Q', 'tbl_users', 353, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:25:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (591, 'ZFFUMMP', 'tbl_users', 352, 'user_level', 'user', 'admin', 'update', 1, '2023-02-27 16:25:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (592, '7UK1S7T', 'tbl_users', 354, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:26:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (593, '0FJQOEK', 'tbl_users', 355, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:26:47+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (594, 'CWJE1TG', 'tbl_users', 354, 'user_level', 'user', 'admin', 'update', 1, '2023-02-27 16:26:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (595, '1RJ73NA', 'tbl_users', 354, 'employment_status', 'regular', 'probationary', 'update', 1, '2023-02-27 16:26:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (596, 'TBFMAL7', 'tbl_users', 356, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:27:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (597, 'WYNF4KK', 'tbl_users', 357, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:28:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (598, 'HEEHDDT', 'tbl_users', 356, 'civil_status', 'single', 'married', 'update', 1, '2023-02-27 16:28:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (599, 'BABB0WJ', 'tbl_users', 358, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:30:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (600, 'QOB8C1W', 'tbl_users', 359, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:30:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (601, 'U32NPA9', 'tbl_users', 360, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:31:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (602, 'G7JSUH2', 'tbl_users', 361, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:32:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (603, 'J16I6Y5', 'tbl_users', 362, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:32:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (604, 'NVJTQKE', 'tbl_users', 363, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:33:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (605, 'L1S1FZG', 'tbl_users', 364, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:38:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (606, 'R16P00Q', 'tbl_users', 365, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:40:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (607, '590NQ1C', 'tbl_users', 366, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:40:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (608, '21QGIB6', 'tbl_users', 367, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:41:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (609, 'PZ8BRPD', 'tbl_users', 368, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:42:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (610, 'O73UQ23', 'tbl_users', 369, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:42:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (611, 'NW9X0P0', 'tbl_users', 370, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:43:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (612, '9VUHISN', 'tbl_users', 371, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:44:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (613, 'SMX1Y7Q', 'tbl_users', 372, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:44:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (614, 'E5WWI8N', 'tbl_users', 373, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:45:23+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (615, 'AHFCYXC', 'tbl_users', 374, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:45:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (616, '4V0UT3B', 'tbl_users', 375, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:46:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (617, 'JNBQ8D7', 'tbl_users', 376, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:46:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (618, 'NPGRBL9', 'tbl_users', 377, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:47:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (619, '0BPPR4N', 'tbl_users', 375, 'civil_status', 'single', 'married', 'update', 1, '2023-02-27 16:48:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (620, 'HF47CT5', 'tbl_users', 375, 'address', NULL, '394 EAGLE ST. SITIO VETERANS AREA 2 BAGONG SILANGAN QUEZON CITY.', 'update', 1, '2023-02-27 16:48:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (621, 'Y9I29ZK', 'tbl_users', 375, 'birthdate', '2023-2-27', '1988-2-3', 'update', 1, '2023-02-27 16:48:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (622, '6GAY94D', 'tbl_users', 375, 'employment_status', 'agency', 'regular', 'update', 1, '2023-02-27 16:48:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (623, 'XDW5WOE', 'tbl_users', 375, 'employee_no', '21600334', '22100459', 'update', 1, '2023-02-27 16:48:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (624, 'OSJNDWS', 'tbl_users', 378, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:54:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (625, 'KXRDO94', 'tbl_users', 379, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:55:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (626, 'EAH8AMT', 'tbl_users', 380, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:55:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (627, '44JMBSE', 'tbl_users', 381, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:56:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (628, 'EFFBZ69', 'tbl_users', 382, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:56:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (629, '0PF6GFI', 'tbl_users', 383, 'all', NULL, NULL, 'create', 1, '2023-02-27 16:57:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (630, '7MU506A', 'tbl_assign_asset', 5, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:00:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (631, 'UL9QI7B', 'tbl_assign_asset', 12, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:00:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (632, '3ZRATDA', 'tbl_assign_asset', 6, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:01:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (633, 'WOC0Y5B', 'tbl_assign_asset', 15, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:01:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (634, 'RZUSEF2', 'tbl_assign_asset', 7, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:01:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (635, 'BJM4VG1', 'tbl_assign_asset', 17, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:01:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (636, 'KMK10VD', 'tbl_assign_asset', 8, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:01:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (637, 'S0Y8R1Y', 'tbl_assign_asset', 18, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:01:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (638, 'G9QZGB4', 'tbl_assign_asset', 9, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:02:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (639, 'AQ0MIT5', 'tbl_assign_asset', 2, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:02:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (640, 'C4JYEZ0', 'tbl_assign_asset', 10, 'all', NULL, NULL, 'create', 1, '2023-02-27 17:02:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (641, 'CWADQRZ', 'tbl_assign_asset', 5, 'is_released', NULL, NULL, 'issuance', 1, '2023-02-27 17:02:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (642, 'LJIKPH4', 'tbl_users', 384, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:29:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (643, 'SH1208I', 'tbl_users', 385, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:30:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (644, 'AYPKWOK', 'tbl_users', 386, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:31:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (645, '9FG88S3', 'tbl_users', 387, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:32:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (646, 'TAXM35S', 'tbl_users', 388, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:33:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (647, 'IBOJZJG', 'tbl_users', 389, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:34:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (648, 'IX7NVRG', 'tbl_users', 390, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:34:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (649, 'U5AJO25', 'tbl_users', 391, 'all', NULL, NULL, 'create', 1, '2023-02-28 08:35:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (650, 'KL96702', 'tbl_users', 392, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:06:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (651, 'AL6OJF2', 'tbl_users', 393, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:07:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (652, '7WIKSFC', 'tbl_users', 394, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:08:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (653, 'NI1K5VQ', 'tbl_users', 395, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:09:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (654, 'JC8FV7G', 'tbl_users', 396, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:47:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (655, 'JTELCZR', 'tbl_users', 397, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:47:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (656, 'NMX5M3Z', 'tbl_users', 398, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:48:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (657, 'PZKYPC6', 'tbl_users', 397, 'employment_status', 'regular', 'agency', 'update', 1, '2023-02-28 09:48:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (658, 'RCX1XFM', 'tbl_users', 396, 'employment_status', 'regular', 'agency', 'update', 1, '2023-02-28 09:48:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (659, 'VPTX3KE', 'tbl_users', 399, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:48:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (660, 'LBKLQ5R', 'tbl_users', 400, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:49:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (661, 'D5BFEZV', 'tbl_users', 401, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:49:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (662, '3HWSAI5', 'tbl_users', 402, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:50:20+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (663, 'XG4G2PF', 'tbl_users', 403, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:50:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (664, '49LKMXY', 'tbl_users', 404, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:51:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (665, '0RSLTMQ', 'tbl_users', 405, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:51:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (666, 'DCQR6NE', 'tbl_users', 406, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:51:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (667, '3H1LKFB', 'tbl_users', 407, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:52:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (668, 'BIO6H8M', 'tbl_users', 408, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:53:05+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (669, 'K970I99', 'tbl_users', 409, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:53:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (670, 'O03XWAX', 'tbl_users', 410, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:54:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (671, 'X1SS9FV', 'tbl_users', 411, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:55:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (672, '0R0WR3R', 'tbl_users', 412, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:56:22+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (673, 'XY4NSZG', 'tbl_users', 413, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:57:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (674, 'NUQA5QS', 'tbl_users', 414, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:57:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (675, 'DMQH1UN', 'tbl_users', 415, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:58:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (676, 'LZJB7QE', 'tbl_users', 416, 'all', NULL, NULL, 'create', 1, '2023-02-28 09:59:32+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (677, '8EKHT45', 'tbl_users', 417, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:00:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (678, '0MKBJQ1', 'tbl_users', 418, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:00:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (679, 'X9UMV9Q', 'tbl_users', 419, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:02:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (680, '62UULJG', 'tbl_users', 420, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:03:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (681, 'HK9SOS4', 'tbl_users', 421, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:06:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (682, 'ACVYM2N', 'tbl_users', 422, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:08:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (683, 'GQ17MSS', 'tbl_users', 423, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:08:50+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (684, 'QEKC891', 'tbl_users', 424, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:09:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (685, 'FW9MQ9A', 'tbl_users', 425, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:09:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (686, 'VCDQ0JO', 'tbl_users', 426, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:21:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (687, 'TULSQZU', 'tbl_users', 427, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:23:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (688, 'F56C8N4', 'tbl_users', 428, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:24:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (689, 'TEK0X40', 'tbl_users', 428, 'gender', 'male', 'female', 'update', 1, '2023-02-28 10:24:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (690, 'PN8Q3IG', 'tbl_users', 427, 'user_level', 'user', 'admin', 'update', 1, '2023-02-28 10:25:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (691, 'DPVHY24', 'tbl_users', 429, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:25:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (692, 'YSUEQYL', 'tbl_users', 430, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:36:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (693, '7B0BE0Z', 'tbl_users', 431, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:38:25+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (694, 'WE1MU8E', 'tbl_users', 430, 'user_level', 'user', 'admin', 'update', 1, '2023-02-28 10:38:30+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (695, 'NRAQHAK', 'tbl_users', 432, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:40:42+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (696, '7FBNSRC', 'tbl_users', 433, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:41:19+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (697, 'VPNH4RF', 'tbl_users', 434, 'all', NULL, NULL, 'create', 1, '2023-02-28 10:42:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (698, 'DR22RHH', 'tbl_users', 435, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:03:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (699, '0GDDS6Z', 'tbl_users', 436, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:09:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (700, 'D776SY3', 'tbl_users', 437, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:10:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (701, 'OB4OEUA', 'tbl_users', 438, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:10:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (702, '7D9IO7O', 'tbl_users', 439, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:11:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (703, '09HTMFZ', 'tbl_users', 440, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:16:38+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (704, 'G58FE8C', 'tbl_users', 441, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:17:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (705, 'OBSDFP5', 'tbl_users', 442, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:18:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (706, '44XKUV9', 'tbl_users', 443, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:19:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (707, '2DWBFER', 'tbl_users', 444, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:19:34+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (708, 'R1OSG0D', 'tbl_users', 445, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:20:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (709, 'IHS1HKS', 'tbl_users', 446, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:20:49+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (710, 'UTSMSOO', 'tbl_users', 447, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:27:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (711, 'IT1PB39', 'tbl_users', 448, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:27:53+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (712, '3JRR2SV', 'tbl_users', 447, 'user_level', 'user', 'admin', 'update', 1, '2023-02-28 11:27:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (713, 'A8BZ31U', 'tbl_users', 449, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:28:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (714, 'T9OSIAL', 'tbl_users', 450, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:31:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (715, 'A6DYRXV', 'tbl_users', 451, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:59:10+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (716, 'ZAEYPXB', 'tbl_users', 452, 'all', NULL, NULL, 'create', 1, '2023-02-28 11:59:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (717, 'KTS5MTM', 'tbl_users', 453, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:00:18+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (718, 'LDBZ0HP', 'tbl_users', 454, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:14:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (719, 'IVL2GOM', 'tbl_users', 455, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:15:15+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (720, 'G2SHWJK', 'tbl_users', 456, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:15:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (721, 'U92D3UN', 'tbl_users', 457, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:16:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (722, 'QT6YFFX', 'tbl_users', 458, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:18:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (723, '8CL5DZT', 'tbl_users', 459, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:18:56+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (724, 'W6DPAGF', 'tbl_users', 460, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:21:09+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (725, 'QVRVH01', 'tbl_users', 461, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:21:41+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (726, 'FSDZ6EP', 'tbl_users', 462, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:22:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (727, 'H7U8369', 'tbl_users', 463, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:22:59+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (728, 'HL60KSS', 'tbl_users', 464, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:24:07+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (729, 'JG7M52Q', 'tbl_users', 465, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:26:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (730, 'MW3GYCS', 'tbl_users', 466, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:29:33+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (731, '8G5QO7H', 'tbl_users', 467, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:30:08+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (732, '9B9NRET', 'tbl_users', 468, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:32:01+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (733, '1WTZAQG', 'tbl_users', 469, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:32:52+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (734, 'JVDXO5B', 'tbl_users', 470, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:34:58+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (735, 'GC1K7WJ', 'tbl_users', 471, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:41:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (736, 'OQFTN12', 'tbl_users', 472, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:42:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (737, 'Q8880TJ', 'tbl_users', 473, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:43:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (738, 'EG6P0SC', 'tbl_users', 474, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:46:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (739, 'YVJY67M', 'tbl_users', 475, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:47:16+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (740, 'R5QT2ZQ', 'tbl_users', 476, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:47:44+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (741, 'T7GNRAP', 'tbl_users', 477, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:48:28+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (742, 'YXSWXJK', 'tbl_users', 478, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:54:43+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (743, 'K3P2CTD', 'tbl_users', 479, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:56:06+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (744, '3O54UH1', 'tbl_users', 480, 'all', NULL, NULL, 'create', 1, '2023-02-28 12:56:55+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (745, 'OUX62SO', 'tbl_users', 479, 'date_hired', 'NaN-NaN-NaN', '2006-2-28', 'update', 1, '2023-02-28 12:57:02+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (746, 'UFCEFG6', 'tbl_users', 478, 'date_hired', 'NaN-NaN-NaN', '2006-2-28', 'update', 1, '2023-02-28 12:57:13+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (747, 'LLNZ5SH', 'tbl_users', 481, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:01:48+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (748, 'EPGHI2F', 'tbl_users', 482, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:02:24+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (749, 'D6ERGR9', 'tbl_users', 483, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:03:35+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (750, 'D6Z8A1H', 'tbl_users', 484, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:04:31+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (751, 'NOEUC3B', 'tbl_users', 485, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:05:04+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (752, 'ROUEOBZ', 'tbl_users', 486, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:05:40+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (753, 'H6VQP0Q', 'tbl_users', 487, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:06:11+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (754, 'M5R943H', 'tbl_users', 488, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:06:45+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (755, '4P23L8X', 'tbl_users', 489, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:07:17+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (756, 'HP2URDW', 'tbl_users', 490, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:07:54+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (757, 'IX38Q0F', 'tbl_users', 491, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:08:26+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (758, '3UZEKLI', 'tbl_users', 492, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:09:00+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (759, '7GVL6NT', 'tbl_users', 493, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:09:37+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (760, 'BYTG88P', 'tbl_users', 494, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:10:12+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (761, 'HYV9NJE', 'tbl_users', 495, 'all', NULL, NULL, 'create', 1, '2023-02-28 13:10:46+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (762, '664X0FV', 'tbl_company', 4, 'status', '0', '1', 'update', 1, '2023-02-28 13:11:51+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (763, '0S2TJE5', 'tbl_assets', 28, 'all', NULL, NULL, 'create', 1, '2023-03-01 11:33:14+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (764, 'PWV5278', 'tbl_assign_asset', 11, 'all', NULL, NULL, 'create', 1, '2023-03-01 11:35:03+08');
INSERT INTO "public"."tbl_audit_trail" VALUES (765, '194L4W1', 'tbl_assign_asset', 28, 'is_released', NULL, NULL, 'issuance', 1, '2023-03-01 11:35:03+08');

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
INSERT INTO "public"."tbl_category" VALUES (2, 'CTGY-0000002', 'supplies', 'BREAKROOM', 'BR', 1, 1, NULL, NULL, NULL, '2023-02-14 10:55:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_category" VALUES (3, 'CTGY-0000003', 'assets', 'OFFICE FURNITURE', 'FURN', 1, 1, 1, NULL, NULL, '2023-02-14 10:55:31+08', '2023-02-14 11:21:28+08', NULL, NULL);
INSERT INTO "public"."tbl_category" VALUES (1, 'CTGY-0000001', 'supplies', 'OFFICE ESSENTIALS', 'ESTL', 1, 1, 1, NULL, NULL, '2023-02-14 10:54:54+08', '2023-02-14 11:21:48+08', NULL, NULL);
INSERT INTO "public"."tbl_category" VALUES (4, 'CTGY-0000004', 'assets', 'TECHNOLOGY', 'TECH', 1, 1, 1, NULL, NULL, '2023-02-14 10:55:41+08', '2023-02-14 13:30:05+08', NULL, NULL);

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
INSERT INTO "public"."tbl_company" VALUES (2, 'CMP-0000002', 1, 'S-POWER CORPORATION', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 11:37:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (1, 'CMP-0000001', 2, 'KC INDUSTRIAL CORPORATION', '#82 CORDILLERA ST. CORNER QUEZON AVE., QUEZON CITY', NULL, 1, 1, 1, NULL, NULL, '2023-01-27 11:36:08+08', '2023-02-07 11:11:16+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (5, 'CMP-0000005', 1, 'KENNETH LAND AND HOLDINGS INC.', NULL, NULL, 0, 1, 1, NULL, NULL, '2023-01-27 11:38:18+08', '2023-02-23 10:14:48+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (3, 'CMP-0000003', 1, 'SYSTEMS POWERMARK CORPORATION', NULL, NULL, 0, 1, 1, NULL, NULL, '2023-01-27 11:37:23+08', '2023-02-23 10:14:53+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (4, 'CMP-0000004', 1, 'KC ELECTRICAL INNOVATION, INC.', NULL, NULL, 1, 1, 1, NULL, NULL, '2023-01-27 11:38:03+08', '2023-02-28 13:11:51+08', NULL, NULL);

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
INSERT INTO "public"."tbl_department" VALUES (1, 'DPT-0000001', 1, 1, 'ACCOUNTING - AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (2, 'DPT-0000002', 1, 1, 'ACCOUNTING - FINANCE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (3, 'DPT-0000003', 1, 1, 'ADMIN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (4, 'DPT-0000004', 1, 1, 'EXECUTIVE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (5, 'DPT-0000005', 1, 1, 'HUMAN RESOURCE - PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (6, 'DPT-0000006', 1, 1, 'SALES - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:30:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (7, 'DPT-0000007', 1, 1, 'WAREHOUSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:30:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (8, 'DPT-0000008', 2, 1, 'ACCOUNTING - AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:58:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (9, 'DPT-0000009', 2, 1, 'ACCOUNTING - PAYABLES', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:04:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (10, 'DPT-0000010', 2, 1, 'ACCOUNTING - PRE AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:08:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (11, 'DPT-0000011', 2, 1, 'ACCOUNTING - PROJECT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:08:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (12, 'DPT-0000012', 2, 1, 'ACCOUNTING - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:09:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (13, 'DPT-0000013', 2, 1, 'ADMIN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:09:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (14, 'DPT-0000014', 2, 1, 'BUSWAY - DESIGN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (15, 'DPT-0000015', 2, 1, 'BUSWAY - IMPLEMENTATION', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (16, 'DPT-0000016', 2, 1, 'ENGINEERING - CAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (17, 'DPT-0000017', 2, 1, 'ENGINEERING - COSTING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (18, 'DPT-0000018', 2, 1, 'ENGINEERING - DESIGN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (19, 'DPT-0000019', 2, 1, 'ENGINEERING - PROGRAMMING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (20, 'DPT-0000020', 2, 1, 'HUMAN RESOURCE - PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (21, 'DPT-0000021', 2, 1, 'HUMAN RESOURCE - RECRUITMENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (22, 'DPT-0000022', 2, 1, 'IT/MIS', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (23, 'DPT-0000023', 2, 1, 'LOGISTICS', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (24, 'DPT-0000024', 2, 1, 'MANAGEMENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (25, 'DPT-0000025', 2, 1, 'MARKETING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (26, 'DPT-0000026', 2, 1, 'PRODUCTION - ASSEMBLY', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (27, 'DPT-0000027', 2, 1, 'PRODUCTION - BUSBARRING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (28, 'DPT-0000028', 2, 1, 'PRODUCTION - FABRICATION 1', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (29, 'DPT-0000029', 2, 1, 'PRODUCTION - FABRICATION 2', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (30, 'DPT-0000030', 2, 1, 'PRODUCTION - PAINTING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (31, 'DPT-0000031', 2, 1, 'PRODUCTION - QUALITY CONTROL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (32, 'DPT-0000032', 2, 1, 'PURCHASING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (33, 'DPT-0000033', 2, 1, 'QUALITY MANAGEMENT OFFICE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (34, 'DPT-0000034', 2, 1, 'SALES - CDD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (35, 'DPT-0000035', 2, 1, 'SALES - PSD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (36, 'DPT-0000036', 2, 1, 'SALES - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (37, 'DPT-0000037', 2, 1, 'TECHINCAL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (38, 'DPT-0000038', 2, 1, 'WAREHOUSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (39, 'DPT-0000039', 2, 1, 'ACCOUNTING - FINANCE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:15:09+08', NULL, NULL, NULL);

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
  "employment_status" varchar(20) COLLATE "pg_catalog"."default",
  "gender" varchar(10) COLLATE "pg_catalog"."default",
  "civil_status" varchar(20) COLLATE "pg_catalog"."default",
  "address" varchar(1000) COLLATE "pg_catalog"."default",
  "vacation_leave" varchar(5) COLLATE "pg_catalog"."default",
  "sick_leave" varchar(5) COLLATE "pg_catalog"."default",
  "birthdate" varchar(20) COLLATE "pg_catalog"."default",
  "date_hired" varchar(20) COLLATE "pg_catalog"."default",
  "date_resigned" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_employee
-- ----------------------------
INSERT INTO "public"."tbl_employee" VALUES (1, 1, '00000000', '0000000000', NULL, NULL, NULL, 'KC', NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_employee" VALUES (20, 20, '14100063', 'null', 2, 36, 127, 'AIVY', 'OLAYTA', 'RAMOS', 'manila', 'regular', 'female', 'married', '#60F. ACAB ST 10TH AVE CALOOCAN', '0', '0', '1992-4-29', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (21, 21, '18100105', 'null', 2, 36, 130, 'LYNLEE', 'LECAROS', 'MENOR', 'manila', 'regular', 'female', 'single', '18 ZAMBOANGA ST., BAI COMPOUND, VASRA, QUEZON CITY', '0', '0', '1997-10-6', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (11, 11, '98100014', 'null', 1, 2, 3, 'SOLEDAD', 'UY', 'TAN', 'quezon_ave', 'regular', 'female', 'single', '#12-B. LANDARGUN ST., QUEZON CITY', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (12, 12, '99100015', 'null', 1, 4, 6, 'CHERYL', 'UY', 'YOUNG', 'sto_domingo', 'regular', 'female', 'married', 'NO. 82 CORDILLERA ST. COR. QUEZON AVE. QUEZON CITY', '0', '0', '1976-2-4', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (9, 9, '97100013', NULL, 1, 1, 1, 'LITA', 'LIU', 'NG', 'manila', 'regular', 'female', 'married', '#1141 T. MAPUA ST. STA. CRUZ MANILA', '0', '0', '1958-4-28', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (8, 8, '91100010', NULL, 1, 5, 7, 'ROSE LILY', 'UY', 'TAN', 'quezon_ave', 'regular', 'female', 'married', '39-C MARIANO MARCOS COR.BARCELONA ST.BRGY.MAYTUNAS SAN JUAN', '0', '0', '1960-1-24', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (7, 7, '90100009', NULL, 1, 6, 148, 'MARLON', 'UY', 'NASAM', 'quezon_ave', 'regular', 'male', 'married', '1519 THE AMARYLLIS RESIDENCE 12TH ST.', '0', '0', '1968-5-26', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (6, 6, '86100006', NULL, 1, 3, 4, 'MARIA CRISTINA', 'VOLANTE', 'EUGENIO', 'quezon_ave', 'regular', 'female', 'married', '67 FLORENTINO SUITE, COR BANAWE, QUEZON CITY', '0', '0', '1960-10-30', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (5, 5, '78100004', NULL, 1, 7, 9, 'BELIALITA', 'WE', 'WONG', 'manila', 'regular', 'female', 'married', '1141 T.MAPUA ST., STA. CRUZ, MANILA', '0', '0', '1951-8-9', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (4, 4, '77100003', NULL, 1, 7, 8, 'PATERSON', 'LUZON', 'NAVARRO', 'cavite', 'regular', 'male', 'married', '#1872 ANTIPOLO ST., STA. CRUZ, MANILA', '0', '0', '1957-5-8', '2023-1-31', NULL);
INSERT INTO "public"."tbl_employee" VALUES (3, 3, '77100002', NULL, 1, 4, 6, 'CONSTANCIA', 'FRANCISCO', 'UY', 'sto_domingo', 'regular', 'female', 'married', 'NO. 82 CORDILLERA ST. COR. QUEZON AVE. QUEZON CITY
', '0', '0', '1950-1-28', '2023-1-31', NULL);
INSERT INTO "public"."tbl_employee" VALUES (2, 2, '77100001', NULL, 1, 4, 5, 'AGUSTIN', 'TAN', 'UY', 'sto_domingo', 'regular', 'male', 'married', 'NO. 82 CORDILLERA ST. COR. QUEZON AVE. QUEZON CITY', '0', '0', '1949-12-11', '2023-1-31', NULL);
INSERT INTO "public"."tbl_employee" VALUES (10, 10, '83100005', NULL, 1, 6, 148, 'RODOLFO', 'LIM', 'BELLEZA', 'quezon_ave', 'regular', 'male', 'married', '54-D 8TH STREET BRGY MARIANA NEW MANILA QUEZON CITY', '0', '0', '1961-5-14', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (28, 28, '21400335', 'null', 2, 8, 12, 'PIOLO', 'VILLAROSA', 'VILLAGRACIA', 'cavite', 'intern', 'male', 'single', NULL, '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (19, 19, '14100061', 'null', 2, 36, 129, 'JONATHAN', 'CHUA', 'BRAGANZA', 'manila', 'regular', 'male', 'married', 'NO. 34 DREXEL STREET, UE TECH SUBDIVISION, BARANGAY 80, CALOOCAN CITY', '0', '0', '1972-8-3', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (13, 13, '3100019', 'null', 2, 8, 11, 'JULIE', 'BUENAOBRA', 'PALMA', 'manila', 'regular', 'female', 'single', 'BLOCK 7 LOT 12 CAMELLA PROVENCE PHASE 6', '0', '0', '1982-2-15', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (14, 14, '11100040', 'null', 2, 8, 12, 'MILLICENT', 'ANG', 'LIU', 'manila', 'regular', 'female', 'single', '1715 TECSON STREET STA. CRUZ, MANILA', '0', '0', '1988-6-14', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (15, 15, '13100048', 'null', 2, 8, 12, 'CZARINA ROSE', 'CARAOS', 'DESTURA', 'quezon_ave', 'regular', 'female', 'single', 'LOT 24 BLOCK 4, EMERALD ST., OCTAGON PHASE 3 SUBDIVISION, BRGY. DELA PAZ, PASIG CITY', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (16, 16, '19100156', 'null', 2, 8, 10, 'MARIA CONCEPCION', 'DIAZ', 'CARREON', 'sto_domingo', 'regular', 'female', 'married', '160-J SIOSON ST. BANGKULASI NAVOTAS CITY', '0', '0', '1991-12-8', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (17, 17, '21100332', 'null', 2, 8, 12, 'FHEIL ANGELIE', 'SUELLO', 'BETINOL', 'cavite', 'regular', 'female', 'single', 'BLK3 LOT20 CARISSA4C PALMERA HOMES BRGY KAYPIAN CITY OF SAN JOSE DEL MONTE BULACAN', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (18, 18, '7100031', 'null', 2, 36, 130, 'CHRISTINE', 'LIM', 'REYES', 'manila', 'regular', 'female', 'married', 'GRASS RESIDENCES TOWER2 3445 NUEVA VISCAYA ST. BRGY STO CRISTO BAGO BANTAY QUEZON CITY', '0', '0', '1971-12-14', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (22, 22, '87100008', NULL, 2, 38, 139, 'ENRIQUE', 'BAGAUA', 'BANGAYAN', 'manila', 'regular', 'male', 'married', '#4 MARIA CLARA ST. 2ND AVENUE BRGY. 120 CALOOCAN CITY', '0', '0', '1966-7-3', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (23, 23, '6100029', NULL, 2, 38, 145, 'CRISANTO', 'PADILLA', 'TAN', 'manila', 'regular', 'male', 'single', '39 UNIT C MARIANO MARCOS CORNER BARCELONA ST.SAN JUAN', '0', '0', '1958-11-1', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (24, 24, '8100033', NULL, 2, 38, 140, 'RICARDO', 'TURA', 'CUSTODIO', 'manila', 'regular', 'male', 'single', '3294 AREA 2 BLOCK 4 DAGAT-DAGATAN MAYPAJO CALOOCAN CITY', '0', '0', '1979-8-26', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (25, 25, '13100047', NULL, 2, 38, 139, 'ALBERTO', 'PAGATPAT', 'ECLEO', 'manila', 'regular', 'male', 'married', '273 CAMIA ST. BRGY 162 STA QUITERIA CALOOCAN CITY', '0', '0', '1978-11-4', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (26, 26, '13100049', NULL, 2, 38, 140, 'ROWEL', 'ILARYON', 'GAGARIN', 'manila', 'regular', 'male', 'single', '292 ARANETA CORNER SQT. RIVERA BRGY MONRESA QUEZON CITY', '0', '0', '1989-8-1', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (27, 27, '16100087', NULL, 2, 38, 140, 'JOEL', 'AZUELO', 'LASACA', 'manila', 'regular', 'male', 'single', 'BRGY. 12 BLK 38E LOT 3 PAHSE 3 F1 DAGAT DAGATAN CALOOCAN CITY', '0', '0', '1990-8-11', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (31, 31, '9638499731', NULL, 2, 8, 12, 'JESSEL', 'MIRRALES', 'ECLEO', 'cavite', 'agency', 'female', 'single', NULL, '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (30, 30, '21400337', NULL, 2, 8, 12, 'CHRISTOPHER', 'CABRERA', 'DEGRACIA', 'cavite', 'intern', 'male', 'single', NULL, '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (29, 29, '21400336', NULL, 2, 8, 12, 'MARK LAURENCE', 'TANGCOMOAN', 'SALOSA', 'cavite', 'intern', 'male', 'single', NULL, '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (32, 32, '22100376', NULL, 2, 8, 12, 'LEMON', 'JORDAN', 'TALADRO', 'cavite', 'regular', 'male', 'single', 'BLK4 LOT 10 MARYLAND ST. SOUTH2 SAN MARINO CITY SALAWAG DASMARINAS CAVITE', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (33, 33, '22400438', NULL, 2, 8, 12, 'JARENCE', 'CAL', 'MARTILLANO', 'cavite', 'intern', 'male', 'single', 'ADLAS, SILANG CAVITY', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (34, 34, '22400485', NULL, 2, 8, 12, 'MARVIN KARL', 'BARCELONA', 'TUMAMPIL', 'cavite', 'intern', 'male', 'single', 'PASONG LANGKA SILANG CAVITE', '0', '0', '2004-9-3', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (35, 35, '22400486', NULL, 2, 8, 12, 'KYRGYZ', 'MARASIGAN', 'PAYAD', 'cavite', 'intern', 'male', 'single', 'PASONG LANGKA SILANG CAVITE', '0', '0', '2004-6-29', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (36, 36, '22400487', NULL, 2, 8, 12, 'RICHARD', 'MARTILLANA', 'ORANDE', 'cavite', 'intern', 'male', 'single', 'PASONGLANGKA SILANG CAVITE', '0', '0', '2004-9-6', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (37, 37, '19100129', NULL, 2, 10, 17, 'MARIYA DENNISE', 'MENDOZA', 'CONCEPCION', 'cavite', 'regular', 'female', 'single', 'PHASE 10B PACKAGE 5 BLOCK 55 LOT 4', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (38, 38, '4100020', NULL, 2, 11, 27, 'MARICEL', 'ESCALANTE', 'MARTINEZ', 'cavite', 'regular', 'female', 'single', 'NO.37 BLOCK 11 LOT 13, TIERRA VERDE RESIDENCES MT.APO ST., BUROL III DASMARINAS CAVITE', '0', '0', '1976-11-9', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (39, 39, '20100203', NULL, 2, 11, 20, 'MARY GRACE', 'CALAMIONG', 'SANTOS', 'cavite', 'regular', 'female', 'married', 'B5 L9 APARTMENT C ORANGE DRIVE GOODWILL 2 BARANGAY BF SUCAT PARANAQUE CITY', '0', '0', '1975-10-18', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (40, 40, '20100204', NULL, 2, 11, 27, 'LESLIE', 'MENDOZA', 'DELOS SANTOS', 'cavite', 'regular', 'female', 'single', '#170 BRGY. MAGUYAM SILANG CAVITE', '0', '0', '1996-5-29', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (41, 41, '20100208', NULL, 2, 11, 26, 'DARREN', 'PARDINES', 'MANJARES', 'cavite', 'regular', 'male', 'single', 'BLK 5 LOT 1, 3-2-7 STERLING TECHNOPARK, BRGY. LANTIC, CARMONA CAVITE', '0', '0', '1997-3-29', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (42, 42, '21100281', NULL, 2, 11, 26, 'CHELSIE', 'SAYAT', 'GABRIOLA', 'cavite', 'regular', 'female', 'single', '039 DANDAN ST. POBLACION SAN JUAN BATANGAS', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (43, 43, '21100285', NULL, 2, 11, 27, 'MARICAR', 'PARDUCHO', 'DELOS SANTOS', 'cavite', 'regular', 'female', 'single', '210 SITIO GITNA MAGUYAM, SILANG, CAVITE', '0', '0', '1996-10-16', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (44, 44, '21100303', NULL, 2, 11, 26, 'KATHLEEN ELOISE', 'MARCOJOS', 'MERCADO', 'cavite', 'regular', 'female', 'single', 'BLOCK 3 LOT 14 SPRING BEE ST., MAGNAGON SUBDIVISION BARANGAY MAGUYAM SILANG CAVITE', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (45, 45, '21100308', NULL, 2, 11, 26, 'JOAN', 'DAGUNO', 'HILARIO', 'cavite', 'regular', 'female', 'single', 'BLK 18 LOT 12 PHASE 5 MABUHAY HOMES 2000, SALAWAG DASMARINAS CAVITE', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (46, 46, '21100309', NULL, 2, 11, 27, 'IVAN JAMES', 'FABILANE', 'MUNOZ', 'cavite', 'regular', 'male', 'single', 'BLK 3 LOT 12 MAGNAGON, MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (47, 47, '8100034', NULL, 2, 13, 35, 'NOEL', 'OSAL', 'CABAGTONG', 'cavite', 'regular', 'male', 'single', 'BLK 7, LOT8, R5 BRGY. LANKAAN, DASMARINAS, CAVITE', '0', '0', '1964-6-18', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (48, 48, '13100050', NULL, 2, 13, 32, 'FELIZARDO', 'BALON', 'YAGO', 'cavite', 'regular', 'male', 'single', 'LOT 1 BLK 1 PH 3 STERLING TECHNOPARK BRGY. LANTIC CARMONA CAVITE', '0', '0', '2023-2-2', '2023-2-2', NULL);
INSERT INTO "public"."tbl_employee" VALUES (49, 49, '14100062', NULL, 2, 13, 32, 'RAMIL', 'ALDAY', 'MAGYAYA', 'cavite', 'regular', 'male', 'married', 'LOT1BLK1PH3 STERLING TECHNOPARK BRGY LANTIC CARMONA CAVITE', '0', '0', '1989-12-23', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (50, 50, '20100206', NULL, 2, 13, 30, 'ALEXCYS MAE', 'ROSEL', 'CELIS', 'quezon_ave', 'regular', 'female', 'single', '#263 SITIO GITNA BRGY. MAGUYAM SILANG CAVITE', '0', '0', '1997-6-7', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (51, 51, '20100209', NULL, 2, 13, 32, 'ODELON GRIFFIN', 'BUHAY', 'MALLARI', 'cavite', 'regular', 'male', 'married', 'LOT 1 BLOCK 1 PHASE 3 STERLING TECHNO PARK BRGY LANTIC CARMONA CAVITE', '0', '0', '1981-12-12', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (52, 52, '21600248', NULL, 2, 13, 36, 'MARICAR', 'AMBITO', 'HAMOR', 'cavite', 'agency', 'female', 'single', 'B-46 L-18 PHASE 1, ZONE 6 MABUHAY HOMES 2000, PALIPARAN II DASMARIÑAS CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (53, 53, '21600249', NULL, 2, 13, 36, 'JOSEPHINE', 'ESTRADA', 'LOPEZ', 'cavite', 'agency', 'female', 'single', 'PHASE 4B, B-71, L-18, BULIHAN SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (54, 54, '21600254', NULL, 2, 13, 36, 'ESPERANZA', 'SAN ANTONIO', 'GONZALES', 'cavite', 'agency', 'female', 'single', 'BLK 55 LOT 5 ACACIA B, SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (55, 55, '21600269', NULL, 2, 13, 36, 'RINA', 'PRESENTACION', 'ARZOLA', 'cavite', 'agency', 'female', 'single', 'BLK 54 LOT 20 PHASE 1-B BULIHAN SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (56, 56, '21600292', NULL, 2, 13, 36, 'ANALYN', 'RAMOS', 'GARCIA', 'cavite', 'agency', 'female', 'single', 'BLK 39 LOT 9 CONG. ROAD ANAHAW II, SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (57, 57, '21600298', NULL, 2, 13, 36, 'ARLENE', 'ZARAGOSA', 'PONSICA', 'cavite', 'agency', 'female', 'single', 'BLK. 26 LOT 5 NEAR UNIDA IPIL II, SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (58, 58, '21600325', NULL, 2, 13, 36, 'SHIELA', 'ORNACHO', 'FRANCSICO', 'cavite', 'agency', 'female', 'single', 'BLK 05 LOT 01 BRGY. ANAHAW SILANG, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (59, 59, '21600326', NULL, 2, 13, 36, 'CHARLIE', 'ARCILLA', 'MARQUEZ', 'cavite', 'agency', 'male', 'single', 'BLK 14 LOT3 CLEMENCIA VILL BAGONG SILANGAN QUEZON CITY', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (60, 60, '21100340', NULL, 2, 13, 33, 'LILET', 'ILAO', 'MAGYAYA', 'cavite', 'regular', 'female', 'married', 'LOT1 BLK1 PH3 BRGY LANTIC STERLING TECHNO PARK CARMONA CAVITE', '0', '0', '1989-9-8', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (61, 61, '21600360', NULL, 2, 13, 34, 'JEROMEL', 'RODIL', 'CHEW', 'cavite', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (62, 62, '21600361', NULL, 2, 13, 36, 'JOSEPHINE', 'GUMAHIN', 'MERCADO', 'quezon_ave', 'agency', 'female', 'single', NULL, '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (63, 63, '22100402', NULL, 2, 13, 31, 'ANTONIO', 'CO', 'FRANCISCO', 'sto_domingo', 'regular', 'male', 'single', 'LOT1,3-7 BLOCK 5 STERLING TECHNOPARK BRGY LANTIC CARMONA CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (65, 65, '22100482', NULL, 2, 13, 35, 'PAULO', 'RODRIGO', 'BERNARDO', 'cavite', 'regular', 'male', 'single', '545 SAN AGUSTIN ST TUKTUKAN GUIGUINTO BULACAN', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (64, 64, '22100430', NULL, 2, 13, 35, 'ARVIN JOSEPH', 'PANOPIO', 'TEMPORAL', 'cavite', 'regular', 'male', 'single', '6 ADMIRABLE LANE EXTENSION DONA FAUSTINA 2, SUBDIVISION BARANGAY CULIAT TANDANG SORA QC', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (66, 66, '22600483', NULL, 2, 13, 36, 'JENNIFER', 'GUMAHIN', 'TIONGSON', 'cavite', 'agency', 'female', 'single', 'BLOCK 16 #1018 BRGY. PULIDO EXTENSION GMA CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (67, 67, '22600484', NULL, 2, 13, 36, 'JOCELYN', 'TIJONES', 'ORPILLA', 'cavite', 'agency', 'female', 'single', 'BLOCK 36 LOT 13 PHASE 1B BRGY. ACACIA BULIHAN SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (68, 68, '22100494', NULL, 2, 13, 35, 'CHRISTIAN', 'OCAMPO', 'PASTELERO', 'cavite', 'regular', 'male', 'single', '44 RIZAL, PILAR, BATAAN', '0', '0', '1998-8-16', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (69, 69, '22100472', NULL, 2, 15, 41, 'HAROLD DANIEL', 'COLCOL', 'BULLON', 'cavite', 'regular', 'male', 'single', 'BLK 11, LT. 26, KAIMITO ST., PH. 1 WEST, CAMELLA SPRINGVILLE, MOLINO 3, BACOOR CITY, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (70, 70, '15100067', NULL, 2, 16, 42, 'MYRA', 'ANINGAT', 'DOMINE', 'cavite', 'regular', 'female', 'married', 'BLK 5 LOT 1,3-7 PHASE 2 STERLING TECHNO PARK LANTIC CARMONA CAVITE', '0', '0', '1994-1-19', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (71, 71, '20100166', NULL, 2, 16, 43, 'MANUEL', 'SAGUN', 'RAMOS', 'cavite', 'regular', 'male', 'married', 'BLK 6 LOT 9 DON ONOFRE VILL, BGY. BANAY - BANAY, CABUYAO CITY, LAGUNA', '0', '0', '1997-6-21', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (72, 72, '20100167', NULL, 2, 16, 44, 'ANTHONY TONTON', 'SAULO', 'FERRY', 'cavite', 'regular', 'male', 'single', '9328 SUMADSAD COMPOUND IBAYONG ILAT BRGY. KAONG SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (73, 73, '20100168', NULL, 2, 16, 42, 'MARY JEAN', 'MALLON', 'MIRABETE', 'cavite', 'regular', 'female', 'single', 'LT. 1 BLK. 5 PHASE II STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '1997-6-21', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (74, 74, '20100219', NULL, 2, 16, 42, 'CRISTELLE LYN', 'TORREJOS', 'MOFAN', 'cavite', 'regular', 'female', 'single', 'BLK. 5 LOT 1 PHASE 2 STERLING TECHNOPARK BRGY. LANTIC CARMONA CAVITE', '0', '0', '1995-2-14', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (75, 75, '21400262', NULL, 2, 16, 42, 'HARVEY', 'VILLANUEVA', 'SAMONTIZA', 'cavite', 'intern', 'male', 'single', 'SITIO IBABA VILLAGANAS COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (76, 76, '21400263', NULL, 2, 16, 42, 'JUNE CARLO', 'LAGURA', 'TOLENTINO', 'cavite', 'intern', 'male', 'single', 'SITIO IBABA VILLAGANAS COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (77, 77, '21100273', NULL, 2, 16, 42, 'JEFFREY', 'PARDINES', 'DE LOS SANTOS', 'cavite', 'regular', 'male', 'single', 'BLK 57 LOT 1 ZONE 5 BULIHAN SILANG CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (78, 78, '21100341', NULL, 2, 16, 42, 'ALDRIN', 'DIONELA', 'CAPARIDA', 'cavite', 'regular', 'male', 'single', '#310 BAYABAS ST. B-7 L-35 BRGY. POBLACION 2 GMA, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (79, 79, '21100352', NULL, 2, 16, 42, 'JOHNNY', 'NARRIDO', 'TABUCANON', 'cavite', 'regular', 'male', 'single', '4TH ESTATE SAN ANTONIO PARAÑAQUE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (80, 80, '22100414', NULL, 2, 16, 42, 'ANTHONY', 'ESPAÑOL', 'ABELIDA', 'cavite', 'regular', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '1997-7-26', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (81, 81, '22100428', NULL, 2, 16, 42, 'LALAIN', 'BALURAN', 'LACOSTALES', 'cavite', 'regular', 'male', 'single', 'BLK 41 LOT 13 BRGY. ANAHAW 2 SILANG CAVITE', '0', '0', '1998-12-31', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (82, 82, '13100046', NULL, 2, 17, 47, 'PAUL JOSEPH', 'RAFANAN', 'LLANES', 'cavite', 'regular', 'male', 'married', '501 JM LOYOLA ST., BARANGAY 5, CARMONA, CAVITE', '0', '0', '1991-7-19', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (83, 83, '20100172', NULL, 2, 17, 47, 'STARSKIE EDGAR', 'SERENO', 'SAYSON', 'cavite', 'regular', 'male', 'single', 'LOMIBAO COMPOUND HOUSE NO. 1 SITIO IBABA, MAGUYAM SILANG CAVITE', '0', '0', '1989-11-9', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (84, 84, '20100173', NULL, 2, 17, 46, 'RHOMAR', 'IBAY', 'DOCTOLERO', 'cavite', 'regular', 'male', 'single', 'BLOCK 5, LOT 1, 3-7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (85, 85, '21100245', NULL, 2, 17, 45, 'BRYAN', NULL, 'REODICA', 'cavite', 'regular', 'male', 'single', '#4 K- 7TH STREET, KAMUNING, QUEZON CITY', '0', '0', '1997-12-17', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (86, 86, '13100051', NULL, 2, 18, 52, 'WILFREDERICK', 'LABATETE', 'PEDERNAL', 'cavite', 'regular', 'male', 'married', 'BLK 24 LOT 9 PH 2-A ALTA TIERRA HOMES, BRGY. ALDIANO OLAES, GMA, CAVITE', '0', '0', '1991-6-10', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (87, 87, '15100078', NULL, 2, 18, 50, 'AIKO', 'JAKOSALEM', 'BUENAFLOR', 'cavite', 'regular', 'male', 'single', '17 BAYACAL ST., BRGY. SABUTAN, SILANG, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (88, 88, '19100114', NULL, 2, 18, 50, 'JAMAICA GAY', 'JIMENEZ', 'AGCAOILI', 'cavite', 'regular', 'female', 'single', 'BLOCK 5, LOT 1,3-7 PHASE 2, STERLING TECHNOPARK, BARANGAY LANTIK, CARMONA, CAVITE', '0', '0', '1997-1-27', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (89, 89, '20100169', NULL, 2, 18, 52, 'KEVIN ADRIAN', 'MEDINA', 'ZORILLA', 'cavite', 'regular', 'male', 'married', 'LOT 3 BLK 11 PANORAMA VILLE, STA. ROSA, LAGUNA', '0', '0', '1989-7-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (90, 90, '20100170', NULL, 2, 18, 50, 'EYMARD', 'SULIBET', 'BUENO', 'cavite', 'regular', 'male', 'married', 'L1,B5, PH2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA CAVITE', '0', '0', '1991-2-13', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (91, 91, '20100171', NULL, 2, 18, 51, 'SIR-ARLOHN', 'ALAPAD', 'TIJAM', 'cavite', 'regular', 'male', 'single', 'BLOCK 5, LOT 1,3,7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '1996-9-11', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (92, 92, '20100213', NULL, 2, 18, 49, 'ARJAY', 'DE LA CRUZ', 'EVANGELISTA', 'cavite', 'regular', 'male', 'single', 'BLOCK 5, LOT 1,3,7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '1996-9-30', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (93, 93, '22100496', NULL, 2, 18, 51, 'ALBRETCH', 'PARROTINA', 'SUMALDE', 'cavite', 'regular', 'male', 'single', '6 JORDAN ST. SAN AGUSTIN, QUEZON CITY', '0', '0', '1999-1-5', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (94, 94, '22100504', NULL, 2, 18, 51, 'BENJIE', 'ROMERO', 'ROMANO', 'cavite', 'regular', 'male', 'single', '17 D STO. NIÑO ST. PAYATAS A QUEZON CITY', '0', '0', '1997-12-22', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (95, 95, '20100160', NULL, 2, 19, 53, 'JUNE LEE', 'MANARIN', 'VIBARES', 'cavite', 'regular', 'male', 'married', '14153 BANCAL CARMONA CAVITE', '0', '0', '1992-5-24', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (96, 96, '20100175', NULL, 2, 19, 53, 'MARIA YANINA LOIS', 'EUBRA', 'DIYCO', 'cavite', 'regular', 'female', 'single', 'BLOCK 5, LOT 1, 3-7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '1992-6-8', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (97, 97, '20100218', NULL, 2, 19, 53, 'AILEEN', 'PRUDENCIADO', 'OCCIDENTAL', 'cavite', 'regular', 'female', 'single', 'BLK. 5 LOT 1 PHASE 2 STERLING TECHNOPARK BRGY. LANTIC CARMONA CAVITE', '0', '0', '1995-9-25', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (99, 99, '21100355', NULL, 2, 19, 53, 'JUDY ANN', 'BALDO', 'DOLORES', 'cavite', 'regular', 'female', 'single', 'ZONE 3 BEBERON SAN FERNANDO CAMARINES SUR', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (100, 100, '21100338', NULL, 2, 20, 54, 'ANNIE IVIE', 'VILLANUEVA', 'OCAMPO', 'cavite', 'regular', 'female', 'single', '14252 BANCAL CARMONA CAVITE', '0', '0', '1996-11-2', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (101, 101, '20100211', NULL, 2, 21, 59, 'KIMBERLY', 'AMON', 'ALCEDO', 'cavite', 'regular', 'female', 'single', 'SITIO MANGGAHAN PALIGAWAN BRGY. LANTIC CARMONA CAVITE', '0', '0', '1998-7-18', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (102, 102, '20100244', NULL, 2, 21, 57, 'RAQUEL', 'CATAMORA', 'ALOB', 'cavite', 'regular', 'female', 'single', '1832 ISABELA ST. BARANGAY GAVINO MADERAN GEN. MARIANO ALVAREZ, CAVITE', '0', '0', '1984-10-11', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (116, 116, '5100024', NULL, 2, 26, 82, 'JOSE', 'MARCAIDA', 'PALES', 'cavite', 'regular', 'male', 'single', '14344 GOV. DRIVE BANKAL CARMONA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (103, 103, '20100174', NULL, 2, 22, 63, 'DARLENE', 'PLOMENTERA', 'FLORES', 'cavite', 'regular', 'female', 'single', 'BLK. 16A LOT 31 MT. APO ST. TERRA ALTA, PALIPARAN 1, DASMARIÑAS CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (104, 104, '20100212', NULL, 2, 22, 63, 'MABEL', 'CASIL', 'RABIA', 'cavite', 'regular', 'female', 'single', '23 ROTC HUNTERS ST. PINATAG AREA BRGY TATALON QUEZON CITY', '0', '0', '1994-4-10', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (105, 105, '21100329', NULL, 2, 22, 64, 'DEMI JANE', 'NAINGUE', 'ACOSTA', 'cavite', 'regular', 'female', 'single', '452 SILVER ROAD BRGY. MALIA GMA, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (106, 106, '22100480', NULL, 2, 22, 63, 'MARK CHRISTOPHER', 'GARCIA', 'RIVERA', 'cavite', 'regular', 'male', 'single', '2289 RADIUM ST. SAN ANDREA BUKID MANILA', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (107, 107, '22100492', NULL, 2, 22, 63, 'JAZZEL', 'ISAGA', 'ANARETA', 'cavite', 'regular', 'male', 'single', 'B1 L2 CURSILLISTA ST. BRGY STA LUCIA NOVALICHES QUEZON CITY', '0', '0', '1998-9-16', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (108, 108, '22100493', NULL, 2, 22, 64, 'EDWARDO', 'CARTAJENA', 'VILLANUEVA', 'cavite', 'regular', 'male', 'single', '318 GLORIA ST MAYPAJO CALOOCAN', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (109, 109, '22100499', NULL, 2, 23, 66, 'MARK JUN', 'MALIMATA', 'MAKIPLANTA', 'cavite', 'regular', 'male', 'single', 'BRGY. STO. NIÑO 2, DASMARIÑAS CITY CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (110, 110, '5100023', NULL, 2, 24, 69, 'ISRAEL', 'DE LEON', 'PANGILINAN', 'cavite', 'regular', 'male', 'single', 'BLK 7 LOT 12 PHASE 1 SAN LORENZO SOUTH SUBDIVISION, BALIBAGO, STA. ROSA CITY, LAGUNA', '0', '0', '1966-3-25', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (111, 111, '7100032', NULL, 2, 24, 70, 'JUN JUN', 'BUCAD', 'SALACUP', 'cavite', 'regular', 'male', 'single', 'BLK14A L7 HAN ST. RIVERVIEW SUBD. S. DELAS ALAS GMA CAVITE', '0', '0', '1982-12-13', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (112, 112, '20100164', NULL, 2, 24, 69, 'EDMUN', 'CHAN', 'WINGKUN', 'cavite', 'regular', 'male', 'married', 'AVIDA SETTNGS NUVALI B-27 L-2 PHASE 4, CALAMBA CITY, CALAMBA', '0', '0', '1965-9-28', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (113, 113, '20100165', NULL, 2, 24, 70, 'JONNEL', 'RIEL', 'EBAYAN', 'cavite', 'regular', 'male', 'single', 'BLK 6 LOT 12 PHASE 2 RCD ROYAL HOMES, BRGY. KALUBKOB, SILANG, CAVITE', '0', '0', '1983-8-5', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (114, 114, '21100291', NULL, 2, 24, 71, 'FRANCIS NEIL', 'ANDRES', 'SARGENTO', 'cavite', 'regular', 'male', 'married', 'BLK 6 LOT 5 CHEVROLET ST., MONTE CARLO TOWNHOMES, BRGY BANCAL CARMONA CAVITE.', '0', '0', '1985-9-18', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (115, 115, '3100017', NULL, 2, 26, 78, 'JOHNNY', 'FUGOSO', 'PETATE', 'cavite', 'regular', 'male', 'single', 'BLK 82 LOT 47B PHASE 3 LANGKAAN, DASMARIÑAS, CAVITE', '0', '0', '2023-2-3', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (117, 117, '18100107', NULL, 2, 26, 82, 'NUMERIANO', 'CABALIDA', 'SARONA', 'cavite', 'regular', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (118, 118, '18100108', NULL, 2, 26, 74, 'RODEL', 'DELA CRUZ', 'CANDELARIA', 'cavite', 'regular', 'male', 'single', 'ZONE 4 #085 LIBOD 2 LIBMANAN CAMARINES SUR 4407', '0', '0', '1993-7-15', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (119, 119, '19100120', NULL, 2, 26, 81, 'ALLYSON DARLENE', 'PARDUCHO', 'AMOROSO', 'cavite', 'regular', 'male', 'single', '218 BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (120, 120, '19400121', NULL, 2, 26, 74, 'JOHN CARLO', 'CORO', 'MONDIGO', 'cavite', 'intern', 'male', 'single', '143 SITIO POSO BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (121, 121, '19100124', NULL, 2, 26, 82, 'MARVIN', 'PAGLINAWAN', 'ARZAGA', 'cavite', 'regular', 'male', 'married', '48. PUROK 4 MUNTING ILOG SILANG CAVITE', '0', '0', '1990-3-17', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (122, 122, '20100158', NULL, 2, 26, 82, 'KENNETH', 'MAPALAD', 'TENIDO', 'cavite', 'regular', 'male', 'single', '247 SITIO GITNA BARANGAY MAGUYAM SILANG CAVITE', '0', '0', '1998-11-6', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (123, 123, '20100159', NULL, 2, 26, 74, 'WARREN', 'BALUTE', 'PEREZ', 'cavite', 'regular', 'male', 'single', '9709 UNIT 4 MAGUYAM ROAD RD MAGUYAM SILANG CAVITE', '0', '0', '1997-5-15', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (124, 124, '20100161', NULL, 2, 26, 77, 'ALGIN PATRICK', NULL, 'ADRA', 'cavite', 'regular', 'male', 'single', 'BLK. 5 LOT 1 PHASE 2 STERLING TECHNOPARK BRGY. LANTIC CARMONA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (125, 125, '20100162', NULL, 2, 26, 74, 'JIMBOY', 'TUBIANO', 'TUBIANO', 'cavite', 'regular', 'male', 'single', 'BANCAL.CARMONA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (126, 126, '20100176', NULL, 2, 26, 81, 'BEEJAY', 'REYES', 'JAYPE', 'cavite', 'regular', 'male', 'married', '9643 APARTMENT 5, ANARNA COMPOUND, MAGUYAM, SILANG, CAVITE', '0', '0', '1992-7-15', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (127, 127, '20100183', NULL, 2, 26, 74, 'MARIANO', 'DELA CRUZ', 'MANGALDAN', 'cavite', 'regular', 'male', 'single', 'PHASE 2-B BLK 32 L-10 BULIHAN, SILANG, CAVITE', '0', '0', '1985-5-28', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (128, 128, '20100184', NULL, 2, 26, 74, 'LEONCIO', 'BOCO', 'LANANTE', 'cavite', 'regular', 'male', 'single', 'BLOCK 10 LOT 75 BRGY RAMON CRUZ', '0', '0', '1991-7-28', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (129, 129, '20100186', NULL, 2, 26, 74, 'ERWIN', 'ALMONTE', 'CASAUL', 'cavite', 'regular', 'male', 'single', '145 SITIO POSO BARANGAY MAGUYAM SILANG CAVITE', '0', '0', '1993-7-24', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (130, 130, '20100188', NULL, 2, 26, 76, 'ROBELL', 'SANTOS', 'AMORANTO', 'cavite', 'regular', 'male', 'single', 'BLOCK 5, LOT 1, 3-7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '1993-9-29', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (131, 131, '20100189', NULL, 2, 26, 76, 'PAULINE GRACE', 'LEVARDO', 'LATOJA', 'cavite', 'regular', 'female', 'single', 'LOT 1, 3-7, BLOCK 5, PHASE 2, STERLING TECHNOPARK, CARMONA, CAVITE', '0', '0', '1995-10-12', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (132, 132, '20100190', NULL, 2, 26, 75, 'MARIEL', 'CARDINAL', 'GAGARIN', 'cavite', 'regular', 'female', 'single', 'BLOCK 5, LOT 1, 3-7, PHASE 2, STERLING TECHNOPARK, LANTIC, CARMONA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (133, 133, '20100194', NULL, 2, 26, 81, 'JIMUEL', 'ROSALES', 'ASUGUI', 'cavite', 'regular', 'male', 'single', 'LOT 1, BLOCK 5, PHASE 2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (134, 134, '20100195', NULL, 2, 26, 80, 'MARIA LHARA', 'ALBALATE', 'SABALLEGUE', 'cavite', 'regular', 'female', 'single', 'LOT 1, BLOCK 5, PHASE 2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '1997-12-14', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (135, 135, '20100196', NULL, 2, 26, 82, 'LEO', 'NARBAY', 'BEROY', 'cavite', 'regular', 'male', 'single', 'BLK 45, LOT 11 BARANGAY PASONG KAWAYAN LL CAVITE CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (136, 136, '20100197', NULL, 2, 26, 82, 'RICARDO', 'MARIÑAS', 'PEREZ', 'cavite', 'regular', 'male', 'married', 'SITIO IBABA MAGUYAM SILANG CAVITE', '0', '0', '1963-11-7', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (137, 137, '20100210', NULL, 2, 26, 81, 'RONNIE', 'MANUEL', 'POBLETE', 'cavite', 'regular', 'male', 'single', 'BAYHON ST BALITE I SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (138, 138, '20600222', NULL, 2, 26, 74, 'GIL', 'MARTINEZ', 'CARLOSAN', 'cavite', 'agency', 'male', 'single', '530 SITIO IBABA, MAGUYAM, SILANG, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (139, 139, '20600225', NULL, 2, 26, 82, 'NORBERTO', 'CANANI', 'TELEBRICO', 'cavite', 'agency', 'male', 'single', '432 REYES COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (140, 140, '20600226', NULL, 2, 26, 74, 'EUGENE', 'PAGSISIHAN', 'BARROZO', 'cavite', 'agency', 'male', 'single', 'B22 L15 GAVINO MADERAN, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (141, 141, '20600227', NULL, 2, 26, 74, 'EDRIAN', 'AZORES', 'CANABE', 'cavite', 'agency', 'male', 'single', '278 B40 L1 AREA D, MANGANESE ST., EPIFANIO MALIA, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (142, 142, '20600230', NULL, 2, 26, 74, 'ALBERTH', 'TURIANO', 'MOTA', 'cavite', 'agency', 'male', 'single', '#1510 AREA H BRGY. PULIDO, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (143, 143, '20400231', NULL, 2, 26, 74, 'JOHN LEYNARD', 'ASUQUE', 'ABULAG', 'cavite', 'intern', 'male', 'single', '14/30 ABANDO ROAD SINON AKBAY, BANCAL CARMONA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (144, 144, '20400232', NULL, 2, 26, 74, 'NORMAN', 'ORTILLA', 'DAPASEN', 'cavite', 'intern', 'male', 'single', '0015 PUROK 21, BRGY. DAPDAP, WEST TAGAYTAY CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (145, 145, '20400233', NULL, 2, 26, 74, 'MARIONE', 'TABORA', 'DE LEMOS', 'cavite', 'intern', 'male', 'single', '14/30 ABANDO ROAD SINON AKBAY, BANCAL CARMONA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (147, 147, '20400235', NULL, 2, 26, 74, 'MARK DANIEL', 'BUENDIA', 'MARASIGAN', 'cavite', 'intern', 'male', 'single', 'B191 L8 PH2 MABUHAY CITY SUBD. DASMARINAS, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (148, 148, '20400237', NULL, 2, 26, 74, 'ALVIN', 'PUAS', 'AMANTE', 'cavite', 'intern', 'male', 'single', '151 SITIO POSO BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (149, 149, '20400238', NULL, 2, 26, 74, 'JERICHO', 'MANALO', 'ELIAZAR', 'cavite', 'intern', 'male', 'single', 'PUROK 47 SITIO PALIGAWAN BULALONG MATANDA IRUHIN EAST TAGAYTAY CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (151, 151, '20400240', NULL, 2, 26, 74, 'JOHN PAULO', 'GLINOFRIA', 'MENDIETA', 'cavite', 'intern', 'male', 'single', 'SILANG CAVITE, SITIO IBABA MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (152, 152, '20400241', NULL, 2, 26, 74, 'WILMAR', 'OABEL', 'OABEL', 'cavite', 'intern', 'male', 'single', 'SILANG CAVITE, SITIO IBABA MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (153, 153, '20400242', NULL, 2, 26, 74, 'ANGELO', 'ILAGAN', 'MARQUEZ', 'cavite', 'intern', 'male', 'single', 'SILANG CAVITE, SITIO IBABA MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (154, 154, '20400243', NULL, 2, 26, 74, 'PETER PAUL', 'ARGUILLON', 'QUIMOD', 'cavite', 'intern', 'male', 'single', '143 SITIO POSO BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (155, 155, '21400250', NULL, 2, 26, 74, 'MICHAEL', 'LIBRES', 'RABINO', 'cavite', 'intern', 'male', 'single', '514 RICA DR. MONTECITO NUVALI, CANLUBANG, CALAMBA CITY, LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (156, 156, '21400261', NULL, 2, 26, 74, 'JERIC', 'PAGARA', 'GULMATICO', 'cavite', 'intern', 'male', 'single', 'SITIO IBABA VILLAGANAS COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (157, 157, '21100265', NULL, 2, 26, 82, 'JOHN EDGAR', 'AZUELA', 'PALOYO', 'cavite', 'regular', 'male', 'single', 'REYES COMPOUND, MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (158, 158, '21100266', NULL, 2, 26, 74, 'JUDELYN', 'BORROMEO', 'CEA', 'cavite', 'regular', 'female', 'single', 'MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (159, 159, '21100267', NULL, 2, 26, 74, 'JOEBERT', 'CASIO', 'PARCIA', 'cavite', 'regular', 'male', 'single', 'IRAYA, GUINOBATAN, ALBAY/ MAGUYAM SILANG CAVITE', '0', '0', '1995-6-30', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (160, 160, '21600271', NULL, 2, 26, 74, 'ANDREAN', 'NAVA', 'TAYAM', 'cavite', 'agency', 'male', 'single', 'SITIO IBABA BRGY MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (161, 161, '21600274', NULL, 2, 26, 74, 'JETHER REI', 'MATCHAN', 'ARITALLA', 'cavite', 'agency', 'male', 'single', 'UNIT E ARAÑADOR COMP. SITIO GITNA MAGUYAM SILANG CVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (162, 162, '21600277', NULL, 2, 26, 74, 'CARLO', 'VALLENTE', 'MEJIAS', 'cavite', 'agency', 'male', 'single', '529 SITIO GITNA MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (163, 163, '21600278', NULL, 2, 26, 82, 'ERTHEL', 'OCLARES', 'MESA', 'cavite', 'agency', 'female', 'single', 'BLK 37 LOT 17 MASWERTE ST. BERNARDO PULIDO (AREA H), GENERAL MARIANO ALVARES CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (164, 164, '21600279', NULL, 2, 26, 74, 'JOHN PAULO', 'IGNACIO', 'RAVALO', 'cavite', 'agency', 'male', 'single', '014 OLD BULIHAN BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (150, 150, '20400239', NULL, 2, 26, 74, 'DEVIN', 'ABICO', 'MEJORADA', 'cavite', 'intern', 'male', 'single', '14/30 ABANDO ROAD SINON AKBAY, BANCAL CARMONA, CAVITE', '0', '0', '1999-11-3', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (165, 165, '21600289', NULL, 2, 26, 74, 'WILFREDO', 'MACARIOLA', 'LORENO', 'cavite', 'agency', 'male', 'single', 'BLK 9 LOT 6 PHASE 6 BANABA, SILANG, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (166, 166, '21600293', NULL, 2, 26, 82, 'MARK ANTHONY', 'CARINO', 'MANGARIN', 'cavite', 'agency', 'male', 'single', 'BLK 91 LOT 8 ZONE 8 PALIPARAN II, DASMARINAS CITY CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (167, 167, '21600294', NULL, 2, 26, 74, 'JOSEPH ARTH', 'BEJINO', 'PORTUGAL', 'cavite', 'agency', 'male', 'single', 'BLK 212 LOT 4 ZONE 10 AFP HOUSE BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (168, 168, '21100295', NULL, 2, 26, 82, 'LAURO', 'QUINTANS', 'TEODORO', 'cavite', 'regular', 'male', 'married', '731, MAGALLANES ST., BRGY. 7, CARMONA, CAVITE', '0', '0', '1987-6-26', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (169, 169, '21600297', NULL, 2, 26, 74, 'NOEL', 'BALGOBERO', 'BORROMEO', 'cavite', 'agency', 'male', 'single', 'BLK 6 LOT 15 FOUR ST. KAPITAN KUA(AREA F), GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (170, 170, '21600299', NULL, 2, 26, 74, 'EMMANUEL', 'PAREDES', 'SANTILLAN', 'cavite', 'agency', 'male', 'single', '#1459-A EXTENSION AREA H BERNARDO PULIDO (AREA H), GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (171, 171, '21600300', NULL, 2, 26, 74, 'DEEJAY', 'NERAL', 'VILLAPA', 'cavite', 'agency', 'male', 'single', 'BLK 14 LOT 10 BULIHAN YAKAL, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (172, 172, '21600301', NULL, 2, 26, 82, 'MARK', 'LOBOS', 'GUTIERREZ', 'cavite', 'agency', 'male', 'single', 'BLK 13 LOT 58 PHASE 2 FVR BRANGAY 5 POBLACION, GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (173, 173, '21600302', NULL, 2, 26, 82, 'DIVINO FRANCO', 'ENCIRIAN', 'STO TOMAS', 'cavite', 'agency', 'male', 'single', '333 (NEAR STERLING) MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (174, 174, '21100314', NULL, 2, 26, 82, 'MARCK JOSEPH', 'BERMUNDO', 'BETCHAYDA', 'cavite', 'regular', 'male', 'single', 'MAHOGANY STREET LIBOTON NAGA CITY, CAMARINES SUR PHILIPPINES', '0', '0', '1999-1-31', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (175, 175, '21100315', NULL, 2, 26, 82, 'EDISON', 'ORTIZ', 'BERMUNDO', 'cavite', 'regular', 'male', 'single', 'ZONE 7 SAGRADA FAMILYA PEÑAFRANCIA AVENUE NAGA CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (176, 176, '21100316', NULL, 2, 26, 82, 'JEANETTE', 'ALMONTE', 'BEDIONES', 'cavite', 'regular', 'female', 'single', 'BLK 19, LOT 54 SAINT LAWRENCE ST. GRANDRIVER STONE VILLAGE, BRGY. DITA STA ROSA, LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (177, 177, '21100319', NULL, 2, 26, 81, 'LEO MARLOR', 'MENDOZA', 'ENCABO', 'cavite', 'regular', 'male', 'single', '160 BATUHAN SAMPALOC IV, DASMARINAS, CAVITE', '0', '0', '1994-12-4', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (178, 178, '21100321', NULL, 2, 26, 82, 'ANGELU', 'PORTUGUEZ', 'AGUILAR', 'cavite', 'regular', 'female', 'single', 'DINAGA,CANAMAN,CAM SUR', '0', '0', '1999-1-3', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (179, 179, '21600339', NULL, 2, 26, 74, 'ERWIN', 'DAEL', 'ESPENILLA', 'cavite', 'agency', 'male', 'single', 'BKL 5 LOT EXT BRGY PULIDO G.M.A CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (180, 180, '21400347', NULL, 2, 26, 73, 'GILBERT', 'DIAZ', 'HERNANDEZ', 'cavite', 'intern', 'male', 'single', NULL, '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (181, 181, '21400348', NULL, 2, 26, 73, 'JOSEPH', 'VARGAS', 'BAJADO', 'cavite', 'intern', 'male', 'single', 'DON ANTONIO BOMBON CAMARINES SUR/ DINULOS BLDG. SITIO IBABA SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (182, 182, '21100351', NULL, 2, 26, 82, 'MICHAEL', 'CAMPUS', 'FRIAS', 'cavite', 'regular', 'male', 'single', 'SAN ROQUE, BULA CAMARINES SUR', '0', '0', '1998-11-16', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (183, 183, '21100353', NULL, 2, 26, 82, 'JESSICA JANE', 'IBATUAN', 'MENDINA', 'cavite', 'regular', 'female', 'single', 'ZONE 4 SAN MATEO CAMALIGAN CAM.SUR', '0', '0', '1997-12-26', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (184, 184, '21100358', NULL, 2, 26, 81, 'BRIAN CARLO', 'FLORES', 'FERATERO', 'cavite', 'regular', 'male', 'single', 'B3 L31 SUNRISE VILLAGE II, SAN RAFAEL, STO. TOMAS, BATANGAS', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (185, 185, '21100359', NULL, 2, 26, 81, 'ERMILYN', 'REANZARES', 'QUERUBIN', 'cavite', 'regular', 'female', 'single', 'BLOCK 45 LOT 3, BAHAYANG PILIPINO VILLAGE, SABANG, LIPA CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (186, 186, '22400366', NULL, 2, 26, 82, 'JEREMY KANE', 'DE LEON', 'AALA', 'cavite', 'intern', 'male', 'single', 'SITIO GUINTING CASILE CABUYAO LAGUNA', '0', '0', '2003-3-8', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (187, 187, '22400367', NULL, 2, 26, 82, 'CRISTIAN JOHN PAUL', 'MIRA', 'ARIMADO', 'cavite', 'intern', 'male', 'single', 'MAGUYAM REYES COMPOUND', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (188, 188, '22400368', NULL, 2, 26, 82, 'LORD MICHAEL', 'FRAGO', 'MEDINA', 'cavite', 'intern', 'male', 'single', 'IMUS CAVITE, BUCANDALA 1', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (146, 146, '20400234', NULL, 2, 26, 74, 'JUNIEVEN', 'GRAPA', 'DEGUINIO', 'cavite', 'intern', 'male', 'single', '14/30 ABANDO ROAD SINON AKBAY, BANCAL CARMONA, CAVITE', '0', '0', '2001-6-27', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (189, 189, '22400372', NULL, 2, 26, 74, 'LAN', 'MARIGICIO', 'ORMACIDO', 'cavite', 'intern', 'male', 'single', 'MAGUYAM REYES COMBOUND', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (190, 190, '22600373', NULL, 2, 26, 74, 'GREG', 'DEVELA', 'RODRIGUEZ', 'cavite', 'agency', 'male', 'single', 'SITIO KARSADAHAN,KANLURAN,BRGY.KAONG,SILANG,CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (191, 191, '22600374', NULL, 2, 26, 74, 'MICHAEL JOSHUA', 'REYES', 'JAURIGUE', 'cavite', 'agency', 'male', 'single', 'MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (192, 192, '22400375', NULL, 2, 26, 74, 'REYNALD', 'AREVALO', 'CATALO', 'cavite', 'intern', 'male', 'single', 'MAGUYAM REYES COMPOUND', '0', '0', '2000-10-12', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (193, 193, '22400378', NULL, 2, 26, 74, 'JUSTIN', 'ARANJUEZ', 'CROMPIDO', 'cavite', 'intern', 'male', 'single', 'MAGUYAM REYES COMPOUND', '0', '0', '1999-10-14', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (194, 194, '22400380', NULL, 2, 26, 74, 'RODZEL', 'BULALAQUE', 'ESCOTE', 'cavite', 'intern', 'male', 'single', 'PUTING KAHOY SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (195, 195, '22600381', NULL, 2, 26, 74, 'JONRAD', 'ORTIZ', 'BAGTINGLA', 'cavite', 'agency', 'male', 'single', 'PHASE1A BLK29 LOT25 BRGY:ACACIA SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (196, 196, '22400382', NULL, 2, 26, 74, 'MICO', 'MELGAR', 'ACOBERA', 'cavite', 'intern', 'male', 'single', 'BANCAO CARMONA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (197, 197, '22400383', NULL, 2, 26, 74, 'WINLOUR MON', 'ENRILE', 'OMBAO', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (198, 198, '22600385', NULL, 2, 26, 82, 'NED', 'MELEGRITO', 'RAFOL', 'cavite', 'agency', 'male', 'single', 'BLK 10 LOT 1 POBLACION 2', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (199, 199, '22600395', NULL, 2, 26, 82, 'RHOFER', 'DELIMA', 'ALIGARBES', 'cavite', 'agency', 'male', 'single', 'BLK.37 EXCESS LOT,PHASE 6,BRGY.BANABA, BULIHAN,SILANG,CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (200, 200, '22400396', NULL, 2, 26, 74, 'HARDY', 'TORDA', 'MAGLAQUE', 'cavite', 'intern', 'male', 'single', 'MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (201, 201, '22600397', NULL, 2, 26, 74, 'JOHN KIANNE', 'HIJE', 'MERIN', 'cavite', 'agency', 'male', 'single', 'BLK 44 EXCESSLOT PHASE 1B BRGY ACACIA BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (202, 202, '22100399', NULL, 2, 26, 82, 'CAMIA MAE', 'MAÑOSA', 'SAN JUAN', 'cavite', 'regular', 'male', 'single', '226 ZONE 3A DEL PILAR SAN FERNANDO C.S.', '0', '0', '1998-2-18', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (203, 203, '22600407', NULL, 2, 26, 74, 'IVAN LESTER', 'FRANCISCO', 'GARCIA', 'cavite', 'agency', 'male', 'single', 'BLK 43 LOT 31 BRGY. ACACIA PHASE 1B BULIHAN SILANG, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (204, 204, '22400408', NULL, 2, 26, 82, 'NIÑO MIGUEL', 'JALUAG', 'SILVA', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (205, 205, '22400415', NULL, 2, 26, 74, 'PEREZ II', 'DUMAWAN', 'MACARIO', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (206, 206, '22400416', NULL, 2, 26, 82, 'EDRIAN GABRIEL', NULL, 'MACALALAG', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (207, 207, '22400418', NULL, 2, 26, 74, 'JONEL', 'ABRAHAN', 'ESCARLAN', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '1997-8-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (208, 208, '22400419', NULL, 2, 26, 74, 'ELMER', 'SALO', 'DAHOME', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (209, 209, '22400424', NULL, 2, 26, 82, 'ARNOLD', 'VILLANUEVA', 'LLORCA', 'cavite', 'intern', 'male', 'single', 'CUNLUBANG CALAMBA LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (210, 210, '22400433', NULL, 2, 26, 74, 'CLARENCE JAY', 'VARGAS', 'TESORERO', 'cavite', 'intern', 'male', 'single', '255 B GENERAL CAPINPIN ST SAN VICENTE BIÑAN LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (211, 211, '22400434', NULL, 2, 26, 74, 'JOHN ALLEN', 'LIZASO', 'BARRAMEDA', 'cavite', 'intern', 'male', 'single', 'SITIO IBABA BRGY. MAGUYAM', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (212, 212, '22400436', NULL, 2, 26, 74, 'FRANK', 'MACHADO', 'RICAFRENTE', 'cavite', 'intern', 'male', 'single', 'REYES COMPOUND', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (213, 213, '22400437', NULL, 2, 26, 74, 'JOSE LUIS', 'FRANCISCO', 'NOLLASE', 'cavite', 'intern', 'male', 'single', 'PHASE 3 LOT 16 MILAGROSA CARMONA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (214, 214, '22400440', NULL, 2, 26, 74, 'MARK JAY', 'TAÑO', 'TUMALIN', 'cavite', 'intern', 'male', 'single', 'MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (215, 215, '22400441', NULL, 2, 26, 74, 'KIMUEL', 'BALBOA', 'RUFO', 'cavite', 'intern', 'male', 'single', 'BRGY MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (216, 216, '22400442', NULL, 2, 26, 74, 'RONNEL', 'M.', 'DESACOLA', 'cavite', 'intern', 'male', 'single', 'BRGY.MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (217, 217, '22400443', NULL, 2, 26, 74, 'GERALD', 'BAUTISTA', 'MONTERDE', 'cavite', 'intern', 'male', 'single', 'BANCAL CARMONA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (218, 218, '22400445', NULL, 2, 26, 74, 'RANDEL RYAN', 'GACER', 'NAVAL', 'cavite', 'intern', 'male', 'single', 'ASIA 1 CANLUBANG CALAMBA LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (219, 219, '22400446', NULL, 2, 26, 74, 'JOHN RENIER', 'MALINAO', 'AGUILAR', 'cavite', 'intern', 'male', 'single', 'MAGUYAM SILANG', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (220, 220, '22400488', NULL, 2, 26, 74, 'ELCANA', NULL, 'DELA CRUZ', 'cavite', 'intern', 'female', 'single', 'PASONG LANGKA SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (221, 221, '22400491', NULL, 2, 26, 82, 'BRYAN CLIENE', 'INFANTA', 'DAIT', 'cavite', 'intern', 'male', 'single', '2815 PILAPIL ST., BRGY. 83, ZONE 10, PASAY CITY', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (222, 222, '22400497', NULL, 2, 26, 74, 'JAMES JEFFERSON', 'ALUNEN', 'FRANADA', 'cavite', 'intern', 'male', 'single', '071, INCHICAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (223, 223, '22400498', NULL, 2, 26, 74, 'REYMOND', 'CAMACHO', 'TIMBAL', 'cavite', 'intern', 'male', 'single', 'AGBAN, BARAS, CATANDUANES', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (224, 224, '22400505', NULL, 2, 26, 74, 'RODERICK', 'SIRUMA', 'PILAO', 'cavite', 'intern', 'male', 'single', 'LOT 6 BLOCK 2 LOMBRERAS GMA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (225, 225, '22400506', NULL, 2, 26, 74, 'JOHN MCHOLMES', 'OCAP', 'RAFER', 'cavite', 'intern', 'male', 'single', 'GEN. ORBE ST. PUROK 4 PASONG LANGKA, SILANG, CAVITE', '0', '0', '2002-8-15', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (226, 226, '22400507', NULL, 2, 26, 74, 'ANGELO', 'CATALAN', 'ARIAS', 'cavite', 'intern', 'male', 'single', 'SITIO GITNA, MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (227, 227, '22400510', NULL, 2, 26, 74, 'IGNACIO', 'ARTURO', 'PARTOSA', 'cavite', 'intern', 'male', 'single', 'MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (228, 228, '22400511', NULL, 2, 26, 74, 'REGIO', 'MARK ZANDER', 'ALMONTE', 'cavite', 'intern', 'male', 'single', 'PHASE 1BLOCK 9 LOT 17 TERRAVERDE RESSEDENCE CARMONA CAVITE', '0', '0', '2006-8-15', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (229, 229, '22400512', NULL, 2, 26, 74, 'BALOG', 'JONATHAN', 'NONE', 'cavite', 'intern', 'male', 'single', NULL, '0', '0', '2003-9-16', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (230, 230, '3100016', NULL, 2, 27, 85, 'EDWIN', 'CASIQUIN', 'CARBONEL', 'cavite', 'regular', 'male', 'single', 'BLK1 LOT 30, BRGY JACINTO LUMBRERAS, GMA CAVITE', '0', '0', '1972-11-8', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (231, 231, '11100042', NULL, 2, 27, 84, 'LUIS', 'PINTOR', 'PATROPIS', 'cavite', 'regular', 'male', 'single', 'IBAYONG ILAT BRGY KAONG SILANG CAVITE', '0', '0', '1984-6-11', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (232, 232, '19100154', NULL, 2, 27, 87, 'JOHN ANDREW', 'BITARA', 'VOLANTE', 'cavite', 'regular', 'male', 'married', '557 STIGMA ST. CAMELLA HOMES BAYAN LUMA IMUS, CAVITE', '0', '0', '1990-7-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (233, 233, '20100163', NULL, 2, 27, 85, 'ROLANDO', 'ERA', 'GERMIO', 'cavite', 'regular', 'male', 'single', 'BLK 6, LOT 34 BRGY JACINTO LUMBRERAS, GMA CAVITE', '0', '0', '1985-5-28', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (234, 234, '20100191', NULL, 2, 27, 84, 'DANTE', 'DIAMANTE', 'CAPUYAN', 'cavite', 'regular', 'male', 'single', 'BLOCK 7 LOT 18 PHASE 1 EQUATOR STREET BRGY SALITRAN IV DASMARIÑAS CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (235, 235, '20100192', NULL, 2, 27, 85, 'LEGGY MARK', 'RODRIGUEZ', 'AGUILLO', 'cavite', 'regular', 'male', 'married', 'BLK.6 LOT9 DON ONOFRE VILLAGE, BGY. BANAY-BANAY, CABUYAO CITY, LAGUNA', '0', '0', '1991-2-22', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (236, 236, '20100193', NULL, 2, 27, 85, 'NORIEL', 'MENDONES', 'BALANTA', 'cavite', 'regular', 'male', 'married', 'BRGY. MAGUYAM SILANG CAVITE', '0', '0', '1990-7-6', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (237, 237, '20100214', NULL, 2, 27, 84, 'RONALD ALLAN', 'AQUINO', 'PADUA', 'cavite', 'regular', 'male', 'single', 'MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (238, 238, '20600228', NULL, 2, 27, 84, 'NELSON', 'PLETE', 'DEL ROSARIO', 'cavite', 'agency', 'male', 'single', '357 AGUAVILLE COMPUND, MAGUYAM, SILANG, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (239, 239, '21100264', NULL, 2, 27, 86, 'ELENE JOYCE', 'CREENCIA', 'AMBOJIA', 'cavite', 'regular', 'male', 'single', '66 J.P. RIZAL ST. BIGA 1, SILANG, CAVITE 4118', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (240, 240, '21600280', NULL, 2, 27, 84, 'ARJAY', 'PINTOR', 'ZAMORA', 'cavite', 'agency', 'male', 'single', '001 SITIO GITNA MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (241, 241, '21100304', NULL, 2, 27, 83, 'RHEINALD', 'GARCIA', 'RAMIREZ', 'cavite', 'regular', 'male', 'single', 'BLOCK 12 LOT 32 MAGNAGON SPRING HOMES BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (242, 242, '21600305', NULL, 2, 27, 84, 'RAMUEL', 'MOLIGRO', 'SAYAM', 'cavite', 'agency', 'male', 'single', 'BLK 7 LOT 26 SIKAPVILLE SABUTAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (243, 243, '22100400', NULL, 2, 27, 84, 'JESIL JIM', 'ASICO', 'DACLES', 'cavite', 'regular', 'male', 'single', '#577 KALAYA HAMIS, ZONE 5, DUGCAL, CAMALIGAN, CAMARINES SUR', '0', '0', '1999-6-10', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (244, 244, '22100413', NULL, 2, 27, 84, 'MARK VICTORY', 'ARIMADO', 'ESPERA', 'cavite', 'regular', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '1998-4-30', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (245, 245, '22400417', NULL, 2, 27, 84, 'MARK FRANCIS', NULL, 'CRUZADO', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (246, 246, '22100422', NULL, 2, 27, 86, 'KIMBERLY', 'FLORA', 'NOLLAN', 'cavite', 'regular', 'female', 'single', 'ZONE 3, SAN GABRIEL PAMPLONA, CAMARINES SUR', '0', '0', '1998-7-27', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (247, 247, '22100462', NULL, 2, 27, 83, 'KRISTINE', 'BONA', 'REGALADO', 'cavite', 'regular', 'female', 'single', 'NAPALALABA ST. SAGRADA BAAO, CAMARINES SUR', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (248, 248, '22400509', NULL, 2, 27, 84, 'DACUDAO', 'MEGLORENZ', 'RODILLAS', 'cavite', 'intern', 'male', 'single', 'MAGUYAM SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (249, 249, '15100065', NULL, 2, 28, 88, 'MARLON', 'MAROLLANO', 'MATA', 'cavite', 'regular', 'male', 'single', 'SITIO IBAYONG ILAT KAONG SILANG CAVITE', '0', '0', '1992-9-24', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (250, 250, '18100109', NULL, 2, 28, 90, 'ROBERTO', 'MANABAT', 'SUMAGUE', 'cavite', 'regular', 'male', 'single', '65 SITIO PANTAY, BRGY. MAGUYAM, SILANG, CAVITE', '0', '0', '1975-11-20', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (251, 251, '20100177', NULL, 2, 28, 88, 'BRANDO', 'OAB', 'FORTEZA', 'cavite', 'regular', 'male', 'married', 'MAGUYAM SILANG CAVITE', '0', '0', '1985-3-30', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (252, 252, '20100178', NULL, 2, 28, 88, 'JACKSON', 'PANTI', 'ESTRADA', 'cavite', 'regular', 'male', 'married', 'PHASE 2 BLK 11 LOT 7 FVR, GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '1979-9-27', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (253, 253, '20100179', NULL, 2, 28, 88, 'EARL MIGUEL', 'COBEY', 'LEYSON', 'cavite', 'regular', 'male', 'single', 'BRGY. KAONG HANOPOL SILANG CAVITE', '0', '0', '1989-4-5', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (254, 254, '20600220', NULL, 2, 28, 88, 'DONARDO', 'ROJO', 'CAWALING', 'cavite', 'agency', 'male', 'single', '#436 B2 L19 BRGY. COL.J.P. ELISES G.M.A CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (255, 255, '20600223', NULL, 2, 28, 88, 'JOSELITO', 'BAS', 'RAPADA', 'cavite', 'agency', 'male', 'single', 'B38 L11 BRGY A OLAES, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (256, 256, '21400251', NULL, 2, 28, 89, 'NIXON', 'OCAMPO', 'RICAFRENTE', 'cavite', 'intern', 'male', 'single', 'B41 L 26 AVIDA, CERIS 1, CANLUBANG, CALAMBA CITY, LAGUNA', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (257, 257, '21100259', NULL, 2, 28, 91, 'YRAZEL JOY', 'SOLORANO', 'TACOS', 'cavite', 'regular', 'female', 'single', 'SAN JUAN II GEN. TRIAS CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (98, 98, '21600247', NULL, 2, 19, 53, 'LOVE JOY', 'CARALE', 'ASONG', 'cavite', 'agency', 'female', 'single', 'B-20 L-13 ORCHARD TOWN HOMES BRGY. SALAWAG, DASMARIÑAS CAVITE', '0', '0', '1993-1-6', '2023-2-3', NULL);
INSERT INTO "public"."tbl_employee" VALUES (258, 258, '22600403', NULL, 2, 28, 90, 'JESSIE', 'TOLENTINO', 'JALALON', 'cavite', 'agency', 'male', 'single', 'BLK 12 LOT 35 ANAHAW 1 BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (259, 259, '22100431', NULL, 2, 28, 89, 'MARVIN', 'DAGDAGAN', 'RONDILLA', 'cavite', 'regular', 'male', 'single', '105 CONGRESSIONAL ROAD, BLOCK 8 LOT 5, BRGY. ELISES, GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '1994-9-18', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (260, 260, '22100432', NULL, 2, 28, 89, 'ROEL CHRISTIAN', 'CASTILLO', 'BADILLO', 'cavite', 'regular', 'male', 'single', 'B-105 L-5 P-4 MABUHAY CITY, PALIPARAN 3, DASMARIÑAS, CAVITE', '0', '0', '1998-4-14', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (261, 261, '22100478', NULL, 2, 28, 91, 'PAUL KENNETH', 'GAVARRA', 'CARANI', 'cavite', 'regular', 'male', 'single', 'BLK. 37 LOT 20 PH 1 SITIO PULO DELA PAZ BINAN CITY LAGUNA', '0', '0', '1999-9-16', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (262, 262, '22100489', NULL, 2, 28, 91, 'MIKE', 'PAGUIBITAN', 'NAVA', 'cavite', 'regular', 'male', 'single', '94 LOOBAN ST. PUROK V, BRGY. SORO-SORO, BIÑAN CITY, LAGUNA', '0', '0', '2000-4-3', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (263, 263, '22100495', NULL, 2, 28, 91, 'MICHAEL ANGELO', 'AREVALO', 'ACORDA', 'cavite', 'regular', 'male', 'single', 'LT207 B15 SILANGAN ST. SAN FRANCISCO BIÑAN CITY LAGUNA', '0', '0', '2000-3-8', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (264, 264, '22100503', NULL, 2, 28, 91, 'SHIERWIN', 'MONTALDO', 'MEJOY', 'cavite', 'regular', 'male', 'single', 'CONTRERAS APARTMENT DOOR 2 SAN ROQUE STREET PUNTURIN VALENZUELA CITY', '0', '0', '1998-2-10', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (265, 265, '10100037', NULL, 2, 29, 92, 'JUMEL', 'DELA TORRE', 'AMAGO', 'cavite', 'regular', 'male', 'married', 'BLK 14 LOT 3 BRGY. G. DE JESUS, G.M.A, CAVITE', '0', '0', '1986-9-23', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (266, 266, '19100122', NULL, 2, 29, 92, 'MARVIN', 'CALUBA', 'LLABORE', 'cavite', 'regular', 'male', 'single', 'IBAYONG ILAT, KAONG SILANG CAVITE', '0', '0', '1992-10-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (267, 267, '20100181', NULL, 2, 29, 92, 'EDGARDO', 'LOMUCSO', 'ASEGURADO', 'cavite', 'regular', 'male', 'single', 'SITIO IBABA BRGY. MAGUYAM, SILANG, CAVITE', '0', '0', '1978-11-22', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (268, 268, '20100182', NULL, 2, 29, 94, 'JONNEL', 'VELOSO', 'PADASAS', 'cavite', 'regular', 'male', 'single', 'BLOCK 10, LOT 75, BRGY. RAMON CRUZ, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (269, 269, '20100185', NULL, 2, 29, 93, 'BENEDICT', 'BAGASIN', 'FRANCISCO', 'cavite', 'regular', 'male', 'single', 'BLK6 LOT9 GAINSVILLE SUBDIVISION BULIHAN SILANG CAVITE', '0', '0', '1979-8-14', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (272, 272, '21600255', NULL, 2, 29, 95, 'HENRY', 'VILLAFRANCA', 'MENDEZ', 'cavite', 'agency', 'male', 'single', 'B-32 L-10, ANAHAW II, BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (273, 273, '21600256', NULL, 2, 29, 95, 'FREDERICK', 'OCSON', 'ADORANTE', 'cavite', 'agency', 'male', 'single', 'B-32 L-10, ANAHAW II, BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (274, 274, '21600270', NULL, 2, 29, 92, 'KENNETH', 'ALCONES', 'MADRONERO', 'cavite', 'agency', 'male', 'single', '001 TAMANLI KAPITAN KUA (AREA F), GENERAL MARIANO ALVAREZ CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (271, 271, '20600229', NULL, 2, 29, 95, 'MARVIN', 'MALABUYOC', 'TOLENTINO', 'cavite', 'agency', 'male', 'single', 'B6 L53 BRGY.LUMBRERAS GMA,CAVITE', '0', '0', '1987-10-25', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (270, 270, '20600221', NULL, 2, 29, 92, 'NORMAN', 'SANORIA', 'GENESIS', 'cavite', 'agency', 'male', 'single', 'BLK.39 LOT 14 BRGY.YAKAL,SILANG,CAVITE', '0', '0', '1995-4-17', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (275, 275, '21600349', NULL, 2, 29, 93, 'CRISPIN', 'RIVERA', 'PAGSALIGAN', 'cavite', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (276, 276, '22100377', NULL, 2, 29, 95, 'BRYAN', 'ASIDERA', 'ROMBAOA', 'cavite', 'regular', 'male', 'single', 'UNIT 3 BALLENTES RESIDENCE REYES COMPOUND SITIO IBABA MAGUYAM SILANG CAVITE', '0', '0', '1987-5-30', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (277, 277, '10100038', NULL, 2, 30, 97, 'JUNJUN', 'ZURBITO', 'FRANCO', 'cavite', 'regular', 'male', 'married', 'GOVERNORS DRIVE PALIPARAN 1 DASMARIÑAS CAVITE', '0', '0', '1979-6-24', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (278, 278, '19100123', NULL, 2, 30, 98, 'PRUDENCIO', 'RACELIS', 'MASANGCAY', 'cavite', 'regular', 'male', 'married', 'ZONE10,BLOCK211,LOT12,BULIHAN SILANG CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (279, 279, '20100187', NULL, 2, 30, 96, 'RAYMOND', 'MESANO', 'GARCIA', 'cavite', 'regular', 'male', 'single', 'BLK 7 LOT14 C6B BRGY GREGORIA DE JESUS GMA CAVITE', '0', '0', '1983-12-3', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (280, 280, '20100217', NULL, 2, 30, 98, 'JANREY', 'LANCISO', 'FERNANDEZ', 'cavite', 'regular', 'male', 'single', 'BLK 14 LOT 67 PHASE 2 POB.5 FVR GMA CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (281, 281, '20600224', NULL, 2, 30, 98, 'ARMAN', 'ABELLO', 'SAGUM', 'cavite', 'agency', 'male', 'single', 'P2, B11, L10, POBLACION 5, FVR, GMA, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (282, 282, '21600288', NULL, 2, 30, 98, 'GLENN BERTH', 'VISTA', 'ESTEBA', 'cavite', 'agency', 'male', 'single', 'BLK 40 LOT 11 PROPER ADIANO OLAES, GENERAL MARIANO ALVAREZ, CAVITE', '0', '0', '2023-2-9', '2023-2-9', NULL);
INSERT INTO "public"."tbl_employee" VALUES (283, 283, '21600306', NULL, 2, 30, 98, 'JOEMAR', 'POIN', 'VISCA', 'cavite', 'agency', 'male', 'single', 'BLK 4 LOT 41 GREENWOODS PORTEA ST. PALIPARAN I, DASMARINAS CITY', '0', '0', '2023-2-10', '2023-2-10', NULL);
INSERT INTO "public"."tbl_employee" VALUES (284, 284, '21600307', NULL, 2, 30, 98, 'JAMES DARYL', 'SALCEDO', 'BADAJOS', 'cavite', 'agency', 'male', 'single', '135 TAMAK ST MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (285, 285, '21600327', NULL, 2, 30, 98, 'JEROME', 'GACMATAN', 'SAURET', 'cavite', 'agency', 'male', 'single', 'BLK 23 LOT 4 BUKLURAN 2 SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (286, 286, '21600346', NULL, 2, 30, 97, 'ORLANDO', 'ASUG', 'DESOLOC', 'cavite', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (287, 287, '22600398', NULL, 2, 30, 98, 'JOEY', 'VINOYA', 'FERMILAN', 'cavite', 'agency', 'male', 'single', 'BLK.41 LOT 1 BRGY.YAKAL. BULIHAN SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (288, 288, '22600401', NULL, 2, 30, 98, 'JASON', 'CANDIDO', 'AGNES', 'cavite', 'agency', 'male', 'single', 'REYES COMPOUND SITIO IBABA BRGY. MAGUYAM SILANG, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (289, 289, '22600409', NULL, 2, 30, 98, 'BONG-BONG', 'SEVILLENA', 'BACULANDO', 'cavite', 'agency', 'male', 'single', 'BLK10B LOT6 GMA VILLAGE BRGY. POBLACION 5 GMA CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (290, 290, '22600448', NULL, 2, 30, 98, 'JUANDEL', 'FAMI', 'DERILON', 'cavite', 'agency', 'male', 'single', 'TRECE MARTIRES CITY, REGINA VILLE 2000', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (291, 291, '22600449', NULL, 2, 30, 98, 'DARL WINSETT REYMOND', 'DINSAY', 'CARANDANG', 'cavite', 'agency', 'male', 'single', 'PHASE 2, BRGY. INOCENCIO, REGINA VILLE 2000 TRECE MARTIRES CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (292, 292, '22600471', NULL, 2, 30, 98, 'RODERICK', 'LOPEZ', 'BULTRON', 'cavite', 'agency', 'male', 'single', 'NAIC,CALUBCOB,CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (293, 293, '22600508', NULL, 2, 30, 98, 'JERWEN', 'EGAMEN', 'BEATO', 'cavite', 'agency', 'male', 'single', 'SITIO PANTAY MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (294, 294, '14100059', NULL, 2, 31, 106, 'GILBERT', 'CASTRO', 'BOLANOS', 'cavite', 'regular', 'male', 'married', 'SITIO IBABA BRGY MAGUYAM SILANG CAVITE', '0', '0', '1989-4-6', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (295, 295, '17100091', NULL, 2, 31, 108, 'MELANNIE', 'VILLAR', 'TRESVALLES', 'cavite', 'regular', 'female', 'single', 'UNIT 6, GEALOGO COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '1994-6-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (296, 296, '18100111', NULL, 2, 31, 104, 'CHESMA', 'MORANTE', 'TAMAKEN', 'cavite', 'regular', 'male', 'single', 'BLOCK 5, LOT 1,3-7 PHASE 2, STERLING TECHNOPARK, BARANGAY LANTIK, CARMONA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (297, 297, '20100198', NULL, 2, 31, 106, 'KARL JOSEPH', 'PORRAS', 'SENEREZ', 'cavite', 'regular', 'male', 'married', 'LOT 1, BLOCK 5, PHASE 2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '1985-10-10', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (298, 298, '20100199', NULL, 2, 31, 149, 'JOCEL', 'PALACIO', 'ZARATE', 'cavite', 'regular', 'female', 'single', 'LOT 1, BLOCK 5, PHASE 2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '1997-11-9', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (299, 299, '20100200', NULL, 2, 31, 104, 'MARK', 'DE GUZMAN', 'FLORESCA', 'cavite', 'regular', 'male', 'single', '#75 ROOM G CARUMAY APARTMENT, OLD BULIHAN, BULIHAN, SILANG CAVITE', '0', '0', '1989-9-29', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (300, 300, '20100201', NULL, 2, 31, 105, 'JHON', 'VALENZUELA', 'ABIERA', 'cavite', 'regular', 'male', 'single', 'LOT 1, BLOCK 5, PHASE 2, STERLING TECHNOPARK, BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (301, 301, '20100202', NULL, 2, 31, 101, 'EUDES MARKCHALO', 'MANALILI', 'EVANGELISTA', 'cavite', 'regular', 'male', 'single', 'BLK 14 LOT 48, ZARAGOSA ST., TOWN AND COUNTRY WEST, MOLINO 3, BACOOR CITY, CAVITE, 4102', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (302, 302, '21100246', NULL, 2, 31, 104, 'ROMEO', 'MARTINEZ', 'CHAVEZ', 'cavite', 'regular', 'male', 'single', '856 MARIA CRISTINA ST., SAMPALOC, MANILA', '0', '0', '1994-3-18', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (303, 303, '21400260', NULL, 2, 31, 105, 'CHRISTIAN', 'PANIM', 'BAYHONAN', 'cavite', 'intern', 'male', 'single', 'SITIO IBABA VILLAGANAS COMPOUND MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (304, 304, '21600275', NULL, 2, 31, 100, 'EDWILL', 'BUCABUCA', 'DIOLATA', 'cavite', 'agency', 'male', 'single', 'PHASE 2 BLK 13 LOT 68 FVR BARANGAY 5 POBLACION GMA CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (305, 305, '21100282', NULL, 2, 31, 99, 'ALLAN JOHN', 'CALUB', 'BORJA', 'cavite', 'regular', 'male', 'married', 'BLK20 LOT6 POLAND ST. PHASE 2 SALAWAG DASMARIÑAS CAVITE', '0', '0', '1991-1-24', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (306, 306, '21100296', NULL, 2, 31, 104, 'ARLENE GRACE', 'CALINAYA', 'TUAZON', 'cavite', 'regular', 'male', 'single', 'LT 1 BLK 5 PHASE 2 STERLING TECHNOPARK , BRGY. LANTIC, CARMONA, CAVITE', '0', '0', '1998-1-23', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (307, 307, '21100318', NULL, 2, 31, 104, 'BRYAN EARL', 'PAGUNTALAN', 'VISPERAS', 'cavite', 'regular', 'male', 'single', 'PH3B B4 L26 ARCHERY DRIVE PACITA COMPLEX 1 SAN FRANCISCO (HALANG) CITY OF BIÑAN LAGUNA', '0', '0', '1997-12-20', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (308, 308, '21100324', NULL, 2, 31, 108, 'PRINCESS JANE', 'DIAO', 'ALFONSO', 'cavite', 'regular', 'female', 'single', '192 KARSADAHAN KANLURAN, KAONG, SILANG, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (309, 309, '21100350', NULL, 2, 31, 101, 'JUNE', 'GANIRON', 'VILLAPAÑA', 'cavite', 'regular', 'male', 'single', 'B99 L40 P4 MABUHAY CITY SUBD., BRGY. PALIPARAN III, CITY OF DASMARIÑAS, CAVITE, 4114', '0', '0', '1997-6-7', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (310, 310, '21100354', NULL, 2, 31, 101, 'MAR ANTHONY', 'AUSTRIA', 'ANGOB', 'cavite', 'regular', 'male', 'single', 'B9 L19 CONFEDERATION DRIVE CITYHOMES, BRGY. SAMPALOC IV DASMARINAS CAVITE', '0', '0', '1999-3-8', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (311, 311, '22100389', NULL, 2, 31, 104, 'ROBINSON JR.', 'CABAUATAN', 'MADDAWIN', 'cavite', 'regular', 'male', 'single', 'ANTIPOLO CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (312, 312, '22100390', NULL, 2, 31, 104, 'CARL JOHN', 'NEMENZO', 'VILLARIAS', 'cavite', 'regular', 'male', 'single', 'LOT 28 BLOCK 1 KENSINGTON 16 ARUBA ST., NAVARRO GENERAL TRIAS CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (313, 313, '22100391', NULL, 2, 31, 102, 'JOHN RAYMOND', 'YU', 'AYTONA', 'cavite', 'regular', 'male', 'single', '#13 LOT 2 BLK 22 KINGSPOINT SUBDIVISION KING CHARLES EXT. NOVALICHES BAGBAG QUEZON CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (314, 314, '22100404', NULL, 2, 31, 104, 'VINCE ALDRENE', 'DELA TORRE', 'RAZALAN', 'cavite', 'regular', 'male', 'single', 'PUROK SARANAY BRGY. POBLACION SUR, MAYANTOC TARLAC', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (315, 315, '22400412', NULL, 2, 31, 107, 'JHON LLOYD', 'TORRENTE', 'TARROMA', 'cavite', 'intern', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (316, 316, '22100420', NULL, 2, 31, 104, 'VINCE CESAR', 'BAGSAIN', 'ROA', 'cavite', 'regular', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (317, 317, '22400439', NULL, 2, 31, 105, 'ALBERT CARL', NULL, 'CAJAYON', 'cavite', 'intern', 'male', 'single', 'BRGY MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (318, 318, '21100357', NULL, 2, 35, 122, 'KARLA', 'VARELA', 'METILA', 'cavite', 'regular', 'female', 'single', '146 MABIKAS ST BAGONG BARIO CALOOCAN CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (319, 319, '5100022', NULL, 2, 38, 146, 'JOHN', 'ZULUETA', 'MARTINEZ', 'cavite', 'regular', 'male', 'single', 'NO.37 BLOCK 11 LOT 13, TIERRA VERDE RESIDENCES MT.APO ST., BUROL III DASMARINAS CAVITE', '0', '0', '1977-6-23', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (320, 320, '6100026', NULL, 2, 38, 146, 'ERWIN', 'BACQUIANO', 'PALMA', 'cavite', 'regular', 'male', 'single', 'IBAYONG ILAT, KAONG SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (321, 321, '17100092', NULL, 2, 38, 143, 'BETCHIE ANN', 'MADELO', 'ARBOLEDA', 'cavite', 'regular', 'male', 'single', '#11458 B. PULAR ST. MABUHAY CARMONA CAVITE', '0', '0', '1996-10-30', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (322, 322, '19100125', NULL, 2, 38, 139, 'CELSO', 'VILLANUEVA', 'AGDON', 'cavite', 'regular', 'male', 'single', 'BKL3LOT21 SEC15 PHASE2 PABAHAY BRGY BAGTAS TANZA CAVITE', '0', '0', '1982-5-8', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (323, 323, '20100205', NULL, 2, 38, 146, 'ARNEL', 'MERCADO', 'GALIT', 'cavite', 'regular', 'male', 'married', 'BLK 10 LOT 26 TAHANAN VILLAGE BRGY. SAN GABRIEL GMA CAVITE', '0', '0', '1983-1-15', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (324, 324, '20100207', NULL, 2, 38, 143, 'KRIZELLE', 'VALLESTEROS', 'ESGUERRA', 'cavite', 'regular', 'female', 'single', '9709 UNIT 2, MAGUYAM ROAD, MAGUYAM, SILANG, CAVITE', '0', '0', '1993-6-11', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (325, 325, '20600236', NULL, 2, 38, 140, 'RHOLEEN', NULL, 'MONTANO', 'cavite', 'agency', 'female', 'single', 'B13 LOT EXCESS, BRGY. CALIMAG, GMA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (326, 326, '21600253', NULL, 2, 38, 140, 'EUGENE', 'LALAS', 'ABEJO', 'cavite', 'agency', 'male', 'single', 'B-15 L-14 BRGY. CALIMAG GMA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (327, 327, '21100258', NULL, 2, 38, 141, 'JOAQUIN', 'ALCANTARA', 'BELA', 'cavite', 'regular', 'male', 'single', 'B8 L14 MAGNAGON BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (328, 328, '21100268', NULL, 2, 38, 143, 'AMIEL GRANT', 'CALAMIONG', 'SANTOS', 'cavite', 'regular', 'male', 'single', 'L9 BLK 9 ORANGE DR.KANAN GOODWILL 2 SUCAT PARAÑAQUE CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (329, 329, '21600276', NULL, 2, 38, 140, 'JASON', 'ALVAREZ', 'JAEN', 'cavite', 'agency', 'male', 'single', '555 MANAIG SITIO LOTE MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (330, 330, '21100290', NULL, 2, 38, 140, 'MARLON', 'SERAFICA', 'MAGNO', 'cavite', 'regular', 'male', 'single', '149 WALING WALING ST. L.E 2 VILLAGE BRGY CINCO, VILLA SILANGAN CALAMBA CITY LAGUNA', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (331, 331, '21100311', NULL, 2, 38, 150, 'LARA JANE', 'ARCENAL', 'FUENTES', 'cavite', 'regular', 'female', 'single', 'AREA J BLOCK 26 LOT 54 SEVERINO DELAS ALAS GMA, CAVITE', '0', '0', '1995-11-16', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (332, 332, '21600328', NULL, 2, 38, 139, 'BOBBY', 'PITAGARA', 'GALLENO', 'cavite', 'agency', 'male', 'single', 'MAGUYAM SILANG,CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (333, 333, '21100356', NULL, 2, 38, 143, 'ARA MAE', 'RUBIA', 'ALBALATE', 'cavite', 'regular', 'female', 'single', 'STO NIÑO STREET , 2ND DISTRICT (POB II) GAINZA, CAMARINES SUR', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (334, 334, '21100362', NULL, 2, 38, 150, 'EMIL', 'SENILLA', 'CHANTENGCO', 'cavite', 'regular', 'male', 'single', '#104 MAGUEY ROAD, BRGY. SAN ISIRO, ANTIPOLO CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (335, 335, '22600394', NULL, 2, 38, 146, 'RHUNEL', 'VILLANUEVA', 'CARRANTO', 'cavite', 'agency', 'male', 'single', 'PHASE 1B EXCESS LOT BRGY. ACACIA BULIHAN SILANG, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (336, 336, '22600410', NULL, 2, 38, 146, 'RONEL', 'BIBERA', 'BALURAN', 'cavite', 'agency', 'male', 'single', 'PANGANIBAN COMPOUND SITIO IBABA BRGY. MAGUYAM SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (337, 337, '22600421', NULL, 2, 38, 146, 'VICENTE', 'LINGAYA', 'FELICIANO', 'cavite', 'agency', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (338, 338, '22600444', NULL, 2, 38, 146, 'JERALD', 'RODRIGUEZ', 'BELLEN', 'cavite', 'agency', 'male', 'single', 'BLK 16 LOT ARELLANO ST. POBLACION 1 GMA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (339, 339, '22600450', NULL, 2, 38, 146, 'JOEMARX', 'DE GUZMAN', 'ALCALDE', 'cavite', 'agency', 'male', 'single', 'BRGY. PULIDO GMA, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (340, 340, '22100458', NULL, 2, 38, 141, 'MARK JOSEPH', 'AVILA', 'DELOS REYES', 'cavite', 'regular', 'male', 'single', '121 ALVARO ST. LAWA, OBANDO, BULACAN', '0', '0', '1994-5-22', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (341, 341, '14100055', NULL, 2, 39, 13, 'KATRINA JOYCE', 'TAN', 'CHUA', 'quezon_ave', 'regular', 'female', 'married', '39C MARIANO MARCOS COR BARCELONA ST BRGY MAYTUNAS SAN JUAN MM', '0', '0', '1992-9-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (342, 342, '19100116', NULL, 2, 12, 28, 'JOANNA MARIE', 'POLINTAN', 'BERNABE', 'quezon_ave', 'regular', 'female', 'married', '200 SOLI ST. SANGANDAAN, CALOOCAN CITY', '0', '0', '1991-9-5', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (343, 343, '20100216', NULL, 2, 12, 29, 'YVETTE MARIE', 'TEH', 'LIM', 'quezon_ave', 'regular', 'female', 'married', '3618 LINGAYEN STREET, STA MESA, MANILA', '0', '0', '1974-9-28', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (344, 344, '21600333', NULL, 2, 13, 36, 'ARLEN', 'BUNDUKIN', 'ENALDO', 'quezon_ave', 'agency', 'female', 'married', NULL, '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (345, 345, '22600514', NULL, 2, 13, 36, 'JOSEFINE', 'CO', 'BACNAON', 'quezon_ave', 'agency', 'female', 'married', '49 E. RODRIGUEZ SR AVE Q.C', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (346, 346, '17100093', NULL, 2, 17, 45, 'JUWIREX', 'TO', 'TIU', 'quezon_ave', 'regular', 'male', 'single', '411 REV AGLIPAY ST., BRGY. OLD ZANIGA, MANDALUYONG CITY', '0', '0', '1995-9-15', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (347, 347, '17100090', NULL, 2, 20, 56, 'ELAINE', 'GALLEGO', 'ROSALES', 'quezon_ave', 'regular', 'female', 'single', '1580 SAMAKA KAPALARAN BRGY. COMMONWEALTH, QUEZON CITY', '0', '0', '1996-10-19', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (348, 348, '15100068', NULL, 2, 22, 65, 'CALVIN', 'PUA', 'SY', 'quezon_ave', 'regular', 'male', 'single', '#75 IBA ST BRGY. STA. TERESITA QUEZON CITY', '0', '0', '1986-3-2', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (350, 350, '21100283', NULL, 2, 22, 62, 'MESIAHS', 'WENDAM', 'MAIZTEGUI', 'quezon_ave', 'regular', 'male', 'single', '2417 VISION ST. BRGY. 371, STA. CRUZ MANILA, METRO MANILA', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (349, 349, '21100257', NULL, 2, 22, 62, 'JOHN KENNETH', 'JUSTO', 'PEPITO', 'quezon_ave', 'regular', 'male', 'single', '#29 P.FLORENTINO ST. BRGY STO_DOMINGO QUEZON CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (351, 351, '21100287', NULL, 2, 22, 64, 'JOHN ROBERT', 'LIZARDO', 'QUE', 'quezon_ave', 'regular', 'male', 'single', '49 RAGANG STREET, BARANGAY MANRESA, QUEZON CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (353, 353, '22100427', '6318192', 2, 22, 63, 'PAUL JOHN', 'SOLANO', 'JUDAN', 'quezon_ave', 'regular', 'male', 'single', '#364 P. RIVERA ST., BRGY. SANGANDAAN, QUEZON CITY', '0', '0', '1998-6-20', '2022-5-23', NULL);
INSERT INTO "public"."tbl_employee" VALUES (352, 352, '21100317', NULL, 2, 22, 63, 'JOSHUA AJ', 'AMORANTO', 'UMALI', 'quezon_ave', 'regular', 'male', 'single', '1 STO. TOMAS ST. BRGY. DON MANUEL QUEZON CITY, METRO MANILA', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (355, 355, '22100481', NULL, 2, 22, 64, 'MICHAEL', 'AGUILAR', 'MARTINEZ', 'quezon_ave', 'probationary', 'male', 'single', 'POBLACION.SUR TALAVERA NUEVA ECIJA', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (354, 354, '22100461', NULL, 2, 22, 63, 'JOAQUIN SHAUGHN', 'BRITO', 'CHUA', 'quezon_ave', 'probationary', 'male', 'single', '867 TOMAS MAPUA STREET STA. CRUZ MANILA 1003', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (357, 357, '22100502', NULL, 2, 25, 72, 'VICTOR', 'ADRIANO', 'ALONZO', 'quezon_ave', 'regular', 'male', 'single', '116 LUWASAN STREET BALASING, STA. MARIA, BULACAN', '0', '0', '1982-4-12', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (356, 356, '16100080', NULL, 2, 25, 72, 'ALEXANDER', 'LAVIDES', 'CABIAS', 'quezon_ave', 'regular', 'male', 'married', '045 LOWER JASMIN STREET . BARANGAY PAYATAS A., QUEZON CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (358, 358, '3100018', NULL, 2, 36, 128, 'JUPITER', 'CUBE', 'VACAL', 'quezon_ave', 'regular', 'male', 'single', '730 INT. 21 B. BRGY. 604 BAGONG BAYAN, STA. MESA MANILA', '0', '0', '1966-11-6', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (359, 359, '10100039', NULL, 2, 36, 130, 'CHARLES ADRIAN DOMINIQUE', 'WU', 'ANG', 'quezon_ave', 'regular', 'male', 'single', '9/F , RM.903, RBMT BUILDING LESSOR, 5TH AVENUE ALONG C3 ROAD WEST GRACE PARK CALOOCAN CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (360, 360, '14100060', NULL, 2, 36, 130, 'DENNIS', 'RAMIREZ', 'GANANCIAL', 'quezon_ave', 'regular', 'male', 'married', '2 MAZARAGA ST. BRGY. TATALON QUEZON CITY', '0', '0', '1986-12-13', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (361, 361, '15100066', NULL, 2, 36, 127, 'MARIA LOURICE', 'ESCOBIDO', 'SANCHEZ', 'quezon_ave', 'regular', 'female', 'single', '730 INT 8-A BAGUMBAYAN ST. STA. MESA MANILA', '0', '0', '1992-8-5', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (362, 362, '15100069', NULL, 2, 36, 129, 'DERRICK', 'ONG', 'NG', 'quezon_ave', 'regular', 'male', 'married', '7 UNIT H EYMARD DRIVE KRISTONG HARI E. RODRIGUEZ QUEZON CITY', '0', '0', '1975-9-24', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (363, 363, '22100455', NULL, 2, 36, 130, 'PATRICK', 'SIY', 'CHUA', 'quezon_ave', 'regular', 'male', 'single', 'CELADON PARK TOWER 2 FELIX HUERTAS STREET STA.CRUZ TONDO MANILA', '0', '0', '1999-7-6', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (364, 364, '21100312', NULL, 2, 37, 136, 'RONIE', 'VILLASOR', 'TORREQUITE', 'quezon_ave', 'regular', 'male', 'single', 'SITIO TAGUISAN BAGONG NAYON ANTIPOLO CITY RZAL', '0', '0', '1982-11-4', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (365, 365, '87100007', NULL, 2, 38, 138, 'JERRY', 'SALAS', 'CASAR', 'quezon_ave', 'regular', 'male', 'married', '615 INT. O . BAG-BAG NOVALICHES QUEZON CITY', '0', '0', '1966-5-18', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (366, 366, '95100011', NULL, 2, 38, 138, 'METODIO', 'PELONIA', 'BONGOLTO', 'quezon_ave', 'regular', 'male', 'single', 'CLUSTER 3 MALUBAN TATALON QUEZON CITY', '0', '0', '1972-6-7', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (367, 367, '5100021', NULL, 2, 38, 142, 'CHRISTOPHER', 'SORIA', 'TABLATE', 'quezon_ave', 'regular', 'male', 'single', '356 SAINT PAUL STREET REPUBLIC AVENUE BRGY HOLY SPIRIT QUEZON CITY', '0', '0', '1979-5-12', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (368, 368, '6100025', NULL, 2, 38, 138, 'REXLY', 'CASAR', 'CATAGGATAN', 'quezon_ave', 'regular', 'male', 'single', '208 PUROK SILANGAN BRGY. DELA PAZ', '0', '0', '1985-11-14', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (369, 369, '10100035', NULL, 2, 38, 138, 'RHAD', 'EUGENIO', 'FRIAS', 'quezon_ave', 'regular', 'male', 'married', '#76 SAMARAL ST. 5TH FLOOR BRGY. TATALON QUEZON CITY', '0', '0', '1987-2-7', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (370, 370, '10100036', NULL, 2, 38, 140, 'ROWEN', 'CAÑA', 'ESQUILLO', 'quezon_ave', 'regular', 'male', 'single', '76 SAMARAL ST. BRGY TATALON QUEZON CITY', '0', '0', '1985-9-18', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (371, 371, '13100045', NULL, 2, 38, 140, 'ARNIEL', 'AYACAIDE', 'ABALLE', 'quezon_ave', 'regular', 'male', 'married', '#22 BMA ST. TATALON QUEZON CITY', '0', '0', '1987-9-29', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (372, 372, '16100084', NULL, 2, 38, 139, 'MARVIN', 'MOSTAJO', 'ARGALLON', 'quezon_ave', 'regular', 'male', 'married', 'BLK 51 LOT 18 CRISTOBAL ST PHASE 1 DELA COSTA 5 SUBD. BRGY BURGOS RODRIGUEZ RIZAL', '0', '0', '1977-4-26', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (373, 373, '16100085', NULL, 2, 38, 137, 'ARNEL', 'CATIMBANG', 'VERGARA', 'quezon_ave', 'regular', 'male', 'single', '0601 BARANGAY PALANGUE 3, NAIC, CAVITE', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (374, 374, '21100286', NULL, 2, 38, 139, 'BENJAR', 'ORTEGA', 'RAMOS', 'quezon_ave', 'regular', 'male', 'single', '76 SAMARAL ST. BRGY TATALON, QUEZON CITY', '0', '0', '1993-12-8', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (376, 376, '22100405', NULL, 2, 38, 146, 'JOHNRESTY', 'ADESAS', 'TALINGDAN', 'quezon_ave', 'regular', 'male', 'single', '#550 BLK1 BRGY 649 GASANGAN BASECO PORT AREA MANILA', '0', '0', '1998-9-25', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (377, 377, '22100425', NULL, 2, 38, 137, 'DANILO', 'LUZON', 'NAVARRO', 'quezon_ave', 'regular', 'male', 'married', 'POOK PAG-ASA BLK 4 BATASAN HILLS QUEZON CITY', '0', '0', '1961-8-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (375, 375, '22100459', NULL, 2, 38, 139, 'BERNABE', 'SAMBAYON', 'NARRA', 'quezon_ave', 'regular', 'male', 'married', '394 EAGLE ST. SITIO VETERANS AREA 2 BAGONG SILANGAN QUEZON CITY.', '0', '0', '1988-2-3', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (378, 378, '16100081', NULL, 2, 9, 16, 'ELYANNA MYRA', 'ANDAL', 'PASCUAL', 'sto_domingo', 'regular', 'female', 'single', '400B PASCUAL STREET, COLOONG 2 VALENZUELA CITY', '0', '0', '1995-6-20', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (379, 379, '18100106', NULL, 2, 9, 16, 'MICHELLE', 'ADESAS', 'TALINGDAN', 'sto_domingo', 'regular', 'female', 'single', '43 POOK DELA PAZ ST.,BRGY. MATANDANG BALARA, QUEZON CITY', '0', '0', '1997-10-20', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (380, 380, '19100137', NULL, 2, 9, 16, 'RICHELLE', 'LAYCO', 'SILVERIO', 'sto_domingo', 'regular', 'female', 'single', 'LOT 48 BLK 18 BRGY. 28 CALOOCAN CITY', '0', '0', '2023-2-27', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (381, 381, '19100142', NULL, 2, 9, 14, 'JOHN ROBERT', 'AVENDAÑO', 'CRISOSTOMO', 'sto_domingo', 'regular', 'male', 'married', '176 C. SANTOS ST. PANGHULO OBANDO, BULACAN', '0', '0', '1988-5-24', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (382, 382, '19100143', NULL, 2, 9, 16, 'JOANNA', 'MALTE', 'DE GUZMAN', 'sto_domingo', 'regular', 'female', 'single', 'NO. 12 JORDAN ST. CLEMENTE SUBD, BRGY. SAN AUSTIN, NOVALICHES, QUEZON CITY', '0', '0', '1998-8-30', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (383, 383, '22100423', NULL, 2, 9, 15, 'BETTY', 'YAO', 'LEE', 'sto_domingo', 'regular', 'female', 'single', '66 UNIT 512 MOLAVE ST. DUYAN DUYAN QUEZON CITY', '0', '0', '1949-12-19', '2023-2-27', NULL);
INSERT INTO "public"."tbl_employee" VALUES (384, 384, '97100012', NULL, 2, 10, 18, 'EMELYN', 'PALOMARES', 'CORCINO', 'sto_domingo', 'regular', 'female', 'married', 'LOT4 BLK21 PH3 ST. AGATHA HOMES, BRGY. TIKAY, MALOLOS CITY', '0', '0', '1975-6-17', '2023-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (385, 385, '19100157', NULL, 2, 10, 19, 'ROSCEL', 'PALOMO', 'PADUA', 'sto_domingo', 'regular', 'female', 'married', '22 ROSE ST. BRGY. HOLY SPIRIT, QUEZON CITY', '0', '0', '1989-3-23', '2023-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (386, 386, '22100457', NULL, 2, 10, 18, 'ROSALIE', 'TADEJA', 'SAN JUAN', 'sto_domingo', 'regular', 'female', 'single', '66 FAUSTA VILLAGE ABANGAN SUR MARILAO BULACAN', '0', '0', '2023-2-28', '2023-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (387, 387, '13100052', NULL, 2, 11, 25, 'ELVIRA', 'PALMARIA', 'AYURO', 'sto_domingo', 'regular', 'female', 'single', 'UNIT 410 PARKLANE TOWER, ROCHESTER CONDOMINIUM, 1601 ELISCO ROAD', '0', '0', '1954-6-25', '2023-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (388, 388, '19100126', NULL, 2, 11, 24, 'MARIA CRISTINA', 'GENETA', 'BIGAYAN', 'sto_domingo', 'regular', 'female', 'married', '0396 UNIT A CATALINA ST. DE CASTRO COMPOUND STA. QUITERIA CALOOCAN CITY', '0', '0', '1994-10-20', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (389, 389, '19100132', NULL, 2, 11, 20, 'MERO FE', 'AGOS', 'DELA CRUZ', 'sto_domingo', 'regular', 'female', 'married', 'BLOCK 2 LOT 23 VILLA LIBRADA BRGY. SAN JOSE PLARIDEL, BULACAN', '0', '0', '1986-9-11', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (390, 390, '19100135', NULL, 2, 11, 22, 'CHARMAINE KAYE', 'ASEO', 'REGIS', 'sto_domingo', 'regular', 'female', 'single', 'BLK 6 LOT 15 EMERALD STREET STA CECILIA SUBDIVISION GUITNANG BAYAN 1 SAN MATEO RIZAL', '0', '0', '1997-12-25', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (391, 391, '19100139', NULL, 2, 11, 23, 'MARIA VICTORIA', 'ESTRADA', 'ARANTE', 'sto_domingo', 'regular', 'female', 'married', '49 DON PEDRO MALASIQUI, PANGASINAN', '0', '0', '1996-11-6', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (392, 392, '19100140', NULL, 2, 11, 21, 'ROXANNE LEA MAE', 'QUINTERO', 'ATIENZA', 'sto_domingo', 'regular', 'female', 'single', '#3 LIPTON 2 ST. FILINVEST II BATASAN HILLS QUEZON CITY', '0', '0', '1997-6-7', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (393, 393, '19100153', NULL, 2, 11, 24, 'JOHN ABEL', 'YRAG', 'TIBANG', 'sto_domingo', 'regular', 'male', 'single', '20A CATTLEYA STREET IVC MARIKINA CITY', '0', '0', '1997-9-1', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (394, 394, '22100364', NULL, 2, 11, 25, 'ARSENIO', 'FLORES', 'FLORES', 'sto_domingo', 'regular', 'male', 'married', 'ROCHESTER GARDEN PARKLANE TOWER ELISCO ROAD BRGY. SAN JOAQUIN PASIG CITY', '0', '0', '1979-11-20', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (395, 395, '22100388', NULL, 2, 11, 26, 'HEIRESS', 'FERNANDEZ', 'HORTELANO', 'sto_domingo', 'regular', 'female', 'single', 'BLK 43 LOT 3 & 5 CARISSA HOMES EAST 2 DALIG TERESA RIZAL PHILIPPINES', '0', '0', '1993-10-13', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (398, 398, '22600435', NULL, 2, 13, 36, 'JOVELYN', NULL, 'ENSENARES', 'sto_domingo', 'agency', 'female', 'single', 'ELDORADO DULO BRGY DON BOSO PARAÑAQUE CITY', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (397, 397, '22600429', NULL, 2, 13, 36, 'MICHELLE', 'CAÑOLAS', 'TUTOR', 'sto_domingo', 'agency', 'female', 'single', '4871 LOWER BAYANIHAN COMMONWEALTH QUEZON CITY', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (396, 396, '21600363', NULL, 2, 13, 36, 'EMILY', 'CABAYLO', 'DEXIMO', 'sto_domingo', 'agency', 'female', 'single', NULL, '0', '0', '2023-2-28', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (399, 399, '22600447', NULL, 2, 13, 36, 'EDISON', 'NERSA', 'SAN JOSE', 'sto_domingo', 'agency', 'male', 'single', 'B-59 L-16 VILLA LUISA BAGUMBONG CALOOCAN CITY', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (400, 400, '22800463', NULL, 2, 13, 35, 'HERMOGENES', NULL, 'KUIZON', 'sto_domingo', 'probationary', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (401, 401, '22800464', NULL, 2, 13, 35, 'JEROME', NULL, 'OBORDO', 'sto_domingo', 'probationary', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (402, 402, '22800465', NULL, 2, 13, 35, 'ROBERTO', NULL, 'RIGUER', 'sto_domingo', 'probationary', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (403, 403, '22800466', NULL, 2, 13, 35, 'RENE', NULL, 'FERNANDEZ', 'sto_domingo', 'probationary', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (404, 404, '22600467', NULL, 2, 13, 36, 'MARIANO', NULL, 'DELA CRUZ', 'sto_domingo', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (405, 405, '22600468', NULL, 2, 13, 36, 'JONATHAN', NULL, 'VALERCO', 'sto_domingo', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (406, 406, '22600469', NULL, 2, 13, 36, 'JOEBEL', NULL, 'BELLOJAN', 'sto_domingo', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (407, 407, '22600470', NULL, 2, 13, 36, 'ALEX', NULL, 'CANDIA', 'sto_domingo', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (408, 408, '22800475', NULL, 2, 13, 34, 'GONZALO', 'LIM', 'GARCIA', 'sto_domingo', 'regular', 'male', 'single', 'BLK 18 LOT 4 KARLAVILLE SUBD. WAWA 3 ROSARIO CAVITE', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (409, 409, '22800476', NULL, 2, 13, 34, 'LEONARDO', 'DELA FUENTE', 'DEMINGOY', 'sto_domingo', 'regular', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (410, 410, '22600513', NULL, 2, 13, 36, 'FERNANDO', 'JANINE', 'CABALLES', 'sto_domingo', 'agency', 'male', 'single', NULL, '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (411, 411, '17100088', NULL, 2, 14, 39, 'JOHN REY', 'SUNGA', 'MASANQUE', 'sto_domingo', 'regular', 'male', 'married', '15# ANDRADE ST. BALINGSA, QUEZON CITY, METRO MANILA', '0', '0', '2023-2-28', '2017-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (412, 412, '19100130', NULL, 2, 14, 39, 'JUSTIN JHON', 'CASTICIMO', 'CORPUZ', 'sto_domingo', 'regular', 'male', 'single', '3RD FLOOR 1724 VICENTE CRUZ CORNER ESPAÑA SAMPALOC MANILA', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (413, 413, '19100134', NULL, 2, 14, 37, 'KENNETH', 'SANTOS', 'PARAGUISON', 'sto_domingo', 'regular', 'male', 'single', 'BLK 16 LOT 21 BRGY. SAN ANTONIO DE PADUA 2, DASMARIÑAS CITY, CAVITE.', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (414, 414, '22100453', NULL, 2, 14, 38, 'JOHN ERICSON', 'FACTORAN', 'RASOS', 'sto_domingo', 'regular', 'male', 'single', 'B8 L8 4TH STREET BREEZEWOODS 3 MAMBOG 3 BACOOR CITY, CAVITE', '0', '0', '2000-2-8', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (415, 415, '22100490', NULL, 2, 14, 38, 'RYAN', 'LACSA', 'FRANCISCO', 'sto_domingo', 'regular', 'male', 'single', '31 G. MOLINA ST., CANUMAY EAST VALENZUELA CITY', '0', '0', '2000-5-23', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (416, 416, '14100057', NULL, 2, 15, 40, 'REY', 'RECOPERTO', 'MONTANO', 'sto_domingo', 'regular', 'male', 'married', 'LOT 2A BLK3 JASMINE ST. DONA MARCIA A SUBD. BRGY. UGONG VALENZUELA CITY', '0', '0', '1976-9-16', '2014-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (417, 417, '16100086', NULL, 2, 15, 41, 'AL DIHN', 'TORRENUEVA', 'MIRADORA', 'sto_domingo', 'regular', 'male', 'married', '93 SUNFLOWER ST. GREENHEIGHTS NEWTOWN 1A SUBD. MAYAMOT ANTIPOLO CITY.', '0', '0', '1993-9-15', '2016-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (418, 418, '18100103', NULL, 2, 15, 41, 'ROWELL', 'NOBLEZA', 'SULPICO', 'sto_domingo', 'regular', 'male', 'single', '67 P FLORENTINO STREET, SANTA MESA HEIGHTS, QUEZON CITY', '0', '0', '2023-2-28', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (419, 419, '22100406', NULL, 2, 15, 41, 'NEIL', 'MICALLER', 'LONGNO', 'sto_domingo', 'regular', 'male', 'single', '15332 ST. FRANCIS STREET SAN AGUSTIN VILLAGE BRGY. MOONWALK PARAÑAQUE CITY', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (420, 420, '22100452', NULL, 2, 15, 41, 'MARK GENESIS', 'LEQUIT', 'GENIO', 'sto_domingo', 'regular', 'male', 'single', '4628 MOLINA ST., BRGY. POBLACION, MAKATI CTY', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (421, 421, '22100479', NULL, 2, 15, 41, 'ENARD SERIL', 'BAYANGOS', 'MARQUEZ', 'sto_domingo', 'regular', 'male', 'single', '#38 SAMPAGUITA STREET, C.V.S, PORO, CITY OF SAN FERNANDO, LA UNION', '0', '0', '1999-6-2', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (422, 422, '16100082', NULL, 2, 17, 48, 'MA LUISA', 'ANTONIO', 'LAURENTE', 'sto_domingo', 'regular', 'female', 'single', '#19 ALIBANGBANG ST. VETERANS VILLAGE, PROJECT 7, QUEZON CITY', '0', '0', '1996-10-1', '2016-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (423, 423, '19100128', NULL, 2, 17, 45, 'ANDREW', 'BALUDIO', 'CAMIROS', 'sto_domingo', 'regular', 'male', 'single', '24 VICTORY AVE., TATALON, QUEZON CITY', '0', '0', '1989-5-31', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (424, 424, '19100146', NULL, 2, 17, 45, 'RAINFREDO', 'MAMAYSON', 'MARRA', 'sto_domingo', 'regular', 'male', 'single', '#35 TEBUEL MANAOAG PANGASINAN', '0', '0', '1990-6-15', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (425, 425, '22100477', NULL, 2, 17, 46, 'LEO ROCHESTER', 'TOMAS', 'BERGONIA', 'sto_domingo', 'regular', 'male', 'single', 'BGRY. STO. CRISTO GUIMBA, NUEVA ECIJA', '0', '0', '1998-5-3', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (426, 426, '22100426', NULL, 2, 18, 50, 'KAVIN', 'LIM', 'ROSIOS', 'sto_domingo', 'regular', 'male', 'single', '58 KING FERDINAND ST KINGSPOINT BAGBAG NOVALICHES QUEZON CITY', '0', '0', '1997-12-8', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (428, 428, '21100330', NULL, 2, 20, 54, 'JOANNA-MARIE', 'SAURE', 'AMARO', 'sto_domingo', 'regular', 'female', 'single', '63 B. TABING ILOG ST. KAINGIN BUKID BRGY. APOLONIO SAMSON QUEZON CITY', '0', '0', '1997-10-1', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (427, 427, '20100215', NULL, 2, 20, 55, 'IVY', 'QUA', 'ANANO', 'sto_domingo', 'regular', 'female', 'married', '1367 QUIRICADA ST. BRGY. 331 STA. CRUZ, MANILA', '0', '0', '1989-11-7', '2020-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (429, 429, '22100392', NULL, 2, 20, 54, 'KIMBERLY', 'PIAMONTE', 'PITOGO', 'sto_domingo', 'regular', 'female', 'single', 'ZONE 3 BUENAVISTA SAN FERNANDO CAMARINES SUR', '0', '0', '1997-11-29', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (431, 431, '21100284', NULL, 2, 21, 58, 'MAE ANNE', 'RIVERA', 'DIMAANO', 'sto_domingo', 'regular', 'female', 'single', '1421-A. FELIX HUERTAS ST. STA. CRUZ, MANILA', '0', '0', '2023-2-28', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (430, 430, '19100117', NULL, 2, 21, 60, 'RIO', 'RUEDA', 'DELA CRUZ', 'sto_domingo', 'regular', 'female', 'single', '111 ACERO ST. TUGATOG, MALABON CITY', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (432, 432, '21100331', NULL, 2, 21, 61, 'MARY ROSE', 'GACER', 'DE ASIS', 'sto_domingo', 'regular', 'female', 'single', 'SAN JOSE HEIGHTS BRGY. MUZON CSJDM BULACAN', '0', '0', '1996-11-18', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (433, 433, '22100365', NULL, 2, 21, 57, 'HIEDE', 'RECABAR', 'MIRANDA', 'sto_domingo', 'regular', 'female', 'single', 'BLK 11 LOT 23 DAMA DE NOCHE ST. DURAVILLE HOMES AMPID 1 SAN MATEO, RIZAL', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (434, 434, '22100456', NULL, 2, 21, 57, 'RAYMOND', 'PARDILLO', 'YBAÑEZ', 'sto_domingo', 'regular', 'male', 'married', '606 6D GEN DE JESUS, BRGY LITTLE BAGUIO SAN JUAN CITY', '0', '0', '1988-9-1', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (435, 435, '21100322', NULL, 2, 22, 64, 'JOSE', 'CABANG', 'LAPUZ', 'sto_domingo', 'regular', 'male', 'married', '148 FABRE CMPD. PHILAND BRGY. PASONG TAMO QUEZON CITY 1107', '0', '0', '1987-4-17', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (436, 436, '15100074', NULL, 2, 23, 67, 'JOB WINSTON', 'SORIANO', 'PUA', 'sto_domingo', 'regular', 'male', 'single', '1142 LA TORRE STREET TONDO MANILA', '0', '0', '1994-1-9', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (437, 437, '16100079', NULL, 2, 23, 66, 'JACKQUELYN', 'SANTOS', 'PANDARAOAN', 'sto_domingo', 'regular', 'female', 'married', 'BLK 4 LOT 20 PCUP RPG VILLE ANTIPOLO RIZAL', '0', '0', '1992-10-2', '2016-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (438, 438, '16100083', NULL, 2, 23, 68, 'FRANCIS', 'LIM', 'CO', 'sto_domingo', 'regular', 'male', 'single', '7-L EYMARD DRIVE E.RODRIGUEZ Q C', '0', '0', '1971-1-11', '2016-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (439, 439, '18100104', NULL, 2, 23, 66, 'LOVELY', 'BUGAYONG', 'MISALANG', 'sto_domingo', 'regular', 'female', 'single', '#217 FERNANDEZ ST. BRGY. SAN ANTONIO QUEZON CITY', '0', '0', '1992-12-4', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (440, 440, '21100252', NULL, 2, 23, 66, 'JENNY', 'TEVES', 'DUQUE', 'sto_domingo', 'regular', 'female', 'single', '091 SAN JUAN ST. OLIVEROS COMPOUND, MAYAMOT ANTIPOLO CITY', '0', '0', '2023-2-28', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (441, 441, '22100501', NULL, 2, 23, 66, 'SHEENA MARIE', 'DE VILLA', 'ESTOLAS', 'sto_domingo', 'regular', 'female', 'single', 'SAN TEODORO, MABINI, BATANGAS', '0', '0', '1999-9-6', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (442, 442, '15100070', NULL, 2, 32, 109, 'KIMBERLY', 'TIU', 'NG', 'sto_domingo', 'regular', 'female', 'married', '7 UNIT H EYMARD DRIVE KRISTONG HARI E. RODRIGUEZ QUEZON CITY', '0', '0', '1983-3-23', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (443, 443, '19100113', NULL, 2, 32, 110, 'RUTH', 'DAYAO', 'MANGALI', 'sto_domingo', 'regular', 'female', 'single', '229 1-B SECOND ST. BRGY. II, GENERAL LUNA, CALOOCAN CITY', '0', '0', '1990-3-16', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (444, 444, '19100152', NULL, 2, 32, 110, 'PAULA JALYN', NULL, 'SERVANDO', 'sto_domingo', 'regular', 'female', 'single', 'BLK. 33A LOT 7 PH3 F1 DAGAT-DAGATAN, CALOOCAN CITY', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (445, 445, '18100320', NULL, 2, 32, 111, 'AURORA', 'FRANCISCO', 'DUAZO', 'sto_domingo', 'regular', 'female', 'widow', '1221 PIEDAD ST UNIT 9D CRYSTAL PLAZA CONDO ,BINONDO, MANILA', '0', '0', '1956-8-18', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (446, 446, '22100451', NULL, 2, 32, 110, 'SHEILA MAE', 'NISPEROS', 'CASUGA', 'sto_domingo', 'regular', 'female', 'single', '#15-A GEMINI ST. PH-3B, BRGY. PEREZ, STO. NINO, MEYCAUAYAN, BULACAN', '0', '0', '1995-4-14', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (448, 448, '19100155', NULL, 2, 33, 114, 'ARON JAMES', 'BUSTILLO', 'ALILIO', 'sto_domingo', 'regular', 'male', 'single', 'PUROK 9, LALAAN 2ND, SILANG, CAVITE', '0', '0', '1994-9-15', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (447, 447, '17100089', NULL, 2, 33, 113, 'JAIR WILHELM', 'PAAS', 'GRAJO', 'sto_domingo', 'regular', 'male', 'single', '1560 LEON GUINTO SR. ST. ERMITA MANILA BRGY. 675 ZONE 73', '0', '0', '1994-9-30', '2017-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (449, 449, '21100310', NULL, 2, 33, 112, 'JESSIE', 'MARTINEZ', 'RAMISAN', 'sto_domingo', 'regular', 'male', 'single', 'BLK 28 LOT 22 PHASE 2A SAN JOSE HEIGHTS,BRGY. MUZON CSJDM BULACAN', '0', '0', '1997-10-11', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (450, 450, '15100071', NULL, 2, 34, 115, 'OLIVER', 'HIZON', 'GABIOLA', 'sto_domingo', 'regular', 'male', 'married', '65B KAINGIN ROAD, BRGY. APOLONIO SAMSON, QUEZON CITY 1106', '0', '0', '1988-9-25', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (451, 451, '15100072', NULL, 2, 34, 116, 'EVANGELINE', 'FLORES', 'LLORERA', 'sto_domingo', 'regular', 'female', 'single', '6225 SANTAN ST. POULTRY COMPOUND SAN DIONISIO PARAÑAQUE CITY', '0', '0', '1992-5-4', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (452, 452, '15100073', NULL, 2, 34, 120, 'ERWIN', 'DE JESUS', 'DELFIN', 'sto_domingo', 'regular', 'male', 'married', 'BLOCK 9A LOT 18 PHASE III C BRGY 20 CALOOCAN CITY', '0', '0', '1982-4-24', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (453, 453, '15100075', NULL, 2, 34, 118, 'ARVEE', 'NAGA', 'CESTINA', 'sto_domingo', 'regular', 'male', 'single', '#578 APARTMENT 1B PROTACIO STREET BARANGAY 114, PASAY CITY', '0', '0', '2023-2-28', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (454, 454, '19100115', NULL, 2, 34, 118, 'BRIA RODORA', 'PALISOC', 'SO', 'sto_domingo', 'regular', 'female', 'single', '17B MAPLE TOWER, PGMH, PENAFRANCIA ST., PACO MLA', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (455, 455, '19100127', NULL, 2, 34, 118, 'LOUIE ALFRED', 'HORTILANO', 'BRES', 'sto_domingo', 'regular', 'male', 'single', 'B23 L8 CARISSA 5A BRGY.KAYIAN CITY OF SAN JOSE DEL MONTE BULACAN', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (456, 456, '21100272', NULL, 2, 34, 117, 'LAURA LUISA', 'MALZAN', 'AGUILAR', 'sto_domingo', 'regular', 'female', 'single', '1026 BOHOL ST. BRGY 561 BALIC-BALIC, SAMPALOC, MANILA', '0', '0', '1997-9-20', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (457, 457, '15100379', NULL, 2, 34, 119, 'ADRIANO', 'MORALES', 'MAGCALAS', 'sto_domingo', 'regular', 'male', 'single', '#54 8TH ST. NEW MANILA, QUEZON CITY', '0', '0', '2023-2-28', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (458, 458, '15100076', NULL, 2, 35, 124, 'LAARNIE', 'MARIANO', 'GONZALES', 'sto_domingo', 'regular', 'female', 'married', 'UNIT 2 #304 15TH AVE., BRGY. SILANGAN, Q.C.', '0', '0', '1977-7-13', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (459, 459, '17100094', NULL, 2, 35, 123, 'MICHAEL VINCENT', 'BISMONTE', 'GARCIA', 'sto_domingo', 'regular', 'male', 'single', '83 NICANOR RAMIREZ ST. QUEZON CITY', '0', '0', '1991-9-7', '2017-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (460, 460, '18100095', NULL, 2, 35, 125, 'ELAINE', 'GONZALES', 'BELARMINO', 'sto_domingo', 'regular', 'female', 'single', '62 SENATOR NEPTALI GONZALES ST. BRGY HARAPIN ANG BUKAS MANDALUYONG CITY', '0', '0', '1986-11-27', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (461, 461, '18100096', NULL, 2, 35, 121, 'CARL JHON', 'CALBONE', 'ESTELLA', 'sto_domingo', 'regular', 'male', 'single', '27C BRGY DONA JOSEFA E-RODRIGUEZ SR. AVE.QUEZON CITY', '0', '0', '1990-6-15', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (462, 462, '18100097', NULL, 2, 35, 124, 'JIMMY', 'BAUTISTA', 'DELA CRUZ', 'sto_domingo', 'regular', 'male', 'married', '#4 VENUS ST. MERALCO VILL. BRGY. BATIA BOCAUE BULACAN', '0', '0', '1976-8-6', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (463, 463, '18100098', NULL, 2, 35, 126, 'WILMER', 'PASCUAL', 'COVITA', 'sto_domingo', 'regular', 'male', 'married', 'BLK 16 LOT 9, QC VILLE TOWNHOMES, CENTRAL AVE., CULIAT, QUEZON CITY', '0', '0', '1976-1-16', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (464, 464, '18100102', NULL, 2, 35, 123, 'ANGELEA', 'VERDUN', 'AMAY', 'sto_domingo', 'regular', 'female', 'single', '54 PUROK 4A LUZON AVENUE, QUEZON CITY', '0', '0', '1991-1-25', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (465, 465, '19100119', NULL, 2, 35, 121, 'REGINE', 'PINCA', 'VALLESTEROS', 'sto_domingo', 'regular', 'female', 'single', '66 D BONIFACIO ST. CANUMAY EAST VALENZUELA CITY', '0', '0', '1997-5-10', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (466, 466, '13100053', NULL, 2, 37, 133, 'MARC JOSHUA', 'PERALTA', 'NATIVIDAD', 'sto_domingo', 'regular', 'male', 'single', 'BLK 66 LOT 16 PHASE 3 UPPER BICUTAN TAGUIG CITY METRO MANILA', '0', '0', '1991-6-30', '2013-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (467, 467, '14100056', NULL, 2, 37, 135, 'JOSE', 'FERRERAS', 'BERCASIO', 'sto_domingo', 'regular', 'male', 'married', 'BLK 60 LOT 3 PHASE 10 WILLINGTON PLACE PASONG CAMACHILE 2 GENERAL TRIAS CAVITE', '0', '0', '1981-9-20', '2014-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (468, 468, '15100077', NULL, 2, 37, 133, 'AVELINO', 'ALNAS', 'MALAPIT', 'sto_domingo', 'regular', 'male', 'single', '07 CEBU ST. PAEL SUBDIVISION BRGY. CULIAT QUEZON CITY', '0', '0', '2023-2-28', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (469, 469, '18100099', NULL, 2, 37, 133, 'WILIHITO', 'BAYLOSIS', 'TUMULAK', 'sto_domingo', 'regular', 'male', 'single', 'PHASE 2 151 BENITEZ ST BF HOMES PARAÑAQUE CITY', '0', '0', '2023-2-28', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (470, 470, '18100100', NULL, 2, 37, 134, 'ALVIN', 'TOMACAS', 'ARENAS', 'sto_domingo', 'regular', 'male', 'married', 'BLK 3 LOT 3, 81 MAKATURING ST. BARANGKA ITAAS, MANDALUYONG CITY', '0', '0', '1983-11-29', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (471, 471, '18100101', NULL, 2, 37, 135, 'DARIO', 'ANGELES', 'VILLAZOR', 'sto_domingo', 'regular', 'male', 'single', '14 CUCURBITA ST. ST. DOMINIC 6, TANDANG SORA, QUEZON CITY', '0', '0', '1983-4-14', '2018-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (472, 472, '19100112', NULL, 2, 37, 133, 'JOSEPH ANTHONY', 'PINEDA', 'MANANSALA', 'sto_domingo', 'regular', 'male', 'single', 'BLK 5 LOT 1,3-7 PHASE 2 STERLING TECHNOPARK BRGY LANTIC CARMONA CAVITE', '0', '0', '1995-8-8', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (473, 473, '19100118', NULL, 2, 37, 133, 'SALACNIB', 'TATSON', 'VILLA', 'sto_domingo', 'regular', 'male', 'single', 'CABARAMBANAN GINAIT ILOCOS SUR', '0', '0', '1954-6-14', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (474, 474, '19100133', NULL, 2, 37, 133, 'KEVIN LEXTER', 'LABARENTO', 'OCAY', 'sto_domingo', 'regular', 'male', 'single', '128 CITYLAND PIONEER, HIGHWAY HILLS, MANDALUYONG CITY', '0', '0', '2023-2-28', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (475, 475, '19100141', NULL, 2, 37, 132, 'SHERWIN', 'VICENTE', 'CABAYA', 'sto_domingo', 'regular', 'male', 'married', '#932 PRUDENCIO ST., ESPAÑA, SAMPALOC, MANILA', '0', '0', '1992-5-9', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (476, 476, '21100313', NULL, 2, 37, 131, 'JAN REI', 'YABUT', 'ALMONICAR', 'sto_domingo', 'regular', 'male', 'single', '1240 CRISTOBAL ST. SAMPALOC, MANILA', '0', '0', '2023-2-28', '2021-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (477, 477, '22100500', NULL, 2, 37, 133, 'PAOLO', 'COLMENAR', 'ESGUERRA', 'sto_domingo', 'regular', 'male', 'single', 'SANTA CLARA, GENERAL TRIAS, CAVITE', '0', '0', '2023-2-28', '2022-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (480, 480, '11100041', NULL, 2, 38, 140, 'DRAN-REV', 'DUCANES', 'MAGBANUA', 'sto_domingo', 'regular', 'male', 'single', '#2 BLK 10 SAMPAGUITA ST STA. LUCIA PHASE 6 BRGY.PUNTURIN VALENZUELA CITY', '0', '0', '1987-12-9', '2011-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (479, 479, '6100028', NULL, 2, 38, 140, 'CATALINO', 'MANTALABA', 'CAPUYAN', 'sto_domingo', 'regular', 'male', 'single', 'BLK.8 BRGY. GUMAOK CENTRAL SJDM BULACAN', '0', '0', '1982-11-25', '2006-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (478, 478, '6100027', NULL, 2, 38, 142, 'CHARLIE', 'MEDINA', 'MACATUNO', 'sto_domingo', 'regular', 'male', 'single', '#16 CLUSTER3 MANUNGGAL ST.BRGY.TATALON Q,CITY', '0', '0', '1982-4-15', '2006-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (481, 481, '12100044', NULL, 2, 38, 140, 'AURELIO', 'ENGO', 'BALUYOT', 'sto_domingo', 'regular', 'male', 'married', '11 SAN LORENZO AT PAYATAS A QUEZON CITY', '0', '0', '1981-10-29', '2012-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (482, 482, '14100054', NULL, 2, 38, 142, 'EDUARDO', NULL, 'BUHIAN', 'sto_domingo', 'regular', 'male', 'single', '22 BMA ST. BRGY TATALON QUEZON CITY', '0', '0', '1994-10-28', '2014-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (483, 483, '14100058', NULL, 2, 38, 144, 'LEO', 'HISARZA', 'DUQUE', 'sto_domingo', 'regular', 'male', 'married', '93 GENERAL AVE BRGY TANDANG SORA QC', '0', '0', '1988-8-26', '2014-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (484, 484, '15100064', NULL, 2, 38, 138, 'PABLO', 'BOLORON', 'ARADO', 'sto_domingo', 'regular', 'male', 'single', '86F 17TH STREET DOÑA JUANA RODRIGUEZ BRGY. KRISTONG HARI Q.C.', '0', '0', '1969-8-13', '2015-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (485, 485, '19100131', NULL, 2, 38, 139, 'JAID', 'ANTIVO', 'DAGATAN', 'sto_domingo', 'regular', 'male', 'married', '2917A BAUTISTA ST. PUNTA STA.ANA MANILA', '0', '0', '1990-7-22', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (486, 486, '19100136', NULL, 2, 38, 140, 'ROGER', 'ABELLANA', 'RIVERA', 'sto_domingo', 'regular', 'male', 'married', '#364 RIVERA COMPD,BRGY SANGANDAAN QUEZON CITY', '0', '0', '1988-4-9', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (487, 487, '19100138', NULL, 2, 38, 140, 'JOEL', 'FAILANO', 'VALDEZ', 'sto_domingo', 'regular', 'male', 'married', 'BLK. 10 GUMAOC WEST CITY OF SAN JOSE DEL MONTE BULACAN', '0', '0', '1974-8-18', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (488, 488, '19100144', NULL, 2, 38, 139, 'GEORGE', 'VILLARAZA', 'FERNANDEZ', 'sto_domingo', 'regular', 'male', 'single', 'AREA 5A SITIO, CABUYAO, SAUYO, NOVALICHES, QUEZON CITY', '0', '0', '1989-9-10', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (489, 489, '19100145', NULL, 2, 38, 139, 'NELSON', 'ARONG', 'LAAG', 'sto_domingo', 'regular', 'male', 'married', '#71 BRGY. MAHARLIKA QUEZON CITY', '0', '0', '1980-10-9', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (490, 490, '19100147', NULL, 2, 38, 140, 'TEOFILO', 'PELAEZ', 'PALLES', 'sto_domingo', 'regular', 'male', 'married', '14 UNIVERSITY AVENUE EXIT POTRERO MALABON CITY', '0', '0', '1965-7-22', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (491, 491, '19100148', NULL, 2, 38, 140, 'SERGIO', 'ELAGO', 'RACAZA', 'sto_domingo', 'regular', 'male', 'married', '#5 STA. FE ST. RIO GARDEN HOMES LAS PIÑAS CITY', '0', '0', '1976-9-29', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (492, 492, '19100149', NULL, 2, 38, 140, 'ROLYNAR', 'SANCHEZ', 'RAPOLE', 'sto_domingo', 'regular', 'male', 'married', '052 HORNBILL ST. AREA 3 SITIO VETERANS BRGY. BAGONG SILANG QUEZON CITY', '0', '0', '1986-6-16', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (493, 493, '19100150', NULL, 2, 38, 139, 'REMANDO', 'HIMONGALA', 'SALGON', 'sto_domingo', 'regular', 'male', 'married', '7 JP RIZAL ST., ARTY SUBD. BRGY. KARUHATAN VALENZUELA CITY', '0', '0', '1986-9-2', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (494, 494, '19100151', NULL, 2, 38, 147, 'JOHN ANGELO', 'RED', 'SEBIL', 'sto_domingo', 'regular', 'male', 'married', '43 KABULUSAN II CALOOCAN CITY', '0', '0', '1992-2-6', '2019-2-28', NULL);
INSERT INTO "public"."tbl_employee" VALUES (495, 495, '22100411', NULL, 2, 38, 137, 'JAYSON', 'JALIMAO', 'CARO', 'sto_domingo', 'regular', 'male', 'single', 'BRGY. MAGUYAM, SILANG CAVITE', '0', '0', '1992-6-27', '2022-2-28', NULL);

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
INSERT INTO "public"."tbl_position" VALUES (1, 'PST-0000001', 1, 1, 'AUDIT HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:38:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (3, 'PST-0000002', 1, 2, 'EXECUTIVE SECRETARY', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:43:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (4, 'PST-0000003', 1, 3, 'ADMIN HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:44:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (5, 'PST-0000004', 1, 4, 'PRESIDENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:45:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (6, 'PST-0000005', 1, 4, 'VICE PRESIDENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:45:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (7, 'PST-0000006', 1, 5, 'PAYROLL SPECIALIST', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 15:46:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (8, 'PST-0000007', 1, 7, 'CHECKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:05:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (9, 'PST-0000008', 1, 7, 'WAREHOUSE MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:05:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (10, 'PST-0000009', 2, 8, 'ACCOUNTING LEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:07:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (11, 'PST-0000010', 2, 8, 'AUDITOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:07:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (12, 'PST-0000011', 2, 8, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:07:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (13, 'PST-0000012', 2, 39, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:16:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (14, 'PST-0000013', 2, 9, 'ACCOUNTING LEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:16:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (15, 'PST-0000014', 2, 9, 'ADMIN ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:18:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (16, 'PST-0000015', 2, 9, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:18:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (17, 'PST-0000016', 2, 10, 'FIELD ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:19:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (18, 'PST-0000017', 2, 10, 'GENERAL COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:19:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (19, 'PST-0000018', 2, 10, 'TECHNICAL AUDITOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:19:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (20, 'PST-0000019', 2, 11, 'ACCOUNTING LEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:21:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (21, 'PST-0000020', 2, 11, 'ASSISTANT LEAD - BILLING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:21:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (22, 'PST-0000021', 2, 11, 'ASSOCIATE - ACCOUNTS RECEIVABLE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:21:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (23, 'PST-0000022', 2, 11, 'LEAD - ACCOUNTS RECEIVABLE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:21:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (24, 'PST-0000023', 2, 11, 'LEAD - BILLING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:21:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (25, 'PST-0000024', 2, 11, 'MANAGER - BILLING & AR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:22:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (26, 'PST-0000025', 2, 11, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:27:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (27, 'PST-0000026', 2, 11, 'ACCOUNTING COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:27:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (28, 'PST-0000027', 2, 12, 'SALES COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:29:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (29, 'PST-0000028', 2, 12, 'ACCOUNTING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:29:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (30, 'PST-0000029', 2, 13, 'ADMIN ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:31:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (31, 'PST-0000030', 2, 13, 'ADMIN HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:31:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (32, 'PST-0000031', 2, 13, 'CARETAKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:31:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (33, 'PST-0000032', 2, 13, 'COMPANY NURSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:31:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (34, 'PST-0000033', 2, 13, 'DRIVER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:32:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (35, 'PST-0000034', 2, 13, 'HELPER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:32:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (36, 'PST-0000035', 2, 13, 'UTILITY', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:32:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (37, 'PST-0000036', 2, 14, 'DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:36:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (38, 'PST-0000037', 2, 14, 'JR DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:36:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (39, 'PST-0000038', 2, 14, 'SERVICE ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:36:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (40, 'PST-0000039', 2, 15, 'ELECTRICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:37:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (41, 'PST-0000040', 2, 15, 'SITE IMPLEMENTATION ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:38:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (42, 'PST-0000041', 2, 16, 'CAD OPERATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:38:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (43, 'PST-0000042', 2, 16, 'CAD SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:39:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (44, 'PST-0000043', 2, 16, 'SR CAD OPERATOR I', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:39:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (45, 'PST-0000044', 2, 17, 'COSTING ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:40:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (46, 'PST-0000045', 2, 17, 'JR COSTING ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:40:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (47, 'PST-0000046', 2, 17, 'SR COSTING ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:40:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (48, 'PST-0000047', 2, 17, 'COSTING COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:40:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (49, 'PST-0000048', 2, 18, 'CADET ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:43:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (50, 'PST-0000049', 2, 18, 'DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:44:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (51, 'PST-0000050', 2, 18, 'JR DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:44:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (52, 'PST-0000051', 2, 18, 'SR DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:44:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (53, 'PST-0000052', 2, 19, 'CNC PROGRAMMER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:49:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (54, 'PST-0000053', 2, 20, 'HR ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:55:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (55, 'PST-0000054', 2, 20, 'HR OFFICER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:55:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (56, 'PST-0000055', 2, 20, 'PAYROLL STAFF', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:55:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (57, 'PST-0000056', 2, 21, 'COMPANY NURSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:57:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (58, 'PST-0000057', 2, 21, 'CONSULTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:58:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (59, 'PST-0000058', 2, 21, 'HR ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:58:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (60, 'PST-0000059', 2, 21, 'HR ASSOCIATE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:58:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (61, 'PST-0000060', 2, 21, 'HR OFFICER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:58:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (62, 'PST-0000061', 2, 22, 'CONSULTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:59:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (63, 'PST-0000062', 2, 22, 'IT PROGRAMMER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:59:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (64, 'PST-0000063', 2, 22, 'IT STAFF', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:59:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (65, 'PST-0000064', 2, 22, 'IT SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 17:00:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (66, 'PST-0000065', 2, 23, 'LOGISTICS ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:09:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (67, 'PST-0000066', 2, 23, 'LOGISTICS IN CHARGE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:09:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (68, 'PST-0000067', 2, 23, 'LOGISTICS MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:09:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (69, 'PST-0000068', 2, 24, 'FACTORY MANAGER', ' ', 1, 1, NULL, NULL, NULL, '2023-01-30 08:10:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (70, 'PST-0000069', 2, 24, 'FACTORY SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:11:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (71, 'PST-0000070', 2, 24, 'ENGINEERING SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:11:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (72, 'PST-0000071', 2, 25, 'MARKETING COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:11:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (73, 'PST-0000072', 2, 26, 'INTERN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:13:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (74, 'PST-0000073', 2, 26, 'ASSEMBLER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:14:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (75, 'PST-0000074', 2, 26, 'BUSBAR OPTIMIZER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:14:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (76, 'PST-0000075', 2, 26, 'CNC PROGRAMMER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:14:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (77, 'PST-0000076', 2, 26, 'DESIGN ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:14:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (78, 'PST-0000077', 2, 26, 'LEAD MAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:15:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (79, 'PST-0000078', 2, 26, 'MARKETING  COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:15:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (80, 'PST-0000079', 2, 26, 'PRODUCTION ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:15:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (81, 'PST-0000080', 2, 26, 'PRODUCTION  ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:15:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (82, 'PST-0000081', 2, 26, 'WIRING TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:16:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (83, 'PST-0000082', 2, 27, 'BUSBAR OPTIMIZER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:24:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (84, 'PST-0000083', 2, 27, 'BUSBAR TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:24:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (85, 'PST-0000084', 2, 27, 'CNC OPERATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:24:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (86, 'PST-0000085', 2, 27, 'PRODUCTION ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:25:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (87, 'PST-0000086', 2, 27, 'WIRING TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:25:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (88, 'PST-0000087', 2, 28, 'CNC OPERATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:40:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (89, 'PST-0000088', 2, 28, 'CNC PROGRAMMER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:41:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (90, 'PST-0000089', 2, 28, 'GRINDER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:41:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (92, 'PST-0000091', 2, 29, 'CNC OPERATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:45:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (93, 'PST-0000092', 2, 29, 'GRINDER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:45:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (94, 'PST-0000093', 2, 29, 'METAL CHECKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:45:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (95, 'PST-0000094', 2, 29, 'WELDER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:46:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (96, 'PST-0000095', 2, 30, 'CHECKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:46:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (97, 'PST-0000096', 2, 30, 'HELPER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:47:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (98, 'PST-0000097', 2, 30, 'SPRAYER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:47:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (99, 'PST-0000098', 2, 31, 'ENCODER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:58:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (100, 'PST-0000099', 2, 31, 'HELPER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:58:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (101, 'PST-0000100', 2, 31, 'JR QUALITY CONTROL ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:58:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (102, 'PST-0000101', 2, 31, 'PRODUCTION ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:58:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (103, 'PST-0000102', 2, 31, 'PROJECT COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:59:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (104, 'PST-0000103', 2, 31, 'QUALITY CONTROL ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:59:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (105, 'PST-0000104', 2, 31, 'QUALITY CONTROL TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:59:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (106, 'PST-0000105', 2, 31, 'SR QUALITY CONTROL ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:59:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (107, 'PST-0000106', 2, 31, 'WIRING TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 08:59:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (108, 'PST-0000107', 2, 31, 'METHODS ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:00:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (109, 'PST-0000108', 2, 32, 'IMPORTATION SPECIALIST', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:01:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (110, 'PST-0000109', 2, 32, 'PURCHASING ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:01:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (111, 'PST-0000110', 2, 32, 'PURCHASING HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:01:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (112, 'PST-0000111', 2, 33, 'QUALITY MANAGEMENT OFFICE STAFF II', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:02:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (113, 'PST-0000112', 2, 33, 'QUALITY MANAGEMENT SUPERVISOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:02:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (114, 'PST-0000113', 2, 33, 'SR PROCESS ANALYST', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:02:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (115, 'PST-0000114', 2, 34, 'JR SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:19:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (116, 'PST-0000115', 2, 34, 'PROJECT COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:19:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (117, 'PST-0000116', 2, 34, 'SALES COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:19:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (118, 'PST-0000117', 2, 34, 'SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:19:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (119, 'PST-0000118', 2, 34, 'SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:20:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (120, 'PST-0000119', 2, 34, 'SR SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:20:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (121, 'PST-0000120', 2, 35, 'JR SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:45:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (122, 'PST-0000121', 2, 35, 'SALES COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:45:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (123, 'PST-0000122', 2, 35, 'SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:45:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (124, 'PST-0000123', 2, 35, 'SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:46:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (125, 'PST-0000124', 2, 35, 'SALES SECRETARY', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:46:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (126, 'PST-0000125', 2, 35, 'SR SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:46:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (127, 'PST-0000126', 2, 36, 'SALES COORDINATOR', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:48:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (128, 'PST-0000127', 2, 36, 'SALES ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:48:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (129, 'PST-0000128', 2, 36, 'SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:48:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (130, 'PST-0000129', 2, 36, 'SALES REPRESENTATIVE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:48:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (131, 'PST-0000130', 2, 37, 'CADET ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:49:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (132, 'PST-0000131', 2, 37, 'ELECTRICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:49:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (133, 'PST-0000132', 2, 37, 'SERVICE ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:49:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (134, 'PST-0000133', 2, 37, 'SERVICE TECHNICIAN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:49:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (135, 'PST-0000134', 2, 37, 'TECHNICAL HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:49:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (136, 'PST-0000135', 2, 37, 'TECHNICAL HELPER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:50:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (137, 'PST-0000136', 2, 38, 'CARETAKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:51:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (138, 'PST-0000137', 2, 38, 'CHECKER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:51:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (139, 'PST-0000138', 2, 38, 'DRIVER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:51:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (140, 'PST-0000139', 2, 38, 'HELPER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (141, 'PST-0000140', 2, 38, 'ISSUANCE STAFF', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (142, 'PST-0000141', 2, 38, 'MESSENGER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (143, 'PST-0000142', 2, 38, 'PPIC', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (144, 'PST-0000143', 2, 38, 'QUALITY CONTROL ENGINEER', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (145, 'PST-0000144', 2, 38, 'WAREHOUSE HEAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:52:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (146, 'PST-0000145', 2, 38, 'WAREHOUSE STAFF', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:53:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (147, 'PST-0000146', 2, 38, 'WAREHOUSE STORAGE IN CHARGE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-30 09:53:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (148, 'PST-0000147', 1, 6, 'SALES MANAGER', NULL, 1, 1, NULL, NULL, NULL, '2023-02-02 13:44:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (91, 'PST-0000090', 2, 28, 'PRODUCTION ENGINEER', NULL, 1, 1, 1, NULL, NULL, '2023-01-30 08:41:48+08', '2023-02-09 14:10:40+08', NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (149, 'PST-0000148', 2, 31, 'PRODUCTION ENCODER', NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 15:26:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_position" VALUES (150, 'PST-0000149', 2, 38, 'PPIC ASSISTANT', NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 15:55:04+08', NULL, NULL, NULL);

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
  "position" varchar(100) COLLATE "pg_catalog"."default",
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
INSERT INTO "public"."tbl_sub_category" VALUES (1, 'ITM-0000001', 1, 'PAPER', 'PPR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:07:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (4, 'ITM-0000004', 1, 'PRINTER INK AND TONER', 'TNR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:09:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (5, 'ITM-0000005', 1, 'STAPLERS, STAPLES, PAPER CLIPS, AND PUSH PINS', 'CLPS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:10:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (6, 'ITM-0000006', 1, 'SHIPPING AND PACKAGING SUPPLIES', 'SPS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:10:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (7, 'ITM-0000007', 1, 'ORGANIZERS', 'ORGR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:12:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (8, 'ITM-0000008', 1, 'PAPER SHREDDERS', 'SHRD', 1, 1, NULL, NULL, NULL, '2023-02-14 11:12:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (9, 'ITM-0000009', 1, 'OFFICE STATIONARY', 'STNR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (10, 'ITM-0000010', 1, 'BUSINESS CARDS', 'BC', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (11, 'ITM-0000011', 2, 'OFFICE CLEANING SUPPLIES', 'CLN', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (12, 'ITM-0000012', 2, 'FIRST AID', 'AID', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (13, 'ITM-0000013', 3, 'OFFICE DESKS', 'DSK', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (15, 'ITM-0000015', 3, 'WHITEBOARDS', 'BRDS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (16, 'ITM-0000016', 3, 'FILING CABINETS', 'FC', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (17, 'ITM-0000017', 4, 'SYSTEM UNIT', 'SU', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (18, 'ITM-0000018', 4, 'LAPTOPS', 'LT', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (19, 'ITM-0000019', 4, 'MOUSE', 'MSE', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (20, 'ITM-0000020', 4, 'KEYBOARD', 'KB', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (21, 'ITM-0000021', 4, 'PRINTER', 'PRTR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (22, 'ITM-0000022', 4, 'MONITOR', 'MNTR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (23, 'ITM-0000023', 4, 'NETWORKING EQUIPMENTS', 'NTWK', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (25, 'ITM-0000025', 4, 'HARDDRIVES', 'HD', 1, 1, NULL, NULL, NULL, '2023-02-14 11:17:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (26, 'ITM-0000026', 4, 'PHONES', 'PHNS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:17:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (3, 'ITM-0000003', 1, 'DRY ERASE MARKERS AND HIGHLIGHTERS', 'DEMH', 1, 1, 1, NULL, NULL, '2023-02-14 11:09:26+08', '2023-02-14 11:26:06+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (2, 'ITM-0000002', 1, 'PENS', 'PEN', 1, 1, 1, NULL, NULL, '2023-02-14 11:09:07+08', '2023-02-14 11:26:30+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (14, 'ITM-0000014', 3, 'OFFICE CHAIRS', 'CHR', 1, 1, 1, NULL, NULL, '2023-02-14 11:14:42+08', '2023-02-14 11:53:43+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (24, 'ITM-0000024', 4, 'PROJECTORS', 'PRJR', 0, 1, 1, NULL, NULL, '2023-02-14 11:16:59+08', '2023-02-17 14:57:36+08', NULL, NULL);

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
  "is_email_verified" int4,
  "is_contact_no_verified" int4,
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
INSERT INTO "public"."tbl_users" VALUES (19, 'USR-0000018', 'jonathanbraganza149@gmail.com', NULL, '9178961908', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:38:33+08', '2023-02-02 14:41:26+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (20, 'USR-0000019', 'vhie0021@gmail.com', NULL, '9756742073', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:39:26+08', '2023-02-02 14:41:34+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (21, 'USR-0000020', 'menorlynlee@gmail.com', NULL, '9291008698', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:40:33+08', '2023-02-02 14:41:41+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (11, 'USR-0000010', 'careers@kcic.com.ph', NULL, '9178336166', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:07:25+08', '2023-02-02 14:43:29+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (12, 'USR-0000011', 'cheryl_uy@kcic.com.ph', NULL, '9178360071', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:08:36+08', '2023-02-02 14:43:39+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (13, 'USR-0000012', 'jle_2152@yahoo.com', NULL, '9281049321', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:24:03+08', '2023-02-02 14:44:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (14, 'USR-0000013', 'liumillie@yahoo.com.hk', NULL, '9228027771', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:25:20+08', '2023-02-02 14:45:03+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (15, 'USR-0000014', 'czarinarose.destura@gmail.com', NULL, '9154462511', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:26:17+08', '2023-02-02 14:45:10+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (16, 'USR-0000015', 'diazmariaconcepcion08@gmail.com', NULL, '9772902845', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:27:24+08', '2023-02-02 14:45:24+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (17, 'USR-0000016', 'Kevin.Nicoakhie@Gmail.Com', NULL, '9976034139', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:33:31+08', '2023-02-02 14:45:37+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (18, 'USR-0000017', 'Xtine2us@gmail.com', NULL, '9175366659', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:35:26+08', '2023-02-02 14:46:33+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (22, 'USR-0000021', NULL, NULL, '9661705672', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:49:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (23, 'USR-0000022', 'montikat_94@yahoo.com', NULL, '9175778578', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:50:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (24, 'USR-0000023', 'Jovypregoner@gmail.com', NULL, '9772915093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:54:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (25, 'USR-0000024', 'albertoecleo@gmail.com', NULL, '9059476783', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:55:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (26, 'USR-0000025', 'rowelgagarin@yahoo.com', NULL, '9611087113', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:56:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (27, 'USR-0000026', 'richjoellasaca@gmail.com', NULL, '9283187607', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:57:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (9, 'USR-0000008', 'nglita99@gmail.com', NULL, '9290887778', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:50:29+08', '2023-02-02 14:02:32+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (8, 'USR-0000007', 'sanly_29@yahoo.com', NULL, '9175208578', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:49:13+08', '2023-02-02 14:02:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (7, 'USR-0000006', 'marlonuylasam@yahoo.com', NULL, '9175152668', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:45:36+08', '2023-02-02 14:03:06+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (6, 'USR-0000005', 'cristy_eugenio@yahoo.com.ph', NULL, '9237393855', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:35:50+08', '2023-02-02 14:03:15+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (5, 'USR-0000004', 'careers@kcic.com.ph', NULL, '9178146140', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 11:51:48+08', '2023-02-02 14:03:38+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (4, 'USR-0000003', 'navarropaterson08@gmail.com', NULL, '9167009609', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-01-31 16:50:01+08', '2023-02-02 14:03:51+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (3, 'USR-0000002', 'constancia_uy@kcic.com.ph', NULL, '09178110071', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-01-31 16:34:03+08', '2023-02-02 14:03:59+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (2, 'USR-0000001', 'agustin_uy@kcic.com.ph', NULL, '09178380071', 0, 0, 'superadmin', 0, 1, 1, 1, NULL, NULL, '2023-01-31 15:37:24+08', '2023-02-02 14:04:04+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (10, 'USR-0000009', 'rodolfo_belleza@kcic.com.ph', NULL, NULL, 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:05:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (38, 'USR-0000037', 'maricelmartinez1976@gmail.com', NULL, '9258470116', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:36:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (39, 'USR-0000038', 'gcsantos.2914@gmail.com', NULL, '9296895601', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:36:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (40, 'USR-0000039', 'leslie.delossantos24@gmail.com', NULL, '9368829521', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:37:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (41, 'USR-0000040', 'darrenmanjares@gmail.com', NULL, '9774745358', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:39:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (42, 'USR-0000041', 'csgabriola13@gmail.com', NULL, '9055505045', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:40:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (28, 'USR-0000027', 'Piolo.Villagracia01@Gmail.Com', NULL, '9498738853', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:00:49+08', '2023-02-02 15:16:24+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (31, 'USR-0000030', 'Jesselecleo07@Gmail.Com', NULL, '9638499731', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:19:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (30, 'USR-0000029', 'Degracia.Faith12@Gmail.Com', NULL, '9568100919', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:18:35+08', '2023-02-02 15:19:22+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (29, 'USR-0000028', 'Salosamarklaurence8@Gmail.Com', NULL, '9635264854', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:17:52+08', '2023-02-02 15:19:30+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (32, 'USR-0000031', 'Lemontaladro3@Gmail.Com', NULL, '9954241335', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:25:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (33, 'USR-0000032', 'martillanorence9@gmail.com', NULL, '9773730178', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:26:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (34, 'USR-0000033', 'mtumampil03@gmail.com', NULL, '9772571043', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:27:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (35, 'USR-0000034', 'payadkyrgyz2@gmail.com', NULL, '9916067674', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:28:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (36, 'USR-0000035', 'oranderichard@gmail.com', NULL, '9557581445', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:29:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (37, 'USR-0000036', 'cmariyadennise@gmail.com', NULL, '9185236583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:30:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (43, 'USR-0000042', 'maricardelossantos065@gmail.com', NULL, '9274156451', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:41:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (44, 'USR-0000043', 'kathleeneloisemercado@gmail.com', NULL, '9152479714', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:47:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (45, 'USR-0000044', 'joandaguno19@yahoo.com', NULL, '9381255797', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 16:48:33+08', '2023-02-02 16:49:06+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (46, 'USR-0000045', 'ijf.munoz@gmail.com', NULL, '9076741952', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:49:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (47, 'USR-0000046', 'marymint02@yahoo.com', NULL, '9477019200', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:52:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (48, 'USR-0000047', 'felizardo@gmail.com', NULL, '9177283131', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:53:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (49, 'USR-0000048', 'ramil.magyaya29@yahoo.com.ph', NULL, '9176241505', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:39:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (50, 'USR-0000049', 'alexcyscelis28@gmail.com', NULL, '9555276586', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:48:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (51, 'USR-0000050', 'Eigodelon@gmail.com', NULL, '9171121744', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:53:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (52, 'USR-0000051', 'hamor2020@gmail.com', NULL, '9196908459', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:03:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (53, 'USR-0000052', 'josephine1412@gmail.com', NULL, '9979817389', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:04:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (54, 'USR-0000053', 'jaypsphilip98@gmail.com', NULL, '9083445822', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:04:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (55, 'USR-0000054', 'rinzarzola11@gmail.com', NULL, '9127025479', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:05:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (56, 'USR-0000055', 'garciaanalyn515@gmail.com', NULL, '9353132937', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:06:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (57, 'USR-0000056', 'ponsicaarlene3@gmail.com', NULL, '9508430630', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:06:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (58, 'USR-0000057', 'shielafrancisco2474@gmail.com', NULL, '9955055682', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:07:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (59, 'USR-0000058', 'charliemarquez474@gmail.com', NULL, '9979211017', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:08:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (60, 'USR-0000059', 'Leth_Ilao08@Yahoo.Com.Ph', NULL, '9171539487', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:09:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (61, 'USR-0000060', 'Jeromelchew@Yahoo.Com', NULL, '9568213325', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:09:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (62, 'USR-0000061', 'Joygumahin20@Gmail.Com', NULL, '9753832575', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:11:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (63, 'USR-0000062', 'tonyfrancisco226@yahoo.com', NULL, '9178818221', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:11:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (65, 'USR-0000064', 'paulo5bernardo9@gmail.com', NULL, '9612957013', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:32:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (64, 'USR-0000063', 'arvinjosephtemporal@gmail.com', NULL, '9175621127', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-03 09:12:50+08', '2023-02-03 09:33:04+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (66, 'USR-0000065', 'jennifertiongson52@gmail.com', NULL, '9319665620', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:33:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (67, 'USR-0000066', 'jocelynorpilla7@gmail.com', NULL, '9317924701', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:34:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (68, 'USR-0000067', 'pasteleroc30@gmail.com', NULL, '9291062147', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:34:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (69, 'USR-0000068', 'bullonharold@gmail.com', NULL, '9063469093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:36:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (70, 'USR-0000069', 'aningatmyra011994@gmail.com', NULL, '9774537349', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:38:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (71, 'USR-0000070', 'noel.ramos27@yahoo.com', NULL, '9983544427', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:39:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (72, 'USR-0000071', 'Aikken24@gmail.com', NULL, '9266596564', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:39:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (73, 'USR-0000072', 'jeanviruz21@gmail.com', NULL, '9164653126', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:40:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (74, 'USR-0000073', 'cristellemofz@gmail.com', NULL, '9285754281', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:41:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (75, 'USR-0000074', 'harveysamontiza22@gmail.com', NULL, '9309443122', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:42:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (76, 'USR-0000075', 'carlojunetolentino@gmail.com', NULL, '9639830817', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:47:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (77, 'USR-0000076', 'jepyok8354@gmail.com', NULL, '9174756228', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:48:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (78, 'USR-0000077', 'Adcaparida2988@Gmail.Com', NULL, '9568856897', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:48:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (79, 'USR-0000078', 'Jjjohnny.T19@Gmail.Com', NULL, '9302917903', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:49:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (80, 'USR-0000079', 'tontonanthony007@gmail.com', NULL, '9508774299', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:50:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (81, 'USR-0000080', 'lalain1231lacostales@gmail.com', NULL, '9182411347', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:50:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (82, 'USR-0000081', 'pauljosephllanes@yahoo.com', NULL, '9061400114', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (83, 'USR-0000082', 'starskie_sayson@yahoo.com', NULL, '9469148652', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:58:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (84, 'USR-0000083', 'rhomardoctolero@gmail.com', NULL, '9154527247', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:59:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (85, 'USR-0000084', 'bryan.reodica1217@gmail.com', NULL, '9195358160', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:00:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (86, 'USR-0000085', 'Pedernal_wilfrederick@yahoo.com', NULL, '9369094552', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:06:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (87, 'USR-0000086', 'aikojbuenaflor@gmail.com', NULL, '9752477879', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:06:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (88, 'USR-0000087', 'jamaicagayagcaoili1997@gmail.com', NULL, '9153580875', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:07:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (89, 'USR-0000088', 'kevinzorilla@gmail.com', NULL, '9054235300', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:08:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (90, 'USR-0000089', 'eymardbueno@gmail.com', NULL, '9058500197', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:09:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (91, 'USR-0000090', 'arlohn09@gmail.com', NULL, '9665690221', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:10:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (92, 'USR-0000091', 'earjay74@gmail.com', NULL, '9152758684', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:11:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (93, 'USR-0000092', 'albretchsumalde1@gmail.com', NULL, '9165323624', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:12:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (94, 'USR-0000093', 'benjieromano25@gmail.com', NULL, '9060643098', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:13:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (95, 'USR-0000094', 'jleevibares@gmail.com', NULL, '9171169004', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:14:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (96, 'USR-0000095', 'Ydiyco@gmail.com', NULL, '9276720455', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:15:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (97, 'USR-0000096', 'occidental.aileen09@gmail.com', NULL, '9770189141', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:15:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (99, 'USR-0000098', 'Judybaldo2025@Gmail.Com', NULL, '9974812915', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:16:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (100, 'USR-0000099', 'Annieivieo@Gmail.Com', NULL, '9168749825', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:18:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (101, 'USR-0000100', 'Alcedokimberlya@gmail.com', NULL, '9279371166', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:19:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (102, 'USR-0000101', 'raquel_alob@yahoo.com', NULL, '9569634458', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:20:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (116, 'USR-0000115', 'nongpales75@gmail.com', NULL, '09463555524', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:24:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (103, 'USR-0000102', 'darleneplomenteraflores@gmail.com', NULL, NULL, 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:24:11+08', '2023-02-03 10:25:33+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (104, 'USR-0000103', 'mabel.rabia@yahoo.com', NULL, '9268860537', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:25:18+08', '2023-02-03 10:25:38+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (105, 'USR-0000104', 'demijaneacosta@gmail.com', NULL, '9363679255', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:30:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (106, 'USR-0000105', 'rmarkg91@gmail.com', NULL, '9298886708', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:31:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (107, 'USR-0000106', 'jazzel.anareta11@mail.com', NULL, '9615811241', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:31:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (108, 'USR-0000107', 'ecv30@yahoo.com', NULL, '9053275093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:32:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (109, 'USR-0000108', 'makiplantamj08@gmail.com', NULL, '9662565033', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:37:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (110, 'USR-0000109', 'israel_pangilinan@systemspowermark.com.ph', NULL, '9662153955', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:39:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (111, 'USR-0000110', 'junbsalacup@gmail.com', NULL, '9158622678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:40:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (112, 'USR-0000111', 'edmunwingkun@yahoo.com', NULL, '9985460156', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:40:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (113, 'USR-0000112', 'jonnelebayan08@gmail.com', NULL, '9154796592', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:41:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (114, 'USR-0000113', 'fnsargento@gmail.com', NULL, '9950181803', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:42:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (115, 'USR-0000114', 'Jpetate@gmail.com', NULL, '9995469641', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:44:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (117, 'USR-0000116', NULL, NULL, '9150127848', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:25:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (118, 'USR-0000117', 'supermanrodel@gmail.com', NULL, '9300098047', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:26:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (119, 'USR-0000118', 'amorosoallyson1@gmail.com', NULL, '9552957912', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:27:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (120, 'USR-0000119', 'carlojohnmondigo@gmil.com', NULL, '9504884868', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:28:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (121, 'USR-0000120', 'marvinarzaga30@gmail.com', NULL, '9094488390', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:29:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (122, 'USR-0000121', 'kennethtenido1998@gmail.com', NULL, '9352969678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:32:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (123, 'USR-0000122', 'perezwarren97@gmail.com', NULL, '9155859291', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:34:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (124, 'USR-0000123', 'alginadra110197@gmail.com', NULL, '9162222546', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:35:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (125, 'USR-0000124', 'Jimboybaluyot339@gmail.com', NULL, '9558951895', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:35:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (126, 'USR-0000125', 'beejay.jaype@gmail.com', NULL, '9173072242', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:36:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (127, 'USR-0000126', 'mangaldanmariano@gmail.com', NULL, '9759887602', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:38:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (128, 'USR-0000127', 'lanante16@gmail.com', NULL, '9510096008', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:15:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (129, 'USR-0000128', 'casaulalmonte@gmail.com', NULL, '9304892382', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:16:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (130, 'USR-0000129', 'amorantorobell@gmail.com', NULL, '9166915992', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:17:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (131, 'USR-0000130', 'Paulinegracelatoja@gmail.com', NULL, '9171926354', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:18:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (132, 'USR-0000131', 'marielgagarin1825@gmail.com', NULL, '9354636153', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:18:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (133, 'USR-0000132', 'jimuel.asugui09@gmail.com', NULL, '9165562768', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:19:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (134, 'USR-0000133', 'marialhara.saballegue@gmail.com', NULL, '9666759477', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:19:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (135, 'USR-0000134', 'yorebleo@gmail.com', NULL, '9612583374', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:20:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (136, 'USR-0000135', 'ricprz111963@gmail.com', NULL, '9481547786', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:21:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (137, 'USR-0000136', 'ronniepoblete@yahoo.com', NULL, '9151348988', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:21:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (138, 'USR-0000137', 'gcarlosan@gmail.com', NULL, '9385875549', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:22:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (139, 'USR-0000138', 'norbertotelebrico@gmail.com', NULL, '9052564958', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:22:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (140, 'USR-0000139', 'ghinz010589@gmail.com', NULL, '9951022831', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:23:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (141, 'USR-0000140', 'edriancanabe@gmail.com', NULL, '9564957276', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:24:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (142, 'USR-0000141', 'motaalberth16@gmail.com', NULL, '9064384517', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:24:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (143, 'USR-0000142', 'johnleynardabulag2@gmail.com', NULL, '9155231150', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:25:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (144, 'USR-0000143', 'normandapasen@gmail.com', NULL, '9510083498', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:28:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (145, 'USR-0000144', 'marionedelemos@gmail.com', NULL, '9107213183', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:28:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (147, 'USR-0000146', 'markdanielmarasigan00@gmail.com', NULL, '9481289945', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:30:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (148, 'USR-0000147', 'alvinamante221908@gmail.com', NULL, '9552918356', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:30:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (149, 'USR-0000148', 'jerichoeliazar.2@gmail.com', NULL, '9568200281', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:31:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (151, 'USR-0000150', 'paulomendieta79@gmail.com', NULL, '9386667583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:36:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (152, 'USR-0000151', 'WILMAROABEL@gmail.com', NULL, '9120893306', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:37:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (153, 'USR-0000152', 'angeloilagan.marquez20@gmail.com', NULL, '9638867501', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:37:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (154, 'USR-0000153', 'peterarguillon@gmail.com', NULL, '9518947381', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:38:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (155, 'USR-0000154', 'michaeljrrabino23@gmail.com', NULL, '9531730011', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:39:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (156, 'USR-0000155', 'jeric.davido018@gmail.com', NULL, '9471038975', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:39:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (157, 'USR-0000156', 'johnpaloyo22@gmail.com', NULL, '9097345129', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:40:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (158, 'USR-0000157', 'ceajudelyn07@gmail.com', NULL, '9468667070', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:41:23+08', '2023-02-09 11:41:35+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (159, 'USR-0000158', 'parciajoebert@gmail.com', NULL, '9066516951', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:42:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (160, 'USR-0000159', 'tayamadrian@gmail.com', NULL, '9278724269', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:42:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (161, 'USR-0000160', 'aritallajether@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:43:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (162, 'USR-0000161', 'carlomejias870@gmail.com', NULL, '9467824999', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:43:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (163, 'USR-0000162', 'erthelmesa@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:44:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (164, 'USR-0000163', 'jaypee.ravalo@gmail.com', NULL, '9503547163', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:45:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (165, 'USR-0000164', 'lorenowilfredojr94@gmail.com', NULL, '9632749434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:45:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (166, 'USR-0000165', 'markcarinomangarin@gmail.com', NULL, '9125370334', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:46:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (167, 'USR-0000166', 'josepharthportugal1@gmail.com', NULL, '9518658972', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:46:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (168, 'USR-0000167', 'bunso_ng_spc@yahoo.com', NULL, '9564958868', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:47:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (169, 'USR-0000168', 'noelboroqmeo21@gmail.com', NULL, '9319546901', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:48:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (170, 'USR-0000169', 'emmansantillan1@gmail.com', NULL, '9277725883', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:48:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (171, 'USR-0000170', 'deejayvillapa11@gmail.com', NULL, '9071035535', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:49:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (172, 'USR-0000171', 'markgutierrez03071998@gmail.com', NULL, '9362738475', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:49:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (173, 'USR-0000172', 'divinofrancoestotomas@gmail.con', NULL, '9610564367', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:50:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (174, 'USR-0000173', 'marckjosephbetchayda6@gmail.com', NULL, '9098219522', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:51:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (175, 'USR-0000174', 'edison27bermundo@gmail.com', NULL, '9465467873', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:52:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (176, 'USR-0000175', 'bedionesjeanette07@gmail.com', NULL, '9631751573', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:53:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (177, 'USR-0000176', 'leomarlorencabo@gmail.com', NULL, '9665925830', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:54:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (178, 'USR-0000177', 'angelupaguilar@gmail.com', NULL, '9388658692', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:54:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (179, 'USR-0000178', NULL, NULL, '9308527397', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:55:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (180, 'USR-0000179', 'Hernandezgilbert956@Gmail.Com', NULL, '9956673957', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:56:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (181, 'USR-0000180', 'Josephbajado92@Gmail.Com', NULL, '9123416746', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:57:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (182, 'USR-0000181', 'Friasm884@Gmail.Com', NULL, '9398911193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:57:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (183, 'USR-0000182', 'Mendinajessicajane@Gmail.Com', NULL, '9319177966', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:58:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (184, 'USR-0000183', 'Brian.Feratero@Gmail.Com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:59:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (185, 'USR-0000184', 'Querubinermilyn@Gmail.Com', NULL, '9090234784', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:59:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (186, 'USR-0000185', 'Jeremy200356@Gmail.Com', NULL, '9663858759', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 12:00:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (187, 'USR-0000186', 'Monicoarimado@Gmail.Com', NULL, '9270710621', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:01:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (188, 'USR-0000187', 'Lordmichael@Gmail.Com', NULL, '9483788749', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:01:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (150, 'USR-0000149', 'devinmejorada@gmail.com', NULL, '9485183766', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:31:54+08', '2023-02-09 13:04:47+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (146, 'USR-0000145', 'junieven@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:29:28+08', '2023-02-09 13:04:29+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (189, 'USR-0000188', 'Medianajohnrey6@Gmail.Com', NULL, '9951936021', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:05:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (190, 'USR-0000189', 'Ghabbie13@Gmail.Com', NULL, '9089612984', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:06:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (191, 'USR-0000190', 'Anonymouscannon098@Gmail.Com', NULL, '9685544878', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:06:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (192, 'USR-0000191', 'Catalorenald@Gmail.Com', NULL, '9352196187', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:07:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (193, 'USR-0000192', 'Justin.A.Crompido@Gmail.Com', NULL, '9519603468', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:08:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (194, 'USR-0000193', 'Rodzelmalubay44@Gmail.Com', NULL, '9659635307', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:08:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (195, 'USR-0000194', 'Jonradbagtingla@Gmail.Com', NULL, '9669374577', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:09:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (196, 'USR-0000195', 'Micoacobera@Gmail.Com', NULL, '9291394839', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:10:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (197, 'USR-0000196', 'Dark_Xheon@Yahoo.Com', NULL, '9383722955', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (198, 'USR-0000197', 'Nedrafols822@Gmail.Com', NULL, '9309030053', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:16:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (199, 'USR-0000198', 'roperdaligarbes@gmail.com', NULL, '9064809584', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 13:17:08+08', '2023-02-09 13:17:16+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (200, 'USR-0000199', 'hardymaglaque002@gmail.com', NULL, '9106284813', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:18:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (201, 'USR-0000200', 'jkmerin24@gmail.com', NULL, '9161556244', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:18:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (202, 'USR-0000201', 'camsanjuan18@gmail.com', NULL, '9126077561', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:19:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (203, 'USR-0000202', 'garciaivan@gmail.com', NULL, '9319011248', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:22:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (204, 'USR-0000203', 'ninomiguelsilva12@gmail.com', NULL, '9563174178', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:22:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (205, 'USR-0000204', 'itsme.wah18@gmail.com', NULL, '9690653501', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:23:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (206, 'USR-0000205', 'edriangabrielmacalalag115@gmail.com', NULL, '9502378549', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:23:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (207, 'USR-0000206', 'escjonelabra@gmail.com', NULL, '9913379697', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:24:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (208, 'USR-0000207', 'dahomeselmer@gmail.com', NULL, '9519972082', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:25:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (209, 'USR-0000208', 'arnoldvillanuevallorca13@gmail.com', NULL, '9071024835', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:25:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (210, 'USR-0000209', 'tesoreroclang02@gmail.com', NULL, '9359617553', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:26:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (211, 'USR-0000210', 'johnallenbarrameda449@gmail.com', NULL, '9659878929', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:27:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (212, 'USR-0000211', 'rfranklexter@gmail.com', NULL, '9706061573', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:28:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (213, 'USR-0000212', 'luis143nollase@gmail.com', NULL, '9090714602', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:33:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (214, 'USR-0000213', 'jaymarktumalin420@gmail.com', NULL, '9637175470', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:33:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (215, 'USR-0000214', 'kimuelrufo19@gmail.com', NULL, '9126756804', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (216, 'USR-0000215', 'ronneldesacola310@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (217, 'USR-0000216', 'geraldmonterde1000@gmail.com', NULL, '9481837864', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (218, 'USR-0000217', 'navalrandilryan@gmail.com', NULL, '9519290434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:35:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (219, 'USR-0000218', 'renieraguilar28@gmail.com', NULL, '9617755339', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:35:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (220, 'USR-0000219', 'elcanadelacruz938@gmail.com', NULL, '9350593847', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:36:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (221, 'USR-0000220', 'bryanclienedait@gmail.com', NULL, '9668477188', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:36:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (222, 'USR-0000221', 'jamesjeffersonfranada@gmail.com', NULL, '9566087401', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:37:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (223, 'USR-0000222', 'reymondtimbal@gmail.com', NULL, '9055458391', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:38:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (224, 'USR-0000223', 'roderickpilao1@gmail.com', NULL, '9380405970', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:38:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (225, 'USR-0000224', 'johnholmes4343@gmail.com', NULL, '9471889618', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:39:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (226, 'USR-0000225', 'angeloariaz928@gmail.com', NULL, '9959543479', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:39:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (227, 'USR-0000226', 'Ijay2865@gmail.com', NULL, '9672556442', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:40:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (228, 'USR-0000227', 'regiomarkzander@gmail.com', NULL, '9773752279', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:40:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (229, 'USR-0000228', 'vistaljonathan54@gmail.com', NULL, '9096945778', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:41:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (230, 'USR-0000229', 'wendilenobrac@gmail.com', NULL, '9369153574', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:43:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (231, 'USR-0000230', 'luispatropis@gmail.com', NULL, '9165057198', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:44:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (232, 'USR-0000231', 'Drewvolante09@gmail.com', NULL, '9611494399', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:45:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (233, 'USR-0000232', 'rolandogermio@gmail.com', NULL, '9663615251', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:47:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (234, 'USR-0000233', 'dantscap432@gmail.com', NULL, '9086619284', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:48:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (235, 'USR-0000234', 'leggymark.aguillo@gmail.com', NULL, '9053135372', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:50:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (236, 'USR-0000235', 'norielpunk06@gmail.com', NULL, '9484441445', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:51:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (237, 'USR-0000236', 'ronaldallanmaintech2015@yahoo.com', NULL, '9194119062', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:52:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (238, 'USR-0000237', 'nelsondelrosariojr69@gmail.com', NULL, '9514211037', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:52:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (239, 'USR-0000238', 'joyceambojia05@gmail.com', NULL, '9278050506', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:53:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (240, 'USR-0000239', 'arjayzamora2552@gmail.com', NULL, '9516337076', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:53:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (241, 'USR-0000240', 'Rrheinald18@yahoo.com', NULL, '9265055325', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:54:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (242, 'USR-0000241', 'sayamramuel11@gmail.com', NULL, '9284243643', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:54:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (243, 'USR-0000242', 'jesrill.dacles@gmail.com', NULL, '9319845154', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:55:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (244, 'USR-0000243', 'markvictoryespera0@gmail.com', NULL, '9105363427', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:56:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (245, 'USR-0000244', 'markfrancis3109@gmail.com', NULL, '9264383074', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:56:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (246, 'USR-0000245', 'kimflora27@gmail.com', NULL, '9107208513', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (247, 'USR-0000246', 'kristinebonaregalado@gmail.com', NULL, '9384622449', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:57:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (248, 'USR-0000247', 'kingrist24@gmail.com', NULL, '9669229886', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:58:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (249, 'USR-0000248', 'marlonmata199224@gmail.com', NULL, '9267369964', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:03:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (250, 'USR-0000249', 'junsumague20@gmail.com', NULL, '9285920331', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:04:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (251, 'USR-0000250', 'brandoforteza@gmail.com', NULL, '9388925610', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:05:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (252, 'USR-0000251', 'jacksonestrada09271979@gmail.com', NULL, '9175191681', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:06:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (253, 'USR-0000252', 'leysonearlmiguel@gmail.com', NULL, '9465698364', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:06:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (254, 'USR-0000253', 'donardocawaling6@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:07:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (255, 'USR-0000254', 'mikaycarbon16@gmail.com', NULL, '9198855175', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:08:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (256, 'USR-0000255', 'Ricafrentenixon@gmail.com', NULL, '9067027920', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:08:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (257, 'USR-0000256', 'yrahtacos@gmail.com', NULL, '9069143848', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:11:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (98, 'USR-0000097', 'lovesong.carale23@gmail.com', NULL, '9367717654', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:16:25+08', '2023-02-09 14:13:50+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (258, 'USR-0000257', 'jessiejalalon15@gmail.com', NULL, '9662685712', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:02:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (259, 'USR-0000258', 'rondilla.marvin@gmail.com', NULL, '9387987771', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:04:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (260, 'USR-0000259', 'roelchristianbadillo00@gmail.com', NULL, '9754537032', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:05:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (261, 'USR-0000260', 'cdeadpool809@gmail.com', NULL, '9384568494', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:06:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (262, 'USR-0000261', 'mikepaguibitannava@gmail.com', NULL, '9304445094', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:06:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (263, 'USR-0000262', 'mchlnglcrd@gmail.com', NULL, '9564727510', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:07:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (264, 'USR-0000263', 'shierwinmejoy123@gmail.com', NULL, '9567303959', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:07:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (265, 'USR-0000264', 'Amagojumel1986@gmail.com', NULL, '9091927416', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:35:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (266, 'USR-0000265', 'marvinllabore199209@gmail.com', NULL, '9666703175', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:37:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (267, 'USR-0000266', 'aseguradoedgardo@gmail.com', NULL, '9959257461', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:39:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (268, 'USR-0000267', 'dennel1993padasas@gmail.com', NULL, '9120600545', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:39:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (269, 'USR-0000268', 'benedictfrancisco79@gmail.com', NULL, '9103497137', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:40:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (272, 'USR-0000271', 'henrymendez536@gmail.com', NULL, '9651996478', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:54:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (273, 'USR-0000272', 'adorante@gmail.com', NULL, '9650522675', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:54:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (274, 'USR-0000273', 'kenmadronero27@gmail.com', NULL, '9260622201', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:55:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (271, 'USR-0000270', 'marvintolentino187@gmail.com', NULL, '9950421817', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 15:53:39+08', '2023-02-09 15:56:17+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (270, 'USR-0000269', 'normangenesis10@gmail.com', NULL, '9993286382', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 15:53:01+08', '2023-02-09 15:56:46+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (275, 'USR-0000274', 'Tristanjace111412@Gmail.Com', NULL, '9972211997', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (276, 'USR-0000275', 'Rombaoabryan26@Gmail.Com', NULL, '9389372161', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:58:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (277, 'USR-0000276', 'Jujun.franco@gmail.com', NULL, '9651788014', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:30:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (278, 'USR-0000277', 'Masangcayprudencio3@gmail.com', NULL, '9551642007', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:32:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (279, 'USR-0000278', 'garciaraymond1203@gmail.com', NULL, '9095814319', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:33:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (280, 'USR-0000279', 'fernandezjanrey23@gmail.com', NULL, '9156079435', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:33:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (281, 'USR-0000280', 'sagumarman31@gmail.com', NULL, '9675806019', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:34:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (282, 'USR-0000281', 'glennberth@gmail.com', NULL, '9637768825', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:35:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (283, 'USR-0000282', 'joemarvisca5@gmail.com', NULL, '9291192691', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-10 09:36:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (284, 'USR-0000283', 'jamesdaryl18b@gmail.com', NULL, '9512250959', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:06:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (285, 'USR-0000284', 'j_sauret@yahoo.com', NULL, '9635999990', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:07:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (286, 'USR-0000285', 'Lancolozed@Gmail.Com', NULL, '9122024971', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:08:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (287, 'USR-0000286', 'jowilim77@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:08:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (288, 'USR-0000287', 'jasonagnes095@gmail.com', NULL, '9659907569', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:09:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (289, 'USR-0000288', 'baculandobong06@gmail.com', NULL, '9389372332', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:09:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (290, 'USR-0000289', 'djuandel@gmail.com', NULL, '9071674094', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:10:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (291, 'USR-0000290', 'dwrcarandang@gmail.com', NULL, '9677324816', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:11:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (292, 'USR-0000291', 'roderickbultron44@gmail.com', NULL, '9959711145', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:11:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (293, 'USR-0000292', 'jerwenbeato15@gmail.com', NULL, '9454153417', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:12:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (294, 'USR-0000293', 'gilbert.bolanos26@gmail.com', NULL, '9275523867', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:19:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (295, 'USR-0000294', 'melaiitresvalles1994@gmail.com', NULL, '9260622201', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:21:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (296, 'USR-0000295', 'chesma.morante@gmail.com', NULL, '9369249526', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:23:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (297, 'USR-0000296', 'kevinjamesenerez2015@gmail.com', NULL, '9563243359', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:24:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (298, 'USR-0000297', 'jclzrt@gmail.com', NULL, '9777211446', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:27:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (299, 'USR-0000298', '09markus29@gmail.com', NULL, '9238455729', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:28:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (300, 'USR-0000299', 'jhonabiera3@gmail.com', NULL, '9564761330', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:29:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (301, 'USR-0000300', 'eudesevangelista12@gmail.com', NULL, '9057340305', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:29:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (302, 'USR-0000301', 'romeomartinezchavez@gmail.com', NULL, '9064417790', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:30:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (303, 'USR-0000302', 'christianbayhonan73@gmail.com', NULL, '9462586107', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:31:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (304, 'USR-0000303', 'edithawilliam75@gmail.com', NULL, '9858490305', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:31:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (305, 'USR-0000304', 'Ajborja09@gmail.com', NULL, '9089700923', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:32:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (306, 'USR-0000305', 'arlenegracetuazon76@gmail.com', NULL, '9224105719', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:33:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (307, 'USR-0000306', 'bryanepv@gmail.com', NULL, '9666452509', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:34:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (308, 'USR-0000307', 'princessalfonso0523@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:34:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (309, 'USR-0000308', 'Jgvillapana@Gmail.Com', NULL, '9182749612', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:35:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (310, 'USR-0000309', 'MAR_Angob08@Yahoo.Com', NULL, '9392274430', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:36:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (311, 'USR-0000310', 'rmaddawinjr@gmail.com', NULL, '9057670744', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:37:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (312, 'USR-0000311', 'villariascarljohn28@gmail.com', NULL, '9298142334', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:38:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (313, 'USR-0000312', 'aytonaraymond123@gmail.com', NULL, '9153152871', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:38:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (314, 'USR-0000313', 'vincealdrene@gmail.com', NULL, '9567901996', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:39:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (315, 'USR-0000314', 'jhonlloydtarromatarroma@gmail.com', NULL, '9468784081', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:40:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (316, 'USR-0000315', 'vinceroa18@gmail.com', NULL, '9459905781', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:40:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (317, 'USR-0000316', 'cajayon.albert.carl@gmail.com', NULL, '9636794816', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:41:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (318, 'USR-0000317', 'Karlalhay013@Gmail.Com', NULL, '9214815240', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:42:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (319, 'USR-0000318', 'maricelmartinez1976@gmail.com', NULL, '9258470116', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:47:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (320, 'USR-0000319', 'palma_erwin06@gmail.com', NULL, '9123603698', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:47:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (321, 'USR-0000320', 'chieann30@gmail.com', NULL, '9178707236', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:48:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (322, 'USR-0000321', 'Celsoagdon@gmail.com', NULL, '9368353582', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:49:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (323, 'USR-0000322', 'arnel_vookal@yahoo.com', NULL, '9465110481', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:49:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (324, 'USR-0000323', 'krizelleesguerra@gmail.com', NULL, '9458998739', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:50:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (325, 'USR-0000324', 'mrholeenmontano@gmail.com', NULL, '9094490404', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:50:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (326, 'USR-0000325', 'abejoeugene06@gmail.com', NULL, '9454003012', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:51:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (327, 'USR-0000326', 'belajoaquin97@gmail.com', NULL, '9198807821', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:51:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (328, 'USR-0000327', 'aims13.grant@gmail.com', NULL, '9157850839', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:52:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (329, 'USR-0000328', 'jasonjaen17@gmail.com', NULL, '9319033365', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:53:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (330, 'USR-0000329', 'marlonmagno35@gmail.com', NULL, '9055424484', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:54:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (331, 'USR-0000330', 'larajanefuentes2608@gmail.com', NULL, '9204899596', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:55:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (332, 'USR-0000331', 'gallenobobby@gmail.com', NULL, '9516659623', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:55:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (333, 'USR-0000332', 'Aramaealbalate@Gmail.Com', NULL, '9485939918', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:56:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (334, 'USR-0000333', 'Silentmerj@Gmail.Com', NULL, '9182030639', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:56:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (335, 'USR-0000334', 'rhunelvillanueva123456@gmail.com', NULL, '9754133394', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:57:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (336, 'USR-0000335', 'ronelbaluran9@gmail.com', NULL, '9052308202', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:57:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (337, 'USR-0000336', 'jhunfeliciano@gmail.com', NULL, '9218865536', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:58:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (338, 'USR-0000337', 'bellenjerald37@gmail.com', NULL, '9562658951', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:58:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (339, 'USR-0000338', 'joemarxalcalde@gmail.com', NULL, '9123148437', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:59:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (340, 'USR-0000339', 'markug201400044@gmail.com', NULL, '9270343583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:59:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (341, 'USR-0000340', 'katuytan@gmail.com', NULL, '9177798021', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:11:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (342, 'USR-0000341', 'joannamariebernabe95@gmail.com', NULL, '9239246605', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:12:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (343, 'USR-0000342', 'yvelim.928@gmail.com', NULL, '9178055557', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:13:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (344, 'USR-0000343', 'Arlenenaldo0321@Gmail.Com', NULL, '9156350530', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:14:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (345, 'USR-0000344', 'josefine.bacnaon24@yahoo.com', NULL, '9677559606', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:15:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (346, 'USR-0000345', 'juwirextiu15@gmail.com', NULL, '9770332970', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:16:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (347, 'USR-0000346', 'rosaleselaine3@gmail.com', NULL, '9365421413', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:18:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (348, 'USR-0000347', 'calvs23@gmail.com', NULL, '9053294496', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:21:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (350, 'USR-0000349', 'maiztegui.mesiahs@gmail.com', NULL, '9201202782', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:22:47+08', '2023-02-27 16:23:26+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (349, 'USR-0000348', 'nhoj.kenneth@yahoo.com', NULL, '9167162459', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:22:21+08', '2023-02-27 16:23:32+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (351, 'USR-0000350', 'quejohnrobert@gmail.com', NULL, '9393693085', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:23:20+08', '2023-02-27 16:23:47+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (353, 'USR-0000352', 'judan.pauljohn@gmail.com', NULL, '9502099508', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:25:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (352, 'USR-0000351', 'joshuaajaumali@gmail.com', NULL, '9456732627', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:24:19+08', '2023-02-27 16:25:44+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (355, 'USR-0000354', 'michaelcharlotte.mc16@gmail.com', NULL, '9672370398', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:26:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (354, 'USR-0000353', 'jschua98@gmail.com', NULL, '9171001693', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:26:18+08', '2023-02-27 16:26:54+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (357, 'USR-0000356', 'vic_ahl12@yahoo.com', NULL, '9451622906', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:28:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (356, 'USR-0000355', 'kuyaidoy@gmail.com', NULL, '9216140407', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:27:56+08', '2023-02-27 16:28:35+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (358, 'USR-0000357', 'vacaljupiter@gmail.com', NULL, '9327198630', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:30:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (359, 'USR-0000358', 'charlesadrianang@gmail.com', NULL, '9176758991', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:30:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (360, 'USR-0000359', 'd.ganancial@yahoo.com', NULL, '9065559195', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:31:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (361, 'USR-0000360', 'slourice@yahoo.com.ph', NULL, '9058703068', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:32:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (362, 'USR-0000361', 'panchy111@yahoo.com', NULL, '9175351155', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:32:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (363, 'USR-0000362', 'patrickjulianschua@gmail.com', NULL, '9293813358', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:33:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (364, 'USR-0000363', 'ron110482@gmail.com', NULL, '9369702682', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:38:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (365, 'USR-0000364', 'jeffrey.casa@gmail.com', NULL, '9087687525', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:40:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (366, 'USR-0000365', 'metodiobongolto@yahoo.com', NULL, '9282010420', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:40:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (367, 'USR-0000366', 'Christophertablate12@gmail.com', NULL, '9665828471', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:41:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (368, 'USR-0000367', 'cataggatanrexly@gmail.com', NULL, '9301056774', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:42:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (369, 'USR-0000368', 'Friasrhad09@mail.com', NULL, '9327736506', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:42:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (370, 'USR-0000369', 'rowenesquillo007@gmail.com', NULL, '9994988982', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:43:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (371, 'USR-0000370', 'arniel092987@gmail.com', NULL, '9291189192', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:44:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (372, 'USR-0000371', 'Jackelineargallon@gmail.com', NULL, '9772077582', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:44:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (373, 'USR-0000372', 'arnelyago1966@gmail.com', NULL, '9062131225', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:45:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (374, 'USR-0000373', 'benjar08ramos@gmail.com', NULL, '9753027994', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:45:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (376, 'USR-0000375', 'talingdanjohnresty6@gmail.com', NULL, '9516728766', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:46:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (377, 'USR-0000376', 'danilo_navarro@gmail.com', NULL, '9054758369', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:47:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (375, 'USR-0000374', 'Bernabenarra@Gmail.Com', NULL, '9273211651', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:46:19+08', '2023-02-27 16:48:55+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (378, 'USR-0000377', 'elyannamyraapascual@gmail.com', NULL, '9451357111', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:54:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (379, 'USR-0000378', 'michelletalingdan@gmail.com', NULL, '9212009639', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:55:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (380, 'USR-0000379', 'ritch2812@gmail.com', NULL, '9089056430', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:55:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (381, 'USR-0000380', 'crisostomojohnrobert@yahoo.com.ph', NULL, '9058681259', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:56:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (382, 'USR-0000381', 'joannadgzmn0830@gmail.com', NULL, '9275383156', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:56:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (383, 'USR-0000382', NULL, NULL, '9053197587', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:57:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (384, 'USR-0000383', 'emspalomares@gmail.com', NULL, '9278045408', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:29:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (385, 'USR-0000384', 'scelpadua@gmail.com', NULL, '9567111784', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:30:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (386, 'USR-0000385', 'rosaliesanjuan2001@gmail.com', NULL, '9774917571', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:31:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (387, 'USR-0000386', 'elvira_p_ayuro@yahoo.com.ph', NULL, '9324528193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:32:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (388, 'USR-0000387', 'cristinageneta@gmail.com', NULL, '9264074723', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:33:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (389, 'USR-0000388', 'm.delacruz1711@yahoo.com', NULL, '9232246807', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:34:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (390, 'USR-0000389', 'charmainekaye25@gmail.com', NULL, '9488961997', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:34:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (391, 'USR-0000390', 'mariavictoriaarante@gmail.com', NULL, '9502539237', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:35:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (392, 'USR-0000391', 'anne.atienza2@gmail.com', NULL, '9672810920', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:06:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (393, 'USR-0000392', 'johnabeltibang0197@gmail.com', NULL, '9975140806', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:07:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (394, 'USR-0000393', 'Arseflores05@Gmail.Com', NULL, '9175282773', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:08:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (395, 'USR-0000394', 'heiress.hortelano13@gmail.com', NULL, '9475027028', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:09:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (398, 'USR-0000397', 'joveencinares@gmail.com', NULL, '9203229487', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:48:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (397, 'USR-0000396', 'chiimtutor979@gmail.com', NULL, '9989432657', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 09:47:32+08', '2023-02-28 09:48:14+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (396, 'USR-0000395', 'Emilydeximo@Gmail.Com', NULL, '9073276634', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 09:47:01+08', '2023-02-28 09:48:20+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (399, 'USR-0000398', 'edison san jose.831@gmail.com', NULL, '9061511969', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:48:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (400, 'USR-0000399', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:49:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (401, 'USR-0000400', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:49:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (402, 'USR-0000401', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:50:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (403, 'USR-0000402', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:50:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (404, 'USR-0000403', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (405, 'USR-0000404', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (406, 'USR-0000405', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (407, 'USR-0000406', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:52:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (408, 'USR-0000407', 'careers@kcic.com.ph', NULL, '9197926737', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:53:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (409, 'USR-0000408', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:53:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (410, 'USR-0000409', 'janinefernando90@gmail.com', NULL, '9265787090', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:54:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (411, 'USR-0000410', 'johnreymasanque_017@yahoo.com', NULL, '9260367185', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:55:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (412, 'USR-0000411', 'corpuzjustin2121@gmail.com', NULL, '9453990224', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:56:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (413, 'USR-0000412', 'k.paraguison03@gmail.com', NULL, '9053302610', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:57:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (414, 'USR-0000413', 'johnericsonrasos@gmail.com', NULL, '9084685905', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:57:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (415, 'USR-0000414', 'ryanfrancisco.ryn@gmail.com', NULL, '9682190562', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:58:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (416, 'USR-0000415', 'reysrmontano@gmail.com', NULL, '9776280359', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:59:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (417, 'USR-0000416', 'aldihnmiradora68@gmail.com', NULL, '9350819061', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:00:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (418, 'USR-0000417', 'rsulpico23@gmail.com', NULL, '9166465914', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:00:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (419, 'USR-0000418', 'neillongno@gmail.com', NULL, '9454116076', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:02:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (420, 'USR-0000419', 'markgenesisgenio@gmail.com', NULL, '9491176260', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:03:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (421, 'USR-0000420', 'esbmarquez@gmail.com', NULL, '9563923671', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:06:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (422, 'USR-0000421', 'laurentema.luisa@gmail.com', NULL, '9561298836', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:08:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (423, 'USR-0000422', 'Andrew.camiros@yahoo.com', NULL, '9171375971', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:08:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (424, 'USR-0000423', 'pid61590@gmail.com', NULL, '9478117912', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:09:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (425, 'USR-0000424', 'rochesterbergonia@gmail.com', NULL, '9499788552', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:09:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (426, 'USR-0000425', 'kavinrosios08@gmail.com', NULL, '9085965110', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:21:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (428, 'USR-0000427', 'Joannamarieamaro100197@Gmail.Com', NULL, '9152175930', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:24:51+08', '2023-02-28 10:24:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (427, 'USR-0000426', 'ivydqua@gmail.com', NULL, '9064496026', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:23:31+08', '2023-02-28 10:25:03+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (429, 'USR-0000428', 'kimberlypitogo6@gmail.com', NULL, '9639627458', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:25:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (431, 'USR-0000430', 'mheanrivera10@gmail.com', NULL, '9333133312', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:38:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (430, 'USR-0000429', 'riodelacruz7410@gmail.com', NULL, '9564691894', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:36:46+08', '2023-02-28 10:38:30+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (432, 'USR-0000431', 'Mrrsdeasis@Gmail.Com', NULL, '9972652958', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:40:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (433, 'USR-0000432', 'Hiedemiranda30@Gmail.Com', NULL, '9776762923', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:41:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (434, 'USR-0000433', 'raymondybanez024@gmail.com', NULL, '9153581824', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:42:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (435, 'USR-0000434', 'jrj.lapuz@gmail.com', NULL, '9980989965', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:03:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (436, 'USR-0000435', 'jobpua16@gmail.com', NULL, '9321703365', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:09:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (437, 'USR-0000436', 'sjackquelyn19@gmail.com', NULL, '9295378434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:10:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (438, 'USR-0000437', NULL, NULL, '9175273646', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:10:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (439, 'USR-0000438', 'misalanglovely@gmail.com', NULL, '9550263270', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:11:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (440, 'USR-0000439', 'jnydq13@gmail.com', NULL, '9152307431', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:16:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (441, 'USR-0000440', 'sheenamarieestolas@gmail.com', NULL, '9455698739', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:17:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (442, 'USR-0000441', 'ylrebmik232002@yahoo.com', NULL, '9175165937', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:18:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (443, 'USR-0000442', 'kenkenmangali@gmail.com', NULL, '9158844593', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:19:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (444, 'USR-0000443', 'paulaservando@gmail.com', NULL, '9260529853', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:19:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (445, 'USR-0000444', 'akfd818@yahoo.com', NULL, '9175390818', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:20:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (446, 'USR-0000445', 'shelzcasuga@gmail.com', NULL, '9264134893', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:20:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (448, 'USR-0000447', 'rosh.alilio@gmail.com', NULL, '9171194160', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:27:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (447, 'USR-0000446', 'grajojair947@gmail.com', NULL, '9774532126', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 11:27:16+08', '2023-02-28 11:27:58+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (449, 'USR-0000448', 'jessieramisan@gmail.com', NULL, '9454123542', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:28:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (450, 'USR-0000449', 'oliverhgabiola@gmail.com', NULL, '9667482987', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:31:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (451, 'USR-0000450', 'lloreravanj@gmail.com', NULL, '9069055923', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:59:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (452, 'USR-0000451', 'jowin28@gmail.com', NULL, '9175827678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:59:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (453, 'USR-0000452', 'arvee.cestina@yahoo.com.ph', NULL, '9066970414', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:00:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (454, 'USR-0000453', 'sobriarodora@gmail.com', NULL, '9293410894', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (455, 'USR-0000454', 'louiealfredbres06@gmail.com', NULL, '9064067129', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:15:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (456, 'USR-0000455', 'louiegiaguilar20@gmail.com', NULL, '9669578488', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:15:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (457, 'USR-0000456', 'Adriano_Magcalas@Kcei.Com.Ph', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:16:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (458, 'USR-0000457', 'laarniemgonzales@gmail.com', NULL, '9178811261', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:18:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (459, 'USR-0000458', 'vincent.bgarcia@yahoo.com', NULL, '9954347442', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:18:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (460, 'USR-0000459', 'leine08162007@gmail.com', NULL, '9915662659', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:21:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (461, 'USR-0000460', 'estellacarljhon@gmai.com', NULL, '9560912712', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:21:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (462, 'USR-0000461', 'jimmy_delacruz@kcic.com.ph', NULL, '9178056740', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:22:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (463, 'USR-0000462', 'wilmerpcovita@gmail.com', NULL, '9171755716', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:22:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (464, 'USR-0000463', 'amayangelea1025@gmail.com', NULL, '9993744276', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:24:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (465, 'USR-0000464', 'regine07vallesteros@gmail.com', NULL, '9454371130', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:26:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (466, 'USR-0000465', 'marcjoshuanatividad@gmail.com', NULL, '9950223404', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:29:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (467, 'USR-0000466', 'joebercasiojr@gmail.com', NULL, '9178595032', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:30:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (468, 'USR-0000467', 'avelinomalapitjr@gmail.com', NULL, '9173601199', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:32:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (469, 'USR-0000468', 'wbtumulak@gmail.com', NULL, '9176045882', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:32:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (470, 'USR-0000469', 'alvintarenas@gmail.com', NULL, '9959112587', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:34:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (471, 'USR-0000470', 'dario.villazor@gmail.com', NULL, '9062636626', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:41:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (472, 'USR-0000471', 'jmanansala8895@gmail.com', NULL, '9193888475', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:42:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (473, 'USR-0000472', 'nibvilla@gmail.com', NULL, '9369640034', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:43:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (474, 'USR-0000473', 'kevinlexterocay@gmail.com', NULL, '9155673193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:46:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (475, 'USR-0000474', 'Cabayawin09@gmail.com', NULL, '9061261795', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:47:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (476, 'USR-0000475', 'jralmonicar14@gmail.com', NULL, '9270826524', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:47:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (477, 'USR-0000476', 'paoloesguerra003@gmail.com', NULL, '9561202480', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:48:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (480, 'USR-0000479', 'drev0027@gmail.com', NULL, '9331784459', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:56:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (479, 'USR-0000478', 'catalinocapuyan@gmail.com', NULL, '9151600869', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 12:56:06+08', '2023-02-28 12:57:02+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (478, 'USR-0000477', 'charliemacatuno@gmail.com', NULL, '9950883051', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 12:54:43+08', '2023-02-28 12:57:13+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (481, 'USR-0000480', 'aurelio.baluyot.ge2019@gmail.com', NULL, '9954509331', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:01:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (482, 'USR-0000481', 'edwardbuhian67@gmail.com', NULL, '9085064160', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:02:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (483, 'USR-0000482', 'duqueleo125@gmail.com', NULL, '9999031082', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:03:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (484, 'USR-0000483', 'pabloarado1969@gmail.com', NULL, '9199091499', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:04:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (485, 'USR-0000484', 'Jaidallen052014@gmail.com', NULL, '9196096075', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:05:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (486, 'USR-0000485', 'riverarogerjr10@gmail.com', NULL, '9995318527', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:05:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (487, 'USR-0000486', 'joelfvaldez74@gmail.com', NULL, '9288263555', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:06:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (488, 'USR-0000487', 'fernandezgeorge63@gmail.com', NULL, '9272795614', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:06:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (489, 'USR-0000488', 'bobonglaag@gmail.com', NULL, '9203685158', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:07:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (490, 'USR-0000489', 'teopalles@gmail.com', NULL, '9058167720', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:07:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (491, 'USR-0000490', 'sergioracaza52@gmail.com', NULL, '9086541079', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:08:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (492, 'USR-0000491', 'Rolynar.rapole.ge2019@gmail.com', NULL, '9777972819', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:09:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (493, 'USR-0000492', 'Remandosalgon@gmail.com', NULL, '9952137996', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:09:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (494, 'USR-0000493', 'jamikszsebil@gmail.com', NULL, '9323564886', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:10:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (495, 'USR-0000494', NULL, NULL, '9501105053', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:10:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (1, '0000000', 'superadmin@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '00000000000', 1, 1, 'superadmin', 1, 1, 1, NULL, NULL, NULL, '2022-12-21 11:13:47.452153+08', NULL, NULL, NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_assets_id_seq"', 30, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_assets_info_id_seq"', 30, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_assign_asset_id_seq"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_audit_trail_id_seq"', 769, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_category_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_company_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_depertment_id_seq"', 40, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_employee_id_seq"', 496, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_position_id_seq"', 151, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_services_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_services_report_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_services_sales_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_services_technical_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_sub_category_id_seq"', 27, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."tbl_users_id_seq"', 496, true);

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
-- Primary Key structure for table tbl_position
-- ----------------------------
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_pkey" PRIMARY KEY ("id");

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
-- Primary Key structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_pkey" PRIMARY KEY ("id");

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
-- Foreign Keys structure for table tbl_position
-- ----------------------------
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."tbl_department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_position" ADD CONSTRAINT "tbl_position_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Foreign Keys structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
