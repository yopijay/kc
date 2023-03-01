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

 Date: 01/03/2023 13:17:49
*/


-- ----------------------------
-- Table sequence for tbl_users
-- ----------------------------
CREATE SEQUENCE "public"."tbl_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

SELECT setval('"public"."tbl_users_id_seq"', 495, true);


-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_users";
CREATE TABLE "public"."tbl_users" (
  "id" int4 NOT NULL DEFAULT nextval('tbl_users_id_seq'::regclass),
  "series_no" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(150) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "contact_no" varchar(20) COLLATE "pg_catalog"."default",
  "is_email_verified" int4,
  "is_contact_no_verified" int4,
  "user_level" varchar(20) COLLATE "pg_catalog"."default",
  "is_logged" int4,
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
-- Records of tbl_users
-- ----------------------------
INSERT INTO "public"."tbl_users" VALUES (19, 'USR-0000018', 'jonathanbraganza149@gmail.com', NULL, '9178961908', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:38:33+08', '2023-02-02 14:41:26+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (20, 'USR-0000019', 'vhie0021@gmail.com', NULL, '9756742073', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:39:26+08', '2023-02-02 14:41:34+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (21, 'USR-0000020', 'menorlynlee@gmail.com', NULL, '9291008698', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:40:33+08', '2023-02-02 14:41:41+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (11, 'USR-0000010', 'careers@kcic.com.ph', NULL, '9178336166', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:07:25+08', '2023-02-02 14:43:29+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (12, 'USR-0000011', 'cheryl_uy@kcic.com.ph', NULL, '9178360071', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:08:36+08', '2023-02-02 14:43:39+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (13, 'USR-0000012', 'jle_2152@yahoo.com', NULL, '9281049321', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:24:03+08', '2023-02-02 14:44:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (14, 'USR-0000013', 'liumillie@yahoo.com.hk', NULL, '9228027771', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:25:20+08', '2023-02-02 14:45:03+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (15, 'USR-0000014', 'czarinarose.destura@gmail.com', NULL, '9154462511', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:26:17+08', '2023-02-02 14:45:10+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (16, 'USR-0000015', 'diazmariaconcepcion08@gmail.com', NULL, '9772902845', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:27:24+08', '2023-02-02 14:45:24+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (17, 'USR-0000016', 'Kevin.Nicoakhie@Gmail.Com', NULL, '9976034139', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:33:31+08', '2023-02-02 14:45:37+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (18, 'USR-0000017', 'Xtine2us@gmail.com', NULL, '9175366659', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 14:35:26+08', '2023-02-02 14:46:33+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (22, 'USR-0000021', NULL, NULL, '9661705672', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:49:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (23, 'USR-0000022', 'montikat_94@yahoo.com', NULL, '9175778578', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:50:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (24, 'USR-0000023', 'Jovypregoner@gmail.com', NULL, '9772915093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:54:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (25, 'USR-0000024', 'albertoecleo@gmail.com', NULL, '9059476783', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:55:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (26, 'USR-0000025', 'rowelgagarin@yahoo.com', NULL, '9611087113', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:56:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (27, 'USR-0000026', 'richjoellasaca@gmail.com', NULL, '9283187607', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:57:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (9, 'USR-0000008', 'nglita99@gmail.com', NULL, '9290887778', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:50:29+08', '2023-02-02 14:02:32+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (8, 'USR-0000007', 'sanly_29@yahoo.com', NULL, '9175208578', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:49:13+08', '2023-02-02 14:02:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (7, 'USR-0000006', 'marlonuylasam@yahoo.com', NULL, '9175152668', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:45:36+08', '2023-02-02 14:03:06+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (6, 'USR-0000005', 'cristy_eugenio@yahoo.com.ph', NULL, '9237393855', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 13:35:50+08', '2023-02-02 14:03:15+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (5, 'USR-0000004', 'careers@kcic.com.ph', NULL, '9178146140', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-02 11:51:48+08', '2023-02-02 14:03:38+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (4, 'USR-0000003', 'navarropaterson08@gmail.com', NULL, '9167009609', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-01-31 16:50:01+08', '2023-02-02 14:03:51+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (3, 'USR-0000002', 'constancia_uy@kcic.com.ph', NULL, '09178110071', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-01-31 16:34:03+08', '2023-02-02 14:03:59+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (2, 'USR-0000001', 'agustin_uy@kcic.com.ph', NULL, '09178380071', 0, 0, 'superadmin', 0, 1, 1, 1, NULL, NULL, '2023-01-31 15:37:24+08', '2023-02-02 14:04:04+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (10, 'USR-0000009', 'rodolfo_belleza@kcic.com.ph', NULL, NULL, 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 14:05:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (38, 'USR-0000037', 'maricelmartinez1976@gmail.com', NULL, '9258470116', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:36:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (39, 'USR-0000038', 'gcsantos.2914@gmail.com', NULL, '9296895601', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:36:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (40, 'USR-0000039', 'leslie.delossantos24@gmail.com', NULL, '9368829521', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:37:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (41, 'USR-0000040', 'darrenmanjares@gmail.com', NULL, '9774745358', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:39:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (42, 'USR-0000041', 'csgabriola13@gmail.com', NULL, '9055505045', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:40:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (28, 'USR-0000027', 'Piolo.Villagracia01@Gmail.Com', NULL, '9498738853', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:00:49+08', '2023-02-02 15:16:24+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (31, 'USR-0000030', 'Jesselecleo07@Gmail.Com', NULL, '9638499731', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:19:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (30, 'USR-0000029', 'Degracia.Faith12@Gmail.Com', NULL, '9568100919', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:18:35+08', '2023-02-02 15:19:22+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (29, 'USR-0000028', 'Salosamarklaurence8@Gmail.Com', NULL, '9635264854', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 15:17:52+08', '2023-02-02 15:19:30+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (32, 'USR-0000031', 'Lemontaladro3@Gmail.Com', NULL, '9954241335', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:25:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (33, 'USR-0000032', 'martillanorence9@gmail.com', NULL, '9773730178', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:26:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (34, 'USR-0000033', 'mtumampil03@gmail.com', NULL, '9772571043', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:27:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (35, 'USR-0000034', 'payadkyrgyz2@gmail.com', NULL, '9916067674', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:28:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (36, 'USR-0000035', 'oranderichard@gmail.com', NULL, '9557581445', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:29:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (37, 'USR-0000036', 'cmariyadennise@gmail.com', NULL, '9185236583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:30:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (43, 'USR-0000042', 'maricardelossantos065@gmail.com', NULL, '9274156451', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 15:41:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (44, 'USR-0000043', 'kathleeneloisemercado@gmail.com', NULL, '9152479714', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:47:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (45, 'USR-0000044', 'joandaguno19@yahoo.com', NULL, '9381255797', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-02 16:48:33+08', '2023-02-02 16:49:06+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (46, 'USR-0000045', 'ijf.munoz@gmail.com', NULL, '9076741952', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:49:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (47, 'USR-0000046', 'marymint02@yahoo.com', NULL, '9477019200', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:52:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (48, 'USR-0000047', 'felizardo@gmail.com', NULL, '9177283131', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-02 16:53:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (49, 'USR-0000048', 'ramil.magyaya29@yahoo.com.ph', NULL, '9176241505', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:39:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (50, 'USR-0000049', 'alexcyscelis28@gmail.com', NULL, '9555276586', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:48:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (51, 'USR-0000050', 'Eigodelon@gmail.com', NULL, '9171121744', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 08:53:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (52, 'USR-0000051', 'hamor2020@gmail.com', NULL, '9196908459', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:03:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (53, 'USR-0000052', 'josephine1412@gmail.com', NULL, '9979817389', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:04:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (54, 'USR-0000053', 'jaypsphilip98@gmail.com', NULL, '9083445822', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:04:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (55, 'USR-0000054', 'rinzarzola11@gmail.com', NULL, '9127025479', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:05:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (56, 'USR-0000055', 'garciaanalyn515@gmail.com', NULL, '9353132937', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:06:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (57, 'USR-0000056', 'ponsicaarlene3@gmail.com', NULL, '9508430630', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:06:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (58, 'USR-0000057', 'shielafrancisco2474@gmail.com', NULL, '9955055682', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:07:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (59, 'USR-0000058', 'charliemarquez474@gmail.com', NULL, '9979211017', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:08:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (60, 'USR-0000059', 'Leth_Ilao08@Yahoo.Com.Ph', NULL, '9171539487', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:09:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (61, 'USR-0000060', 'Jeromelchew@Yahoo.Com', NULL, '9568213325', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:09:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (62, 'USR-0000061', 'Joygumahin20@Gmail.Com', NULL, '9753832575', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:11:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (63, 'USR-0000062', 'tonyfrancisco226@yahoo.com', NULL, '9178818221', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:11:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (65, 'USR-0000064', 'paulo5bernardo9@gmail.com', NULL, '9612957013', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:32:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (64, 'USR-0000063', 'arvinjosephtemporal@gmail.com', NULL, '9175621127', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-03 09:12:50+08', '2023-02-03 09:33:04+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (66, 'USR-0000065', 'jennifertiongson52@gmail.com', NULL, '9319665620', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:33:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (67, 'USR-0000066', 'jocelynorpilla7@gmail.com', NULL, '9317924701', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:34:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (68, 'USR-0000067', 'pasteleroc30@gmail.com', NULL, '9291062147', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:34:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (69, 'USR-0000068', 'bullonharold@gmail.com', NULL, '9063469093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:36:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (70, 'USR-0000069', 'aningatmyra011994@gmail.com', NULL, '9774537349', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:38:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (71, 'USR-0000070', 'noel.ramos27@yahoo.com', NULL, '9983544427', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:39:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (72, 'USR-0000071', 'Aikken24@gmail.com', NULL, '9266596564', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:39:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (73, 'USR-0000072', 'jeanviruz21@gmail.com', NULL, '9164653126', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:40:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (74, 'USR-0000073', 'cristellemofz@gmail.com', NULL, '9285754281', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:41:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (75, 'USR-0000074', 'harveysamontiza22@gmail.com', NULL, '9309443122', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:42:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (76, 'USR-0000075', 'carlojunetolentino@gmail.com', NULL, '9639830817', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:47:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (77, 'USR-0000076', 'jepyok8354@gmail.com', NULL, '9174756228', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:48:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (78, 'USR-0000077', 'Adcaparida2988@Gmail.Com', NULL, '9568856897', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:48:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (79, 'USR-0000078', 'Jjjohnny.T19@Gmail.Com', NULL, '9302917903', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:49:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (80, 'USR-0000079', 'tontonanthony007@gmail.com', NULL, '9508774299', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:50:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (81, 'USR-0000080', 'lalain1231lacostales@gmail.com', NULL, '9182411347', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:50:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (82, 'USR-0000081', 'pauljosephllanes@yahoo.com', NULL, '9061400114', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (83, 'USR-0000082', 'starskie_sayson@yahoo.com', NULL, '9469148652', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:58:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (84, 'USR-0000083', 'rhomardoctolero@gmail.com', NULL, '9154527247', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 09:59:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (85, 'USR-0000084', 'bryan.reodica1217@gmail.com', NULL, '9195358160', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:00:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (86, 'USR-0000085', 'Pedernal_wilfrederick@yahoo.com', NULL, '9369094552', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:06:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (87, 'USR-0000086', 'aikojbuenaflor@gmail.com', NULL, '9752477879', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:06:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (88, 'USR-0000087', 'jamaicagayagcaoili1997@gmail.com', NULL, '9153580875', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:07:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (89, 'USR-0000088', 'kevinzorilla@gmail.com', NULL, '9054235300', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:08:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (90, 'USR-0000089', 'eymardbueno@gmail.com', NULL, '9058500197', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:09:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (91, 'USR-0000090', 'arlohn09@gmail.com', NULL, '9665690221', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:10:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (92, 'USR-0000091', 'earjay74@gmail.com', NULL, '9152758684', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:11:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (93, 'USR-0000092', 'albretchsumalde1@gmail.com', NULL, '9165323624', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:12:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (94, 'USR-0000093', 'benjieromano25@gmail.com', NULL, '9060643098', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:13:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (95, 'USR-0000094', 'jleevibares@gmail.com', NULL, '9171169004', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:14:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (96, 'USR-0000095', 'Ydiyco@gmail.com', NULL, '9276720455', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:15:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (97, 'USR-0000096', 'occidental.aileen09@gmail.com', NULL, '9770189141', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:15:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (99, 'USR-0000098', 'Judybaldo2025@Gmail.Com', NULL, '9974812915', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:16:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (100, 'USR-0000099', 'Annieivieo@Gmail.Com', NULL, '9168749825', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:18:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (101, 'USR-0000100', 'Alcedokimberlya@gmail.com', NULL, '9279371166', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:19:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (102, 'USR-0000101', 'raquel_alob@yahoo.com', NULL, '9569634458', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:20:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (116, 'USR-0000115', 'nongpales75@gmail.com', NULL, '09463555524', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:24:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (103, 'USR-0000102', 'darleneplomenteraflores@gmail.com', NULL, NULL, 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:24:11+08', '2023-02-03 10:25:33+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (104, 'USR-0000103', 'mabel.rabia@yahoo.com', NULL, '9268860537', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:25:18+08', '2023-02-03 10:25:38+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (105, 'USR-0000104', 'demijaneacosta@gmail.com', NULL, '9363679255', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:30:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (106, 'USR-0000105', 'rmarkg91@gmail.com', NULL, '9298886708', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:31:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (107, 'USR-0000106', 'jazzel.anareta11@mail.com', NULL, '9615811241', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:31:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (108, 'USR-0000107', 'ecv30@yahoo.com', NULL, '9053275093', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:32:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (109, 'USR-0000108', 'makiplantamj08@gmail.com', NULL, '9662565033', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:37:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (110, 'USR-0000109', 'israel_pangilinan@systemspowermark.com.ph', NULL, '9662153955', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:39:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (111, 'USR-0000110', 'junbsalacup@gmail.com', NULL, '9158622678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:40:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (112, 'USR-0000111', 'edmunwingkun@yahoo.com', NULL, '9985460156', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:40:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (113, 'USR-0000112', 'jonnelebayan08@gmail.com', NULL, '9154796592', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:41:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (114, 'USR-0000113', 'fnsargento@gmail.com', NULL, '9950181803', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:42:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (115, 'USR-0000114', 'Jpetate@gmail.com', NULL, '9995469641', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-03 10:44:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (117, 'USR-0000116', NULL, NULL, '9150127848', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:25:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (118, 'USR-0000117', 'supermanrodel@gmail.com', NULL, '9300098047', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:26:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (119, 'USR-0000118', 'amorosoallyson1@gmail.com', NULL, '9552957912', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:27:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (120, 'USR-0000119', 'carlojohnmondigo@gmil.com', NULL, '9504884868', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:28:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (121, 'USR-0000120', 'marvinarzaga30@gmail.com', NULL, '9094488390', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:29:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (122, 'USR-0000121', 'kennethtenido1998@gmail.com', NULL, '9352969678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:32:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (123, 'USR-0000122', 'perezwarren97@gmail.com', NULL, '9155859291', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:34:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (124, 'USR-0000123', 'alginadra110197@gmail.com', NULL, '9162222546', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:35:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (125, 'USR-0000124', 'Jimboybaluyot339@gmail.com', NULL, '9558951895', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:35:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (126, 'USR-0000125', 'beejay.jaype@gmail.com', NULL, '9173072242', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:36:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (127, 'USR-0000126', 'mangaldanmariano@gmail.com', NULL, '9759887602', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 10:38:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (128, 'USR-0000127', 'lanante16@gmail.com', NULL, '9510096008', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:15:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (129, 'USR-0000128', 'casaulalmonte@gmail.com', NULL, '9304892382', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:16:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (130, 'USR-0000129', 'amorantorobell@gmail.com', NULL, '9166915992', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:17:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (131, 'USR-0000130', 'Paulinegracelatoja@gmail.com', NULL, '9171926354', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:18:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (132, 'USR-0000131', 'marielgagarin1825@gmail.com', NULL, '9354636153', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:18:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (133, 'USR-0000132', 'jimuel.asugui09@gmail.com', NULL, '9165562768', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:19:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (134, 'USR-0000133', 'marialhara.saballegue@gmail.com', NULL, '9666759477', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:19:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (135, 'USR-0000134', 'yorebleo@gmail.com', NULL, '9612583374', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:20:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (136, 'USR-0000135', 'ricprz111963@gmail.com', NULL, '9481547786', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:21:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (137, 'USR-0000136', 'ronniepoblete@yahoo.com', NULL, '9151348988', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:21:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (138, 'USR-0000137', 'gcarlosan@gmail.com', NULL, '9385875549', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:22:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (139, 'USR-0000138', 'norbertotelebrico@gmail.com', NULL, '9052564958', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:22:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (140, 'USR-0000139', 'ghinz010589@gmail.com', NULL, '9951022831', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:23:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (141, 'USR-0000140', 'edriancanabe@gmail.com', NULL, '9564957276', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:24:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (142, 'USR-0000141', 'motaalberth16@gmail.com', NULL, '9064384517', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:24:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (143, 'USR-0000142', 'johnleynardabulag2@gmail.com', NULL, '9155231150', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:25:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (144, 'USR-0000143', 'normandapasen@gmail.com', NULL, '9510083498', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:28:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (145, 'USR-0000144', 'marionedelemos@gmail.com', NULL, '9107213183', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:28:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (147, 'USR-0000146', 'markdanielmarasigan00@gmail.com', NULL, '9481289945', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:30:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (148, 'USR-0000147', 'alvinamante221908@gmail.com', NULL, '9552918356', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:30:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (149, 'USR-0000148', 'jerichoeliazar.2@gmail.com', NULL, '9568200281', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:31:13+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (151, 'USR-0000150', 'paulomendieta79@gmail.com', NULL, '9386667583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:36:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (152, 'USR-0000151', 'WILMAROABEL@gmail.com', NULL, '9120893306', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:37:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (153, 'USR-0000152', 'angeloilagan.marquez20@gmail.com', NULL, '9638867501', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:37:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (154, 'USR-0000153', 'peterarguillon@gmail.com', NULL, '9518947381', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:38:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (155, 'USR-0000154', 'michaeljrrabino23@gmail.com', NULL, '9531730011', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:39:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (156, 'USR-0000155', 'jeric.davido018@gmail.com', NULL, '9471038975', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:39:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (157, 'USR-0000156', 'johnpaloyo22@gmail.com', NULL, '9097345129', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:40:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (158, 'USR-0000157', 'ceajudelyn07@gmail.com', NULL, '9468667070', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:41:23+08', '2023-02-09 11:41:35+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (159, 'USR-0000158', 'parciajoebert@gmail.com', NULL, '9066516951', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:42:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (160, 'USR-0000159', 'tayamadrian@gmail.com', NULL, '9278724269', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:42:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (161, 'USR-0000160', 'aritallajether@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:43:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (162, 'USR-0000161', 'carlomejias870@gmail.com', NULL, '9467824999', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:43:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (163, 'USR-0000162', 'erthelmesa@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:44:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (164, 'USR-0000163', 'jaypee.ravalo@gmail.com', NULL, '9503547163', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:45:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (165, 'USR-0000164', 'lorenowilfredojr94@gmail.com', NULL, '9632749434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:45:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (166, 'USR-0000165', 'markcarinomangarin@gmail.com', NULL, '9125370334', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:46:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (167, 'USR-0000166', 'josepharthportugal1@gmail.com', NULL, '9518658972', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:46:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (168, 'USR-0000167', 'bunso_ng_spc@yahoo.com', NULL, '9564958868', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:47:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (169, 'USR-0000168', 'noelboroqmeo21@gmail.com', NULL, '9319546901', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:48:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (170, 'USR-0000169', 'emmansantillan1@gmail.com', NULL, '9277725883', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:48:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (171, 'USR-0000170', 'deejayvillapa11@gmail.com', NULL, '9071035535', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:49:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (172, 'USR-0000171', 'markgutierrez03071998@gmail.com', NULL, '9362738475', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:49:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (173, 'USR-0000172', 'divinofrancoestotomas@gmail.con', NULL, '9610564367', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:50:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (174, 'USR-0000173', 'marckjosephbetchayda6@gmail.com', NULL, '9098219522', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:51:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (175, 'USR-0000174', 'edison27bermundo@gmail.com', NULL, '9465467873', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:52:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (176, 'USR-0000175', 'bedionesjeanette07@gmail.com', NULL, '9631751573', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:53:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (177, 'USR-0000176', 'leomarlorencabo@gmail.com', NULL, '9665925830', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:54:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (178, 'USR-0000177', 'angelupaguilar@gmail.com', NULL, '9388658692', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:54:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (179, 'USR-0000178', NULL, NULL, '9308527397', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:55:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (180, 'USR-0000179', 'Hernandezgilbert956@Gmail.Com', NULL, '9956673957', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:56:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (181, 'USR-0000180', 'Josephbajado92@Gmail.Com', NULL, '9123416746', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:57:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (182, 'USR-0000181', 'Friasm884@Gmail.Com', NULL, '9398911193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:57:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (183, 'USR-0000182', 'Mendinajessicajane@Gmail.Com', NULL, '9319177966', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:58:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (184, 'USR-0000183', 'Brian.Feratero@Gmail.Com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:59:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (185, 'USR-0000184', 'Querubinermilyn@Gmail.Com', NULL, '9090234784', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 11:59:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (186, 'USR-0000185', 'Jeremy200356@Gmail.Com', NULL, '9663858759', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 12:00:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (187, 'USR-0000186', 'Monicoarimado@Gmail.Com', NULL, '9270710621', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:01:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (188, 'USR-0000187', 'Lordmichael@Gmail.Com', NULL, '9483788749', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:01:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (150, 'USR-0000149', 'devinmejorada@gmail.com', NULL, '9485183766', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:31:54+08', '2023-02-09 13:04:47+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (146, 'USR-0000145', 'junieven@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 11:29:28+08', '2023-02-09 13:04:29+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (189, 'USR-0000188', 'Medianajohnrey6@Gmail.Com', NULL, '9951936021', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:05:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (190, 'USR-0000189', 'Ghabbie13@Gmail.Com', NULL, '9089612984', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:06:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (191, 'USR-0000190', 'Anonymouscannon098@Gmail.Com', NULL, '9685544878', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:06:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (192, 'USR-0000191', 'Catalorenald@Gmail.Com', NULL, '9352196187', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:07:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (193, 'USR-0000192', 'Justin.A.Crompido@Gmail.Com', NULL, '9519603468', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:08:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (194, 'USR-0000193', 'Rodzelmalubay44@Gmail.Com', NULL, '9659635307', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:08:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (195, 'USR-0000194', 'Jonradbagtingla@Gmail.Com', NULL, '9669374577', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:09:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (196, 'USR-0000195', 'Micoacobera@Gmail.Com', NULL, '9291394839', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:10:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (197, 'USR-0000196', 'Dark_Xheon@Yahoo.Com', NULL, '9383722955', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (198, 'USR-0000197', 'Nedrafols822@Gmail.Com', NULL, '9309030053', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:16:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (199, 'USR-0000198', 'roperdaligarbes@gmail.com', NULL, '9064809584', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 13:17:08+08', '2023-02-09 13:17:16+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (200, 'USR-0000199', 'hardymaglaque002@gmail.com', NULL, '9106284813', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:18:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (201, 'USR-0000200', 'jkmerin24@gmail.com', NULL, '9161556244', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:18:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (202, 'USR-0000201', 'camsanjuan18@gmail.com', NULL, '9126077561', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:19:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (203, 'USR-0000202', 'garciaivan@gmail.com', NULL, '9319011248', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:22:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (204, 'USR-0000203', 'ninomiguelsilva12@gmail.com', NULL, '9563174178', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:22:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (205, 'USR-0000204', 'itsme.wah18@gmail.com', NULL, '9690653501', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:23:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (206, 'USR-0000205', 'edriangabrielmacalalag115@gmail.com', NULL, '9502378549', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:23:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (207, 'USR-0000206', 'escjonelabra@gmail.com', NULL, '9913379697', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:24:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (208, 'USR-0000207', 'dahomeselmer@gmail.com', NULL, '9519972082', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:25:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (209, 'USR-0000208', 'arnoldvillanuevallorca13@gmail.com', NULL, '9071024835', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:25:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (210, 'USR-0000209', 'tesoreroclang02@gmail.com', NULL, '9359617553', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:26:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (211, 'USR-0000210', 'johnallenbarrameda449@gmail.com', NULL, '9659878929', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:27:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (212, 'USR-0000211', 'rfranklexter@gmail.com', NULL, '9706061573', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:28:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (213, 'USR-0000212', 'luis143nollase@gmail.com', NULL, '9090714602', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:33:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (214, 'USR-0000213', 'jaymarktumalin420@gmail.com', NULL, '9637175470', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:33:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (215, 'USR-0000214', 'kimuelrufo19@gmail.com', NULL, '9126756804', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (216, 'USR-0000215', 'ronneldesacola310@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (217, 'USR-0000216', 'geraldmonterde1000@gmail.com', NULL, '9481837864', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:34:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (218, 'USR-0000217', 'navalrandilryan@gmail.com', NULL, '9519290434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:35:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (219, 'USR-0000218', 'renieraguilar28@gmail.com', NULL, '9617755339', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:35:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (220, 'USR-0000219', 'elcanadelacruz938@gmail.com', NULL, '9350593847', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:36:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (221, 'USR-0000220', 'bryanclienedait@gmail.com', NULL, '9668477188', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:36:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (222, 'USR-0000221', 'jamesjeffersonfranada@gmail.com', NULL, '9566087401', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:37:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (223, 'USR-0000222', 'reymondtimbal@gmail.com', NULL, '9055458391', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:38:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (224, 'USR-0000223', 'roderickpilao1@gmail.com', NULL, '9380405970', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:38:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (225, 'USR-0000224', 'johnholmes4343@gmail.com', NULL, '9471889618', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:39:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (226, 'USR-0000225', 'angeloariaz928@gmail.com', NULL, '9959543479', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:39:39+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (227, 'USR-0000226', 'Ijay2865@gmail.com', NULL, '9672556442', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:40:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (228, 'USR-0000227', 'regiomarkzander@gmail.com', NULL, '9773752279', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:40:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (229, 'USR-0000228', 'vistaljonathan54@gmail.com', NULL, '9096945778', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:41:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (230, 'USR-0000229', 'wendilenobrac@gmail.com', NULL, '9369153574', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:43:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (231, 'USR-0000230', 'luispatropis@gmail.com', NULL, '9165057198', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:44:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (232, 'USR-0000231', 'Drewvolante09@gmail.com', NULL, '9611494399', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:45:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (233, 'USR-0000232', 'rolandogermio@gmail.com', NULL, '9663615251', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:47:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (234, 'USR-0000233', 'dantscap432@gmail.com', NULL, '9086619284', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:48:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (235, 'USR-0000234', 'leggymark.aguillo@gmail.com', NULL, '9053135372', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:50:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (236, 'USR-0000235', 'norielpunk06@gmail.com', NULL, '9484441445', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:51:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (237, 'USR-0000236', 'ronaldallanmaintech2015@yahoo.com', NULL, '9194119062', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:52:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (238, 'USR-0000237', 'nelsondelrosariojr69@gmail.com', NULL, '9514211037', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:52:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (239, 'USR-0000238', 'joyceambojia05@gmail.com', NULL, '9278050506', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:53:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (240, 'USR-0000239', 'arjayzamora2552@gmail.com', NULL, '9516337076', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:53:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (241, 'USR-0000240', 'Rrheinald18@yahoo.com', NULL, '9265055325', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:54:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (242, 'USR-0000241', 'sayamramuel11@gmail.com', NULL, '9284243643', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:54:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (243, 'USR-0000242', 'jesrill.dacles@gmail.com', NULL, '9319845154', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:55:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (244, 'USR-0000243', 'markvictoryespera0@gmail.com', NULL, '9105363427', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:56:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (245, 'USR-0000244', 'markfrancis3109@gmail.com', NULL, '9264383074', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:56:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (246, 'USR-0000245', 'kimflora27@gmail.com', NULL, '9107208513', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (247, 'USR-0000246', 'kristinebonaregalado@gmail.com', NULL, '9384622449', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:57:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (248, 'USR-0000247', 'kingrist24@gmail.com', NULL, '9669229886', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 13:58:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (249, 'USR-0000248', 'marlonmata199224@gmail.com', NULL, '9267369964', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:03:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (250, 'USR-0000249', 'junsumague20@gmail.com', NULL, '9285920331', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:04:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (251, 'USR-0000250', 'brandoforteza@gmail.com', NULL, '9388925610', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:05:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (252, 'USR-0000251', 'jacksonestrada09271979@gmail.com', NULL, '9175191681', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:06:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (253, 'USR-0000252', 'leysonearlmiguel@gmail.com', NULL, '9465698364', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:06:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (254, 'USR-0000253', 'donardocawaling6@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:07:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (255, 'USR-0000254', 'mikaycarbon16@gmail.com', NULL, '9198855175', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:08:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (256, 'USR-0000255', 'Ricafrentenixon@gmail.com', NULL, '9067027920', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:08:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (257, 'USR-0000256', 'yrahtacos@gmail.com', NULL, '9069143848', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 14:11:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (98, 'USR-0000097', 'lovesong.carale23@gmail.com', NULL, '9367717654', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-03 10:16:25+08', '2023-02-09 14:13:50+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (258, 'USR-0000257', 'jessiejalalon15@gmail.com', NULL, '9662685712', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:02:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (259, 'USR-0000258', 'rondilla.marvin@gmail.com', NULL, '9387987771', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:04:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (260, 'USR-0000259', 'roelchristianbadillo00@gmail.com', NULL, '9754537032', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:05:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (261, 'USR-0000260', 'cdeadpool809@gmail.com', NULL, '9384568494', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:06:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (262, 'USR-0000261', 'mikepaguibitannava@gmail.com', NULL, '9304445094', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:06:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (263, 'USR-0000262', 'mchlnglcrd@gmail.com', NULL, '9564727510', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:07:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (264, 'USR-0000263', 'shierwinmejoy123@gmail.com', NULL, '9567303959', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:07:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (265, 'USR-0000264', 'Amagojumel1986@gmail.com', NULL, '9091927416', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:35:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (266, 'USR-0000265', 'marvinllabore199209@gmail.com', NULL, '9666703175', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:37:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (267, 'USR-0000266', 'aseguradoedgardo@gmail.com', NULL, '9959257461', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:39:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (268, 'USR-0000267', 'dennel1993padasas@gmail.com', NULL, '9120600545', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:39:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (269, 'USR-0000268', 'benedictfrancisco79@gmail.com', NULL, '9103497137', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:40:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (272, 'USR-0000271', 'henrymendez536@gmail.com', NULL, '9651996478', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:54:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (273, 'USR-0000272', 'adorante@gmail.com', NULL, '9650522675', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:54:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (274, 'USR-0000273', 'kenmadronero27@gmail.com', NULL, '9260622201', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:55:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (271, 'USR-0000270', 'marvintolentino187@gmail.com', NULL, '9950421817', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 15:53:39+08', '2023-02-09 15:56:17+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (270, 'USR-0000269', 'normangenesis10@gmail.com', NULL, '9993286382', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-09 15:53:01+08', '2023-02-09 15:56:46+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (275, 'USR-0000274', 'Tristanjace111412@Gmail.Com', NULL, '9972211997', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:57:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (276, 'USR-0000275', 'Rombaoabryan26@Gmail.Com', NULL, '9389372161', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 15:58:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (277, 'USR-0000276', 'Jujun.franco@gmail.com', NULL, '9651788014', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:30:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (278, 'USR-0000277', 'Masangcayprudencio3@gmail.com', NULL, '9551642007', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:32:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (279, 'USR-0000278', 'garciaraymond1203@gmail.com', NULL, '9095814319', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:33:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (280, 'USR-0000279', 'fernandezjanrey23@gmail.com', NULL, '9156079435', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:33:57+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (281, 'USR-0000280', 'sagumarman31@gmail.com', NULL, '9675806019', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:34:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (282, 'USR-0000281', 'glennberth@gmail.com', NULL, '9637768825', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-09 16:35:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (283, 'USR-0000282', 'joemarvisca5@gmail.com', NULL, '9291192691', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-10 09:36:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (1, '0000000', 'superadmin@kcic.com.ph', 'QFN1cGVyYWRtaW4wMDAw', '00000000000', 1, 1, 'superadmin', 1, 1, 1, NULL, NULL, NULL, '2022-12-21 11:13:47.452153+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (284, 'USR-0000283', 'jamesdaryl18b@gmail.com', NULL, '9512250959', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:06:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (285, 'USR-0000284', 'j_sauret@yahoo.com', NULL, '9635999990', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:07:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (286, 'USR-0000285', 'Lancolozed@Gmail.Com', NULL, '9122024971', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:08:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (287, 'USR-0000286', 'jowilim77@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:08:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (288, 'USR-0000287', 'jasonagnes095@gmail.com', NULL, '9659907569', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:09:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (289, 'USR-0000288', 'baculandobong06@gmail.com', NULL, '9389372332', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:09:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (290, 'USR-0000289', 'djuandel@gmail.com', NULL, '9071674094', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:10:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (291, 'USR-0000290', 'dwrcarandang@gmail.com', NULL, '9677324816', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:11:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (292, 'USR-0000291', 'roderickbultron44@gmail.com', NULL, '9959711145', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:11:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (293, 'USR-0000292', 'jerwenbeato15@gmail.com', NULL, '9454153417', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:12:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (294, 'USR-0000293', 'gilbert.bolanos26@gmail.com', NULL, '9275523867', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:19:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (295, 'USR-0000294', 'melaiitresvalles1994@gmail.com', NULL, '9260622201', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:21:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (296, 'USR-0000295', 'chesma.morante@gmail.com', NULL, '9369249526', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:23:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (297, 'USR-0000296', 'kevinjamesenerez2015@gmail.com', NULL, '9563243359', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:24:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (298, 'USR-0000297', 'jclzrt@gmail.com', NULL, '9777211446', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:27:27+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (299, 'USR-0000298', '09markus29@gmail.com', NULL, '9238455729', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:28:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (300, 'USR-0000299', 'jhonabiera3@gmail.com', NULL, '9564761330', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:29:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (301, 'USR-0000300', 'eudesevangelista12@gmail.com', NULL, '9057340305', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:29:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (302, 'USR-0000301', 'romeomartinezchavez@gmail.com', NULL, '9064417790', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:30:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (303, 'USR-0000302', 'christianbayhonan73@gmail.com', NULL, '9462586107', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:31:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (304, 'USR-0000303', 'edithawilliam75@gmail.com', NULL, '9858490305', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:31:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (305, 'USR-0000304', 'Ajborja09@gmail.com', NULL, '9089700923', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:32:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (306, 'USR-0000305', 'arlenegracetuazon76@gmail.com', NULL, '9224105719', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:33:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (307, 'USR-0000306', 'bryanepv@gmail.com', NULL, '9666452509', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:34:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (308, 'USR-0000307', 'princessalfonso0523@gmail.com', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:34:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (309, 'USR-0000308', 'Jgvillapana@Gmail.Com', NULL, '9182749612', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:35:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (310, 'USR-0000309', 'MAR_Angob08@Yahoo.Com', NULL, '9392274430', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:36:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (311, 'USR-0000310', 'rmaddawinjr@gmail.com', NULL, '9057670744', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:37:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (312, 'USR-0000311', 'villariascarljohn28@gmail.com', NULL, '9298142334', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:38:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (313, 'USR-0000312', 'aytonaraymond123@gmail.com', NULL, '9153152871', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:38:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (314, 'USR-0000313', 'vincealdrene@gmail.com', NULL, '9567901996', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:39:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (315, 'USR-0000314', 'jhonlloydtarromatarroma@gmail.com', NULL, '9468784081', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:40:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (316, 'USR-0000315', 'vinceroa18@gmail.com', NULL, '9459905781', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:40:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (317, 'USR-0000316', 'cajayon.albert.carl@gmail.com', NULL, '9636794816', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:41:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (318, 'USR-0000317', 'Karlalhay013@Gmail.Com', NULL, '9214815240', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:42:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (319, 'USR-0000318', 'maricelmartinez1976@gmail.com', NULL, '9258470116', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:47:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (320, 'USR-0000319', 'palma_erwin06@gmail.com', NULL, '9123603698', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:47:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (321, 'USR-0000320', 'chieann30@gmail.com', NULL, '9178707236', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:48:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (322, 'USR-0000321', 'Celsoagdon@gmail.com', NULL, '9368353582', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:49:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (323, 'USR-0000322', 'arnel_vookal@yahoo.com', NULL, '9465110481', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:49:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (324, 'USR-0000323', 'krizelleesguerra@gmail.com', NULL, '9458998739', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:50:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (325, 'USR-0000324', 'mrholeenmontano@gmail.com', NULL, '9094490404', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:50:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (326, 'USR-0000325', 'abejoeugene06@gmail.com', NULL, '9454003012', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:51:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (327, 'USR-0000326', 'belajoaquin97@gmail.com', NULL, '9198807821', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:51:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (328, 'USR-0000327', 'aims13.grant@gmail.com', NULL, '9157850839', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:52:29+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (329, 'USR-0000328', 'jasonjaen17@gmail.com', NULL, '9319033365', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:53:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (330, 'USR-0000329', 'marlonmagno35@gmail.com', NULL, '9055424484', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:54:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (331, 'USR-0000330', 'larajanefuentes2608@gmail.com', NULL, '9204899596', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:55:21+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (332, 'USR-0000331', 'gallenobobby@gmail.com', NULL, '9516659623', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:55:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (333, 'USR-0000332', 'Aramaealbalate@Gmail.Com', NULL, '9485939918', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:56:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (334, 'USR-0000333', 'Silentmerj@Gmail.Com', NULL, '9182030639', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:56:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (335, 'USR-0000334', 'rhunelvillanueva123456@gmail.com', NULL, '9754133394', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:57:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (336, 'USR-0000335', 'ronelbaluran9@gmail.com', NULL, '9052308202', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:57:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (337, 'USR-0000336', 'jhunfeliciano@gmail.com', NULL, '9218865536', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:58:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (338, 'USR-0000337', 'bellenjerald37@gmail.com', NULL, '9562658951', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:58:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (339, 'USR-0000338', 'joemarxalcalde@gmail.com', NULL, '9123148437', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:59:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (340, 'USR-0000339', 'markug201400044@gmail.com', NULL, '9270343583', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 15:59:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (341, 'USR-0000340', 'katuytan@gmail.com', NULL, '9177798021', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:11:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (342, 'USR-0000341', 'joannamariebernabe95@gmail.com', NULL, '9239246605', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:12:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (343, 'USR-0000342', 'yvelim.928@gmail.com', NULL, '9178055557', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:13:51+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (344, 'USR-0000343', 'Arlenenaldo0321@Gmail.Com', NULL, '9156350530', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:14:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (345, 'USR-0000344', 'josefine.bacnaon24@yahoo.com', NULL, '9677559606', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:15:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (346, 'USR-0000345', 'juwirextiu15@gmail.com', NULL, '9770332970', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:16:36+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (347, 'USR-0000346', 'rosaleselaine3@gmail.com', NULL, '9365421413', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:18:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (348, 'USR-0000347', 'calvs23@gmail.com', NULL, '9053294496', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:21:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (350, 'USR-0000349', 'maiztegui.mesiahs@gmail.com', NULL, '9201202782', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:22:47+08', '2023-02-27 16:23:26+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (349, 'USR-0000348', 'nhoj.kenneth@yahoo.com', NULL, '9167162459', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:22:21+08', '2023-02-27 16:23:32+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (351, 'USR-0000350', 'quejohnrobert@gmail.com', NULL, '9393693085', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:23:20+08', '2023-02-27 16:23:47+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (353, 'USR-0000352', 'judan.pauljohn@gmail.com', NULL, '9502099508', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:25:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (352, 'USR-0000351', 'joshuaajaumali@gmail.com', NULL, '9456732627', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:24:19+08', '2023-02-27 16:25:44+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (355, 'USR-0000354', 'michaelcharlotte.mc16@gmail.com', NULL, '9672370398', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:26:47+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (354, 'USR-0000353', 'jschua98@gmail.com', NULL, '9171001693', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:26:18+08', '2023-02-27 16:26:54+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (357, 'USR-0000356', 'vic_ahl12@yahoo.com', NULL, '9451622906', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:28:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (356, 'USR-0000355', 'kuyaidoy@gmail.com', NULL, '9216140407', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:27:56+08', '2023-02-27 16:28:35+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (358, 'USR-0000357', 'vacaljupiter@gmail.com', NULL, '9327198630', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:30:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (359, 'USR-0000358', 'charlesadrianang@gmail.com', NULL, '9176758991', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:30:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (360, 'USR-0000359', 'd.ganancial@yahoo.com', NULL, '9065559195', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:31:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (361, 'USR-0000360', 'slourice@yahoo.com.ph', NULL, '9058703068', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:32:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (362, 'USR-0000361', 'panchy111@yahoo.com', NULL, '9175351155', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:32:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (363, 'USR-0000362', 'patrickjulianschua@gmail.com', NULL, '9293813358', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:33:14+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (364, 'USR-0000363', 'ron110482@gmail.com', NULL, '9369702682', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:38:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (365, 'USR-0000364', 'jeffrey.casa@gmail.com', NULL, '9087687525', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:40:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (366, 'USR-0000365', 'metodiobongolto@yahoo.com', NULL, '9282010420', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:40:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (367, 'USR-0000366', 'Christophertablate12@gmail.com', NULL, '9665828471', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:41:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (368, 'USR-0000367', 'cataggatanrexly@gmail.com', NULL, '9301056774', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:42:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (369, 'USR-0000368', 'Friasrhad09@mail.com', NULL, '9327736506', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:42:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (370, 'USR-0000369', 'rowenesquillo007@gmail.com', NULL, '9994988982', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:43:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (371, 'USR-0000370', 'arniel092987@gmail.com', NULL, '9291189192', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:44:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (372, 'USR-0000371', 'Jackelineargallon@gmail.com', NULL, '9772077582', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:44:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (373, 'USR-0000372', 'arnelyago1966@gmail.com', NULL, '9062131225', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:45:23+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (374, 'USR-0000373', 'benjar08ramos@gmail.com', NULL, '9753027994', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:45:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (376, 'USR-0000375', 'talingdanjohnresty6@gmail.com', NULL, '9516728766', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:46:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (377, 'USR-0000376', 'danilo_navarro@gmail.com', NULL, '9054758369', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:47:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (375, 'USR-0000374', 'Bernabenarra@Gmail.Com', NULL, '9273211651', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-27 16:46:19+08', '2023-02-27 16:48:55+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (378, 'USR-0000377', 'elyannamyraapascual@gmail.com', NULL, '9451357111', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:54:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (379, 'USR-0000378', 'michelletalingdan@gmail.com', NULL, '9212009639', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:55:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (380, 'USR-0000379', 'ritch2812@gmail.com', NULL, '9089056430', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:55:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (381, 'USR-0000380', 'crisostomojohnrobert@yahoo.com.ph', NULL, '9058681259', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:56:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (382, 'USR-0000381', 'joannadgzmn0830@gmail.com', NULL, '9275383156', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:56:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (383, 'USR-0000382', NULL, NULL, '9053197587', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-27 16:57:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (384, 'USR-0000383', 'emspalomares@gmail.com', NULL, '9278045408', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:29:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (385, 'USR-0000384', 'scelpadua@gmail.com', NULL, '9567111784', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:30:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (386, 'USR-0000385', 'rosaliesanjuan2001@gmail.com', NULL, '9774917571', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:31:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (387, 'USR-0000386', 'elvira_p_ayuro@yahoo.com.ph', NULL, '9324528193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:32:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (388, 'USR-0000387', 'cristinageneta@gmail.com', NULL, '9264074723', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:33:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (389, 'USR-0000388', 'm.delacruz1711@yahoo.com', NULL, '9232246807', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:34:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (390, 'USR-0000389', 'charmainekaye25@gmail.com', NULL, '9488961997', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:34:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (391, 'USR-0000390', 'mariavictoriaarante@gmail.com', NULL, '9502539237', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 08:35:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (392, 'USR-0000391', 'anne.atienza2@gmail.com', NULL, '9672810920', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:06:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (393, 'USR-0000392', 'johnabeltibang0197@gmail.com', NULL, '9975140806', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:07:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (394, 'USR-0000393', 'Arseflores05@Gmail.Com', NULL, '9175282773', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:08:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (395, 'USR-0000394', 'heiress.hortelano13@gmail.com', NULL, '9475027028', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:09:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (398, 'USR-0000397', 'joveencinares@gmail.com', NULL, '9203229487', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:48:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (397, 'USR-0000396', 'chiimtutor979@gmail.com', NULL, '9989432657', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 09:47:32+08', '2023-02-28 09:48:14+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (396, 'USR-0000395', 'Emilydeximo@Gmail.Com', NULL, '9073276634', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 09:47:01+08', '2023-02-28 09:48:20+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (399, 'USR-0000398', 'edison san jose.831@gmail.com', NULL, '9061511969', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:48:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (400, 'USR-0000399', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:49:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (401, 'USR-0000400', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:49:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (402, 'USR-0000401', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:50:20+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (403, 'USR-0000402', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:50:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (404, 'USR-0000403', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (405, 'USR-0000404', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (406, 'USR-0000405', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:51:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (407, 'USR-0000406', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:52:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (408, 'USR-0000407', 'careers@kcic.com.ph', NULL, '9197926737', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:53:05+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (409, 'USR-0000408', NULL, NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:53:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (410, 'USR-0000409', 'janinefernando90@gmail.com', NULL, '9265787090', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:54:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (411, 'USR-0000410', 'johnreymasanque_017@yahoo.com', NULL, '9260367185', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:55:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (412, 'USR-0000411', 'corpuzjustin2121@gmail.com', NULL, '9453990224', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:56:22+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (413, 'USR-0000412', 'k.paraguison03@gmail.com', NULL, '9053302610', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:57:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (414, 'USR-0000413', 'johnericsonrasos@gmail.com', NULL, '9084685905', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:57:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (415, 'USR-0000414', 'ryanfrancisco.ryn@gmail.com', NULL, '9682190562', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:58:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (416, 'USR-0000415', 'reysrmontano@gmail.com', NULL, '9776280359', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 09:59:32+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (417, 'USR-0000416', 'aldihnmiradora68@gmail.com', NULL, '9350819061', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:00:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (418, 'USR-0000417', 'rsulpico23@gmail.com', NULL, '9166465914', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:00:30+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (419, 'USR-0000418', 'neillongno@gmail.com', NULL, '9454116076', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:02:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (420, 'USR-0000419', 'markgenesisgenio@gmail.com', NULL, '9491176260', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:03:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (421, 'USR-0000420', 'esbmarquez@gmail.com', NULL, '9563923671', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:06:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (422, 'USR-0000421', 'laurentema.luisa@gmail.com', NULL, '9561298836', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:08:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (423, 'USR-0000422', 'Andrew.camiros@yahoo.com', NULL, '9171375971', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:08:50+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (424, 'USR-0000423', 'pid61590@gmail.com', NULL, '9478117912', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:09:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (425, 'USR-0000424', 'rochesterbergonia@gmail.com', NULL, '9499788552', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:09:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (426, 'USR-0000425', 'kavinrosios08@gmail.com', NULL, '9085965110', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:21:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (428, 'USR-0000427', 'Joannamarieamaro100197@Gmail.Com', NULL, '9152175930', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:24:51+08', '2023-02-28 10:24:56+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (427, 'USR-0000426', 'ivydqua@gmail.com', NULL, '9064496026', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:23:31+08', '2023-02-28 10:25:03+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (429, 'USR-0000428', 'kimberlypitogo6@gmail.com', NULL, '9639627458', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:25:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (431, 'USR-0000430', 'mheanrivera10@gmail.com', NULL, '9333133312', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:38:25+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (430, 'USR-0000429', 'riodelacruz7410@gmail.com', NULL, '9564691894', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 10:36:46+08', '2023-02-28 10:38:30+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (432, 'USR-0000431', 'Mrrsdeasis@Gmail.Com', NULL, '9972652958', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:40:42+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (433, 'USR-0000432', 'Hiedemiranda30@Gmail.Com', NULL, '9776762923', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:41:19+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (434, 'USR-0000433', 'raymondybanez024@gmail.com', NULL, '9153581824', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 10:42:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (435, 'USR-0000434', 'jrj.lapuz@gmail.com', NULL, '9980989965', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:03:46+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (436, 'USR-0000435', 'jobpua16@gmail.com', NULL, '9321703365', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:09:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (437, 'USR-0000436', 'sjackquelyn19@gmail.com', NULL, '9295378434', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:10:03+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (438, 'USR-0000437', NULL, NULL, '9175273646', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:10:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (439, 'USR-0000438', 'misalanglovely@gmail.com', NULL, '9550263270', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:11:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (440, 'USR-0000439', 'jnydq13@gmail.com', NULL, '9152307431', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:16:38+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (441, 'USR-0000440', 'sheenamarieestolas@gmail.com', NULL, '9455698739', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:17:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (442, 'USR-0000441', 'ylrebmik232002@yahoo.com', NULL, '9175165937', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:18:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (443, 'USR-0000442', 'kenkenmangali@gmail.com', NULL, '9158844593', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:19:06+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (444, 'USR-0000443', 'paulaservando@gmail.com', NULL, '9260529853', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:19:34+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (445, 'USR-0000444', 'akfd818@yahoo.com', NULL, '9175390818', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:20:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (446, 'USR-0000445', 'shelzcasuga@gmail.com', NULL, '9264134893', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:20:49+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (448, 'USR-0000447', 'rosh.alilio@gmail.com', NULL, '9171194160', 0, 0, 'admin', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:27:53+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (447, 'USR-0000446', 'grajojair947@gmail.com', NULL, '9774532126', 0, 0, 'admin', 0, 1, 1, 1, NULL, NULL, '2023-02-28 11:27:16+08', '2023-02-28 11:27:58+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (449, 'USR-0000448', 'jessieramisan@gmail.com', NULL, '9454123542', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:28:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (450, 'USR-0000449', 'oliverhgabiola@gmail.com', NULL, '9667482987', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:31:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (451, 'USR-0000450', 'lloreravanj@gmail.com', NULL, '9069055923', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:59:10+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (452, 'USR-0000451', 'jowin28@gmail.com', NULL, '9175827678', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 11:59:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (453, 'USR-0000452', 'arvee.cestina@yahoo.com.ph', NULL, '9066970414', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:00:18+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (454, 'USR-0000453', 'sobriarodora@gmail.com', NULL, '9293410894', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:14:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (455, 'USR-0000454', 'louiealfredbres06@gmail.com', NULL, '9064067129', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:15:15+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (456, 'USR-0000455', 'louiegiaguilar20@gmail.com', NULL, '9669578488', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:15:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (457, 'USR-0000456', 'Adriano_Magcalas@Kcei.Com.Ph', NULL, NULL, 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:16:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (458, 'USR-0000457', 'laarniemgonzales@gmail.com', NULL, '9178811261', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:18:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (459, 'USR-0000458', 'vincent.bgarcia@yahoo.com', NULL, '9954347442', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:18:56+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (460, 'USR-0000459', 'leine08162007@gmail.com', NULL, '9915662659', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:21:09+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (461, 'USR-0000460', 'estellacarljhon@gmai.com', NULL, '9560912712', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:21:41+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (462, 'USR-0000461', 'jimmy_delacruz@kcic.com.ph', NULL, '9178056740', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:22:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (463, 'USR-0000462', 'wilmerpcovita@gmail.com', NULL, '9171755716', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:22:59+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (464, 'USR-0000463', 'amayangelea1025@gmail.com', NULL, '9993744276', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:24:07+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (465, 'USR-0000464', 'regine07vallesteros@gmail.com', NULL, '9454371130', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:26:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (466, 'USR-0000465', 'marcjoshuanatividad@gmail.com', NULL, '9950223404', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:29:33+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (467, 'USR-0000466', 'joebercasiojr@gmail.com', NULL, '9178595032', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:30:08+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (468, 'USR-0000467', 'avelinomalapitjr@gmail.com', NULL, '9173601199', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:32:01+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (469, 'USR-0000468', 'wbtumulak@gmail.com', NULL, '9176045882', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:32:52+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (470, 'USR-0000469', 'alvintarenas@gmail.com', NULL, '9959112587', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:34:58+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (471, 'USR-0000470', 'dario.villazor@gmail.com', NULL, '9062636626', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:41:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (472, 'USR-0000471', 'jmanansala8895@gmail.com', NULL, '9193888475', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:42:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (473, 'USR-0000472', 'nibvilla@gmail.com', NULL, '9369640034', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:43:02+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (474, 'USR-0000473', 'kevinlexterocay@gmail.com', NULL, '9155673193', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:46:43+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (475, 'USR-0000474', 'Cabayawin09@gmail.com', NULL, '9061261795', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:47:16+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (476, 'USR-0000475', 'jralmonicar14@gmail.com', NULL, '9270826524', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:47:44+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (477, 'USR-0000476', 'paoloesguerra003@gmail.com', NULL, '9561202480', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:48:28+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (480, 'USR-0000479', 'drev0027@gmail.com', NULL, '9331784459', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 12:56:55+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (479, 'USR-0000478', 'catalinocapuyan@gmail.com', NULL, '9151600869', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 12:56:06+08', '2023-02-28 12:57:02+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (478, 'USR-0000477', 'charliemacatuno@gmail.com', NULL, '9950883051', 0, 0, 'user', 0, 1, 1, 1, NULL, NULL, '2023-02-28 12:54:43+08', '2023-02-28 12:57:13+08', NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (481, 'USR-0000480', 'aurelio.baluyot.ge2019@gmail.com', NULL, '9954509331', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:01:48+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (482, 'USR-0000481', 'edwardbuhian67@gmail.com', NULL, '9085064160', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:02:24+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (483, 'USR-0000482', 'duqueleo125@gmail.com', NULL, '9999031082', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:03:35+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (484, 'USR-0000483', 'pabloarado1969@gmail.com', NULL, '9199091499', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:04:31+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (485, 'USR-0000484', 'Jaidallen052014@gmail.com', NULL, '9196096075', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:05:04+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (486, 'USR-0000485', 'riverarogerjr10@gmail.com', NULL, '9995318527', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:05:40+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (487, 'USR-0000486', 'joelfvaldez74@gmail.com', NULL, '9288263555', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:06:11+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (488, 'USR-0000487', 'fernandezgeorge63@gmail.com', NULL, '9272795614', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:06:45+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (489, 'USR-0000488', 'bobonglaag@gmail.com', NULL, '9203685158', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:07:17+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (490, 'USR-0000489', 'teopalles@gmail.com', NULL, '9058167720', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:07:54+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (491, 'USR-0000490', 'sergioracaza52@gmail.com', NULL, '9086541079', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:08:26+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (492, 'USR-0000491', 'Rolynar.rapole.ge2019@gmail.com', NULL, '9777972819', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:09:00+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (493, 'USR-0000492', 'Remandosalgon@gmail.com', NULL, '9952137996', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:09:37+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (494, 'USR-0000493', 'jamikszsebil@gmail.com', NULL, '9323564886', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:10:12+08', NULL, NULL, NULL);
INSERT INTO "public"."tbl_users" VALUES (495, 'USR-0000494', NULL, NULL, '9501105053', 0, 0, 'user', 0, 1, 1, NULL, NULL, NULL, '2023-02-28 13:10:46+08', NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_users
-- ----------------------------
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_deleted_by_fkey" FOREIGN KEY ("deleted_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_imported_by_fkey" FOREIGN KEY ("imported_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tbl_users" ADD CONSTRAINT "tbl_users_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "public"."tbl_users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;