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

 Date: 01/03/2023 13:17:22
*/


-- ----------------------------
-- Table sequence for tbl_sub_category
-- ----------------------------
CREATE SEQUENCE "public"."tbl_sub_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_sub_category_id_seq"', 26, true);


-- ----------------------------
-- Table structure for tbl_sub_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sub_category";
CREATE TABLE "public"."tbl_sub_category" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_sub_category_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "category_id" int4,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "tag" varchar(10) COLLATE "pg_catalog"."default",
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
-- Records of tbl_sub_category
-- ----------------------------
INSERT INTO "public"."tbl_sub_category" VALUES (1, 'ITM-0000001', 1, 'PAPER', 'PPR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:07:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (4, 'ITM-0000004', 1, 'PRINTER INK AND TONER', 'TNR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:09:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (5, 'ITM-0000005', 1, 'STAPLERS, STAPLES, PAPER CLIPS, AND PUSH PINS', 'CLPS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:10:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (6, 'ITM-0000006', 1, 'SHIPPING AND PACKAGING SUPPLIES', 'SPS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:10:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (7, 'ITM-0000007', 1, 'ORGANIZERS', 'ORGR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:12:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (8, 'ITM-0000008', 1, 'PAPER SHREDDERS', 'SHRD', 1, 1, NULL, NULL, NULL, '2023-02-14 11:12:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (9, 'ITM-0000009', 1, 'OFFICE STATIONARY', 'STNR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (10, 'ITM-0000010', 1, 'BUSINESS CARDS', 'BC', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (11, 'ITM-0000011', 2, 'OFFICE CLEANING SUPPLIES', 'CLN', 1, 1, NULL, NULL, NULL, '2023-02-14 11:13:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (12, 'ITM-0000012', 2, 'FIRST AID', 'AID', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (13, 'ITM-0000013', 3, 'OFFICE DESKS', 'DSK', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (15, 'ITM-0000015', 3, 'WHITEBOARDS', 'BRDS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:14:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (16, 'ITM-0000016', 3, 'FILING CABINETS', 'FC', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (17, 'ITM-0000017', 4, 'SYSTEM UNIT', 'SU', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (18, 'ITM-0000018', 4, 'LAPTOPS', 'LT', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (19, 'ITM-0000019', 4, 'MOUSE', 'MSE', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (20, 'ITM-0000020', 4, 'KEYBOARD', 'KB', 1, 1, NULL, NULL, NULL, '2023-02-14 11:15:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (21, 'ITM-0000021', 4, 'PRINTER', 'PRTR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (22, 'ITM-0000022', 4, 'MONITOR', 'MNTR', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (23, 'ITM-0000023', 4, 'NETWORKING EQUIPMENTS', 'NTWK', 1, 1, NULL, NULL, NULL, '2023-02-14 11:16:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (25, 'ITM-0000025', 4, 'HARDDRIVES', 'HD', 1, 1, NULL, NULL, NULL, '2023-02-14 11:17:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (26, 'ITM-0000026', 4, 'PHONES', 'PHNS', 1, 1, NULL, NULL, NULL, '2023-02-14 11:17:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (3, 'ITM-0000003', 1, 'DRY ERASE MARKERS AND HIGHLIGHTERS', 'DEMH', 1, 1, 1, NULL, NULL, '2023-02-14 11:09:26+08', '2023-02-14 11:26:06+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (2, 'ITM-0000002', 1, 'PENS', 'PEN', 1, 1, 1, NULL, NULL, '2023-02-14 11:09:07+08', '2023-02-14 11:26:30+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (14, 'ITM-0000014', 3, 'OFFICE CHAIRS', 'CHR', 1, 1, 1, NULL, NULL, '2023-02-14 11:14:42+08', '2023-02-14 11:53:43+08', NULL, NULL);
INSERT INTO "public"."tbl_sub_category" VALUES (24, 'ITM-0000024', 4, 'PROJECTORS', 'PRJR', 0, 1, 1, NULL, NULL, '2023-02-14 11:16:59+08', '2023-02-17 14:57:36+08', NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_sub_category
-- ----------------------------
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_sub_category
-- ----------------------------
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."tbl_category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_sub_category" ADD CONSTRAINT "tbl_sub_category_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
