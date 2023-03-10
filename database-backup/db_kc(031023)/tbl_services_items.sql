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

 Date: 10/03/2023 14:08:34
*/


-- ----------------------------
-- Table sequence for tbl_services_items
-- ----------------------------
CREATE SEQUENCE "public"."tbl_services_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


-- ----------------------------
-- Table structure for tbl_services_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_items";
CREATE TABLE "public"."tbl_services_items" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_items_id_seq'::regclass),
  "service_id" int4,
  "item" varchar(100) COLLATE "pg_catalog"."default",
  "qty" varchar(20) COLLATE "pg_catalog"."default",
  "unit" varchar(50) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table tbl_services_items
-- ----------------------------
ALTER TABLE "public"."tbl_services_items" ADD CONSTRAINT "tbl_services_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_items
-- ----------------------------
ALTER TABLE "public"."tbl_services_items" ADD CONSTRAINT "tbl_services_items_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
