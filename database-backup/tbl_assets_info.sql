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

 Date: 17/04/2023 17:00:34
*/


-- ----------------------------
-- Table sequence for tbl_assets_info
-- ----------------------------
CREATE SEQUENCE "public"."tbl_assets_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_assets_info_id_seq"', 1, false);


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
-- Primary Key structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_assets_info
-- ----------------------------
ALTER TABLE "public"."tbl_assets_info" ADD CONSTRAINT "tbl_assets_info_assets_id_fkey" FOREIGN KEY ("asset_id") REFERENCES "public"."tbl_assets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
