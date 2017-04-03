/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90602
Source Host           : localhost:5432
Source Database       : web
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90602
File Encoding         : 65001

Date: 2017-04-03 03:51:18
*/


-- ----------------------------
-- Sequence structure for Items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Items_id_seq";
CREATE SEQUENCE "public"."Items_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;
SELECT setval('"public"."Items_id_seq"', 7, true);

-- ----------------------------
-- Sequence structure for Orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Orders_id_seq";
CREATE SEQUENCE "public"."Orders_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 27
 CACHE 1;
SELECT setval('"public"."Orders_id_seq"', 27, true);

-- ----------------------------
-- Sequence structure for Orders_Items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Orders_Items_id_seq";
CREATE SEQUENCE "public"."Orders_Items_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 14
 CACHE 1;
SELECT setval('"public"."Orders_Items_id_seq"', 14, true);

-- ----------------------------
-- Table structure for Items
-- ----------------------------
DROP TABLE IF EXISTS "public"."Items";
CREATE TABLE "public"."Items" (
"id" int4 DEFAULT nextval('"Items_id_seq"'::regclass) NOT NULL,
"title" varchar(255) COLLATE "default" NOT NULL,
"price" float8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Items
-- ----------------------------
INSERT INTO "public"."Items" VALUES ('1', 'Телевизор', '50');
INSERT INTO "public"."Items" VALUES ('2', 'Телефон', '10');
INSERT INTO "public"."Items" VALUES ('3', 'Ноутбук', '15');
INSERT INTO "public"."Items" VALUES ('4', 'Стиральная машинка', '12');
INSERT INTO "public"."Items" VALUES ('5', 'Велосипед', '20');
INSERT INTO "public"."Items" VALUES ('6', 'Холодильник', '15');
INSERT INTO "public"."Items" VALUES ('7', 'Магнитофон', '25');
INSERT INTO "public"."Items" VALUES ('8', 'Монитор', '20');
INSERT INTO "public"."Items" VALUES ('9', 'Микроволновка', '25');
INSERT INTO "public"."Items" VALUES ('10', 'Роутер', '30');

-- ----------------------------
-- Table structure for Order_Items
-- ----------------------------
DROP TABLE IF EXISTS "public"."Order_Items";
CREATE TABLE "public"."Order_Items" (
"id" int4 DEFAULT nextval('"Orders_Items_id_seq"'::regclass) NOT NULL,
"item_id" int4,
"count" int4,
"order_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Order_Items
-- ----------------------------
INSERT INTO "public"."Order_Items" VALUES ('1', '1', '1', '17');
INSERT INTO "public"."Order_Items" VALUES ('2', '2', '1', '18');
INSERT INTO "public"."Order_Items" VALUES ('3', '8', '1', '19');
INSERT INTO "public"."Order_Items" VALUES ('4', '6', '1', '20');
INSERT INTO "public"."Order_Items" VALUES ('5', '3', '1', '20');
INSERT INTO "public"."Order_Items" VALUES ('6', '7', '1', '21');
INSERT INTO "public"."Order_Items" VALUES ('7', '7', '1', '22');
INSERT INTO "public"."Order_Items" VALUES ('8', '7', '1', '23');
INSERT INTO "public"."Order_Items" VALUES ('9', '6', '1', '24');
INSERT INTO "public"."Order_Items" VALUES ('10', '8', '1', '24');
INSERT INTO "public"."Order_Items" VALUES ('11', '7', '1', '25');
INSERT INTO "public"."Order_Items" VALUES ('12', '6', '1', '26');
INSERT INTO "public"."Order_Items" VALUES ('13', '8', '1', '26');
INSERT INTO "public"."Order_Items" VALUES ('14', '6', '2', '27');

-- ----------------------------
-- Table structure for Orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."Orders";
CREATE TABLE "public"."Orders" (
"id" int4 DEFAULT nextval('"Orders_id_seq"'::regclass) NOT NULL,
"sum" float8
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of Orders
-- ----------------------------
INSERT INTO "public"."Orders" VALUES ('1', '23');
INSERT INTO "public"."Orders" VALUES ('2', '4');
INSERT INTO "public"."Orders" VALUES ('3', '20');
INSERT INTO "public"."Orders" VALUES ('4', '10');
INSERT INTO "public"."Orders" VALUES ('5', '10');
INSERT INTO "public"."Orders" VALUES ('6', '15');
INSERT INTO "public"."Orders" VALUES ('7', '15');
INSERT INTO "public"."Orders" VALUES ('8', '110');
INSERT INTO "public"."Orders" VALUES ('9', '15');
INSERT INTO "public"."Orders" VALUES ('10', '15');
INSERT INTO "public"."Orders" VALUES ('11', '15');
INSERT INTO "public"."Orders" VALUES ('12', '15');
INSERT INTO "public"."Orders" VALUES ('13', '15');
INSERT INTO "public"."Orders" VALUES ('14', '20');
INSERT INTO "public"."Orders" VALUES ('15', '10');
INSERT INTO "public"."Orders" VALUES ('16', '15');
INSERT INTO "public"."Orders" VALUES ('17', '50');
INSERT INTO "public"."Orders" VALUES ('18', '10');
INSERT INTO "public"."Orders" VALUES ('19', '20');
INSERT INTO "public"."Orders" VALUES ('20', '30');
INSERT INTO "public"."Orders" VALUES ('21', '25');
INSERT INTO "public"."Orders" VALUES ('22', '25');
INSERT INTO "public"."Orders" VALUES ('23', '25');
INSERT INTO "public"."Orders" VALUES ('24', '35');
INSERT INTO "public"."Orders" VALUES ('25', '25');
INSERT INTO "public"."Orders" VALUES ('26', '35');
INSERT INTO "public"."Orders" VALUES ('27', '30');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."Items_id_seq" OWNED BY "Items"."id";
ALTER SEQUENCE "public"."Orders_id_seq" OWNED BY "Orders"."id";
ALTER SEQUENCE "public"."Orders_Items_id_seq" OWNED BY "Order_Items"."id";

-- ----------------------------
-- Primary Key structure for table Items
-- ----------------------------
ALTER TABLE "public"."Items" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Order_Items
-- ----------------------------
ALTER TABLE "public"."Order_Items" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Orders
-- ----------------------------
ALTER TABLE "public"."Orders" ADD PRIMARY KEY ("id");
