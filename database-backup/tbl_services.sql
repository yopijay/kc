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

 Date: 30/03/2023 16:44:58
*/


-- ----------------------------
-- Table structure for tbl_services
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services";
CREATE TABLE "public"."tbl_services" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "service_request_no" varchar(50) COLLATE "pg_catalog"."default",
  "date_prepared" varchar(20) COLLATE "pg_catalog"."default",
  "date_requested" varchar(20) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default",
  "created_by" int4,
  "updated_by" int4,
  "deleted_by" int4,
  "date_created" timestamptz(6),
  "date_updated" timestamptz(6),
  "date_deleted" timestamptz(6)
)
;

-- ----------------------------
-- Records of tbl_services
-- ----------------------------
INSERT INTO "public"."tbl_services" VALUES (5, 'SRVC-0000005', '2303-005', '2023-3-29', '2023-3-29', 'closed', 1, 1, NULL, '2023-03-29 11:04:48+08', '2023-03-29 11:37:27+08', NULL);
INSERT INTO "public"."tbl_services" VALUES (2, 'SRVC-0000002', '2303-002', '2023-2-9', '2023-2-9', 'closed', 1, 1, NULL, '2023-03-23 13:45:15+08', '2023-03-23 13:48:08+08', NULL);
INSERT INTO "public"."tbl_services" VALUES (1, 'SRVC-0000001', '2303-001', '2023-1-24', '2023-1-24', 'done', 1, 1, NULL, '2023-03-23 13:07:11+08', '2023-03-24 11:14:22+08', NULL);
INSERT INTO "public"."tbl_services" VALUES (3, 'SRVC-0000003', '2303-003', '2023-1-24', '2023-1-24', 'closed', 1, 1, NULL, '2023-03-24 13:17:21+08', '2023-03-24 13:17:54+08', NULL);
INSERT INTO "public"."tbl_services" VALUES (4, 'SRVC-0000004', '2303-004', '2023-2-9', '2023-2-9', 'done', 1, 1, NULL, '2023-03-28 14:53:45+08', '2023-03-28 15:10:29+08', NULL);

-- ----------------------------
-- Primary Key structure for table tbl_services
-- ----------------------------
ALTER TABLE "public"."tbl_services" ADD CONSTRAINT "tbl_services_pkey" PRIMARY KEY ("id");
