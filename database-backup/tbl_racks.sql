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

 Date: 19/04/2023 16:37:12
*/


-- ----------------------------
-- Table sequence for tbl_racks
-- ----------------------------
CREATE SEQUENCE "public"."tbl_racks_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_racks_id_seq"', 1, false);


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
-- Primary Key structure for table tbl_racks
-- ----------------------------
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_racks
-- ----------------------------
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_racks" ADD CONSTRAINT "tbl_racks_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
