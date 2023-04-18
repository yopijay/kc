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

 Date: 18/04/2023 08:14:14
*/


-- ----------------------------
-- Table sequence for tbl_users_permissions
-- ----------------------------
CREATE SEQUENCE "public"."tbl_users_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_users_permissions_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_users_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_users_permissions";
CREATE TABLE "public"."tbl_users_permissions" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_users_permissions_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "user_id" int4,
  "permissions" text COLLATE "pg_catalog"."default",
  "updated_by" int4,
  "date_updated" timestamptz(6)
)
;

-- ----------------------------
-- Primary Key structure for table tbl_users_permissions
-- ----------------------------
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_users_permissions
-- ----------------------------
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_permissions" ADD CONSTRAINT "tbl_users_permissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
