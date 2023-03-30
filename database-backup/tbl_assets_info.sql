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

 Date: 30/03/2023 16:44:15
*/


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
INSERT INTO "public"."tbl_assets_info" VALUES (29, 29, 'DELL', 'BLACK ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CN-049PR0-CH400-973-079P-A00', 'MS116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-3-1', NULL, 'usb', 'right-handed', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (30, 30, 'EPSON', 'BLACK', NULL, '375 X 347 X 179 MM', NULL, NULL, NULL, NULL, NULL, NULL, 'XAGM049000', 'ECOTANK L3210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-3-2', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (31, 31, 'EPSON', 'BLACK', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'VGFK338306', 'L360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-3-6', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets_info" VALUES (32, 32, 'EPSON', 'BLACK', NULL, '375MM X 347MM X 179MM', NULL, NULL, NULL, NULL, NULL, NULL, 'XAGM233476', 'L3210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-3-27', NULL, 'usb', NULL, NULL, NULL, 'inkjet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_assets_id_fkey" FOREIGN KEY ("asset_id") REFERENCES "public"."tbl_assets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
