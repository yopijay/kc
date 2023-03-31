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

 Date: 30/03/2023 16:46:37
*/


-- ----------------------------
-- Table sequence for tbl_users_access
-- ----------------------------
CREATE SEQUENCE "public"."tbl_users_access_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_users_access_id_seq"', 1, false);


-- ----------------------------
-- Table structure for tbl_users_access
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_users_access";
CREATE TABLE "public"."tbl_users_access" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_users_access_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "module_id" int4,
  "sub_module_id" int4,
  "user_id" int4,
  "is_read" int4,
  "is_create" int4,
  "is_update" int4,
  "is_delete" int4,
  "is_import" int4,
  "is_export" int4,
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_users_access
-- ----------------------------
INSERT INTO "public"."tbl_users_access" VALUES (1, NULL, 3, 4, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-03-08 14:34:04+08', NULL, NULL);
INSERT INTO "public"."tbl_users_access" VALUES (2, NULL, 3, 5, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-03-08 14:34:45+08', NULL, NULL);
INSERT INTO "public"."tbl_users_access" VALUES (3, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-03-08 16:02:32+08', NULL, NULL);
INSERT INTO "public"."tbl_users_access" VALUES (4, NULL, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, '2023-03-08 16:02:56+08', NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_users_access
-- ----------------------------
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_users_access
-- ----------------------------
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "public"."tbl_module" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_sub_module_id_fkey" FOREIGN KEY ("sub_module_id") REFERENCES "public"."tbl_sub_module" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users_access" ADD CONSTRAINT "tbl_users_access_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
