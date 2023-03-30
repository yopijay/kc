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

 Date: 30/03/2023 16:44:07
*/


-- ----------------------------
-- Table structure for tbl_assets
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_assets";
CREATE TABLE "public"."tbl_assets" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_assets_id_seq'::regclass),
  "series_no" varchar(20) COLLATE "pg_catalog"."default",
  "category_id" int4,
  "sub_category_id" int4,
  "asset_tag" varchar(100) COLLATE "pg_catalog"."default",
  "is_released" int4,
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
-- Records of tbl_assets
-- ----------------------------
INSERT INTO "public"."tbl_assets" VALUES (6, 'QIM-0000006', 3, 15, 'ASSTS-FURN-BRDS-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:16:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (7, 'QIM-0000007', 3, 15, 'ASSTS-FURN-BRDS-0000002', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:18:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (8, 'QIM-0000008', 3, 16, 'ASSTS-FURN-FC-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:28:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (10, 'QIM-0000010', 3, 16, 'ASSTS-FURN-FC-0000003', 0, 1, 1, NULL, NULL, NULL, '2023-02-16 10:59:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (19, 'QIM-0000019', 4, 23, 'ASSTS-TECH-NTWK-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 13:55:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (20, 'QIM-0000020', 4, 23, 'ASSTS-TECH-NTWK-0000002', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:29:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (21, 'QIM-0000021', 4, 23, 'ASSTS-TECH-NTWK-0000003', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:34:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (22, 'QIM-0000022', 4, 23, 'ASSTS-TECH-NTWK-0000004', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 14:36:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (23, 'QIM-0000023', 4, 25, 'ASSTS-TECH-HD-0000001', 0, 1, 1, NULL, NULL, NULL, '2023-02-17 15:15:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (3, 'QIM-0000003', 3, 13, 'ASSTS-FURN-DSK-0000003', 0, 1, 1, 1, NULL, NULL, '2023-02-15 09:19:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (26, 'QIM-0000026', 4, 23, 'ASSTS-TECH-NTWK-0000005', 0, 1, 1, 1, NULL, NULL, '2023-02-21 11:02:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (24, 'QIM-0000024', 4, 25, 'ASSTS-TECH-HD-0000002', 0, 1, 1, 1, NULL, NULL, '2023-02-17 15:16:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (11, 'QIM-0000011', 3, 15, 'ASSTS-FURN-BRDS-0000003', 0, 1, 1, 1, NULL, NULL, '2023-02-16 11:16:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (25, 'QIM-0000025', 4, 26, 'ASSTS-TECH-PHNS-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 15:31:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (1, 'QIM-0000001', 3, 13, 'ASSTS-FURN-DSK-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:16:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (13, 'QIM-0000013', 4, 18, 'ASSTS-TECH-LT-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 09:35:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (14, 'QIM-0000014', 4, 19, 'ASSTS-TECH-MSE-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 10:22:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (4, 'QIM-0000004', 3, 14, 'ASSTS-FURN-CHR-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:46:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (9, 'QIM-0000009', 3, 16, 'ASSTS-FURN-FC-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-16 10:29:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (16, 'QIM-0000016', 4, 21, 'ASSTS-TECH-PRTR-0000001', 0, 1, 1, 1, NULL, NULL, '2023-02-17 11:35:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (27, 'QIM-0000027', 4, 21, 'ASSTS-TECH-PRTR-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-27 15:02:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (12, 'QIM-0000012', 4, 17, 'ASSTS-TECH-SU-0000001', 1, 1, 1, 1, NULL, NULL, '2023-02-17 08:56:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (15, 'QIM-0000015', 4, 20, 'ASSTS-TECH-KB-0000001', 1, 1, 1, 1, NULL, NULL, '2023-02-17 10:40:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (17, 'QIM-0000017', 4, 22, 'ASSTS-TECH-MNTR-0000001', 1, 1, 1, NULL, NULL, NULL, '2023-02-17 12:00:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (18, 'QIM-0000018', 4, 22, 'ASSTS-TECH-MNTR-0000002', 1, 1, 1, 1, NULL, NULL, '2023-02-17 12:01:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (2, 'QIM-0000002', 3, 13, 'ASSTS-FURN-DSK-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-02-15 09:18:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (5, 'QIM-0000005', 3, 14, 'ASSTS-FURN-CHR-0000002', 1, 1, 1, 1, NULL, NULL, '2023-02-15 14:28:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (28, 'QIM-0000028', 4, 21, 'ASSTS-TECH-PRTR-0000003', 1, 1, 1, NULL, NULL, NULL, '2023-03-01 11:33:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (29, 'QIM-0000029', 4, 19, 'ASSTS-TECH-MSE-0000002', 1, 1, 1, NULL, NULL, NULL, '2023-03-01 14:10:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (30, 'QIM-0000030', 4, 21, 'ASSTS-TECH-PRTR-0000004', 1, 1, 1, NULL, NULL, NULL, '2023-03-02 16:04:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (31, 'QIM-0000031', 4, 21, 'ASSTS-TECH-PRTR-0000005', 1, 1, 1, 1, NULL, NULL, '2023-03-06 10:19:28+08', '2023-03-14 08:50:50+08', NULL, NULL);
INSERT INTO "public"."tbl_assets" VALUES (32, 'QIM-0000032', 4, 21, 'ASSTS-TECH-PRTR-0000006', 0, 1, 1, NULL, NULL, NULL, '2023-03-28 14:09:42+08', NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_assets
-- ----------------------------
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_assets
-- ----------------------------
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_assets" ADD CONSTRAINT "tbl_assets_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
