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

 Date: 30/03/2023 16:46:19
*/


-- ----------------------------
-- Table structure for tbl_sub_module
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sub_module";
CREATE TABLE "public"."tbl_sub_module" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_sub_module_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "module_id" int4,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "path" varchar(120) COLLATE "pg_catalog"."default",
  "is_maintenance" int4,
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
-- Records of tbl_sub_module
-- ----------------------------
INSERT INTO "public"."tbl_sub_module" VALUES (2, 'SUB-MDL-0000002', 1, 'DEPARTMENT', '/department', 0, 1, 1, 1, NULL, NULL, '2023-03-08 09:19:09+08', '2023-03-08 11:16:57+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (1, 'SUB-MDL-0000001', 1, 'COMPANY', '/company', 0, 1, 1, 1, NULL, NULL, '2023-03-08 09:15:16+08', '2023-03-08 11:16:59+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (3, 'SUB-MDL-0000003', 1, 'POSITION', '/position', 0, 1, 1, 1, NULL, NULL, '2023-03-08 09:19:19+08', '2023-03-08 11:19:10+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (4, 'SUB-MDL-0000004', 3, 'USER', '/user', 1, 1, 1, NULL, NULL, NULL, '2023-03-08 13:20:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_module" VALUES (5, 'SUB-MDL-0000005', 3, 'USER-ACCESS', '/user-access', 1, 1, 1, 1, NULL, NULL, '2023-03-08 13:20:18+08', '2023-03-08 14:15:13+08', NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_sub_module
-- ----------------------------
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_sub_module
-- ----------------------------
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "public"."tbl_module" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_module" ADD CONSTRAINT "tbl_sub_module_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
