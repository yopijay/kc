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

 Date: 20/04/2023 11:00:00
*/


-- ----------------------------
-- Table sequence for tbl_items
-- ----------------------------
CREATE SEQUENCE "public"."tbl_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_items_id_seq"', 1, false);


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
  "received_by" int4,
  "date_arrived" varchar(50) COLLATE "pg_catalog"."default",
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
-- Primary Key structure for table tbl_items
-- ----------------------------
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_items
-- ----------------------------
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "public"."tbl_brand" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_rack_id_fkey" FOREIGN KEY ("rack_id") REFERENCES "public"."tbl_racks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_received_by_fkey" FOREIGN KEY ("received_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_items" ADD CONSTRAINT "tbl_items_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
