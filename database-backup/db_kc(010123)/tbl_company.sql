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

 Date: 01/03/2023 13:16:51
*/


-- ----------------------------
-- Table sequence for tbl_company
-- ----------------------------
CREATE SEQUENCE "public"."tbl_company_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_company_id_seq"', 5, true);

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_company";
CREATE TABLE "public"."tbl_company" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_company_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "owner_id" int4,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "address" varchar(1000) COLLATE "pg_catalog"."default",
  "description" varchar(1000) COLLATE "pg_catalog"."default",
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
-- Records of tbl_company
-- ----------------------------
INSERT INTO "public"."tbl_company" VALUES (2, 'CMP-0000002', 1, 'S-POWER CORPORATION', NULL, NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 11:37:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (1, 'CMP-0000001', 2, 'KC INDUSTRIAL CORPORATION', '#82 CORDILLERA ST. CORNER QUEZON AVE., QUEZON CITY', NULL, 1, 1, 1, NULL, NULL, '2023-01-27 11:36:08+08', '2023-02-07 11:11:16+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (5, 'CMP-0000005', 1, 'KENNETH LAND AND HOLDINGS INC.', NULL, NULL, 0, 1, 1, NULL, NULL, '2023-01-27 11:38:18+08', '2023-02-23 10:14:48+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (3, 'CMP-0000003', 1, 'SYSTEMS POWERMARK CORPORATION', NULL, NULL, 0, 1, 1, NULL, NULL, '2023-01-27 11:37:23+08', '2023-02-23 10:14:53+08', NULL, NULL);
INSERT INTO "public"."tbl_company" VALUES (4, 'CMP-0000004', 1, 'KC ELECTRICAL INNOVATION, INC.', NULL, NULL, 1, 1, 1, NULL, NULL, '2023-01-27 11:38:03+08', '2023-02-28 13:11:51+08', NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_company
-- ----------------------------
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_company
-- ----------------------------
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_company" ADD CONSTRAINT "tbl_company_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
