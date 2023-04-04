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

 Date: 30/03/2023 16:46:06
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

SELECT setval('"public"."tbl_services_sales_id_seq"', 1, false);


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
  "position" varchar(100) COLLATE "pg_catalog"."default",
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
  "contact_number" varchar(20) COLLATE "pg_catalog"."default",
  "requests" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tbl_services_sales
-- ----------------------------
INSERT INTO "public"."tbl_services_sales" VALUES (1, 1, '2023-ZSP-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCITON', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVEZ', NULL, 'PAUL JOHN SOLANO JUDAN', 'data:image/png;base64,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', '2023-03-23 13:11:30.359679+08', 'CALVIN SY', NULL, '2023-03-23 13:11:30.359679+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'yes', '0917-589-2716', '[{"request":"implementation - inspection and testing of ats","personnel":"busway engineer","date_from":"2023-1-24","date_to":"2023-1-24","time_from":"3pm","time_to":"onwards"}]');
INSERT INTO "public"."tbl_services_sales" VALUES (2, 2, '2023-ZSP-025', NULL, 'TPSC PHILIPPINES CORPORATION', 'TOSHIBA ANNEX', 'TOSHIBA, LTI STA ROSA LAGUNA', 'MR. CARLO BATOON', 'PROJECT MANAGER / ASST ENGR', 'PAUL JOHN SOLANO JUDAN', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAABkCAYAAAA8AQ3AAAAAAXNSR0IArs4c6QAAC8pJREFUeF7tnWvINkUZx/9+KsRDBkpJWmpZKKGS5oFAC9JKxCBLy9BCUOlkRUaIWn0J+mAHUTsQHaT6UGEHD9CHKDG1oLA+KGoHC0zDIMxUhATjLzMwrvvcu8/uzO7O3r+Bm/f1ee+95prf7PP3mmuvndlDNAhAAAKVENijEj9xEwIQgIAQLG4CCECgGgIIVjVThaMQgACCxT0AAQhUQwDBqmaqcBQCEECwuAcgAIFqCCBY1UwVjkIAAggW9wAEIFANAQSrmqnCUQhAAMHiHtgNgVdI+lu44BRJv+px8f6SjpR0hCT//e+S9pR0XY9r+QoEnkMAwdqeG8Jic5SkoyX57/5sai+R9JogUBapvSW9ruWC34ef/VfS/ZLeLukASf75fpIO3dDJjZJukPTt7ZkGRjqGAII1ht7yr7U4nR9EpEug5hzNZyR9dk4H6LsOAghWHfO0Gy8tTBap9/WIonay+x9Jz0j6s6SbJPm//xGWdbeGi04OS7snQz+OwvaS5KXi4yHaekjSU5J+m3Rk/86SdHqjcy8b79nNQPnu9hFAsNY151+SdEmPITmPZIGJn0cl/SFc1ycv1aOLzq+8VNIPJL0h6feNnVfxha0mgGCtZ/q/FaKqthH9MSTIf9IzUT4VlQ9LujrpjPtxKvKV9sMNUunENdz+mqQLGz/zMs7JbEdd8cne0kb7ZUkfSZwil7W0GVqYPwjWwiZkgDvOGf0yue6Hku6TdMUAW1Nf4nzWA0mnH6TcYeopqKs/BKuu+Wrz9huSLgj/8HVJF1U0pHeGPFZ0+f2UOFQ0ezO4imDNAD1zl45QYsnCYZL+mtl+SXO3SHpr0oGT7lMl/UuOC9uFCCBYhcBOaDYKlvNUh0zY79iuTpR0R2LEhabHjjXK9esmgGDVP7+ul4qtpvl0acXBie8sB+u/F4uPoKYbvDiMSjvw6zCvCr77Txd7Lr35IYEfFsTmGrBjlu40/s1PAMGafw7GevB5SZ8MRpZeLW6R+oAkJ9tj+52k48ZC4PrtIIBg1T/P75D0ozAMvwJzwkKH9GJJX22IlV1dusguFOd2uoVgrWPe/YpLjFqWWHzpl7Ava4jVg6Go9ap1TAGjmIIAgjUF5Wn6SJPvSxKtT0uyP822JB+nmSF6GU0AwRqNcDEGmhXvSxCE70t6d4OQK/HjZzHwcKQOAghWHfPU18tmNDOnaLkA1FvQpM3Lv2sW/G5jX858byYCCNZM4At2a9HyO3nejthtatFy1f1dkl6UjNFFoe8Je2QVHDqm104AwVrnDKeR1r8kXS7J7xmWbl6W/rghVt4C2U8yaRAYTQDBGo1wsQaakVbp9/SaYuXtbby1TVvCfbHQcGzZBBCsZc/PWO+aifgvSvr4WKMt1/vgCUdWsVmsPsrOCwVIb7lJBGv9N4Drs+LHo/UTOu9O+mtJPulmbLMwWQjTVjqaG+sz11dKAMGqdOIGuP0FSR9LrvtUOBxizHYuTbFyZOWoLu4PP8BNLoHAzgQQrO26O04NS7W4B5XFyp8hR2w5N+U8WboMdEX7Urdj3q6ZXuloEayVTmzHsNKniE+Ho7wcffUVGx9mcWbSh7eKcR6LyGo776fJRo1gTYZ6cR29TZIPgXhl4pmXeP7ZTs01Vk6uO5KKzSfyWKz6it3iQOBQPQQQrHrmqoSnLu700i49y9BRkpeIjqLSZlFycj09QfqnQaxK+IZNCDyPAILFTWECFiMfCbZvgsOCZeFy5GSh8knSsXkJ6GisKWrQhEBRAghWUbxVGfcyz4Wezff/HpO0TzKS7wSx8mnRNAhMSgDBmhR3FZ211VXZcZ91eA6J9SrmcLVOIlirndpBA3N+yss/LxHbmvNbPiyCp4GD8HLRWAII1liC67jeQuVShzRP5SJQb73sKvl0SegRe+no/BbLwnXMfzWjQLCqmaoijrYJlTtyaYOXhm5tTxL9cyfjHW2NqZQvMiiMrpcAgrXeud00Mi/5zm9Z+lmoXObQFjntlJSnDms776FZRo1gzYJ9lk4dTbk63ZFTWkvlpZ/LEyxUfYo/20ogHgpLxCn23NoEz9HggZLumYUwnRYngGAVRzx7B85LOZpKDy61U3G/KuejhuSiXLdlu2mbY792i5TH5uLXOEZ2i5j9tivjAIJVhuvcVmNuytFQulWx/XIdlSOqHEWfbQejuo/vSbpU0sMFQLwsnL3ocw7PlnRoI2J0lHiWJG/LTFsZAQRrPRNqYbJA+WlfuuTzCP0KTRSpIdFUFyX3eV4Qj/hdR1t3D9wJItrwOHww7KslHRCKWn3warNZnHyIrM9nvLXLWf69XgIIVr1zl/5SezkUn+rFn5cWqTZy6YGu/vfHJf1G0pWS7uxA7aT+y8OL1Y7c/N8W4ackvTC51iJ4WzjowhsQOulPzqr++7jXCBCsXpgW9yVHHvFJX9w5wTkpF3Q6t+TPXO2CEOUd1HDACXl//iLpqCBIHof9j+KUXuLxuGTCEeEDIXKyWPlQDdqWEkCw6pl4Rxt+ymehSivR/SKyn/B5yVdiuTeUkCvmm1HfJlteykWB8p9U0w8lv+LrEKxlT+4mkfIvtSOpuQs3HSU5mnpTWMLtFDE1STvH9bOwt3yfcoplzxTeTUIAwZoE8646ifVSjqKapQhz5KXsvP3w1jNx6eY/7Wczue/veinnSM8iFMXUkWG66V8E8mA4xcfiRYNAJwEEqxPRJF/wL3OsPJ/6CZ8H6D6d8I4iFIWyLbeUAvEyzsL0T0n3Jku6tqVpMyGf2rGwfYJShEnutao7QbDmmz6LQizobKs89y9xzrxUfAoXE91ebsZIqYuC82TOKfljgYp/77qu+e9+kdqn97iWqq35zMTmkWG77YPvr5gAgjXt5FqkTpP0IUl7JV370XyskxqSbI6RkaMkN9cq7Z8sw9qWY82RW5SiGDlCSsUpJyUz+JykE3cw6jMTr19Abi7nmLGViQCClQnkBjM+7OF0SUdIekH4RbUgRJHa9ETMQpPmjtK80U45pE0jikWVMbcUn8oNEcmx5BxteZnY1q6T9E2WiGMRr+96BKvMnFpoXi/JNUmHhGjHPbl48uehpiiKRlowGUWoK3e0yWsL4SOS7mjklJb6JO4WSfGcxOa4zghHkJWZJaxWRwDByjdl75X02vD6yPGJWUcvT0ryksvbDDuycPHj4WFngaEeNPNK6VO5oTbnuu4kSTe3vPdof/wE8V1zOUa/yyKAYA2fjzdL8i/aW8L7bqklRzh+LcV5pL2Hd/HsstFC5E/JvNIIF7Ne6kjLmwJa1NNmgb925HuJWR3F2DwEEKx+3J0otvgcFz7N+qh+Vtq/FUsDojClie8xdmu+1oLl3F+6ZbPH41d7Lqp5YPg+jgCC1c3Pyzgv33I0vwsXX0H5haR/5zC6Yhv+H4NLHZzLSptfRfKe8rQtI4BgdU/4M91fed43nLfywQ03SPqTpPtDIpxdBQbAlHSupO82LuXeHcay6quY9O7p+4qki8PXbpf0P0lPBxHaM0RMT0jygaM+hPSykDxe0ovI3aOs4xved8vRFRFWHfOV3UsEKztSDEIAAqUIIFilyGIXAhDITgDByo4UgxCAQCkCCFYpstiFAASyE0CwsiPFIAQgUIoAglWKLHYhAIHsBBCs7EgxCAEIlCKAYJUii10IQCA7AQQrO1IMQgACpQggWKXIYhcCEMhOAMHKjhSDEIBAKQIIVimy2IUABLITQLCyI8UgBCBQigCCVYosdiEAgewEEKzsSDEIAQiUIoBglSKLXQhAIDsBBCs7UgxCAAKlCCBYpchiFwIQyE4AwcqOFIMQgEApAghWKbLYhQAEshNAsLIjxSAEIFCKAIJViix2IQCB7AQQrOxIMQgBCJQigGCVIotdCEAgOwEEKztSDEIAAqUIIFilyGIXAhDITgDByo4UgxCAQCkCCFYpstiFAASyE0CwsiPFIAQgUIoAglWKLHYhAIHsBBCs7EgxCAEIlCKAYJUii10IQCA7AQQrO1IMQgACpQggWKXIYhcCEMhO4P/EYZl0jkCBRQAAAABJRU5ErkJggg==', '2023-03-23 13:46:12.233373+08', 'CALVIN SY', NULL, '2023-03-23 13:46:12.233373+08', '2023-2-9', '2PM AT SITE', NULL, NULL, 'yes', '0917-651-5923', '[{"request":"implementation - inspection of ats","personnel":"kc servicing","date_from":"2023-2-9","date_to":"2023-2-9","time_from":"2pm","time_to":"onwards"}]');
INSERT INTO "public"."tbl_services_sales" VALUES (3, 3, '2023-ZSP-015', NULL, 'JP CHAVES ELECTRICAL DESIGN AND CONSTRUCTION', 'COUNTRY CLUB', 'CANLUBANG, LAGUNA', 'MR. JAY-R P. CHAVEZ', NULL, 'PAUL JOHN SOLANO JUDAN', 'data:image/png;base64,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', '2023-03-24 13:17:54.771056+08', 'CALVIN SY', NULL, '2023-03-24 13:17:54.771056+08', '2023-1-24', '3PM AT SITE', NULL, NULL, 'yes', '0917-589-2716', '[{"request":"implementation - inspection and testing of ats","personnel":"busway engineer","date_from":"2023-1-24","date_to":"2023-1-24","time_from":"3pm","time_to":"onwards"}]');
INSERT INTO "public"."tbl_services_sales" VALUES (4, 4, '2023-ZSP-025', NULL, 'TPSC PHILIPPINES CORPORATION', 'TOSHIBA ANNEX', 'TOSHIBA, LTI STA ROSA LAGUNA', 'MR. CARLO BATOON', 'PROJECT MANAGER / ASST. ENGNR', 'PAUL JOHN SOLANO JUDAN', 'data:image/png;base64,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', '2023-03-28 14:58:18.773088+08', 'CALVIN SY', NULL, '2023-03-28 14:58:18.773088+08', '2023-2-9', '2PM AT SITE', NULL, NULL, 'yes', '0917-651-5923', '[{"request":"implementation - inspection of ats","personnel":"kc servicing","date_from":"2023-2-9","date_to":"2023-2-9","time_from":"2pm","time_to":"onwards"}]');
INSERT INTO "public"."tbl_services_sales" VALUES (5, 5, NULL, NULL, 'QWE', 'QWE', 'QWE', 'QWE', NULL, 'KJHGKG', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAABkCAYAAAA8AQ3AAAAAAXNSR0IArs4c6QAADLBJREFUeF7tXT2rNlcV3QELBQuLlIoKgtilsLAIRPEPWFoIUbSPAYOFhUoaxYDmB4ha2eovUMHe2NkZ0cIiYJqgXWThrLjueWfmmY/zObMGXu597zPnnH3W3rOevffZ58xz4csIjIXALyLi65PIr0XEG2OJb2nPIPDcmcZuawQqI/CpiPirjPn7iPhSZRk8XEMETFgNwffQuxH4fkT8QFq9HRGf3t2LGwyLgAlrWNXdUvD3p1n/MSJenH63Dd/IFKzsGyl78Kl+MSJ+N83hNxHxFRPW4Bo9IL4J6wBobtIEAQ0HkbciedmGm6ijzaBWdhvcPep+BBgOIm8FwmLy3Ta8H8thW1jZw6ruVoLr6iCS7r8SwkLSHSTm6wYImLBuoOQLTFHDwW9EBMoZ6GGZsC6g4K1TMGFtRcr3tURAi0VZxgDCcllDS600GNuE1QB0D7kbAc1fgbA0RLQN74Zz3AZW9ri6u4vkX42IX0+T/UdEfCIhLIeEd7GEiDBh3UjZg05V81e/jAjksHDB63JIOKhSj4ptwjqKnNvVQgD1VigaxYUVwh86JKwFfX/jmLD604kleooA81f4K+qvsEKoOSyHhDeyGBPWjZQ94FTT0xnUXv89zedzrsMaULMHRTZhHQTOzaogoPkrzVcpkdHrqiKQB2mLgAmrLf4efR0BJSzmr9BCCQtJeCTjfd0AARPWDZQ88BTnEu4mrIEVelZ0E9ZZBN2+JAJzCXcTVknEO+/bhNW5gm4snp5/BRjUVh0S3tQwTFg3VfwA015KuKcelua2BpiWRTyDgAnrDHpuWxKBpYS7Cask6p33bcLqXEEdiIfwC/9IFBQJZQb8V0LMpYQ7xsJrvnCCAy57WCXQ77RPE1aniqkkFojo5WQsboPhz0ei8PA8/HwrIv48NUBF+pmD9ZYS7uhe81u6v/CRrP58cARMWIMrcIf4CLH0wkO/lZR2DPPMrUpa+B1E9jfxzuZIba3C3R7WGW0M3taENbgCN4qvIdTGJtVu09ASRx+D0NSDmjuRwSFhNfX0NZAJqy99lJImLRE4Mw69JHpGf5g6g1cEsmHIxjFemnJgc3mwOTnQ78emf/h8LuQzYZ3R4MBtTVgDK2+n6GnyHESCd/uBHNJL81IkIRATf9859JPbKQcJDDk0lS3t+92IwHsIMT634KytIJ6RzW07R8CE1bmCKoinZFFy1e/RVJTIvhcRn1khUiT3+SJVrxI+QvZCn5uwLqTMC01FSxp+HBE4SmZpkQAki0P9GKpeCAZPJUVgVMJiOMH5qJfwfES8M33wyWTCuA+GPReCaJ+8B831d4ZE+BtWuvh5jlDJ1vl/BPBGHOoj3ZKDv38tIr65ABiJCyGkSexiVjUKYbFeqNZS/BE1a94HvzMZfbYe6Ygso7chYS2d2a5Jd+S1gDW+nPD39MtMCczH0AxuGb0TFggKFc2pEeaGnR4SPTD2TxLi+OptzXl5S3L9JSI+nNQePapFyj3HUfrTGqylolAlLD0PizqB3XB1UmvNqE+EkCavUSxC5OyZsPT1Tkog6rHwodfQcI58zlRc71WrPiB4aHBxmZ6fzXkBmvBGPVLLBPjeOee8XwlrKaGevgl6jXwY/mM1EkSntoR2xDrnHNxXIQR6JqzvRMRPpnn/LCLePLnVoxCEu7vVeiT8jlBmaTsMSQsknKusYLfAlRuo97R0/LHaxs8j4lsbZQTewBrkRcyBsYlrI4Ctb+uZsIDNT6flaxgajIqrQa1xKzW+hjQksnT7zNVzMkpYS/aZo3CUeVF4cbhMXKWsOmO/vRMWpspvRYQBDAfv5sYTA4SYIDDNqQEjJp6vsFrJcG8p4Y75akiIOcMTO3oBS/THcJFlEs5xHUW0YLsRCEunD6N6MSK+PJEX3wJcEKIuu14jMIaPoz5wJKO1UxhyEhYVDEy5wIPfgSM8+it8CXRpxEeEGo2w6HHBoFBcaDf+f1pfys3Q+xrJIyUZrVWwa0i45okdeSbSlWnIMRJ+R+Y8TJsRCSv1uHhsCnNcw4BfSFCuimntGocCRnjAe34A4eWAkNYISz0szK3E258hA8ZhqQvCzpqrzYXMY+xuRycsehe6ZG3ietYm8fAhiU9PjIsYuJOrj708jCwaXXtBag3CAjbwtjAWFz5KEOPYDFJZ+isQluYg6M4zVEQOwtc8geGvmsTn6mNrD4yLCms5uPR8r9J2rAsB9rQaPlGlFd1iagyFuOpjj+uxFuiB6dYnJbDeasBqExYQpOeHJDwWe3rxSB9r90J3XJGw1ONCqIhciD2u7UbLkgkWV2qBZS8rkC0Iiws9+OkjbbbbU9Y7r0xYJq48pqIlFFqrxNCxxebuNIdVy451XOez8tjXrl5qKXqXUIVu1spml0McA5krkMh9aYU4equ5vYUriRy3Zj0eQ0NsF3v1GIxudRSBOxFWmpzn0bw1H7SjeuqxnW4qZqJcT0Mo6Xn9KSJemECp/ZovbBf79jS2vazKlnlHwlLi0lqlXvIzlU0gy3DMe7EEgLVLpcLGv0fExyfJW+ST6GW1GDuLwkbt5M6EpTpT4sLvPi/pnEXPrTriCwH/zhatQj8gDF56HtY5qbe3dpnDdqyy3mnCegonwxzkSBBq4LytkqFNVmV22JmGjZqwP+PNpoTVIizT16a1GL9DVdcRyYS1jDOMEnmSVyonlOtovv4oS/sd9+YQU8JqYcMqw1pFfn2ULz5iC2WPCCmPH2ExpSvoz2lRV2zREw8qRLj46JQJLS3IvfF566yUsFqEpFvlvNx9JqztKqWHoJutz+Zjto9+zTs1d5gWqPJLQSvKU++qVdJ7yyGD19RY41mZsPYrgHkZroj53KT9GKYt5nJdvIfHu+D/yC0qsSF/1OLacshgC7kuP6YJ67iKU+LySZXHsdSW9GRfl9IFfI5X1uNlHrxahmK6r/DMaad5ELtRLyasPMrGQ6Z5rr2J5DxSXK8XxVVnV7tYNCVUllW42r2yzZmw8gKenhTBuiMfs3sOZ55L9aGI+G1EvHGuu1OtNY/2WmNZTk1kxMYmrDJa0wQ9q75djFoG69q96iqlSxoqo2/CKgt4WnvkY27K4l2jd9147aLRGojLGCaseoCneS6Hi/WwzzkSXn7ClUo/PzmR3dCXAd8AUuZb5oomfSpqZpALdvf+1HeuolXaA7p1QfIDxZmwClr2g67nwsUze+zazeQ+I2vCPS1a5YkVLHcBKnjxx3sR8Y5AhL/h0uOo+bFzYiasIZ4mXV1kkt4hY3+q04R7WheWQ1oTlgkrhx1V7QPbPnCiZ/rqdO5jrCqMB/sAgXRbUA5oqNPeXrWWY25F+nBIWATWLJ2m21X0NM9HG4SzCOBOniCgp5yegcbHc59Az4R1AryKTdNtQBgapOVv5jpK0M3O/4qINxdyUEvS/CcifpTh8MI6s+14FBNWx8pZEE2T9Uz04lYXppbRZRoK6h5GfpHgJ5PplAKHP9Ir9k6HTLoxYWUCslE3XmksD7zWXYF4vNm5POaLI5iwGoKfeWiuNH4kIr479c1z1Ht7c3PmqRfrLn3/oSvbi0G9rWMT1jacRryLp0ewTIJho8+o36ZNPbcdLVoeZ7NN4hvcZcK6tpKZ49LXb2HGXE7HianOrzxrAylZORTs5DkxYXWiiApiLJ3qafJ6Cn4aBgIf5K30qOYK6vIQcwiYsO5pF0zWa4EqPa+0mPEuCKVERTxMVh1ZgAmrI2U0EiVdaVQxlLyuWGmfbkTXubc81bSRKfQ/rAmrfx3VlFA9L+RxtM5LPTCQF1YeRyWxNaJ6KyJedW6vptltH8uEtR2rO9655n0RDy2OBInh6mklkqT78iQbTlmYuyAzVgKdq+rY0k1YHSunM9H44MPzQu6LZLYkJr0v/GTVd4kVScr1hYj47CQMvcPUQ0xl9b6+zozskTgmrEcI+fM1BPQMKCWxJaL4Z0RgXx3f9Iy+GVqqx8b2uA/kw20vuhXmERmtESk+86GJA9q2CWtApQ0isoZiPFL48xHx0ULy83wqDenUo2PerYSXV2hK7jZFwIRlm6iJQLpZmP8noT3yitL8GELN9G815+OxKiNgwqoMuIdbREBDPA0JnQS30XyAgAnLxmAEjMAwCJiwhlGVBTUCRsCEZRswAkZgGARMWMOoyoIaASNgwrINGAEjMAwCJqxhVGVBjYARMGHZBoyAERgGARPWMKqyoEbACJiwbANGwAgMg4AJaxhVWVAjYARMWLYBI2AEhkHAhDWMqiyoETACJizbgBEwAsMgYMIaRlUW1AgYAROWbcAIGIFhEDBhDaMqC2oEjIAJyzZgBIzAMAiYsIZRlQU1Akbgv84ahoPXsocSAAAAAElFTkSuQmCC', '2023-03-29 11:12:59.668306+08', 'QWERQWER', NULL, '2023-03-29 11:12:59.668306+08', '2023-3-29', 'QWE', NULL, NULL, 'yes', NULL, '[{"request":"qwe","personnel":"qwe","date_from":"2023-3-29","date_to":"2023-3-29","time_from":"2","time_to":"onwards"}]');

-- ----------------------------
-- Primary Key structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table tbl_services_sales
-- ----------------------------
ALTER TABLE "public"."tbl_services_sales" ADD CONSTRAINT "tbl_services_sales_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."tbl_services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
