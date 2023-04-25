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

 Date: 20/04/2023 11:59:08
*/


-- ----------------------------
-- Table sequence for tbl_inventory_count
-- ----------------------------
CREATE SEQUENCE "public"."tbl_inventory_count_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_inventory_count_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_inventory_count
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_inventory_count";
CREATE TABLE "public"."tbl_inventory_count" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_inventory_count_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "set_by" int4,
  "date_from" varchar(50) COLLATE "pg_catalog"."default",
  "date_to" varchar(50) COLLATE "pg_catalog"."default",
  "type" varchar(20) COLLATE "pg_catalog"."default",
  "brands" text COLLATE "pg_catalog"."default",
  "total_items" int4,
  "rcs_item_count" int4,
  "ras_item_count" int4,
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
-- Primary Key structure for table tbl_inventory_count
-- ----------------------------
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_inventory_count
-- ----------------------------
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_set_by_fkey" FOREIGN KEY ("set_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory_count" ADD CONSTRAINT "tbl_inventory_count_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
