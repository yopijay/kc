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

 Date: 29/03/2023 16:17:02
*/


-- ----------------------------
-- Table sequence for tbl_services_report
-- ----------------------------
CREATE SEQUENCE "public"."tbl_services_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_services_report_id_seq"', 1, true);


-- ----------------------------
-- Table structure for tbl_services_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_report";
CREATE TABLE "public"."tbl_services_report" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_report_id_seq'::regclass),
  "service_id" int4,
  "work_done" text COLLATE "pg_catalog"."default",
  "personnel_deployed" text COLLATE "pg_catalog"."default",
  "sub_contractors" text COLLATE "pg_catalog"."default",
  "recommendation" text COLLATE "pg_catalog"."default",
  "recommendation_signature" text COLLATE "pg_catalog"."default",
  "recommendation_date" timestamptz(6),
  "comments" text COLLATE "pg_catalog"."default",
  "comments_signature" text COLLATE "pg_catalog"."default",
  "comments_date" timestamptz(6)
)
;

-- ----------------------------
-- Primary Key structure for table tbl_services_report
-- ----------------------------
ALTER TABLE "public"."tbl_services_report" ADD CONSTRAINT "tbl_services_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_report
-- ----------------------------
ALTER TABLE "public"."tbl_services_report" ADD CONSTRAINT "tbl_services_report_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
