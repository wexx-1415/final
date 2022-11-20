/*
 Navicat Premium Data Transfer

 Source Server         : fd
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : final

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 15/11/2022 21:27:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
create database if not exists final;
use final;
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_zh_0900_as_cs ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `BillId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NOT NULL,
  `CommodityIds` json NOT NULL,
  `UserId` int NOT NULL,
  `TransactionPrice` json NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NOT NULL,
  `TransactionTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CommodityNames` json NULL,
  `TotalPrice` decimal(10, 2) NULL DEFAULT NULL,
  `Nums` json NULL,
  PRIMARY KEY (`BillId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_zh_0900_as_cs ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('jqnyylmdubgi', '{\"Ids\": [8, 9]}', 5, '{\"price\": [9999.0, 4699.0]}', 'sss22245', '2022-11-08 19:10:30', '{\"Names\": [\"YOGA Pro14s 2022标压酷睿版 14.5英寸轻薄笔记本电脑 水月银\", \"联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰\"]}', 14698.00, '{\"Nums\": [1, 2]}');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `CommodityId` int NOT NULL AUTO_INCREMENT,
  `CommodityName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  `CommodityDes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  `CommodityPrice` decimal(10, 2) NULL DEFAULT NULL,
  `CommodityPicPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  `Nums` int NULL DEFAULT NULL,
  `Category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  PRIMARY KEY (`CommodityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_zh_0900_as_cs ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (112, '拯救者 R7000 15.6英寸游戏笔记本 幻影黑', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 5999.00, 'E9rWilpDQsIxmyIwo96uLaBMV-9333.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (113, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/512G SSD/RTX™ 3060 6G独显/钛晶灰', 9299.00, 'gP1N6kFzDRD8ipuxrcq0vCClT-3024.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (114, '拯救者 Y7000 2021 英特尔酷睿i5 15.6英寸游戏笔记本 幻影黑', '第11代英特尔酷睿i5-11400H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 5799.00, 'SphHLBxZRJ4oXdtRMtxq1BocM-7805.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (115, '联想 拯救者Y7000P 2022英特尔酷睿i5 15.6英寸笔记本 钛晶灰', '第12代英特尔®酷睿™i5-12500H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™  3050 4G独显/钛晶灰', 6999.00, 'iY82Cyuhv7TCOLtNWtnuLhFSf-0199.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (116, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™  i5-12500H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050  4G独显/星曜银', 6999.00, 'SLubVjDhEfBhcnxCXQkoj6fu8-5640.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (118, '拯救者 R7000 15.6英寸游戏笔记本 幻影黑', 'AMD Ryzen 5 5600H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 5999.00, '0ZgGkK1ZQLT8xTkmbMrrJ7YBY-5523.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (119, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/1T SSD/RTX™ 3060 6G独显/钛晶灰', 10598.00, 'fDjQn9SMNqTE9k2uOpUjI6mKe-2152.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (120, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 冰魄白', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/512G SSD/RTX™ 3060 6G独显/冰魄白', 9599.00, 'LHDr1gSmIwF5wW3llvwUy84Xm-0221.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (122, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/1T SSD/RTX™ 3060 6G独显/冰魄白', 10898.00, 'nXsQtX0JkevFjns85CvbxR3QS-9520.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (123, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3060 6G独显/冰魄白', 10148.00, 'WOeGGrZCnFtWBimLHNFaLuLNB-2771.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (124, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 冰魄白', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/16G/512G SSD/GeForce RTX™ 3060 6G独显/冰魄白', 10499.00, 'RehAvf7LUM18G5CBs7FU8pRrD-0244.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (125, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', '第12代英特尔®酷睿™i7-12700H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™  3050 4G独显/钛晶灰', 7699.00, '1LwpEdq8iPUrwWNKz8z3U1ppk-1064.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (126, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/1T SSD/RTX™ 3070 8G独显/钛晶灰', 12298.00, 'IW4A17MWGDSBJvisAJsyM1vTp-1735.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (127, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™  i7-12700H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050  4G独显/星曜银', 7699.00, '2RCCPR3BxJeVjEIDGYoXtvEIl-0303.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (128, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/16G/512G SSD/RTX3070Ti 8G独显/钛晶灰', 11899.00, 'HO5xswpuz15DaT8qPbx4pAac6-2642.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (129, '联想(Lenovo)拯救者R9000P 2022 16英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows11家庭中文版/16英寸/16GB/512G SSD/RTX3060 6GB独显/钛晶灰', 8699.00, 'Td8vypJcRDMty5xsqj09ZYGOw-1602.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (130, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX3070Ti 8G独显/钛晶灰', 13698.00, 'h6aZEjpQz7EI2NIyuu3aAWg27-3197.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (131, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX™ 3070 8G独显/钛晶灰', 12798.00, 'sGAYSyUbuZ8WpmdJkDYgv4ogj-7502.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (132, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3060 6G独显/钛晶灰', 9848.00, 'bnoXoDqq0ACG34roXPmG7BGKB-0080.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (133, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 5 6600H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 4GB独显/钛晶灰', 6599.00, 'oPjqYM739vgIkZizpgkKMx3ox-9564.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (134, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3070 8G独显/钛晶灰', 11548.00, 'tKlLPJd4QMHkIwnaG9yiUI4gG-5987.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (135, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/ RTX™ 3050 Ti 4GB独显/钛晶灰', 7799.00, 'd4HGrK2st6gxRMHVAY2m7pqSf-7022.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (136, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX™ 3070 Ti 8G独显/钛晶灰', 13498.00, '1Cm3CBI3l7Uinghvp9IkmJRET-4058.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (137, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™  i7-12700H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050  4G独显/星曜银', 7699.00, '2RCCPR3BxJeVjEIDGYoXtvEIl-0303.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (138, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/ RTX™ 3050 4GB独显/钛晶灰', 6999.00, 'UHg95SxqaLH8k8K9S6VPCMEgj-8685.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (139, '拯救者 R7000 15.6英寸游戏笔记本 幻影黑', 'AMD Ryzen 5 5600H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 5999.00, '0ZgGkK1ZQLT8xTkmbMrrJ7YBY-5523.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (140, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/1T SSD/RTX™ 3070 8G独显/钛晶灰', 12298.00, 'IW4A17MWGDSBJvisAJsyM1vTp-1735.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (141, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/16G/512G SSD/GeForce RTX™ 3070 8G独显/钛晶灰', 10799.00, 'VeUxCxRflwyW3vTrBo6I2ZUkL-0765.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (142, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/1T SSD/RTX™ 3070 Ti 8G独显/冰魄白', 13198.00, 'IaEcqne1yHIdB1YFyTYRF7b5E-3620.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (143, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/32G/1T SSD/GeForce RTX™ 3070 8G独显/钛晶灰', 12098.00, 'BW7ttR0U1jpMKlTAp9uC596GM-8466.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (144, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/16G/512G SSD/RTX3070Ti 8G独显/钛晶灰', 11899.00, 'HO5xswpuz15DaT8qPbx4pAac6-2642.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (145, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', '第12代英特尔®酷睿™ i7-12700H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™  3050 Ti 4G独显/钛晶灰', 8499.00, 'QntS82BvILx7VQ0BpvV0odCDu-8307.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (146, '联想(Lenovo)拯救者R9000P 2022 16英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows11家庭中文版/16英寸/16GB/512G SSD/RTX3060 6GB独显/钛晶灰', 8699.00, 'p7hZduDV4HBSLd17AzhdNpyVh-0238.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (147, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3070 Ti 8G独显/冰魄白', 12448.00, 'ThAkwS3hVwd9i2ZJ3FvrsCp5D-4126.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (148, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX™ 3070 Ti 8G独显/冰魄白', 13698.00, 'U0zpGPY7BBFNuWs8p246N0WYP-1478.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (149, '拯救者 R7000 15.6英寸游戏笔记本 幻影黑', 'AMD Ryzen 5 5600H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 5999.00, '0ZgGkK1ZQLT8xTkmbMrrJ7YBY-5523.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (150, '联想(Lenovo)拯救者R9000P 2022 16英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows11家庭中文版/16英寸/16GB/512G SSD/RTX3060 6GB独显/钛晶灰', 8699.00, 'Td8vypJcRDMty5xsqj09ZYGOw-1602.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (151, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代英特尔酷睿 i5-12500H/Windows 11 家庭中文版/16英寸/16G/512G SSD/GeForce RTX™  3060 6G独显/钛晶灰', 8999.00, 'PFW88lifT8tGp5XsPDceyqHBx-9908.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (152, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX3070Ti 8G独显/钛晶灰', 13698.00, 'h6aZEjpQz7EI2NIyuu3aAWg27-3197.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (153, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/2T SSD/RTX™ 3070 8G独显/钛晶灰', 12798.00, 'sGAYSyUbuZ8WpmdJkDYgv4ogj-7502.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (154, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3060 6G独显/钛晶灰', 9848.00, 'bnoXoDqq0ACG34roXPmG7BGKB-0080.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (155, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 5 6600H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 4GB独显/钛晶灰', 6599.00, 'oPjqYM739vgIkZizpgkKMx3ox-9564.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (156, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™ i5-12500H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050 Ti 4G独显/星曜银', 7799.00, 'irqsdzt5lDJnjltvsTR2yWILd-8202.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (157, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3070 8G独显/钛晶灰', 11548.00, 'tKlLPJd4QMHkIwnaG9yiUI4gG-5987.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (158, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050 Ti 4G独显/星曜银', 8699.00, '2cWcSB24GJpDMBO5aHLXEet7E-3755.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (159, '联想(Lenovo)拯救者Y9000X 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™ i5-12500H/Windows11家庭中文版/16.0英寸/16G/512G SSD/GeForce RTX™ 3060 6G独显/钛晶灰', 8799.00, 'M8Gbj6JDDeAlQ1CknVF9IylUU-0695.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (160, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 4GB独显/钛晶灰', 6999.00, 'rEAE8YJ7Wrc1FuRk5BRpSo9QP-1584.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (161, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 7 6800H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 Ti 4GB独显/钛晶灰', 7299.00, 'VRRBZk2aaAOqoxQFYbE7RDXAn-6985.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (162, '拯救者 R7000P 2021款15.6英寸游戏笔记本电脑 幻影黑', 'AMD Ryzen 5  5600H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/GeForce RTX™ 3050Ti 4GB独显/幻影黑', 5999.00, 'DuBEvjnxDz3PEqb0VkVg72R2f-3133.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (163, '【定制款】联想 拯救者Y9000X 2022 16英寸游戏笔记本电脑', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/24G/1T SSD/GeForce RTX™ 3060 6G独显/钛晶灰', 10698.00, 'IYH3YqY7oD9ukktWjG2iaawy7-8381.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (164, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑 冰魄白', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/32G/1T SSD/GeForce RTX™ 3060 6G独显/冰魄白', 11298.00, 'FQLEJN5kC2IdOu6Cqp9NdukrI-8607.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (165, '联想(Lenovo)拯救者Y9000K 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™i7-12800HX/Windows11家庭中文版/16英寸/32GB/1T SSD /RTX™ 3070 Ti 8G独显/钛晶灰', 17999.00, 'fW5nqxxnRhRiXSrwtfo6VySv9-6132.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (166, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX3070Ti 8G独显/钛晶灰', 12448.00, 'TBa7IHalsVyRJphpQlkSwxezV-6042.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (167, '联想(Lenovo)拯救者Y9000X 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/16G/512G SSD/GeForce RTX™ 3060 6G独显/钛晶灰', 8999.00, 'Lw1OiXXJZVOcFpFmpDFaARPwd-4751.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (168, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/16G/1TB SSD/GeForce RTX™  3060 6G独显/钛晶灰', 10298.00, 'gzOZSBxt8Muv969gnVjkM4Qgq-1553.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (169, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/1T SSD/RTX™ 3070 Ti 8G独显/钛晶灰', 12248.00, 'uD2aLyRLx4VgGsnu4NOq7UmPW-0287.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (170, '联想(Lenovo)拯救者R7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', 'AMD Ryzen 5 6600H/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/ RTX™ 3050 Ti 4GB独显/钛晶灰', 7699.00, 'rGS0XoBws7Bmca5yRY23kycIf-0728.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (171, '【定制款】联想 拯救者Y9000X 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™ i7-12700H/Windows11家庭中文版/16.0英寸/24G/1T SSD/GeForce RTX™ 3070 8G独显/钛晶灰', 12198.00, 'ikqEVgyHDIXfZDpsqvmapfWZc-0031.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (172, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/512G SSD/RTX™ 3060 6G独显/冰魄白', 10498.00, 'hefpHItMMMyUiqqzqiIZP1ZyI-1735.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (173, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/16G/1T SSD/GeForce RTX™ 3070 8G独显/钛晶灰', 11348.00, 'wjpGljXpnVf9fe26v1QvNtTcP-6018.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (174, '拯救者R7000 15.6英寸游戏笔记本电脑 幻影黑', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX 3050 4G独显/幻影黑', 6199.00, 'Xg6JIUfwFlLYlMUuPWrsNdzra-7841.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (175, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 钛晶灰', '第12代英特尔®酷睿™i5-12500H/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/ GeForce RTX™  3050 Ti 4G独显/钛晶灰', 7999.00, 'B7hry7gXgYq9w6yzn0k5h0qFg-1198.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (176, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i7-12700H/Windows 11 家庭中文版/16英寸/32G/512G SSD/RTX3070Ti 8G独显/钛晶灰', 12798.00, 'XvFe3oiKOjSlxUhahtoBpC7nk-6654.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (177, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑 冰魄白', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/16G/1T SSD/GeForce RTX™ 3060 6G独显/冰魄白', 10498.00, '2HbGFJgTBA8OymR52MzBvFky9-1351.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (178, '联想(Lenovo)拯救者Y9000P 2022 16英寸游戏笔记本电脑 冰魄白', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/16G/512G SSD/RTX™ 3070 Ti 8G独显/冰魄白', 11999.00, 'GJjxkl0oAhc0jdSi5S5iCoyJL-3763.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (179, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/512G SSD/RTX™ 3060 6G独显/钛晶灰', 10198.00, '1nFIGFoL99XEB5fLtVjxHa4FA-5438.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (180, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代智能英特尔®酷睿™i7-12700H/Windows11家庭中文版/16.0英寸/32G/2T SSD/GeForce RTX™ 3070 8G独显/钛晶灰', 12598.00, 'SpnAFWqDtEAhXLFJ2wahCbnGJ-1600.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (181, '【定制款】联想 拯救者Y9000P 2022 16英寸游戏笔记本电脑', '第12代英特尔酷睿 i9-12900H/Windows 11 家庭中文版/16英寸/32G/512G SSD/RTX™ 3070 Ti 8G独显/钛晶灰', 12598.00, 'bAuW2inxfltAcloPelWL12RdE-0532.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (182, '联想(Lenovo)拯救者Y7000P 2022 15.6英寸游戏笔记本电脑 星曜银', '第12代智能英特尔®酷睿™  i7-12700H/Windows11家庭中文版/15.6英寸/16G/512G SSD/GeForce RTX™ 3050  4G独显/星曜银', 7699.00, 'CJz5tm73Dfi3kz1ouDMYY9ukv-2550.w520.jpg', 15, '拯救者');
INSERT INTO `commodity` VALUES (183, '小新 Pro 16 锐龙版16.0英寸全面屏轻薄笔记本 深空灰', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/集成显卡/深空灰', 4917.00, 'MTsUjfmlF174to1FINwlqiEre-7850.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (184, '联想 小新 Pro16 EVO认证酷睿版16英寸轻薄笔记本电脑 皓月银', 'i5-12500H /Windows11家庭中文版/16.0英寸/16G/512G SSD/集成显卡/皓月银', 5399.00, 'lR3v9gY6nLHx67BXFr6yIdv1g-5792.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (185, '小新 Air 14 酷睿版 14.0英寸全面屏轻薄笔记本电脑 亮银', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/亮银', 3999.00, 'y3ILHDQFlOjVooMOEVnwRVfmF-8709.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (186, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/Radeon 680M高性能集成显卡/深空灰', 5599.00, 'wmXZvYYMtn1kbJgkojjEuKtmT-8723.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (187, '联想 小新 Pro14 EVO认证酷睿版14英寸轻薄笔记本电脑 皓月银', 'i5-12500H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 5299.00, '16FsIT6bWO6tiV96farZDOAMI-1125.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (188, '小新 Air15 酷睿版英特尔酷睿i5 15.6英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/集成显卡/银色', 4599.00, 'ejt5grJh7Xo29qYQZRzSa88Ag-5173.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (189, '小新 Pro 16 锐龙版16.0英寸全面屏轻薄笔记本 深空灰', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/Geforce  RTX 3050 4G独显/深空灰', 6299.00, '6dRWC0MxNIwh3ydgogSEumVtp-7109.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (190, '联想小新Pro16 2022标压酷睿版16英寸轻薄笔记本电脑 皓月银', 'i9-12900H/Windows11家庭中文版/16英寸/16GB/512GB SSD/集成显卡/皓月银', 6299.00, 'z1czLg73tO7MQDkJgjOc2Gbzw-3058.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (191, '联想小新Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i9-12900H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 6199.00, 'aRlzbwWiK5JnGpsAxWxFu6OPh-8236.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (192, '联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen5 6600HS/Windows 11 家庭中文版/14英寸/16G/512G SSD/Radeon 660M高性能集成显卡/深空灰', 4699.00, 'HyBz48sZbUYULet8QhzfKsvP3-1670.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (193, '联想小新Pro14 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen 7 6800HS/Windows11家庭中文版/14英寸/16G/512G SSD/集成显卡/深空灰', 5499.00, '8cCcjxtAPbXQlDjtZ3vRs6mmC-1273.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (194, '联想 小新 Air15 2022酷睿版15.6英寸轻薄笔记本电脑 银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/集成显卡/皓月银', 4799.00, 'LAaDAPfUQRvfnQDJREWyMn6m8-1567.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (195, '联想小新 Pro14 2022酷睿版14英寸轻薄笔记本电脑 暗夜极光', '第12代智能英特尔® 酷睿™ i5-12500H/Windows11家庭中文版/16G/512G SSD/集成显卡/暗夜极光（绿色键盘背光+绿色机身）', 5699.00, '0hKlWJT0e36P1sRvLKpwnhZbj-4870.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (196, '联想小新 New Air14 2023款14英寸超轻薄笔记本电脑', '第12代英特尔酷睿 i5-1240P/Windows 11 家庭中文版/14英寸/16G/512G SSD/集成显卡/霜雪银', 5299.00, 'pfqblSFn8rR9RsEFyylIW4N0x-1971.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (197, '联想 小新 Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i5-12500H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 5599.00, 'Z4w9Dquq9kXN0DxmSSxegUKC8-3669.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (198, '联想 小新 Pro16 2021 标压锐龙版 16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R5 5600H/Windows11家庭中文版/16.0英寸/16G/512G SSD/RTX 3050 4G独显/深空灰', 5999.00, 'FUVIxAZk1U8SidlTjdCTPdTMG-6513.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (199, '联想 小新 Air14 2022酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔®酷睿™ I5-1240P/Windows11家庭中文版/14.0英寸/16GB/512GB/集成显卡/皓月银', 4599.00, 'mbbLCXRCLVflphMGbEx1AUOyl-1643.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (200, '联想小新Duet 12.4英寸轻薄二合一笔记本电脑 深空灰', '第12代智能英特尔酷i5-1235U/Windows11家庭中文版/12.4英寸/16GB/512G SSD/集成显卡/深空灰', 6299.00, 'MFtU94cYgpl2TX7JGhYN0sr02-4102.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (201, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/RTX 3050 4G独显/深空灰', 6999.00, 'TU2J7WxTI6LXtMtJBI8dk8qf6-2106.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (202, '联想 小新 Air15 2022酷睿版15.6英寸轻薄笔记本电脑 银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/集成显卡/皓月银', 4799.00, 'BPBHvwbrMh232AU8IWGTGWCQu-7369.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (203, '联想 小新 Pro16 2022 标压锐龙版 16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R5 6600H/Windows11家庭中文版/16.0英寸/16G/512G SSD/Radeon 660M高性能集成显卡/深空灰', 5599.00, 'aJFiPYwdkyobGEwzq2lLwngfy-7377.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (204, '联想小新Pro14 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen 7 6800HS/Windows11家庭中文版/14英寸/16G/512G SSD/集成显卡/深空灰', 5499.00, 'G0XnVIe5kRrTINcYiB0oNIYZF-8209.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (205, '小新 Air 15英特尔酷睿i5 15.6英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/集成显卡/银色', 4599.00, 'rVwFkMDppkh08ijS4litwhjUL-7009.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (206, '联想 小新 Pro16 EVO认压酷睿版16英寸轻薄笔记本电脑 皓月银', 'i5-12500H /Windows11家庭中文版/16.0英寸/16G/512G SSD/集成显卡/皓月银', 5399.00, 'O7SoSQTdyPt1cv9gQO4CJBEzz-3067.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (207, '联想小新Air14 Plus 2022锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen5 6600HS/Windows 11 家庭中文版/14英寸/16G/512G SSD/Radeon 660M高性能集成显卡/深空灰', 4699.00, '7CBtMY13dWeumjdlALrDh2PaY-8140.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (208, '联想 小新 Pro16 2022款16英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔酷睿 i5-12500H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/集成显卡/皓月银', 5499.00, 'MOcXAjC1abZqWRKT0jH9Ig4KE-2447.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (209, '小新 Air 15 英特尔酷睿i5 15.6英寸全面屏轻薄本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/15.6英寸/16G/512G SSD/集成显卡/银色', 4399.00, '0BuEhBMyGnJbmETaecHcpHutz-5246.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (210, '小新Air14 2021锐龙版14英寸全面屏轻薄笔记本电脑 深空灰', 'AMD Ryzen 5 5500U/Windows 11 家庭中文版/14.0英寸/8G/512G SSD/集成显卡/深空灰 定制款', 3299.00, 'yH0hzmvLV3x0sq9T8MZNQw9lz-0371.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (211, '联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen 7 6800HS/Windows 11 家庭中文版/14英寸/16GB/512GB SSD/Radeon 680M高性能集成显卡/深空灰', 4999.00, 'pGIlKrVwrhL4M7Z9gW9dCCwtQ-8048.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (212, '小新Air15 2021款 英特尔酷睿i5 15.6英寸全面屏轻薄本 银色 套餐', '第11代英特尔酷睿i5-1155G7/Windows 1 家庭中文版/15.6英寸/16G/512G SSD/集成显卡/银色+联想小新蓝牙静音鼠标（灰/白 随机发货）', 4439.00, 'TQ6w97KGNRzyWMC364jmWsrIV-5859.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (213, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/14.0英寸/8G/512G SSD/集成显卡/银色 定制款', 3699.00, '042MndkNIkGPBBK0oVfRtwxHr-5718.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (214, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 10 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/银色+小新蓝牙鼠标（黑白随机发）【win10/win11随机发货】', 4139.00, 'sbjXb8e4IvWXEiTQTLmdgCD8x-2067.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (215, '联想 小新 Pro16 2022 标压锐龙版 16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/Radeon 680M高性能集成显卡/深空灰', 5699.00, 'pp3GMZuwcUPwMkn2uMe1HCmJb-8301.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (216, '小新Air14 2021锐龙版14英寸全面屏轻薄笔记本电脑 深空灰', 'AMD Ryzen 5 5500U/Windows 11 家庭中文版/14.0英寸/8G/256G SSD/集成显卡/深空灰', 2999.00, '0G15zyowaX1i8GaejSYKyGzGc-8243.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (217, '联想 小新Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i5-12500H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 5599.00, 'vHkT5td2ahRX6Gx6yqdVjkkye-9909.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (218, '小新 Air 15 英特尔酷睿i5 15.6英寸全面屏轻薄本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/15.6英寸/16G/1T SSD/集成显卡/银色 升级款', 4899.00, 'AsN2IQ8x7CjmN6yPVhHi66wje-7924.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (219, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/14.0英寸/8G/256G SSD/集成显卡/银色', 3399.00, 'YGMzFlW9glm1IOD0wX5IEF4TY-4842.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (220, '联想 小新 Air15 2022 酷睿版 15.6英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔 酷睿 i5-1235U/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/集成显卡/皓月银', 4699.00, 'mYqRGexrUdFogQSgPcnBAX148-3790.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (221, '联想小新 Pro14 Intel EVO认证 14英寸轻薄笔记本电脑 皓月银', 'i7-12700H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 6799.00, 'bgbUv7jvjstBs1oyUPBwuGpqT-0771.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (222, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 10 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/银色【win10/win11随机发货】', 4099.00, 'XdfCuzVdemNvj2qGDsEv4BImP-0940.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (223, '2021款 小新 Pro 16 锐龙版16.0英寸全面屏轻薄笔记本 深空灰', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/16.0英寸/16GB/512G SSD/Geforce RTX 3050 4G独显/深空灰', 6399.00, 'M6Q8Vsk3pwdrzWkiWDGBd9KWP-4441.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (224, '联想 小新 Pro16 2022款16英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔酷睿 i5-12500H/Windows 11 家庭中文版/16.0英寸/16GB/1T SSD/集成显卡/皓月银 升级款', 6099.00, 'MOcXAjC1abZqWRKT0jH9Ig4KE-2447.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (225, '联想 小新 Air14 2022酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔®酷睿™ I5-1240P/Windows11家庭中文版/14.0英寸/16GB/512GB/集成显卡/皓月银', 4799.00, 'qxdK5M6dus6BMguVA9efBotzu-2445.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (226, '联想 小新 Air14 2022酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔®酷睿™ I5-1240P/Windows11家庭中文版/14.0英寸/16GB/512GB/集成显卡/皓月银', 4599.00, 'N4ZT79LUcgrzS0t4e3NqxquBo-7926.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (227, '2021款 小新 Pro 16 标压锐龙版16.0英寸全面屏轻薄笔记本 深空灰', 'AMD Ryzen 7 5800H/Windows 10 家庭中文版/16.0英寸/16GB/512G SSD/集成显卡/深空灰【win10/win11随机发货】', 4999.00, 'peLfrSkhpr2LuHxjchXF4kSCU-3777.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (228, '联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen5 6600HS/Windows 11 家庭中文版/14英寸/16G/512G SSD/Radeon 660M高性能集成显卡/深空灰', 4499.00, '2ySYuxHHJHATEASKfoRBlWfv3-0647.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (229, '联想 小新 Air14 Plus 2022 酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/14.0英寸/16GB/512G SSD/集成显卡/皓月银', 5199.00, 'MC9zpDKqQz4UfmVVbtrdTUsbk-3523.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (230, '小新Air14 2021锐龙版14英寸全面屏轻薄笔记本电脑 深空灰 套装', 'AMD Ryzen 5 5500U/Windows 11 家庭中文版/14.0英寸/8G/256G SSD/集成显卡/深空灰+联想小新蓝牙鼠标（黑白随机发货）', 3039.00, 'YIhoUWskVFSbWfHVWMQzxqI3y-1368.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (231, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 11 家庭中文版/14.0英寸/8G/256G SSD/集成显卡/银色+联想小新蓝牙鼠标（黑白随机发货）', 3439.00, '6NDbSU7symXOBlbqfbQwDZ1lT-3206.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (232, '联想 小新 Pro16 2022 标压锐龙版 16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/1T SSD/Radeon 680M高性能集成显卡/深空灰 定制款', 6299.00, 'MiGHoJwQm0UzUpY5eKV8xo7JE-9576.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (233, '联想 小新 Air15 2022酷睿版15.6英寸轻薄笔记本电脑 银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/集成显卡/皓月银', 4899.00, 'mYqRGexrUdFogQSgPcnBAX148-3790.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (234, '联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen 7 6800HS/Windows 11 家庭中文版/14英寸/16GB/1T SSD/Radeon 680M高性能集成显卡/深空灰 定制款', 5599.00, 'pGIlKrVwrhL4M7Z9gW9dCCwtQ-8048.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (235, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 10 家庭中文版/14.0英寸/16G/1T SSD/集成显卡/银色 升级款【win10/win11随机发货】', 4499.00, 'XdfCuzVdemNvj2qGDsEv4BImP-0940.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (236, '2021款 小新Air14 英特尔酷睿i5 14.0英寸全面屏轻薄笔记本 银色', '第11代英特尔酷睿i5-1155G7/Windows 10 家庭中文版/14.0英寸/16G/1T SSD/集成显卡/银色 升级款 +小新蓝牙鼠标（黑白随机发）【win10/win11随机发货】', 4539.00, 'u5dujZyln7c7RztzyDHGlnrcP-5655.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (237, '2021款 小新 Pro 16 锐龙版16.0英寸全面屏轻薄笔记本 深空灰', 'AMD Ryzen 7 5800H/Windows 11 家庭中文版/16.0英寸/16GB/1T SSD/Geforce RTX 3050 4G独显/深空灰 升级款', 6799.00, 'M6Q8Vsk3pwdrzWkiWDGBd9KWP-4441.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (238, '联想小新 Pro14 Intel EVO认证 14英寸轻薄笔记本电脑 皓月银', 'i7-12700H/Windows11家庭中文版/14英寸/16GB/1T SSD/集成显卡/皓月银 定制款', 6999.00, 'bgbUv7jvjstBs1oyUPBwuGpqT-0771.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (239, '联保定制 小新Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i9-12900H/Windows11家庭中文版/14英寸/16GB/1TB SSD/集成显卡/皓月银【全国联保升级款】', 6899.00, 'pxzZbhXBrjKKrAXkN2Xum0cW3-9875.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (240, '联想 小新 Air15 2022 酷睿版 15.6英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/15.6英寸/16GB/512G SSD/集成显卡/皓月银', 4799.00, 'RtxjpoA8WMZiacmflcazBVnnU-2387.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (241, '联想 小新Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i5-12500H/Windows11家庭中文版/14英寸/16GB/1T SSD/集成显卡/皓月银 定制款', 5999.00, 'vHkT5td2ahRX6Gx6yqdVjkkye-9909.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (242, '联想 小新 Air14 Plus 2022 酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/14.0英寸/16GB/1T SSD/集成显卡/皓月银  定制款', 5799.00, 'MC9zpDKqQz4UfmVVbtrdTUsbk-3523.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (243, '联想小新Pro14 2022标压酷睿版14英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔® 酷睿™ i9-12900H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 6299.00, 'ZVPPPTlQXXOSkwHU24SL6cam4-5590.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (244, '联想 小新 Air15 2022 酷睿版 15.6英寸轻薄笔记本电脑 皓月银', '第12代智能英特尔  酷睿 i5-1240P/Windows 11 家庭中文版/15.6英寸/16GB/1T SSD/集成显卡/皓月银  定制款', 5499.00, 'mYqRGexrUdFogQSgPcnBAX148-3790.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (245, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/1T SSD/RTX 3050 Ti 4G独显/深空灰 定制款', 8399.00, 'Un1cC6cNRArkO1aVeWMU0N2Cy-6315.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (246, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/RTX 3050 Ti 4G独显/深空灰', 7599.00, 'SymVsfCJpc0OPzygFLXXSH9Av-0638.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (247, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/RTX 3050 Ti 4G独显/深空灰', 7799.00, 'XqMM6vyzNayCVSCzoNFP1TbsJ-6523.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (248, '联想 小新 Pro16 2022标压锐龙版16英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen R7 6800H/Windows11家庭中文版/16.0英寸/16G/512G SSD/RTX 3050 4G独显/深空灰', 7299.00, 'XqMM6vyzNayCVSCzoNFP1TbsJ-6523.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (249, '联想 小新Air14Plus 2022标压锐龙版14英寸轻薄笔记本电脑 深空灰', 'AMD Ryzen5 6600HS/Windows 11 家庭中文版/14英寸/16G/1T SSD/Radeon 660M高性能集成显卡/深空灰 定制款', 5099.00, '2ySYuxHHJHATEASKfoRBlWfv3-0647.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (250, '【只换不修套餐】联想小新Pro14 标压酷睿版14英寸电脑 皓月银', '第12代智能英特尔® 酷睿™ i9-12900H/Windows11家庭中文版/14英寸/16GB/512GB SSD/集成显卡/皓月银', 6199.00, 'vvgh5Zk19MBFMD9qdfeyDlMWB-2272.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (251, '联想(Lenovo)拯救者Y9000X 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™ i5-12500H/Windows11家庭中文版/16.0英寸/16G/512G SSD/GeForce RTX™ 3060 6G独显/钛晶灰', 8799.00, 'QJTra9H7Bmbp2IRWscs3CNjql-3356.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (252, '联保定制 联想拯救者Y9000X 2022 16英寸游戏笔记本电脑 钛晶灰', '第12代智能英特尔®酷睿™ i5-12500H/Windows11家庭中文版/16.0英寸/16G/512G+1T SSD/GeForce RTX™ 3060 6G独显/钛晶灰 【全国联保升级款】', 9599.00, 'cjQVsIkp74sns04rVdckd6X1e-4258.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (253, '联想 小新Air14 Touch锐龙触屏版14英寸轻薄笔记本电脑 银', 'AMD Ryzen 5 5500U/Windows 11 家庭中文版/14英寸/触屏版/16GB/512GB SSD/集成显卡/银', 4299.00, 'chOyCpQ01XhA54l4GTaOuKNyC-4194.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (254, '2021款 小新 Pro14英特尔Evo平台 14.0英寸超轻薄笔记本电脑 亮银', '第11代英特尔酷睿i5-11300H/Windows 10 家庭中文版/14.0英寸/16GB/512G SSD/集成显卡/亮银', 4999.00, 'wIEUVQHSBG7Dx7XnJRTaUIeMn-8849.w520.jpg', 15, '轻薄本');
INSERT INTO `commodity` VALUES (255, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3060Ti  LHR/Windows 11 家庭中文版/16GB/DDR5/512GB SSD/黑色', 9199.00, 'OGBU4a61wNBC1MO60UJBN2mg9-0434.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (256, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/RTX 3060Ti LHR 8GB/Windows 11 家庭中文版/16GB/DDR5/512GB SSD/黑色', 8399.00, 'VMNiD1hw3C0fSlmC3Gj9QaIrC-3300.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (257, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400/i5-12400F/RTX 3060 LHR 12GB/Windows 11 家庭中文版/16GB(8GBx2)DDR5/512GB SSD/黑色', 6999.00, '7WbbvWoz9ioEEvPfu2NrnKBir-0193.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (258, '拯救者 刃7000K 2023 13代英特尔酷睿i5 分体台式机 黑色', '13代英特尔酷睿i5-13600K(F)/RTX3060 Ti 8G/Windows 11 家庭中文版/16G/512G/黑色', 9299.00, 'Fdi86NSZFAiDsvsQwT9GXfaBS-4494.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (259, '拯救者 刃9000K 2023 13代英特尔酷睿i7 分体台式机 黑色', '13代英特尔酷睿i7-13700K(F)/RTX 3080 10G/Windows 11 家庭中文版/32G/1T/黑色', 15999.00, 'SdVvMdmbD7ozOLJwhstcv1uiF-0621.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (260, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3060Ti  LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/1T SSD/黑色', 10498.00, 'nB4pUCFqhxk6LRSFhBWugQ5En-1320.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (261, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K-KF/RTX 3080 LHR 10GB/Windows 11 家庭中文版/32GB/1TB SSD/黑色', 15999.00, 'kDwlcbWsYgq4YQSnBV8GfQn6A-5717.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (262, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/Windows 11 家庭中文版/16GB/DDR5/512GB SSD/RTX 3070 LHR 8GB/黑色', 10299.00, 'KxwcuE6bKtH9dAJD9mdh5hDNO-6097.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (263, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3070 LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/1T  SSD/黑色', 11598.00, '4EROymS4bX7O0gk3HOvkx9Bj8-2314.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (264, '【定制款】拯救者 刃7000K 2022分体台式机黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3060Ti  LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/512GB SSD/黑色', 10098.00, '7XyHY4lrpqty5lIVdUiwdS23y-0416.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (265, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3070 LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/512GB SSD/黑色', 11198.00, 'wdueUn7FMXcixS3uuvAYa3C83-7083.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (266, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K-KF/RTX 3070 LHR 8GB/Windows 11 家庭中文版/32GB/1TB SSD/黑色', 17999.00, '2mYmK8fkkf9Htpq3a5kBY7o1K-5164.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (267, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400/i5-12400F/RTX 3060 LHR 12GB/Windows 11 家庭中文版/16GB(8GBx2)DDR5/1T SSD/黑色', 7548.00, 'vjDpYa4xIVIEeylEs2xC7bRpV-8259.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (268, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K-KF/RTX 3080Ti 12GB/Windows 11 家庭中文版/64GB/2TB SSD/黑色', 24999.00, 'LsXBCk7YbOJmw7WVG9cAg0AvT-1624.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (269, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/RTX3060 LHR 12GB/Windows 11 家庭中文版/16G/ 512G SSD/黑色', 6999.00, 'n8eIsRVb5IHmQgeoWtzfqvHkc-1332.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (270, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K-KF/RTX 3080Ti 12GB/Windows 11 家庭中文版/64GB/2TB SSD/黑色', 24999.00, 'PniaQqjmRSzPIRIXwWsJSJcoN-7432.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (271, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3070 LHR 8GB/Windows 11 家庭中文版/16GB/DDR5/1T SSD/黑色', 10848.00, 'XakysphSMHSzpvSNAsJSb0AB7-0563.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (272, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/RTX 3060Ti  LHR 8GB/Windows 11 家庭中文版/16GB/DDR5/1T SSD/黑色', 9748.00, '4T9ZtPXOHIsRa7GGBPBLEFYSL-0772.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (273, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/RTX 3060Ti LHR 8GB/Windows 11 家庭中文版/16GB/DDR5/1TB SSD/黑色', 8948.00, '2UcYJ1ntJ7SmLmscvCz6d3hgy-6197.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (274, '拯救者 刃9000K 2023 13代英特尔酷睿i9 分体台式机 黑色', '13代英特尔酷睿i9-13900K(F)/RTX 4090 24G/Windows 11 家庭中文版/64G/2T/黑色', 29999.00, 'H7SetUETaxFmwU2h20MtRkHEG-4688.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (275, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400/i5-12400F/RTX 3060 LHR 12GB/Windows 11 家庭中文版/32GB DDR5/1T SSD/黑色', 8298.00, 'h47nuGemvzw7uWNubDYhtXMO6-3622.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (276, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/Windows 10 家庭中文版/16GB(8GBx2)/1TB SSD/RTX 3070Ti LHR 8GB/黑色', 9999.00, 'imPd7rfnsJbCJNZWgC9S6vJxR-5018.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (277, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/RTX 3060Ti LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/1TB SSD/黑色', 9698.00, '6OgfdAOcQHNRPnyWilVrXcHYq-5526.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (278, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400/i5-12400F/Windows 11 家庭中文版/16GB(8GBx2)DDR5/512GB SSD/RTX 3060 LHR 12GB/黑色', 6999.00, 'SWsEKWTZVGG6VfgfVRift761R-9196.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (279, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/Windows 11 家庭中文版/16G/ 512G SSD/RTX3060 LHR 12GB/黑色', 7499.00, 'bqvqFsyM8IoThxGE8ACXPAb97-2689.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (280, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/Windows 10 家庭中文版/16GB(8GBx2)/512GB SSD/RTX 3060 12GB/黑色', 7399.00, 'VnlviG5RR7ba802H2h59bf5nA-7619.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (281, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K/i7-12700KF/Windows 11 家庭中文版/32GB/1TB SSD/RTX 3080 LHR 10GB/黑色', 15999.00, 'ovWYrBtOmUsKggXRvt66DaOAk-8134.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (282, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400F/i5-12400/Windows 11家庭中文版/16G/ DDR5/ 512G SSD/RTX3060 LHR 12G /黑色', 6999.00, 'giOFv5HKj8iuLCoLWeDCNS3PC-4286.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (283, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K/i7-12700KF/Windows 11 家庭中文版/16GB/DDR5/1TB SSD/RTX 3070 Ti 8GB/黑色', 12999.00, 'DvP73JF1RhKlldWnYizsHuDSr-6749.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (284, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/RTX 3060Ti LHR 8GB/Windows 11 家庭中文版/16GB/512GB SSD/黑色', 8099.00, 'faqFBzfz1pTQNAy3sbgVnbKeK-5012.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (285, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_9_5950X/Windows 10 家庭中文版/64GB(16GBx4)/2TB HDD+1TB SSD/RX 6900XT 16GB/黑色', 19999.00, 'BC1ju1aFsrSGmV47Rqwp7zI3n-1145.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (286, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K/i7-12700KF/Windows 11 家庭中文版/16GB/1T SSD/RTX 3070Ti 8GB/黑色', 12899.00, 'Sj9CJvBX6bGDzmgiTUewAY633-3684.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (287, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K/i7-12700KF/Windows 11 家庭中文版/16GB/1TB SSD/RTX 3070Ti 8GB/黑色', 12899.00, 'yDF2bL43RaZ5geq1ljpqssm3X-3558.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (288, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K/i9-12900KF/Windows 11 家庭中文版/32GB/DDR5/1TB SSD/RTX 3070 LHR 8GB/黑色', 15999.00, '4K2uOhil5bP6uzFIhCE16NSfJ-8001.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (289, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400F/i5-12400/Windows 11家庭中文版/16G/ DDR5/ 512G SSD/RTX3060 LHR 12G /黑色', 7199.00, 'giOFv5HKj8iuLCoLWeDCNS3PC-4286.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (290, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_9_5950X/Windows 11 家庭中文版/64GB(16GBx4)/2TB HDD+1TB SSD/RX 6900XT 16GB/黑色', 17999.00, '4ekM3Qioo5fBPLjXp8BV4chGd-2407.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (291, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K-KF/RTX3060 Ti LHR 8G /Windows 11家庭中文版/16G(16Gx1) DDR5/ 512G SSD/黑色', 8399.00, 'If16nXYnAsw87mYEBUsYQmM03-2652.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (292, '拯救者 刃9000K 2022 12代英特尔酷睿i7 分体台式机 黑色', '12代英特尔酷睿i7-12700K/i7-12700KF/Windows 11 家庭中文版/32GB/1TB SSD/RTX 3080 LHR 10GB/黑色', 15999.00, 'OgrlnROadUJGMVwKh6oxLnDbK-5165.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (293, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i7-12700/i7-12700F/Windows 11家庭中文版/16G/ DDR5/ 512G SSD/RTX3070  LHR 8G /黑色', 10499.00, 'yPnkms5O8B8J2trHxkCpr03fm-2482.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (294, '拯救者 刃9000K 2020 英特尔酷睿i7 分体台式机 黑色', '十代英特尔酷睿i7-10700K/i7-10700KF/Windows 10 家庭中文版/16G/512GB SSD+2TB HDD/RTX3080 10GB/黑色', 13999.00, 'nYeeqYeiJF2lXsinfzkv7nvXm-6114.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (295, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/RTX 3070 LHR 8GB/Windows 11 家庭中文版/16GB(8GBx2)/512GB SSD/黑色', 8999.00, 'Vl3jTmqWCuFGe9WooKjES6MY6-5490.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (296, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/Windows 11 家庭中文版/16GB/DDR5/512GB SSD/RTX 3060Ti LHR 8GB/黑色', 8299.00, '8wKd54FvdqOWO88xQV7P0UyLk-5913.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (297, '拯救者 刃7000P-26AMR 分体式游戏主机', 'RYZEN_7_5800/Windows 10 家庭中文版/16G(8Gx2）/ 512G SSD/RTX3070 8GB/黑色', 9499.00, 'hg9fBNBfNxZ2mJtikwMkcW376-4846.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (298, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K/i9-12900KF/Windows 11 家庭中文版/64GB/2TB SSD/RTX 3080Ti 12GB/黑色', 24999.00, 'lJcXbVeMZpMYJ1U37qysnj2IL-1441.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (299, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/RTX 3060Ti LHR 8GB/Windows 11 家庭中文版/32GB/DDR5/512GB SSD/黑色', 9298.00, 'GKpJERXM7ydviTDSKLYrfzzDt-8401.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (300, '【定制款】拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12400/i5-12400F/RTX 3060 LHR 12GB/Windows 11 家庭中文版/32GB DDR5/512GB SSD/黑色', 7898.00, 'hjEONfy7kgw9fDfyPiTI0ykqk-9183.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (301, '拯救者 刃7000K 2022分体台式机 黑色', '12代英特尔酷睿i5-12600K/i5-12600KF/Windows 11家庭中文版/16G(8Gx2) DDR5/ 512G SSD/RTX3060 LHR 12G /黑色', 7699.00, 'kxeVavhQS8xaP9Jy4GlmvYz69-8256.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (302, '拯救者 刃9000K 2022 12代英特尔酷睿i9 分体台式机 黑色', '12代英特尔酷睿i9-12900K/i9-12900KF/Windows 11 家庭中文版/32GB/1TB SSD/RTX 3070 LHR 8GB/黑色', 15999.00, '8kF0HHfIuQthBU52f3Y0Q9xhE-7087.w520.jpg', 15, '台式机');
INSERT INTO `commodity` VALUES (303, 'ThinkPad 小黑双模鼠标 午夜黑', '无线蓝牙双模鼠标，三档可调，蓝光定位，长效续航，稳定链接', 149.00, 'a838NB3g08IskbFHGMXXu5Vuo-0335.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (304, 'ThinkPad 小黑双模鼠标 石墨黑', '', 99.00, '1bCCISYx57agtPDXC52EtUcdt-6955.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (305, '联想小新蓝牙鼠标深色静音版', '联想小新蓝牙静音鼠标', 49.00, '7WVOjglsnLwWSE1jgxTLj42jz-8403.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (306, '拯救者C135W氮化镓适配器 幻影黑', '135W峰值输出、自带双1.5m线材、体积小巧、多品牌兼容', 199.00, 'ew3cQeio29sgaXHqLvRDZl2VE-4026.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (307, '联想小新蓝牙静音鼠标 雾白', '联想小新蓝牙静音鼠标', 49.00, 'hGqXIfsv29iKPwDa6tWIFKhPJ-8857.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (308, 'thinkplus 有线鼠标 M80 商务办公游戏通用鼠标', '', 16.90, 't3mnb46cL4hDkTT08k94MywrR-0371.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (309, '小新蓝牙无线鼠标Plus 暮霭深灰', '轻音按键、内置锂电USB-C接口充电、4挡可调DPI', 59.00, 'GLJZB84x4huH8U1zOpRbZRWj4-9747.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (310, '小新蓝牙无线鼠标Plus 月慕白', '轻音按键、内置锂电USB-C接口充电、4挡可调DPI', 59.00, 'wafZBeXFEOQhZiUIRbdQ9fGx2-7544.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (311, '拯救者散热支架Z3', '', 99.00, 'u2tWTW9SY4ekuDdXwqGXCLvKq-6142.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (312, '联想智能语音鼠标 好小橙 好困蓝', '', 99.90, 'aDUQy9AWRqbXVrqmdfkWGfIgh-2483.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (313, '【企业购】ThinkPad 小黑双模鼠标 石墨黑', '无线蓝牙双模，稳定链接，定位精准，四色可选', 149.00, '5wIB1a8EHhsiyMWONDPzBPoQd-0173.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (314, 'ThinkPad 小黑双模鼠标 陨石银', '', 99.00, 'GPdaRVy9rVFGqi5E37u9DljKl-4023.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (315, '小新蓝牙无线鼠标Plus 天青蓝', '轻音按键、内置锂电USB-C接口充电、4挡可调DPI', 59.00, 'BbcWlxPl2aev5oyHbEwDQVzUw-7115.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (316, '联想无线静音鼠标N911 Pro 黑色（送电脑远程调修服务）', '静音按键，经久耐用，超300万次点击，免开关，自动省电休眠，侧裙/底部防滑设计，人体工学，饱满曲线，舒适质感，一键触发人工服务。', 39.00, 'FDBKYgZIGByc3Bdr9qYUj2j78-1978.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (317, '联想一键服务机械键盘K104 黑色 红轴', '机械混彩背光 定制机械霓虹灯效 全键无冲', 129.00, 'AODryXEQ9pK2FxRDEK9VcS6Hi-2264.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (318, '小新折叠散热支架X2', '', 49.00, 'mpZXl3lfbmAjvM61AJu5GivIZ-9789.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (319, '联想一键服务机械键盘K104 黑色 青轴', '机械混彩背光 定制机械霓虹灯效 全键无冲', 129.00, 'ZWzA2rsP66X4ahg93BpZHoBfk-6171.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (320, '拯救者 M500 无线游戏鼠标-冰魄白', '', 109.00, 'LT5i7RK2tlfASXWMfM0jk4Gge-7869.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (321, '联想便捷笔记本支架X10 Pro', '', 79.00, 'lLoRskBJoa2iuB7WBqBZaxm17-6056.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (322, 'ThinkPad 小黑双模鼠标 魅力红', '', 99.00, 'RukE2Oq1QKjZZqecKbquu1pVu-6233.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (323, '【企业购】thinkplus 口红电源 Young 65W 有线版', '联想thinkplus 原装Type-c 65W 口红电源 有线充电套装手机/平板/笔记本便携适配器  1.5米 数据线黑色', 129.00, 'yXtIHhyNVnrEgcb9q5herFndi-9538.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (324, '拯救者 M500 无线游戏鼠标-幻影黑', '', 109.00, '8cttwBIaJdN4wmEEocpdHN8KQ-7423.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (325, '拯救者C135W氮化镓适配器 幻影黑', '135W峰值输出、自带双1.5m线材、体积小巧、多品牌兼容', 189.00, 'D9QNHQc8db2pqNAuxjA9LI0ar-6274.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (326, '联想大红点M120 Pro无线鼠标', '经典舒适 时尚纤薄 光学引擎 坚固线缆', 29.90, 'nUQD6NhnvEd6Ao9AWIGU57C1a-4487.w520.png', 15, '周边');
INSERT INTO `commodity` VALUES (327, '联想大红点M120 Pro有线鼠标', '时尚纤薄 手感舒适 防滑耐磨 全新喷漆技术', 19.90, 'zP9sdv8OkdCZStViEDCAJQclD-6722.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (328, 'thinkplus 65W USB-C电源转接线 黑', '', 59.00, 'r1x4ZFYni6TPNplasbNlRm27e-8700.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (329, 'ThinkPad创作者鼠标', '', 259.00, 'lRZ67RUuEWYBoVhADiVETS0r6-2394.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (330, '拯救者M600鼠标', 'RGB无线游戏鼠标  轻质便携 吃鸡鼠标', 199.00, '4LHj8ITogXc9yu0WLAtKvIh7T-2820.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (331, '拯救者电竞鼠标垫 Speed Max C款', '表面顺滑 精细热转印 加厚设计 底部防滑', 49.00, 'O3N6FYtH2oVCnG9qpUmB42htm-3884.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (332, '小新铝合金增高悬空散热折叠支架 Z1', '', 149.00, '03IdXHzxc1Kz9JkbtJD5b4duo-0468.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (333, 'ThinkPad小红点蓝牙无线双模键盘', '办公搭档，高效稳定', 699.00, '0YgW2D4uqTYy6PMrRW3PIhY2Q-2957.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (334, '联想小新Air Handle静音无线鼠标白色', '蓝光技术  DPI高达 4000 静音无线 简约时尚 双色可选', 44.90, 'h9BwawHnaJjVyxwsRxNjhMhZu-2596.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (335, '【企业购】thinkplus 65W USB-C电源转接线 黑', '', 59.00, 'r1x4ZFYni6TPNplasbNlRm27e-8700.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (336, '【企业购】thinkplus 口红电源 Young 65W 无线版', '联想thinkplus 原装Type-c 65W 口红电源 充电器手机/平板/笔记本便携充电器 无线 黑色', 129.00, 'ea5jyQpKIjFxwG2rDdkTwSlxs-7078.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (337, '联想多彩机械键盘K310-标配白', '108键全键无冲；23种灯效任意切换；磁吸上盖，轻松换装，百变键帽配色；白色背光、PBT键帽，告别油腻；机械青轴，还原原始的打字手感；多媒体快捷按键。送：电脑远程调修服务', 349.00, 'Pma9LulkgEoeFz3gojbeBd6KL-5758.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (338, 'thinkplus 便携蓝牙鼠标', '', 99.00, 'ZJ8Srau00Hsi2MQ7QsUYwn3Ey-1596.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (339, '拯救者散热支架Z3', '', 109.00, 'tKKOGtU9I0Voqi6nnjh6kJjBo-8988.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (340, '联想USB分线器 U03千兆有线网卡 RJ45网口转换器', '支持笔记本电脑网线口拓展HUB延长线 USB分线', 88.00, '54Hs6UjyS87A3U3yh7mbfTLPF-0648.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (341, '联想KN101无线键鼠套装', '全尺寸键盘 人体工学 坚固耐用 10m范围无线传输', 59.90, 'h7U0cvGNIrtw7cw41BEPi9VvS-6601.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (342, '联想无线光学鼠标M26', '无线连接，人体工学设计，握感舒适，先进光学追踪技术', 49.00, 'MZlcxgLkTgPa4OwTJOQiNBl4P-8834.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (343, '联想网红双料鼠标垫MM22 朗姆灰', '800x400mm大尺寸，皮革质感，防水耐脏，天然软木，柔软防滑，双料结构，打造格调桌面', 49.00, '0WdYBcznDyrv07sv7mBeeuR7p-3989.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (344, 'thinkplus口红电源 GaN Nano 65W', '口红电源 第三代 氮化镓 USB-C迷你适配器 电脑/手机/平板通用', 399.00, '2CWd8wS4szcNlgx3U5gWwOLXC-8168.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (345, '联想笔记本9合1清洁套装J9', '清洁9件套 多功能纳米清洁套装 强效去污 安全配方 有效抑菌', 49.90, '9RmQi8ACcO6IN7wS3BWVqNeXV-5441.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (346, '【企业购】thinkplusM80 无线鼠标', '', 35.00, 'y58cA6EaTBFIWOOR0kwEOjqpT-6389.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (347, '联想一键服务鼠标M25 黑色 无线版', '无线连接，安静按键，长久续航，简约便携，舒适握感，一键呼叫工程师', 39.00, '7jdWG01ICOBqAqCik3zEIz0gU-6699.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (348, '联想一键服务鼠标M24', '无线连接，按键静音，人体工学，手感舒适，侧边快捷键，一键呼叫工程师', 40.00, 'Tz90Yu7i627de7lAT8qmpbCQB-7864.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (349, '联想Type-C转USB-A转换器 4*USB3.0接口分线器 C04Hub集线器', '铝合金材质  高速传输 4口同时使用 多系统兼容', 69.00, 'jHWYhSpvAhHW0CeKqhx5u7JNT-5000.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (350, '联想小新Air Handle静音无线鼠标黑色', '蓝光技术  DPI高达 4000 静音无线 简约时尚 双色可选', 44.90, 'eUF9BI0xv1RyABbFD4VHdneeL-6506.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (351, '联想多彩机械键盘K310-标配黑', '108键全键无冲；23种灯效任意切换；磁吸上盖，轻松换装，百变键帽配色；白色背光、PBT键帽，告别油腻；机械青轴，还原原始的打字手感；多媒体快捷按键。送：电脑远程调修服务', 349.00, 'LLG3I6XMKEw45wa7VpyET8kuG-4417.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (352, '联想USB-C集线器F1-C03 Type-C转千兆网口转USB铝合金材质', '即插即用 稳定传输  千兆网口 多系统兼容', 99.00, 'N89u5GqnRjKkpTIPaKihpGSRH-0711.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (353, 'thinkplus 口红电源 Young 65W 有线版', '联想thinkplus 原装Type-c 65W 口红电源 有线充电套装手机/平板/笔记本便携适配器  1.5米 数据线黑色', 99.00, 'RbSLFhl3Aj5ziuFvlrPSOPHkr-7829.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (354, '联想小新Air2双模鼠标-冰河银', '【无线蓝光】 全金属表层 无线切割 便携办公 台式机笔记本鼠标', 84.90, 'UH2ioct541yvkyNN3p2aWc12Z-3516.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (355, '联想Howard蓝牙无线双模鼠标理性黑', '蓝牙+无线 多段式DPI设计  舒适握感 智能休眠 双色可选', 59.90, 'wz4v3h38oG1USBpFEx9wO0C7x-3720.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (356, '联想U04分线器 USB3.0一拖四多接口 HUB扩展 深灰色', '铝合金材质 高速扩展 笔记本台式电脑4口集线器USB延长线', 59.00, 'vl7X4JwJx3T5DuIx5wddLbI63-9645.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (357, '联想有线键鼠套装MK618（送电脑远程调修服务）', '纤薄键帽，人体工学设计', 59.00, 'GMOI96rdhJjIP5r3873jvZ5Of-7695.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (358, '联想Howard蓝牙无线双模鼠标理性白', '蓝牙+无线 多段式DPI设计  舒适握感 智能休眠 双色可选', 59.90, '1wrR07J55CLtr4pQWwBE7QUpu-8273.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (359, '联想 Yoga CC130 双口GaN适配器 白色', '双C口 多设备兼容 白色 含1.5米+1米双数据线', 219.00, 'D7P1ZfW5mtJk8KFMPctZgLloo-6849.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (360, '拯救者 K7 机械键盘 幻影黑', '无线+蓝牙+有线三模连接、Win+Mac双系统支持、RGB背光灯效', 599.00, 'SI4Y9k8NaYGnyXXIAE7N5dc8L-2844.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (361, '拯救者电竞鼠标垫 Speed Max B款', '', 49.00, 'yQDba9tvMzhnxsPULoHVomG4W-2103.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (362, '联想一键服务机械键盘K104 黑色红轴+N911 pro鼠标黑色', '机械混彩背光 定制机械霓虹灯效 全键无冲', 398.00, 'BWWQC1HL1Cl4IvqiocSS8KWym-7843.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (363, '联想大红点M120Pro无线键鼠套装', '家用办公台式机笔记本电脑通用 无线轻薄 双色可选', 99.90, 'TFZk4dFTw95uPMcV0p8OmsjFT-9647.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (364, '拯救者 M7无线游戏鼠标 冰魄白', '轻量化设计、双模滚轮、3模连接、双区RGB灯光', 249.00, 'L6nU7Z2S2bycLVKzWlapU1iew-0572.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (365, '联想Air Handle静音无线鼠标 风暴灰 2022款', '时尚办公，轻音小巧，无线便携', 47.90, '5CzZMLj6Dp9wFeTflitaHDRkg-0773.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (366, '联想一键服务鼠标M25 白色 无线版', '无线连接，安静按键，长久续航，简约便携，舒适握感，一键呼叫工程师', 39.00, '9g2zDToM6pVG9PKPbwwaQACUq-5527.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (367, '联想Howard蓝牙无线双模鼠标 理性黑 2022款-充电版', '', 59.90, 'YzJPnkGmSvsEQVSPxFJPZz1kD-1799.w520.png', 15, '周边');
INSERT INTO `commodity` VALUES (368, '拯救者电脑贴膜 Y9000P 2022 星空款', '', 49.00, 'd43LEbNoIduxIwooHwB9s1uSl-5233.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (369, '联想KM4800有线键鼠套装 磨砂版', '', 56.90, '3TuhWXFGSB8kpZV4MxovMI4ie-1738.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (370, '联想HEADSHOT游戏鼠标', '', 89.90, 'yUKTROIzzR8UJQ6Kl0tNCzSNm-0216.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (371, '小新USB-C 五合一多功能扩展坞 灰色', '小新USB-C 五合一多功能扩展坞 灰色', 99.00, 'HOzlPvpl3CcGxgD64ATzK62hz-8995.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (372, '联想笔记本散热器S20 Pro', '', 139.00, 'cKKikarfe4UvrsFLWAoW7SM2P-4811.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (373, '联想一键服务无线键鼠套装MK22', '104标准全尺寸键位，无线连接，轻薄设计，加宽掌托', 75.00, 'V9tzxba2hopefbZN6TZ4BKFt3-4172.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (374, '联想小新Air2双模鼠标-星空灰', '金属上盖 无线蓝牙双模链接 蓝光技术 4000DPI  双色可选', 84.90, 'pp14Gxilkc6LoBImlPOVjHt0m-9829.w520.jpg', 15, '周边');
INSERT INTO `commodity` VALUES (375, 'ssfggf', 'kklllk', 4.00, NULL, 0, 'jkk');
INSERT INTO `commodity` VALUES (376, 'ssfggf', 'kklllk', 4.00, NULL, 0, 'jkk');
INSERT INTO `commodity` VALUES (377, 'ssfggf', 'kklllk', 4.00, '(pid-3216393)蒼の碧落.jpg', 0, 'jkk');
INSERT INTO `commodity` VALUES (378, 'RTX 9990 R19990P', '高端游戏本', 12.00, '0WpudHMrKmp14xFSWH6xbYXWw-4269.jpg', 0, '拯救者');
INSERT INTO `commodity` VALUES (379, 'ss', 'rrrr', 12.00, '(⊙o⊙).jpg', 0, 'rrr');
INSERT INTO `commodity` VALUES (380, 'ss', '1', 1.00, '(pid-9683698)鳳凰の娘.jpg', 0, '1');
INSERT INTO `commodity` VALUES (381, 'ss', '1', 1.00, '(pid-18433791)桜河（オウガ）.png', 0, '1');
INSERT INTO `commodity` VALUES (382, 'ss', '1', 1.00, '(pid-18433791)桜河（オウガ）.png', 0, '1');
INSERT INTO `commodity` VALUES (383, 'ss', '1', 1.00, '(pid-18433791)桜河（オウガ）.png', 0, '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NOT NULL,
  `userPwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_zh_0900_as_cs NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_zh_0900_as_cs ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, '1', '22', 'erre12');
INSERT INTO `user` VALUES (15, '2', '3', 'errererer');
INSERT INTO `user` VALUES (17, '11', '1', 'dddddd');
INSERT INTO `user` VALUES (18, '111', '1', 'ssssss');

SET FOREIGN_KEY_CHECKS = 1;
