/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90602
Source Host           : localhost:5432
Source Database       : web
Source Schema         : task

Target Server Type    : PGSQL
Target Server Version : 90602
File Encoding         : 65001

Date: 2017-03-31 10:21:25
*/


-- ----------------------------
-- Sequence structure for order_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "task"."order_items_id_seq";
CREATE SEQUENCE "task"."order_items_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 66
 CACHE 1;
SELECT setval('"task"."order_items_id_seq"', 66, true);

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "task"."orders_id_seq";
CREATE SEQUENCE "task"."orders_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 106
 CACHE 1;
SELECT setval('"task"."orders_id_seq"', 106, true);

-- ----------------------------
-- Sequence structure for product_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "task"."product_id_seq";
CREATE SEQUENCE "task"."product_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"task"."product_id_seq"', 10, true);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "task"."items";
CREATE TABLE "task"."items" (
"id" int4 DEFAULT nextval('"task".product_id_seq'::regclass) NOT NULL,
"title" varchar(255) COLLATE "default",
"image" varchar(255) COLLATE "default",
"price" numeric(10,2)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO "task"."items" VALUES ('1', 'Телевизор', null, '50.00');
INSERT INTO "task"."items" VALUES ('2', 'Телефон', null, '10.00');
INSERT INTO "task"."items" VALUES ('3', 'Ноутбук', null, '15.00');
INSERT INTO "task"."items" VALUES ('4', 'Стиральная машинка', null, '12.00');
INSERT INTO "task"."items" VALUES ('5', 'Велосипед', null, '20.00');
INSERT INTO "task"."items" VALUES ('6', 'Холодильник', null, '15.00');
INSERT INTO "task"."items" VALUES ('7', 'Магнитофон', null, '30.00');
INSERT INTO "task"."items" VALUES ('8', 'Монитор', null, '20.00');
INSERT INTO "task"."items" VALUES ('9', 'Микроволновка', null, '25.00');
INSERT INTO "task"."items" VALUES ('10', 'Роутер', null, '30.00');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS "task"."order_items";
CREATE TABLE "task"."order_items" (
"id" int4 DEFAULT nextval('"task".order_items_id_seq'::regclass) NOT NULL,
"item_id" int4,
"count" int4,
"order_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO "task"."order_items" VALUES ('62', '3', '1', '104');
INSERT INTO "task"."order_items" VALUES ('63', '8', '1', '105');
INSERT INTO "task"."order_items" VALUES ('64', '7', '4', '105');
INSERT INTO "task"."order_items" VALUES ('65', '8', '1', '106');
INSERT INTO "task"."order_items" VALUES ('66', '7', '4', '106');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "task"."orders";
CREATE TABLE "task"."orders" (
"id" int4 DEFAULT nextval('"task".orders_id_seq'::regclass) NOT NULL,
"sum" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO "task"."orders" VALUES ('104', '15');
INSERT INTO "task"."orders" VALUES ('105', '140');
INSERT INTO "task"."orders" VALUES ('106', '140');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "task"."order_items_id_seq" OWNED BY "order_items"."id";
ALTER SEQUENCE "task"."orders_id_seq" OWNED BY "orders"."id";

-- ----------------------------
-- Indexes structure for table items
-- ----------------------------
CREATE UNIQUE INDEX "id" ON "task"."items" USING btree ("id");

-- ----------------------------
-- Primary Key structure for table items
-- ----------------------------
ALTER TABLE "task"."items" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "task"."orders" ADD PRIMARY KEY ("id");
