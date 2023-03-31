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

 Date: 31/03/2023 11:31:57
*/


-- ----------------------------
-- Table sequence for tbl_employee_monitoring
-- ----------------------------
CREATE SEQUENCE "public"."tbl_employee_monitoring_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_employee_monitoring_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_employee_monitoring
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_employee_monitoring";
CREATE TABLE "public"."tbl_employee_monitoring" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_employee_monitoring_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_id" int4,
  "user_id" int4,
  "branch" varchar(50) COLLATE "pg_catalog"."default",
  "date_in" varchar(20) COLLATE "pg_catalog"."default",
  "date_out" varchar(20) COLLATE "pg_catalog"."default",
  "time_in" varchar(20) COLLATE "pg_catalog"."default",
  "time_out" varchar(20) COLLATE "pg_catalog"."default",
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6)
)
;

-- ----------------------------
-- Primary Key structure for table tbl_employee_monitoring
-- ----------------------------
ALTER TABLE "public"."tbl_employee_monitoring" ADD CONSTRAINT "tbl_employee_monitoring_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_employee_monitoring
-- ----------------------------
ALTER TABLE "public"."tbl_employee_monitoring" ADD CONSTRAINT "tbl_employee_monitoring_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee_monitoring" ADD CONSTRAINT "tbl_employee_monitoring_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."tbl_department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_employee_monitoring" ADD CONSTRAINT "tbl_employee_monitoring_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
