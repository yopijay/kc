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

 Date: 30/03/2023 16:46:27
*/


-- ----------------------------
-- Table sequence for tbl_supplies_info
-- ----------------------------
CREATE SEQUENCE "public"."tbl_supplies_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_supplies_info_id_seq"', 1, false);


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
-- Primary Key structure for table tbl_supplies_info
-- ----------------------------
ALTER TABLE "public"."tbl_supplies_info" ADD CONSTRAINT "tbl_supplies_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_supplies_info
-- ----------------------------
ALTER TABLE "public"."tbl_supplies_info" ADD CONSTRAINT "tbl_supplies_info_supply_id_fkey" FOREIGN KEY ("supply_id") REFERENCES "public"."tbl_supplies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
