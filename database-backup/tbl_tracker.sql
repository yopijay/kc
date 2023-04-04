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

 Date: 04/04/2023 11:18:49
*/


-- ----------------------------
-- Table sequence for tbl_tracker
-- ----------------------------
CREATE SEQUENCE "public"."tbl_tracker_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_tracker_id_seq"', 1, false);


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
-- Primary Key structure for table tbl_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_tracker" ADD CONSTRAINT "tbl_tracker_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
