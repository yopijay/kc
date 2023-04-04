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

 Date: 04/04/2023 11:18:57
*/


-- ----------------------------
-- Table sequence for tbl_employee_tracker
-- ----------------------------
CREATE SEQUENCE "public"."tbl_employee_tracker_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_employee_tracker_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_employee_tracker
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_employee_tracker";
CREATE TABLE "public"."tbl_employee_tracker" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_employee_tracker_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "tracker_id" int4,
  "branch" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "date_in" varchar(20) COLLATE "pg_catalog"."default",
  "date_out" varchar(20) COLLATE "pg_catalog"."default",
  "time_in" varchar(20) COLLATE "pg_catalog"."default",
  "time_out" varchar(20) COLLATE "pg_catalog"."default",
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6)
)
;

-- ----------------------------
-- Primary Key structure for table tbl_employee_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_employee_tracker
-- ----------------------------
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_tracker_id_fkey" FOREIGN KEY ("tracker_id") REFERENCES "public"."tbl_tracker" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee_tracker" ADD CONSTRAINT "tbl_employee_tracker_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
