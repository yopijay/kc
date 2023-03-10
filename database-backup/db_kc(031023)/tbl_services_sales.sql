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

 Date: 10/03/2023 14:40:30
*/


-- ----------------------------
-- Table sequence for tbl_services_sales
-- ----------------------------
CREATE SEQUENCE "public"."tbl_services_sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


-- ----------------------------
-- Table structure for tbl_services_sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_services_sales";
CREATE TABLE "public"."tbl_services_sales" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_services_sales_id_seq'::regclass),
  "service_id" int4,
  "so_no" varchar(100) COLLATE "pg_catalog"."default",
  "po_no" varchar(100) COLLATE "pg_catalog"."default",
  "customer" text COLLATE "pg_catalog"."default",
  "project" text COLLATE "pg_catalog"."default",
  "service_location" text COLLATE "pg_catalog"."default",
  "contact_person" varchar(200) COLLATE "pg_catalog"."default",
  "position" varchar(50) COLLATE "pg_catalog"."default",
  "requested_by" text COLLATE "pg_catalog"."default",
  "requested_by_signature" text COLLATE "pg_catalog"."default",
  "requested_by_date" timestamptz(6),
  "noted_by_sup" text COLLATE "pg_catalog"."default",
  "noted_by_sup_signature" text COLLATE "pg_catalog"."default",
  "noted_by_sup_date" timestamptz(6),
  "date_needed" varchar(20) COLLATE "pg_catalog"."default",
  "time_expected" varchar(20) COLLATE "pg_catalog"."default",
  "warranty" varchar(20) COLLATE "pg_catalog"."default",
  "up_to" varchar(50) COLLATE "pg_catalog"."default",
  "for_billing" varchar(10) COLLATE "pg_catalog"."default",
  "contact_number" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_services_sales
-- ----------------------------
INSERT INTO "public"."tbl_services_sales" VALUES (1, 1, '2023-zsp-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCTION (JPCHED)', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVES', NULL, 'ELAINE BELARMINO', NULL, '2023-03-10 13:48:26+08', 'EDMUN WINGKUN', NULL, '2023-03-10 13:48:26+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'no', 'undefined');
INSERT INTO "public"."tbl_services_sales" VALUES (2, 2, '2023-ZSP-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCTION', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVES', NULL, 'ELAINE BELARMINO', NULL, '2023-03-10 13:53:19+08', 'EDMUN WINGKUN', NULL, '2023-03-10 13:53:19+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'no', 'undefined');
INSERT INTO "public"."tbl_services_sales" VALUES (3, 3, '2023-ZSP-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCTION', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVES', NULL, 'ELAINE BELARMINO', NULL, '2023-03-10 13:54:21+08', 'EDMUN WINGKUN', NULL, '2023-03-10 13:54:21+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'no', 'undefined');
INSERT INTO "public"."tbl_services_sales" VALUES (4, 4, '2023-ZSP-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCTION', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVES', NULL, 'ELAINE BELARMINO', NULL, '2023-03-10 13:54:54+08', 'EDMUN WINGKUN', NULL, '2023-03-10 13:54:54+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'no', 'undefined');

-- ----------------------------
-- Primary Key structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
