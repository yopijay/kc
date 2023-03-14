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

 Date: 10/03/2023 14:09:08
*/


-- ----------------------------
-- Table sequence for tbl_services_requests
-- ----------------------------
CREATE SEQUENCE "public"."tbl_services_requests_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_services_requests_id_seq"', 1, true);


-- ----------------------------
-- Table structure for tbl_services_requests
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_requests";
CREATE TABLE "public"."tbl_services_requests" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_requests_id_seq'::regclass),
  "service_id" int4,
  "request" text COLLATE "pg_catalog"."default",
  "personnel" varchar(250) COLLATE "pg_catalog"."default",
  "date_from" varchar(20) COLLATE "pg_catalog"."default",
  "date_to" varchar(20) COLLATE "pg_catalog"."default",
  "time_from" varchar(20) COLLATE "pg_catalog"."default",
  "time_to" varchar(20) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table tbl_services_requests
-- ----------------------------
ALTER TABLE "public"."tbl_services_requests" ADD CONSTRAINT "tbl_services_requests_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_requests
-- ----------------------------
ALTER TABLE "public"."tbl_services_requests" ADD CONSTRAINT "tbl_services_requests_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
