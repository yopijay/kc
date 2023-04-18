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

 Date: 18/04/2023 08:13:21
*/


-- ----------------------------
-- Table sequence for tbl_services_technical
-- ----------------------------
CREATE SEQUENCE "public"."tbl_services_technical_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_services_technical_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_services_technical
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_technical";
CREATE TABLE "public"."tbl_services_technical" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_technical_id_seq'::regclass),
  "service_id" int4,
  "evaluated_by" text COLLATE "pg_catalog"."default",
  "evaluated_by_signature" text COLLATE "pg_catalog"."default",
  "evaluated_by_date" timestamptz(6),
  "eval_noted_by_sup" text COLLATE "pg_catalog"."default",
  "eval_noted_by_sup_signature" text COLLATE "pg_catalog"."default",
  "eval_noted_by_sup_date" timestamptz(6),
  "deliveries_to_customer" int4,
  "tools_equipment" int4,
  "manpower" int4,
  "consumables" int4,
  "others" int4,
  "regular_delivery" int4,
  "to_be_rented" int4,
  "for_completion" int4,
  "for_rectification" int4,
  "supplemental_manning" int4,
  "other_purpose" int4,
  "prepared_by" text COLLATE "pg_catalog"."default",
  "prepared_by_signature" text COLLATE "pg_catalog"."default",
  "prepared_by_date" timestamptz(6),
  "noted_by" text COLLATE "pg_catalog"."default",
  "noted_by_signature" text COLLATE "pg_catalog"."default",
  "noted_by_date" timestamptz(6),
  "authorized_by" text COLLATE "pg_catalog"."default",
  "authorized_by_signature" text COLLATE "pg_catalog"."default",
  "authorized_by_date" timestamptz(6),
  "approved_by" text COLLATE "pg_catalog"."default",
  "approved_by_signature" text COLLATE "pg_catalog"."default",
  "approved_by_date" timestamptz(6),
  "released_by" text COLLATE "pg_catalog"."default",
  "released_by_signature" text COLLATE "pg_catalog"."default",
  "released_by_date" timestamptz(6),
  "received_by" text COLLATE "pg_catalog"."default",
  "received_by_signature" text COLLATE "pg_catalog"."default",
  "received_by_date" timestamptz(6),
  "items" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table tbl_services_technical
-- ----------------------------
ALTER TABLE "public"."tbl_services_technical" ADD CONSTRAINT "tbl_services_technical_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_technical
-- ----------------------------
ALTER TABLE "public"."tbl_services_technical" ADD CONSTRAINT "tbl_services_technical_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
