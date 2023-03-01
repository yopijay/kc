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

 Date: 01/03/2023 13:16:21
*/


-- ----------------------------
-- Table structure for tbl_assign_asset
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_assign_asset";
CREATE TABLE "public"."tbl_assign_asset" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_assign_asset_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_id" int4,
  "category_id" int4,
  "sub_category_id" int4,
  "asset_id" int4,
  "issued_to" int4,
  "remarks" varchar(1000) COLLATE "pg_catalog"."default",
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
-- Records of tbl_assign_asset
-- ----------------------------
INSERT INTO "public"."tbl_assign_asset" VALUES (1, 'ISSUANCE-0000001', 2, 22, 3, 13, 1, 107, NULL, 1, 1, NULL, NULL, NULL, '2023-02-23 15:54:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (2, 'ISSUANCE-0000002', 2, 22, 3, 14, 4, 107, NULL, 1, 1, NULL, NULL, NULL, '2023-02-23 16:04:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (3, 'ISSUANCE-0000003', 2, 22, 3, 16, 9, 104, NULL, 1, 1, 1, NULL, NULL, '2023-02-23 16:26:25+08', '2023-02-27 14:11:09+08', NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (4, 'ISSUANCE-0000004', 1, 5, 4, 21, 27, 8, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 15:03:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (5, 'ISSUANCE-0000005', 2, 22, 4, 17, 12, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:00:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (6, 'ISSUANCE-0000006', 2, 22, 4, 20, 15, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (7, 'ISSUANCE-0000007', 2, 22, 4, 22, 17, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (8, 'ISSUANCE-0000008', 2, 22, 4, 22, 18, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:01:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (9, 'ISSUANCE-0000009', 2, 22, 3, 13, 2, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:02:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (10, 'ISSUANCE-0000010', 2, 22, 3, 14, 5, 353, NULL, 1, 1, NULL, NULL, NULL, '2023-02-27 17:02:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assign_asset" VALUES (11, 'ISSUANCE-0000011', 2, 39, 4, 21, 28, 341, NULL, 1, 1, NULL, NULL, NULL, '2023-03-01 11:35:03+08', NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_assign_asset
-- ----------------------------
ALTER TABLE "public"."tbl_assign_asset" ADD CONSTRAINT "tbl_assign_asset_pkey" PRIMARY KEY ("id");
