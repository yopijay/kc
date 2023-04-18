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

 Date: 17/04/2023 17:00:47
*/


-- ----------------------------
-- Table sequence for tbl_assign_asset
-- ----------------------------
CREATE SEQUENCE "public"."tbl_assign_asset_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_assign_asset_id_seq"', 1, false);


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
-- Primary Key structure for table tbl_assign_asset
-- ----------------------------
ALTER TABLE "public"."tbl_assign_asset" ADD CONSTRAINT "tbl_assign_asset_pkey" PRIMARY KEY ("id");
