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

 Date: 01/03/2023 13:16:59
*/


-- ----------------------------
-- Table sequence for tbl_department
-- ----------------------------
CREATE SEQUENCE "public"."tbl_depertment_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_depertment_id_seq"', 39, true);


-- ----------------------------
-- Table structure for tbl_department
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_department";
CREATE TABLE "public"."tbl_department" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_depertment_id_seq'::regclass),
  "series_no" varchar(50) COLLATE "pg_catalog"."default",
  "company_id" int4,
  "department_head_id" int4,
  "name" varchar(150) COLLATE "pg_catalog"."default",
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
-- Records of tbl_department
-- ----------------------------
INSERT INTO "public"."tbl_department" VALUES (1, 'DPT-0000001', 1, 1, 'ACCOUNTING - AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (2, 'DPT-0000002', 1, 1, 'ACCOUNTING - FINANCE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (3, 'DPT-0000003', 1, 1, 'ADMIN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (4, 'DPT-0000004', 1, 1, 'EXECUTIVE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (5, 'DPT-0000005', 1, 1, 'HUMAN RESOURCE - PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:29:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (6, 'DPT-0000006', 1, 1, 'SALES - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:30:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (7, 'DPT-0000007', 1, 1, 'WAREHOUSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:30:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (8, 'DPT-0000008', 2, 1, 'ACCOUNTING - AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 12:58:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (9, 'DPT-0000009', 2, 1, 'ACCOUNTING - PAYABLES', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:04:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (10, 'DPT-0000010', 2, 1, 'ACCOUNTING - PRE AUDIT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:08:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (11, 'DPT-0000011', 2, 1, 'ACCOUNTING - PROJECT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:08:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (12, 'DPT-0000012', 2, 1, 'ACCOUNTING - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:09:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (13, 'DPT-0000013', 2, 1, 'ADMIN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:09:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (14, 'DPT-0000014', 2, 1, 'BUSWAY - DESIGN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (15, 'DPT-0000015', 2, 1, 'BUSWAY - IMPLEMENTATION', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (16, 'DPT-0000016', 2, 1, 'ENGINEERING - CAD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (17, 'DPT-0000017', 2, 1, 'ENGINEERING - COSTING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (18, 'DPT-0000018', 2, 1, 'ENGINEERING - DESIGN', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:10:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (19, 'DPT-0000019', 2, 1, 'ENGINEERING - PROGRAMMING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (20, 'DPT-0000020', 2, 1, 'HUMAN RESOURCE - PAYROLL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (21, 'DPT-0000021', 2, 1, 'HUMAN RESOURCE - RECRUITMENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:11:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (22, 'DPT-0000022', 2, 1, 'IT/MIS', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (23, 'DPT-0000023', 2, 1, 'LOGISTICS', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (24, 'DPT-0000024', 2, 1, 'MANAGEMENT', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (25, 'DPT-0000025', 2, 1, 'MARKETING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (26, 'DPT-0000026', 2, 1, 'PRODUCTION - ASSEMBLY', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:12:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (27, 'DPT-0000027', 2, 1, 'PRODUCTION - BUSBARRING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (28, 'DPT-0000028', 2, 1, 'PRODUCTION - FABRICATION 1', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (29, 'DPT-0000029', 2, 1, 'PRODUCTION - FABRICATION 2', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (30, 'DPT-0000030', 2, 1, 'PRODUCTION - PAINTING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (31, 'DPT-0000031', 2, 1, 'PRODUCTION - QUALITY CONTROL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:13:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (32, 'DPT-0000032', 2, 1, 'PURCHASING', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (33, 'DPT-0000033', 2, 1, 'QUALITY MANAGEMENT OFFICE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (34, 'DPT-0000034', 2, 1, 'SALES - CDD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (35, 'DPT-0000035', 2, 1, 'SALES - PSD', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (36, 'DPT-0000036', 2, 1, 'SALES - WHOLESALE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (37, 'DPT-0000037', 2, 1, 'TECHINCAL', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (38, 'DPT-0000038', 2, 1, 'WAREHOUSE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 13:14:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_department" VALUES (39, 'DPT-0000039', 2, 1, 'ACCOUNTING - FINANCE', NULL, 1, 1, NULL, NULL, NULL, '2023-01-27 16:15:09+08', NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_department
-- ----------------------------
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_department
-- ----------------------------
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."tbl_company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_department_head_id_fkey" FOREIGN KEY ("department_head_id") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_department" ADD CONSTRAINT "tbl_depertment_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
