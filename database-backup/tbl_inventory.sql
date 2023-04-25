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

 Date: 25/04/2023 13:53:53
*/


-- ----------------------------
-- Table sequence for tbl_inventory
-- ----------------------------
CREATE SEQUENCE "public"."tbl_inventory_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_inventory_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_inventory
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_inventory";
CREATE TABLE "public"."tbl_inventory" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_inventory_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "set_by" int4,
  "date_from" varchar(40) COLLATE "pg_catalog"."default",
  "date_to" varchar(40) COLLATE "pg_catalog"."default",
  "type" varchar(10) COLLATE "pg_catalog"."default",
  "brands" text COLLATE "pg_catalog"."default",
  "total_items" int4,
  "rcs_item_count" int4,
  "ras_item_count" int4,
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
-- Primary Key structure for table tbl_inventory
-- ----------------------------
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_inventory
-- ----------------------------
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_set_by_fkey" FOREIGN KEY ("set_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_inventory" ADD CONSTRAINT "tbl_inventory_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
