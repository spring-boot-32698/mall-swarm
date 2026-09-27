/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 11/05/2023 15:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `read_count` int(1) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Help table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Category icon',
  `help_count` int(11) NULL DEFAULT NULL COMMENT 'Topic count',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Help category table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `report_type` int(1) NULL DEFAULT NULL COMMENT 'Report type:0->Product reviews;1->Topic content;2->User reviews',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Reporter',
  `create_time` datetime NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_status` int(1) NULL DEFAULT NULL COMMENT 'Report status:0->Unhandled;1->Handled',
  `handle_status` int(1) NULL DEFAULT NULL COMMENT 'Handling result:0->Invalid;1->Valid;2->Malicious',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'User report table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT 'Display image',
  `sort` int(11) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Preferred zone' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, 'Make the sound quality stand out', 'No compromise on sound quality, perfect live feel', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, 'Make the sound quality stand out 22', 'Make the sound quality stand out 22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, 'Make the sound quality stand out 33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, 'Make the sound quality stand out 44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between preferred zones and products' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Topic main image',
  `product_count` int(11) NULL DEFAULT NULL COMMENT 'Associated product count',
  `recommend_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `collect_count` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Album images separated by commas',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL COMMENT 'Display status:0->Not displayed;1->Show',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(11) NULL DEFAULT NULL COMMENT 'Forward count',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Topic category name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, 'polo Shirts are stylish too', NULL, NULL, NULL, '2018-11-11 13:26:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Clothing topic');
INSERT INTO `cms_subject` VALUES (2, 2, 'Big-brand phones at low prices', NULL, NULL, NULL, '2018-11-12 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Phone topic');
INSERT INTO `cms_subject` VALUES (3, 2, 'Snapdragon 845 new launch', NULL, NULL, NULL, '2018-11-13 13:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Phone topic');
INSERT INTO `cms_subject` VALUES (4, 1, 'What to wear in summer', NULL, NULL, NULL, '2018-11-01 13:27:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Clothing topic');
INSERT INTO `cms_subject` VALUES (5, 1, 'Summer picks', NULL, NULL, NULL, '2018-11-06 13:27:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Clothing topic');
INSERT INTO `cms_subject` VALUES (6, 2, 'Brand phone price cuts', NULL, NULL, NULL, '2018-11-07 13:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Phone topic');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Category icon',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT 'Topic count',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic category table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, 'Clothing topic', NULL, NULL, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (2, 'Phone topic', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic comment table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic-product relation table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_subject_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_subject_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_subject_product_relation` VALUES (29, 1, 23);
INSERT INTO `cms_subject_product_relation` VALUES (30, 4, 23);
INSERT INTO `cms_subject_product_relation` VALUES (31, 5, 23);
INSERT INTO `cms_subject_product_relation` VALUES (68, 2, 26);
INSERT INTO `cms_subject_product_relation` VALUES (69, 3, 26);
INSERT INTO `cms_subject_product_relation` VALUES (70, 6, 26);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `attend_count` int(11) NULL DEFAULT NULL COMMENT 'Participants',
  `attention_count` int(11) NULL DEFAULT NULL COMMENT 'Follower count',
  `read_count` int(11) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Prize name',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'How to participate',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Topic content',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Category icon',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT 'Topic count',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic category table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Topic comment table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_sku_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT 'Purchase quantity',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Price when added to cart',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product main image',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product name',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product subtitle (selling point)',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product SKU barcode',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Member nickname',
  `create_date` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `modify_date` datetime NULL DEFAULT NULL COMMENT 'Modification time',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT 'Whether deleted',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT 'Product category',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product sales attributes:[{\"key\":\"Color\",\"value\":\"Color\"},{\"key\":\"Capacity\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Shopping cart table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, NULL, 'Huawei HUAWEI P20', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, NULL, 'Xiaomi 8', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 1, 649.00, NULL, 'Redmi 5A', '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 1, 699.00, NULL, 'Redmi 5A', '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 1, 5499.00, NULL, 'Apple iPhone 8 Plus', '[Limited-time Limited-quantity Sale] Apple Mid-year Carnival, enjoy great products, beauty in wisdom! Hurry to >> Check[Guarantee services][2-year original manufacturer warranty], get the AppleCare+ comprehensive service plan, original extended warranty for worry-free after-sales.', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (19, 36, 163, 1, 3, 100.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', '202002210036001', 'windir', '2020-02-25 15:51:59', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `oms_cart_item` VALUES (20, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', '202002210036001', 'windir', '2020-02-25 15:54:23', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `oms_cart_item` VALUES (21, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', '202002210036001', 'windir', '2020-02-25 16:49:53', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `oms_cart_item` VALUES (22, 26, 110, 1, 3, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-04 15:34:24', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (23, 27, 98, 1, 7, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-04 15:35:43', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (24, 26, 110, 1, 4, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-04 16:58:17', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (25, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-04 16:58:23', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (26, 28, 102, 1, 4, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '201808270028001', 'windir', '2020-05-04 16:58:26', NULL, 1, 19, 'Xiaomi', '7437789', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (27, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB Red Special Edition China Mobile/Unicom/Telecom 4G Phone', '[Limited-time Limited-quantity Sale] Apple Mid-year Carnival, enjoy great products, beauty in wisdom! Hurry to >> Check[Guarantee services][2-year original manufacturer warranty], get the AppleCare+ comprehensive service plan, original extended warranty for worry-free after-sales.', '201808270029001', 'windir', '2020-05-04 16:58:29', NULL, 1, 19, 'Apple', '7437799', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (28, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-04 17:07:20', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (29, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-04 17:07:23', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (30, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-04 17:08:14', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (31, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB Red Special Edition China Mobile/Unicom/Telecom 4G Phone', '[Limited-time Limited-quantity Sale] Apple Mid-year Carnival, enjoy great products, beauty in wisdom! Hurry to >> Check[Guarantee services][2-year original manufacturer warranty], get the AppleCare+ comprehensive service plan, original extended warranty for worry-free after-sales.', '201808270029001', 'windir', '2020-05-04 17:09:56', NULL, 1, 19, 'Apple', '7437799', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (32, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-04 17:13:50', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (33, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-04 17:16:15', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (34, 36, 164, 1, 1, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', '202002210036002', 'windir', '2020-05-04 17:19:20', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `oms_cart_item` VALUES (35, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-05 10:41:39', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (36, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-05 10:41:55', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (37, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-05 10:42:57', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (38, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-05 14:29:28', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (39, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-05 14:32:52', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (40, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-05 14:33:20', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (41, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-05 14:49:13', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (42, 26, 111, 1, 1, 3999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026002', 'windir', '2020-05-05 15:26:05', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (43, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '201808270028001', 'windir', '2020-05-16 15:16:04', NULL, 1, 19, 'Xiaomi', '7437789', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (44, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-16 15:18:00', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (45, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 15:00:16', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (46, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-17 15:00:22', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (47, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 15:14:14', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (48, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 15:20:03', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (49, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 15:21:54', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (50, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 16:07:22', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (51, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-17 16:07:26', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (52, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 19:33:36', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (53, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-17 19:33:39', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (54, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 19:39:07', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (55, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-17 19:41:26', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (56, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-18 16:50:00', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (57, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-18 20:22:04', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (58, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-18 20:22:08', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (59, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-23 16:21:13', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (60, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-05-23 17:01:28', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (61, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-24 09:36:50', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (62, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-05-24 09:44:39', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (63, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-06-07 17:01:48', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (64, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-06-14 15:24:40', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (65, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-06-21 14:27:13', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (66, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-06-21 15:12:14', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (67, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-06-21 15:12:53', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (68, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'windir', '2020-06-21 15:15:10', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (69, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2020-06-27 10:27:48', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (70, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', '201808270027001', 'windir', '2022-10-28 14:50:46', NULL, 1, 19, 'Xiaomi', '7437788', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (71, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Purple Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'windir', '2022-10-28 15:27:32', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (72, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'windir', '2022-11-09 15:14:46', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (73, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '202210280038001', 'windir', '2022-11-09 15:25:28', NULL, 1, 53, 'Apple', '100044025833', '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (74, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'windir', '2022-11-09 15:26:04', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (75, 45, 239, 1, 1, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB Iris Purple New Colorway Launch 80W Super Flash Charge 50MP Water-light Portrait Triple Camera 32MP Front Sony Lens 5G Phone', '[11.11 Early purchase with price protection, no need to wait for good deals, apply for price protection with one click to get the difference refunded!] [Reno8 Pro Hot Deals] ', '202211080045001', 'windir', '2022-11-09 16:16:23', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"Color\",\"value\":\"Iris Purple\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (76, 45, 239, 1, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB Iris Purple New Colorway Launch 80W Super Flash Charge 50MP Water-light Portrait Triple Camera 32MP Front Sony Lens 5G Phone', '[11.11 Early purchase with price protection, no need to wait for good deals, apply for price protection with one click to get the difference refunded!] [Reno8 Pro Hot Deals] ', '202211080045001', 'windir', '2022-11-09 16:18:36', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"Color\",\"value\":\"Iris Purple\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (77, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery Ink Feather 12GB+256GB 5G Smartphone Xiaomi Redmi', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'windir', '2022-11-10 15:19:36', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (78, 37, 201, 1, 2, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'windir', '2022-11-10 15:19:44', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (79, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '202210280038001', 'windir', '2022-11-11 15:37:40', NULL, 1, 53, 'Apple', '100044025833', '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (80, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '202210280038001', 'windir', '2022-11-11 15:38:12', NULL, 1, 53, 'Apple', '100044025833', '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (81, 38, 213, 1, 3, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '202210280038001', 'windir', '2022-11-11 15:38:22', NULL, 1, 53, 'Apple', '100044025833', '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (82, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'windir', '2022-11-11 16:07:23', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (83, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'windir', '2022-11-11 16:13:11', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (84, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'windir', '2022-11-11 16:15:05', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (85, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '201808270028001', 'windir', '2022-11-11 16:21:05', NULL, 1, 19, 'Xiaomi', '7437789', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (86, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'windir', '2022-11-16 10:22:47', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (87, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'windir', '2022-11-16 10:22:51', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (88, 39, 217, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', '[Double 11 Big Sale Is Coming] Up to 1000 off for selected models, up to 1000 yuan trade-in subsidy, post photos to win gifts', '202210280039001', 'windir', '2022-11-16 10:22:54', NULL, 1, 54, 'Xiaomi', '100023207945', '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (89, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'windir', '2022-11-16 10:23:16', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (90, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'test', '2022-12-21 15:49:00', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (91, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'test', '2022-12-21 15:49:42', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (92, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'test', '2022-12-21 15:49:53', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (93, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'test', '2022-12-21 15:51:03', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (94, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'test', '2022-12-21 15:51:28', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (95, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'test', '2022-12-21 16:45:16', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (96, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'test', '2022-12-21 16:46:41', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (97, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'test', '2022-12-21 16:50:10', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (98, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'test', '2022-12-23 09:55:11', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (99, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'test', '2023-01-10 15:39:03', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (100, 26, 111, 1, 1, 3899.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026002', 'test', '2023-01-10 16:58:08', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (101, 26, 110, 1, 1, 3699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '201806070026001', 'test', '2023-01-10 17:10:26', NULL, 1, 19, 'Huawei', '6946605', '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (102, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'member', '2023-05-11 15:24:33', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (103, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'member', '2023-05-11 15:24:37', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (104, 38, 213, 11, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022', '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '202210280038001', 'member', '2023-05-11 15:30:32', NULL, 1, 53, 'Apple', '100044025833', '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (105, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', '[Double 11 Big Sale Is Coming] Up to 1000 off for selected models, up to 1000 yuan trade-in subsidy, post photos to win gifts', '202210280039001', 'member', '2023-05-11 15:31:38', NULL, 1, 54, 'Xiaomi', '100023207945', '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (106, 44, 235, 11, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', 'Samsung (SAMSUNG) 500GB SSD Solid State Drive M.2 Interface(NVMe Protocol)', '[Full speed, no cache! Draw a 100-yuan E-card in store, some models with 3-installment interest-free] Combines speed and reliability! Read speed up to 3500MB/s, full power mode! Click ', '202211080044001', 'member', '2023-05-11 15:32:16', NULL, 1, 55, 'Samsung', '100018768480', '[{\"key\":\"Color\",\"value\":\"New arrival 980 |NVMe PCIe3.0*4\"},{\"key\":\"Version\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (107, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 Flat-screen Flagship Ultra-Light XMAGE Imaging BeiDou Satellite Messaging', '[Huawei Mate50 New Launch] Built-in 66W Huawei charging set, Ultra-Light XMAGE imaging,BeiDou satellite messaging, HarmonyOS 3.0! Buy now! Huawei sustainable new-product program, click here》 ', '202211040042001', 'member', '2023-05-11 15:32:44', NULL, 1, 19, 'Huawei', '100035295081', '[{\"key\":\"Color\",\"value\":\"Glossy Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (108, 37, 201, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '202210280037001', 'member', '2023-05-11 15:34:32', NULL, 1, 19, 'Apple', '100038005189', '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (109, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'member', '2023-05-11 15:35:02', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (110, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'member', '2023-05-11 15:35:21', NULL, 1, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (111, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'member', '2023-05-11 15:36:57', NULL, 1, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (112, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', '[Double 11 Big Sale Is Coming] Up to 1000 off for selected models, up to 1000 yuan trade-in subsidy, post photos to win gifts', '202210280039001', 'member', '2023-05-11 15:37:04', NULL, 1, 54, 'Xiaomi', '100023207945', '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (113, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '202211040040001', 'member', '2023-05-11 15:37:57', NULL, 0, 19, 'Xiaomi', '100027789721', '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (114, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '202211040041001', 'member', '2023-05-11 15:38:03', NULL, 0, 19, 'Xiaomi', '100035246702', '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Address name',
  `send_status` int(1) NULL DEFAULT NULL COMMENT 'Default shipping address:0->No;1->Yes',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT 'Whether default shipping address:0->No;1->Yes',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Sender/recipient name',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Recipient phone',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Province/Municipality',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'City',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'District',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Detailed address',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Company shipping/receiving address table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, 'Shenzhen shipping point', 1, 1, 'Big Pear', '18000000000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park');
INSERT INTO `oms_company_address` VALUES (2, 'Beijing shipping point', 0, 0, 'Big Pear', '18000000000', 'Beijing', NULL, 'Nanshan District', 'Kexing Science Park');
INSERT INTO `oms_company_address` VALUES (3, 'Nanjing shipping point', 0, 0, 'Big Pear', '18000000000', 'Jiangsu Province', 'Nanjing', 'Nanshan District', 'Kexing Science Park');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Order id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Order number',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Submission time',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'User account',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Total order amount',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Amount payable (actual paid amount)',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Shipping fee amount',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Promotion optimization amount (promotion price, full reduction, tiered price)',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Points deduction amount',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Coupon deduction amount',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Discount amount applied by admin when adjusting an order',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT 'Payment method:0->Unpaid;1->Alipay;2->WeChat',
  `source_type` int(1) NULL DEFAULT NULL COMMENT 'Order source:0->PC Order;1->app Order',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Order status:0->Pending payment;1->Pending shipment;2->Shipped;3->Completed;4->Closed;5->Invalid order',
  `order_type` int(1) NULL DEFAULT NULL COMMENT 'Order type:0->Normal order;1->Flash sale order',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Logistics company(Delivery method)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tracking number',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT 'Auto-confirm time (days)',
  `integration` int(11) NULL DEFAULT NULL COMMENT 'Points obtainable',
  `growth` int(11) NULL DEFAULT NULL COMMENT 'Growth value obtainable from activity',
  `promotion_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Activity information',
  `bill_type` int(1) NULL DEFAULT NULL COMMENT 'Invoice type:0->No invoice;1->Electronic invoice;2->Paper invoice',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Invoice title',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Invoice content',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Invoice recipient phone',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Invoice recipient email',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Recipient name',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Recipient phone',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Recipient postal code',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Province/Municipality',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'City',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'District',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Detailed address',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Order remarks',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT 'Receipt confirmation status:0->Not confirmed;1->Confirmed',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT 'Deletion status:0->Not deleted;1->Deleted',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT 'Points used when placing the order',
  `payment_time` datetime NULL DEFAULT NULL COMMENT 'Payment time',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT 'Shipping time',
  `receive_time` datetime NULL DEFAULT NULL COMMENT 'Receipt confirmation time',
  `comment_time` datetime NULL DEFAULT NULL COMMENT 'Review time',
  `modify_time` datetime NULL DEFAULT NULL COMMENT 'Modification time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Order table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 20.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Jiangsu Province', 'Changzhou', 'Tianning District', 'Dongxiao Subdistrict', '111', 0, 0, NULL, NULL, NULL, NULL, NULL, '2019-11-09 16:50:28');
INSERT INTO `oms_order` VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '', '', 15, 13284, 13284, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, 1000, '2018-10-11 14:04:19', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 3, 0, 'SF Express', '201707196398345', 15, 13284, 13284, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', '2022-11-11 16:19:34', NULL, NULL);
INSERT INTO `oms_order` VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, 'SF Express', '201707196398346', 15, 13284, 13284, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 1, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, 'SF Express', '201707196398345', 15, NULL, NULL, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, 'YTO Express', 'xx', 15, NULL, NULL, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, 1000, NULL, '2018-10-16 14:42:17', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, 'SF Express', '201707196398345', 15, 0, 0, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, 'SF Express', 'xxx', 15, 0, 0, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, 1000, NULL, '2018-10-16 14:41:28', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear 22', '18033441849', '518000', 'Beijing', 'Beijing urban area', 'Dongcheng District', 'Dongcheng Subdistrict', 'xxx', 0, 1, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31');
INSERT INTO `oms_order` VALUES (26, 1, 2, '201809140101000003', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, 'Single-item promotion,Discount: buy 3 items, 25% off,Full reduction: spend 1000.00, save 120.00,Full reduction: spend 1000.00, save 120.00,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (27, 1, NULL, '202002250100000001', '2020-02-25 15:59:20', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, 'No discount,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (28, 1, NULL, '202002250100000002', '2020-02-25 16:05:47', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, 'No discount,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (29, 1, NULL, '202002250100000003', '2020-02-25 16:07:58', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, 'No discount,No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (30, 1, NULL, '202002250100000004', '2020-02-25 16:50:13', 'test', 240.00, 240.00, 20.00, 0.00, 0.00, 0.00, 10.00, 0, 1, 3, 0, 'SF Express', '12333333', NULL, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park', NULL, 1, 0, NULL, '2020-02-25 16:53:29', '2020-02-25 16:54:03', '2020-05-17 19:38:15', NULL, '2020-02-25 16:52:51');
INSERT INTO `oms_order` VALUES (31, 1, 26, '202005160100000001', '2020-05-16 15:16:54', 'test', 13623.00, 11842.40, 0.00, 1629.60, 1.00, 150.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 13623, 13623, 'Full reduction: spend 5000.00, save 500.00;Discount: buy 2 items, 20% off;Full reduction: spend 500.00, save 50.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (32, 1, NULL, '202005170100000001', '2020-05-17 15:00:38', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 6487, 6487, 'Full reduction: spend 3000.00, save 300.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2020-05-17 15:33:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (33, 1, NULL, '202005170100000002', '2020-05-17 15:14:18', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (34, 1, NULL, '202005170100000003', '2020-05-17 15:20:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (35, 1, NULL, '202005170100000004', '2020-05-17 15:22:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, 'SF Express', '123', 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2020-05-17 15:29:07', '2020-05-17 15:30:24', '2020-05-17 15:41:45', NULL, NULL);
INSERT INTO `oms_order` VALUES (36, 1, NULL, '202005170100000005', '2020-05-17 16:59:26', 'test', 10275.00, 9775.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 10275, 10275, 'Full reduction: spend 5000.00, save 500.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (37, 1, NULL, '202005170100000006', '2020-05-17 19:33:48', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, 'SF Express', 'aadd', 15, 6487, 6487, 'Full reduction: spend 3000.00, save 300.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2020-05-17 19:33:59', '2020-05-17 19:34:59', '2020-05-17 19:35:50', NULL, NULL);
INSERT INTO `oms_order` VALUES (38, 1, NULL, '202005170100000007', '2020-05-17 19:39:10', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (39, 1, NULL, '202005170100000008', '2020-05-17 19:41:30', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, 'SF Express', 'sdf', 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 1, NULL, '2020-05-17 19:41:41', '2020-05-17 19:42:07', '2020-05-17 19:42:36', NULL, NULL);
INSERT INTO `oms_order` VALUES (40, 1, NULL, '202005180100000001', '2020-05-18 16:50:03', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2020-05-18 16:50:29', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (41, 1, 26, '202005180100000002', '2020-05-18 20:22:24', 'test', 6487.00, 6037.00, 0.00, 300.00, 0.00, 150.00, 0.00, 1, 1, 3, 0, 'SF Express', '12313', 15, 6487, 6487, 'Full reduction: spend 3000.00, save 300.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 1, 0, NULL, '2020-05-18 20:22:29', '2020-05-18 20:23:03', '2020-05-18 20:23:20', NULL, NULL);
INSERT INTO `oms_order` VALUES (42, 1, NULL, '202005230100000001', '2020-05-23 16:21:27', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 5398, 5398, 'Discount: buy 2 items, 20% off', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 0, 0, NULL, '2020-05-23 16:21:30', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (43, 1, NULL, '202005230100000002', '2020-05-23 17:01:33', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 5398, 5398, 'Discount: buy 2 items, 20% off', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (44, 1, NULL, '202005240100000001', '2020-05-24 09:37:07', 'test', 7576.00, 7076.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 7576, 7576, 'Full reduction: spend 5000.00, save 500.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (45, 1, 25, '202006070100000001', '2020-06-07 17:02:04', 'test', 10275.00, 9674.90, 0.00, 500.00, 0.00, 100.10, 0.00, 1, 1, 1, 0, NULL, NULL, 15, 10275, 10275, 'Full reduction: spend 5000.00, save 500.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 0, 0, NULL, '2020-06-07 17:02:17', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (46, 1, 24, '202006210100000001', '2020-06-21 14:27:34', 'test', 9186.00, 7796.40, 0.00, 1379.60, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 9186, 9186, 'Full reduction: spend 3000.00, save 300.00;Discount: buy 2 items, 20% off', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2020-06-21 14:27:38', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (47, 1, NULL, '202006210100000002', '2020-06-21 15:13:06', 'test', 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, 'SF Express', '123131', 15, 6487, 6487, 'Full reduction: spend 3000.00, save 300.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 1, 0, NULL, '2020-06-21 15:13:12', '2020-06-21 15:13:44', '2020-06-21 15:13:58', NULL, NULL);
INSERT INTO `oms_order` VALUES (48, 1, 26, '202006210100000003', '2020-06-21 15:15:18', 'test', 3788.00, 3338.00, 0.00, 300.00, 0.00, 150.00, 0.00, 2, 1, 3, 0, 'YTO Express', '12313', 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2020-06-21 15:15:20', '2020-06-21 15:15:48', '2020-06-21 15:15:58', NULL, NULL);
INSERT INTO `oms_order` VALUES (49, 1, NULL, '202006270100000001', '2020-06-27 10:27:56', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 0, 0, NULL, '2020-06-27 10:27:58', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (50, 1, NULL, '202210280100000001', '2022-10-28 14:50:58', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 2699, 2699, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict', NULL, 0, 0, NULL, '2022-10-28 14:51:02', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (51, 1, NULL, '202210280100000002', '2022-10-28 15:27:41', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-10-28 15:27:44', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (52, 1, 30, '202211090100000001', '2022-11-09 15:14:58', 'test', 2999.00, 2799.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2, 1, 3, 0, 'SF Express', '1233', 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2022-11-09 15:15:00', '2022-11-09 15:16:12', '2022-11-09 15:16:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (53, 1, 27, '202211090100000002', '2022-11-09 15:25:38', 'test', 3599.00, 3589.00, 0.00, 0.00, 0.00, 10.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-11-09 15:25:41', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (54, 1, 29, '202211090100000003', '2022-11-09 15:26:11', 'test', 5999.00, 5399.00, 0.00, 0.00, 0.00, 600.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-11-09 15:26:13', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (55, 1, NULL, '202211100100000001', '2022-11-10 16:57:59', 'test', 11998.00, 11998.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (56, 1, 28, '202211110100000001', '2022-11-11 16:12:42', 'test', 2999.00, 2899.00, 0.00, 0.00, 0.00, 100.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-11-11 16:12:48', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (57, 1, NULL, '202211110100000002', '2022-11-11 16:13:14', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-11-11 16:13:21', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (58, 1, NULL, '202211110100000003', '2022-11-11 16:15:08', 'test', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-11-11 16:17:46', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (59, 1, NULL, '202211110100000004', '2022-11-11 16:21:12', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 649, 649, 'Full reduction: spend 500.00, save 50.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (60, 1, NULL, '202211160100000001', '2022-11-16 10:36:08', 'test', 11097.00, 11097.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, 'SF Express', '1234555', 15, 0, 0, 'No discount;No discount;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2022-11-16 10:37:25', '2022-11-16 10:42:50', '2022-11-16 10:44:40', NULL, NULL);
INSERT INTO `oms_order` VALUES (61, 1, NULL, '202212210100000001', '2022-12-21 15:49:08', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (62, 1, NULL, '202212210100000002', '2022-12-21 15:49:57', 'test', 8098.00, 8098.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, 'SF Express', 'SDFERR7845', 15, 0, 0, 'No discount;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2022-12-21 15:50:00', '2022-12-21 15:50:23', '2022-12-21 15:50:33', NULL, NULL);
INSERT INTO `oms_order` VALUES (63, 1, NULL, '202212210100000003', '2022-12-21 15:51:09', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 2, 0, 'SF Express', '112', 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-12-21 15:51:11', '2023-01-10 10:14:12', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (64, 1, NULL, '202212210100000004', '2022-12-21 15:51:35', 'test', 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (65, 1, 28, '202212210100000005', '2022-12-21 16:53:07', 'test', 5098.00, 4788.00, 0.00, 200.00, 10.00, 100.00, 0.00, 2, 1, 2, 0, 'YTO Express', '115', 15, 0, 0, 'Full reduction: spend 2000.00, save 200.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2022-12-21 16:53:58', '2023-01-10 10:14:12', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (66, 1, NULL, '202301100100000001', '2023-01-10 15:34:59', 'test', 5998.00, 5798.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, 'Full reduction: spend 2000.00, save 200.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (67, 1, NULL, '202301100100000002', '2023-01-10 15:39:07', 'test', 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, 'Full reduction: spend 3000.00, save 300.00', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2023-01-10 15:39:16', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (68, 1, NULL, '202301100100000003', '2023-01-10 16:58:19', 'test', 3999.00, 3899.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, 15, 3788, 3788, 'Single-item promotion', NULL, NULL, NULL, NULL, NULL, 'Big Pear', '18033441849', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2023-01-10 16:58:21', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (69, 11, 30, '202305110100000001', '2023-05-11 15:28:56', 'member', 5098.00, 4698.00, 0.00, 200.00, 0.00, 200.00, 0.00, 2, 1, 3, 0, 'SF Express', '1231313', 15, 0, 0, 'Full reduction: spend 2000.00, save 200.00;No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2023-05-11 15:28:59', '2023-05-11 15:30:08', '2023-05-11 15:30:16', NULL, NULL);
INSERT INTO `oms_order` VALUES (70, 11, NULL, '202305110100000002', '2023-05-11 15:30:36', 'member', 3599.00, 3599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, 'SF Express', '232342', 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2023-05-11 15:30:40', '2023-05-11 15:31:22', '2023-05-11 15:31:30', NULL, NULL);
INSERT INTO `oms_order` VALUES (71, 11, NULL, '202305110100000003', '2023-05-11 15:31:55', 'member', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (72, 11, NULL, '202305110100000004', '2023-05-11 15:33:13', 'member', 5368.00, 5368.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 2, 0, 'YTO Express', '1231434', 15, 0, 0, 'No discount;No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2023-05-11 15:33:21', '2023-05-11 15:33:43', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (73, 11, NULL, '202305110100000005', '2023-05-11 15:34:39', 'member', 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 1, 0, 0, NULL, NULL, 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (74, 11, NULL, '202305110100000006', '2023-05-11 15:35:05', 'member', 2999.00, 2799.00, 0.00, 200.00, 0.00, 0.00, 0.00, 2, 1, 2, 0, 'SF Express', '123131', 15, 0, 0, 'Full reduction: spend 2000.00, save 200.00', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 0, 0, NULL, '2023-05-11 15:35:08', '2023-05-11 15:36:00', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (75, 11, NULL, '202305110100000007', '2023-05-11 15:35:24', 'member', 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, 'SF Express', '123131311', 15, 0, 0, 'No discount', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2023-05-11 15:35:26', '2023-05-11 15:36:11', '2023-05-11 15:36:34', NULL, NULL);
INSERT INTO `oms_order` VALUES (76, 11, 28, '202305110100000008', '2023-05-11 15:37:16', 'member', 8998.00, 8698.00, 0.00, 200.00, 0.00, 100.00, 0.00, 2, 1, 3, 0, 'SF Express', '1231313', 15, 0, 0, 'No discount;Full reduction: spend 2000.00, save 200.00', NULL, NULL, NULL, NULL, NULL, 'Xiao Li', '18961511111', '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict', NULL, 1, 0, NULL, '2023-05-11 15:37:18', '2023-05-11 15:37:33', '2023-05-11 15:37:48', NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'Order id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Order number',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Sale price',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT 'Purchase quantity',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT 'Product SKU number',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product SKU barcode',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT 'Product category id',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product promotion name',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Product promotion breakdown amount',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Coupon discount breakdown amount',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Points discount breakdown amount',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Breakdown amount of this product after discounts',
  `gift_integration` int(11) NULL DEFAULT 0,
  `gift_growth` int(11) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product sales attributes:[{\"key\":\"Color\",\"value\":\"Color\"},{\"key\":\"Capacity\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Products included in the order' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', '6946605', 3788.00, 1, 90, '201806070026001', 19, 'Single-item promotion', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', '7437788', 2699.00, 3, 98, '201808270027001', 19, 'Discount: buy 3 items, 25% off', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 699.00, 1, 103, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'Apple', '7437799', 5499.00, 1, 106, '201808270029001', 19, 'No discount', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', '6946605', 3788.00, 1, 90, '201806070026001', 19, 'Single-item promotion', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', '7437788', 2699.00, 3, 98, '201808270027001', 19, 'Discount: buy 3 items, 25% off', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 699.00, 1, 103, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'Apple', '7437799', 5499.00, 1, 106, '201808270029001', 19, 'No discount', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', '6946605', 3788.00, 1, 90, '201806070026001', 19, 'Single-item promotion', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', '7437788', 2699.00, 3, 98, '201808270027001', 19, 'Discount: buy 3 items, 25% off', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 699.00, 1, 103, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'Apple', '7437799', 5499.00, 1, 106, '201808270029001', 19, 'No discount', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', '6946605', 3788.00, 1, 90, '201806070026001', 19, 'Single-item promotion', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', '7437788', 2699.00, 3, 98, '201808270027001', 19, 'Discount: buy 3 items, 25% off', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 699.00, 1, 103, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'Apple', '7437799', 5499.00, 1, 106, '201808270029001', 19, 'No discount', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', '6946605', 3788.00, 1, 90, '201806070026001', 19, 'Single-item promotion', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', '7437788', 2699.00, 3, 98, '201808270027001', 19, 'Discount: buy 3 items, 25% off', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', '7437789', 699.00, 1, 103, '201808270028001', 19, 'Full reduction: spend 1000.00, save 120.00', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', 'Apple', '7437799', 5499.00, 1, 106, '201808270029001', 19, 'No discount', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (46, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (47, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (48, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (49, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (50, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 100.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `oms_order_item` VALUES (51, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `oms_order_item` VALUES (52, 30, '202002250100000004', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, 'No discount', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `oms_order_item` VALUES (53, 31, '202005160100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 2, 110, '201806070026001', 19, 'Full reduction: spend 5000.00, save 500.00', 250.00, 75.00, 0.28, 3462.72, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (54, 31, '202005160100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 2, 98, '201808270027001', 19, 'Discount: buy 2 items, 20% off', 539.80, 0.00, 0.20, 2159.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (55, 31, '202005160100000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 500.00, save 50.00', 50.00, 0.00, 0.05, 598.95, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (56, 32, '202005170100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (57, 32, '202005170100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (58, 33, '202005170100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (59, 34, '202005170100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (60, 35, '202005170100000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (61, 36, '202005170100000005', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 2, 110, '201806070026001', 19, 'Full reduction: spend 5000.00, save 500.00', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (62, 36, '202005170100000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (63, 37, '202005170100000006', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (64, 37, '202005170100000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (65, 38, '202005170100000007', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (66, 39, '202005170100000008', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (67, 40, '202005180100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (68, 41, '202005180100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (69, 41, '202005180100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (70, 42, '202005230100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 2, 98, '201808270027001', 19, 'Discount: buy 2 items, 20% off', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (71, 43, '202005230100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 2, 98, '201808270027001', 19, 'Discount: buy 2 items, 20% off', 539.80, 0.00, 0.00, 2159.20, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (72, 44, '202005240100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 2, 110, '201806070026001', 19, 'Full reduction: spend 5000.00, save 500.00', 250.00, 0.00, 0.00, 3538.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (73, 45, '202006070100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 2, 110, '201806070026001', 19, 'Full reduction: spend 5000.00, save 500.00', 250.00, 36.90, 0.00, 3501.10, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (74, 45, '202006070100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 26.30, 0.00, 2672.70, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (75, 46, '202006210100000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 4.12, 0.00, 3483.88, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (76, 46, '202006210100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 2, 98, '201808270027001', 19, 'Discount: buy 2 items, 20% off', 539.80, 2.94, 0.00, 2156.26, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (77, 47, '202006210100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (78, 47, '202006210100000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (79, 48, '202006210100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 150.00, 0.00, 3338.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (80, 49, '202006270100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (81, 50, '202210280100000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'Xiaomi', '7437788', 2699.00, 1, 98, '201808270027001', 19, 'No discount', 0.00, 0.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (82, 51, '202210280100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Purple Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (83, 52, '202211090100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 200.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (84, 53, '202211090100000002', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', 'Apple', '100044025833', 3599.00, 1, 213, '202210280038001', 53, 'No discount', 0.00, 10.00, 0.00, 3589.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (85, 54, '202211090100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 600.00, 0.00, 5399.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (86, 55, '202211100100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 2, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (87, 56, '202211110100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 100.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (88, 57, '202211110100000002', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (89, 58, '202211110100000003', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (90, 59, '202211110100000004', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', 'Xiaomi', '7437789', 649.00, 1, 102, '201808270028001', 19, 'Full reduction: spend 500.00, save 50.00', 50.00, 0.00, 0.00, 599.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (91, 60, '202211160100000001', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (92, 60, '202211160100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (93, 60, '202211160100000001', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (94, 61, '202212210100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (95, 62, '202212210100000002', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (96, 62, '202212210100000002', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (97, 63, '202212210100000003', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'No discount', 0.00, 0.00, 0.00, 2999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (98, 64, '202212210100000004', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (99, 65, '202212210100000005', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'Full reduction: spend 2000.00, save 200.00', 200.00, 58.80, 5.88, 2734.32, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (100, 65, '202212210100000005', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 41.20, 4.12, 2053.68, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (101, 66, '202301100100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 2, 221, '202211040040001', 19, 'Full reduction: spend 2000.00, save 200.00', 100.00, 0.00, 0.00, 2899.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (102, 67, '202301100100000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3788.00, 1, 110, '201806070026001', 19, 'Full reduction: spend 3000.00, save 300.00', 300.00, 0.00, 0.00, 3488.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (103, 68, '202301100100000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20 ', 'Huawei', '6946605', 3999.00, 1, 111, '201806070026002', 19, 'Single-item promotion', 100.00, 0.00, 0.00, 3899.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (104, 69, '202305110100000001', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'Full reduction: spend 2000.00, save 200.00', 200.00, 117.60, 0.00, 2681.40, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (105, 69, '202305110100000001', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 82.40, 0.00, 2016.60, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (106, 70, '202305110100000002', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9-inch Tablet 2022', 'Apple', '100044025833', 3599.00, 1, 213, '202210280038001', 53, 'No discount', 0.00, 0.00, 0.00, 3599.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `oms_order_item` VALUES (107, 71, '202305110100000003', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', 'Xiaomi', '100023207945', 5999.00, 1, 217, '202210280039001', 54, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (108, 72, '202305110100000004', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 Flat-screen Flagship Ultra-Light XMAGE Imaging BeiDou Satellite Messaging', 'Huawei', '100035295081', 4999.00, 1, 229, '202211040042001', 19, 'No discount', 0.00, 0.00, 0.00, 4999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Glossy Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (109, 72, '202305110100000004', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', 'Samsung (SAMSUNG) 500GB SSD Solid State Drive M.2 Interface(NVMe Protocol)', 'Samsung', '100018768480', 369.00, 1, 235, '202211080044001', 55, 'No discount', 0.00, 0.00, 0.00, 369.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"New arrival 980 |NVMe PCIe3.0*4\"},{\"key\":\"Version\",\"value\":\"512GB\"}]');
INSERT INTO `oms_order_item` VALUES (110, 73, '202305110100000005', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'Apple', '100038005189', 5999.00, 1, 201, '202210280037001', 19, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (111, 74, '202305110100000006', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'Full reduction: spend 2000.00, save 200.00', 200.00, 0.00, 0.00, 2799.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (112, 75, '202305110100000007', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'Xiaomi', '100035246702', 2099.00, 1, 225, '202211040041001', 19, 'No discount', 0.00, 0.00, 0.00, 2099.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `oms_order_item` VALUES (113, 76, '202305110100000008', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', 'Xiaomi', '100023207945', 5999.00, 1, 217, '202210280039001', 54, 'No discount', 0.00, 0.00, 0.00, 5999.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_order_item` VALUES (114, 76, '202305110100000008', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'Xiaomi', '100027789721', 2999.00, 1, 221, '202211040040001', 19, 'Full reduction: spend 2000.00, save 200.00', 200.00, 100.00, 0.00, 2699.00, 0, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'Order id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operator: user; system; admin',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Operation time',
  `order_status` int(1) NULL DEFAULT NULL COMMENT 'Order status:0->Pending payment;1->Pending shipment;2->Shipped;3->Completed;4->Closed;5->Invalid order',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Order operation history records' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, 'Admin user', '2018-10-12 14:01:29', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, 'Admin user', '2018-10-12 14:01:29', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, 'Admin user', '2018-10-12 14:13:10', 4, 'Order closed: buyer returned goods');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, 'Admin user', '2018-10-12 14:13:10', 4, 'Order closed: buyer returned goods');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, 'Admin user', '2018-10-15 16:31:48', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, 'Admin user', '2018-10-15 16:35:08', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, 'Admin user', '2018-10-15 16:35:59', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, 'Admin user', '2018-10-15 16:43:40', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, 'Admin user', '2018-10-15 16:52:14', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, 'Admin user', '2018-10-15 16:52:14', 4, 'Order closed:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, 'Admin user', '2018-10-16 14:41:28', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, 'Admin user', '2018-10-16 14:42:17', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, 'Admin user', '2018-10-16 14:42:17', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, 'Admin user', '2018-10-30 14:37:44', 4, 'Order closed: order closed');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, 'Admin user', '2018-10-30 15:07:01', 0, 'Modify recipient information');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, 'Admin user', '2018-10-30 15:08:13', 0, 'Modify fee information');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, 'Admin user', '2018-10-30 15:08:31', 0, 'Modify remarks:xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, 'Admin user', '2018-10-30 15:08:39', 4, 'Order closed:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 12, 'Admin user', '2019-11-09 16:50:28', 4, 'Modify remarks:111');
INSERT INTO `oms_order_operate_history` VALUES (24, 30, 'Admin user', '2020-02-25 16:52:37', 0, 'Modify fee information');
INSERT INTO `oms_order_operate_history` VALUES (25, 30, 'Admin user', '2020-02-25 16:52:51', 0, 'Modify fee information');
INSERT INTO `oms_order_operate_history` VALUES (26, 30, 'Admin user', '2020-02-25 16:54:03', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (27, 35, 'Admin user', '2020-05-17 15:30:24', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (28, 37, 'Admin user', '2020-05-17 19:35:00', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (29, 39, 'Admin user', '2020-05-17 19:42:08', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (30, 41, 'Admin user', '2020-05-18 20:23:04', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (31, 47, 'Admin user', '2020-06-21 15:13:44', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (32, 48, 'Admin user', '2020-06-21 15:15:49', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (33, 52, 'Admin user', '2022-11-09 15:16:13', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (34, 60, 'Admin user', '2022-11-16 10:42:50', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (35, 62, 'Admin user', '2022-12-21 15:50:24', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (36, 63, 'Admin user', '2023-01-10 10:08:34', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (37, 65, 'Admin user', '2023-01-10 10:08:34', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (38, 69, 'Admin user', '2023-05-11 15:30:08', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (39, 70, 'Admin user', '2023-05-11 15:31:22', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (40, 72, 'Admin user', '2023-05-11 15:33:43', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (41, 74, 'Admin user', '2023-05-11 15:36:00', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (42, 75, 'Admin user', '2023-05-11 15:36:11', 2, 'Shipping completed');
INSERT INTO `oms_order_operate_history` VALUES (43, 76, 'Admin user', '2023-05-11 15:37:34', 2, 'Shipping completed');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'Order id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT 'Shipping address table id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT 'Returned product id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Order number',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Application time',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Member username',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Refund amount',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Returner name',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Returner phone',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Application status:0->Pending;1->Returning;2->Completed;3->Rejected',
  `handle_time` datetime NULL DEFAULT NULL COMMENT 'Handling time',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product image',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product name',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product brand',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product sales attributes: Color: Red; Size:xl;',
  `product_count` int(11) NULL DEFAULT NULL COMMENT 'Return quantity',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Product unit price',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Product actual paid unit price',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Reason',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Description',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Proof images, separated by commas',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Handling remarks',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Handler',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Recipient',
  `receive_time` datetime NULL DEFAULT NULL COMMENT 'Receipt time',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Delivery remarks',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Order return request' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, 1, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 0.00, 'Big Pear', '18000000000', 2, '2022-11-11 10:16:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '111', 'admin', 'admin', '2022-11-11 10:16:26', NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, 'Big Pear', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', 'Already handled', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, 'Big Pear', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', 'Already handled', 'admin', 'admin', '2018-10-18 13:55:58', 'Already handled');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, 'Big Pear', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', 'Reason not sufficient', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, 'Big Pear', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', 'Haha', 'admin', 'admin', '2018-10-24 15:46:35', 'Received');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', 'Just won’t refund', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, 'Big Pear', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', 'Refundable', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, 'Big Pear', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', 'Returned', 'admin', 'admin', '2018-10-24 17:23:06', 'Received');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', 'Cannot be returned', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'Huawei HUAWEI P20', 'Huawei', 'Color: Gold;Memory:16G', 1, 3788.00, 3585.98, 'Quality issue', 'Always laggy', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 'Xiaomi 8', 'Xiaomi', 'Color: Black;Memory:32G', 1, 2699.00, 2022.81, 'Quality issue', 'Not high-end enough', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, 'Big Pear', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 'Redmi 5A', 'Xiaomi', 'Color: Gold;Memory:16G', 1, 649.00, 591.05, 'Quality issue', 'Color is too plain', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Return type',
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT 'Status:0->Not enabled;1->Enable',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Added time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Return reason table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, 'Quality issue', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, 'Size too big', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, 'Don’t like the color', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7 7-day no-reason returns', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, 'Price issue', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, 'Invoice issue', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, 'Other issues', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, 'Logistics issues', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, 'After-sales issues', 0, 1, '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) NULL DEFAULT NULL COMMENT 'Flash sale order timeout close time(cents)',
  `normal_order_overtime` int(11) NULL DEFAULT NULL COMMENT 'Normal order timeout(cents)',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT 'Auto-confirm receipt time after shipping (days)',
  `finish_overtime` int(11) NULL DEFAULT NULL COMMENT 'Time after which the transaction completes automatically and after-sales can no longer be requested (days)',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT 'Time after which orders are automatically reviewed positively after completion (days)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Order settings table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_count` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Album table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Album image table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Initial letter',
  `sort` int(11) NULL DEFAULT NULL,
  `factory_status` int(1) NULL DEFAULT NULL COMMENT 'Whether it is a brand manufacturer:0->No;1->Yes',
  `show_status` int(1) NULL DEFAULT NULL,
  `product_count` int(11) NULL DEFAULT NULL COMMENT 'Product count',
  `product_comment_count` int(11) NULL DEFAULT NULL COMMENT 'Product review count',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Brand logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Zone banner image',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Brand story',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Brand table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, 'Vanward', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5b07ca8aN4e127d2f.jpg', 'http://img13.360buyimg.com/cms/jfs/t1/121860/35/2430/187800/5ec4e294E22f3ffcc/1e233b65b94ba192.jpg', 'Vanward was founded in August 1993 and is headquartered in the Shunde National High-tech Development Zone, Guangdong. It is the largest gas appliance manufacturer in China by production scale, the initiator and promoter of China’s gas appliance development strategy, and the chair unit of the third council of the Gas Appliances Branch of the China Hardware Products Association.');
INSERT INTO `pms_brand` VALUES (2, 'Samsung', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/57201b47N7bf15715.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', 'Samsung Group (English: SAMSUNG, Korean:삼성) is the largest multinational conglomerate in South Korea. Samsung Group includes numerous international subsidiaries, including Samsung Electronics, Samsung C and T, Samsung Life Insurance and more, with business spanning electronics, finance, machinery, chemicals and many other fields.');
INSERT INTO `pms_brand` VALUES (3, 'Huawei', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5abf6f26N31658aa2.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', 'The Honor brand was founded in 2013,is one of Huawei’s two phone brands. Honor takes “innovation, quality, service” as its core strategy,Providing young people worldwide with a trendy all-scenario smart experience,Building the avant-garde culture and trendy lifestyle young people aspire to');
INSERT INTO `pms_brand` VALUES (4, 'Gree', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', NULL, 'Victoria\'s Secret’s story');
INSERT INTO `pms_brand` VALUES (5, 'Fotile', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret’s story');
INSERT INTO `pms_brand` VALUES (6, 'Xiaomi', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5565f5a2N0b8169ae.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', 'Xiaomi Corporation was officially founded in April 2010. It is an innovative technology company focused on in-house development of high-end smartphones and internet TVs, formed mainly by top talent from well-known companies such as Google, Microsoft, Motorola and Kingsoft.');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', 'OPPO Launched its first “smiley-face phone” in 2008, thereby beginning its journey of exploring and leading the most beautiful technology. Today, OPPO, with smart devices centered on the Find and R series phones as well as internet services such as OPPO+, lets consumers worldwide enjoy the most beautiful technology.');
INSERT INTO `pms_brand` VALUES (49, 'Septwolves', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/qipilang.png', NULL, 'BOOB’s story');
INSERT INTO `pms_brand` VALUES (50, 'Heilan Home', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a5c69b9N5d6c5696.jpg', 'http://img10.360buyimg.com/cms/jfs/t1/133148/4/1605/470028/5edaf5ccEd7a687a9/e0a007631361ff75.jpg', '“Heilan Home” (abbreviation: HLA) is a clothing brand under Heilan Home Co., Ltd., headquartered in Jiangyin, Wuxi, Jiangsu Province, China. It mainly uses a chain retail model to sell men’s clothing, accessories and related products.');
INSERT INTO `pms_brand` VALUES (51, 'Apple', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/49b30bb0377030d1.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', 'Apple Inc.(Apple Inc. )is an American high-tech company. Founded by Steve Jobs, Steve Wozniak and Ronald Wayne(Ron Wayne)and others founded on April 1, 1976,and named Apple Computer, Inc.(Apple Computer Inc. ),2007 renamed to Apple Inc. on January 9 of the year,Headquartered in California,...');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 0, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE’s story');
INSERT INTO `pms_brand` VALUES (59, 'Test brand', 'C', 0, 0, 0, NULL, NULL, 'http://localhost:9000/mall/20220609/Snipaste_2022-06-08_14-35-53.png', 'http://localhost:9000/mall/20220609/biji_05.jpg', '12345');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(3) NULL DEFAULT NULL COMMENT 'Review stars:0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Review’s ip',
  `create_time` datetime NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product attributes at time of purchase',
  `collect_couont` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Uploaded image URLs, separated by commas',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Reviewer avatar',
  `replay_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product review table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT 'Reviewer type;0->Member;1->Admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product review reply table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_type` int(1) NULL DEFAULT NULL COMMENT 'Billing type:0->By weight;1->By quantity',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT 'First weight kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT 'First-weight fee (yuan)',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Destination (province, city)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Shipping template' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Member price',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product member price table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, 'Gold member');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (246, 36, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (247, 36, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (248, 36, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (249, 35, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (250, 35, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (251, 35, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (258, 30, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (259, 30, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (260, 30, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (261, 31, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (262, 31, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (263, 31, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (264, 32, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (265, 32, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (266, 32, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (270, 33, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (271, 33, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (272, 33, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (273, 34, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (274, 34, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (275, 34, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (285, 27, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (286, 27, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (287, 27, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (294, 28, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (295, 28, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (296, 28, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (297, 29, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (298, 29, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (299, 29, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (315, 37, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (316, 37, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (317, 37, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (381, 38, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (382, 38, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (383, 38, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (384, 39, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (385, 39, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (386, 39, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (387, 41, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (388, 41, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (389, 41, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (390, 42, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (391, 42, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (392, 42, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (393, 43, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (394, 43, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (395, 43, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (396, 44, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (397, 44, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (398, 44, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (399, 45, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (400, 45, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (401, 45, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (402, 40, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (403, 40, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (404, 40, 3, NULL, 'Diamond member');
INSERT INTO `pms_member_price` VALUES (423, 26, 1, NULL, 'Gold member');
INSERT INTO `pms_member_price` VALUES (424, 26, 2, NULL, 'Platinum member');
INSERT INTO `pms_member_price` VALUES (425, 26, 3, NULL, 'Diamond member');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `feight_template_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Item number',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT 'Deletion status:0->Not deleted;1->Deleted',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT 'Shelf status:0->Off shelf;1->On shelf',
  `new_status` int(1) NULL DEFAULT NULL COMMENT 'New arrival status:0->Not a new arrival;1->New arrival',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT 'Recommendation status;0->Not recommended;1->Recommend',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT 'Review status:0->Not reviewed;1->Approved',
  `sort` int(11) NULL DEFAULT NULL COMMENT 'Sort',
  `sale` int(11) NULL DEFAULT NULL COMMENT 'Sales',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Promotion price',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT 'Growth value awarded',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT 'Points awarded',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT 'Limit on points that can be used',
  `sub_title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Subtitle',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Product description',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Market price',
  `stock` int(11) NULL DEFAULT NULL COMMENT 'In stock',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT 'Stock warning value',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Unit',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Product weight, in grams by default',
  `preview_status` int(1) NULL DEFAULT NULL COMMENT 'Whether it is a preview product:0->No;1->Yes',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product services separated by commas:1->Worry-free returns;2->Quick refund;3->Free shipping',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Album images, including the product image, limited to 5, separated by commas',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Product detail web content',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Mobile web details',
  `promotion_start_time` datetime NULL DEFAULT NULL COMMENT 'Promotion start time',
  `promotion_end_time` datetime NULL DEFAULT NULL COMMENT 'Promotion end time',
  `promotion_per_limit` int(11) NULL DEFAULT NULL COMMENT 'Activity purchase limit',
  `promotion_type` int(1) NULL DEFAULT NULL COMMENT 'Promotion type:0->Use original price if no promotion;1->Use promotion price;2->Use member price;3->Use tiered price;4->Use full-reduction price;5->Flash sale',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Brand name',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product category name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product information' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, NULL, NULL, 0, 'Septwolves', 'Jacket');
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties 2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties 2', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', '<p>Silver Starburst Embroidered Mesh Panties</p>', '<p>Silver Starburst Embroidered Mesh Panties</p>', NULL, NULL, NULL, 0, 'Septwolves', 'Jacket');
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties 3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties 3', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, NULL, NULL, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties 4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties 4', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, NULL, NULL, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties 5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties 5', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, NULL, NULL, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, 'Silver Starburst Embroidered Mesh Panties 6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, 'pcs', 1000.00, 0, NULL, 'Silver Starburst Embroidered Mesh Panties 6', 'Silver Starburst Embroidered Mesh Panties', NULL, 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', 'Silver Starburst Embroidered Mesh Panties', NULL, NULL, NULL, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, 'Women’s Ultra-soft Brushed Sports Cardigan 3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, 'Skillful tailoring, drapey texture', 'Skillful tailoring, drapey texture', 299.00, 100, 0, 'pcs', 0.00, 0, 'string', 'Women’s Ultra-soft Brushed Sports Cardigan', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, 'Vanward', 'Jacket');
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Xiaomi', 'Jacket');
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, 'Sweater test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, 'Sweater test 11', 'xxx', 109.00, 100, 0, 'pcs', 1000.00, 1, '1,2,3', 'Sweater test', 'Sweater test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'Sweater test', 'Sweater test', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP Login bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP Login screen.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, 'Xiaomi', 'Mobile and digital');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Xiaomi', 'Jacket');
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 3, 'Huawei HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 100, 3788.00, 3659.00, 3788, 3788, 0, 'AI Smart Full-screen 6GB+64GB Bright Black All-network Edition China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', '', 4288.00, 1000, 0, 'pcs', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/81293/35/5822/369414/5d3fe77cE619c5487/6e775a52850feea5.jpg!q70.dpg.webp\" alt=\"\" width=\"750\" height=\"776\" /></p>\n<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/45300/25/11592/3658871/5d85ef66E92a8a911/083e47d8f662c582.jpg!q70.dpg.webp\" alt=\"\" width=\"596\" height=\"16383\" /></p>', '2023-01-10 15:49:38', '2023-01-31 00:00:00', 0, 1, 'Huawei', 'Mobile phones');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 99, 2699.00, NULL, 2699, 2699, 0, 'Snapdragon 845 processor, infrared face unlock, AI zoom dual camera, AI voice assistant. Xiaomi 6X as low as 1299, click to buy', 'Xiaomi 8 Full-screen Gaming Smartphone 6GB+64GB Black All-network 4G Dual SIM Dual Standby', 2699.00, 100, 0, '', 0.00, 0, '1', '', '', '', '', '', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', NULL, NULL, 0, 3, 'Xiaomi', 'Mobile phones');
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, 'Xiaomi Redmi 5A All-network Edition 3GB+32GB Champagne Gold China Mobile/Unicom/Telecom 4G Phone Dual SIM Dual Standby', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 98, 649.00, NULL, 649, 649, 0, '8 Days of ultra-long standby, 137g lightweight body, Qualcomm Snapdragon processor. Xiaomi 6X as low as 1299, click to buy', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '<div><img src=\"//img12.360buyimg.com/imgzone/jfs/t1/67362/12/14546/708984/5dc28512Eefdd817d/c82503af0da6c038.gif\" /><img src=\"//img13.360buyimg.com/imgzone/jfs/t1/61488/17/14551/995918/5dc28512E821c228d/41e52005ea5b1f36.gif\" /><img src=\"//img14.360buyimg.com/imgzone/jfs/t1/72961/36/14769/305883/5dc28512E65d77261/3df6be29e3d489d1.gif\" />\n<p>&nbsp;</p>\n</div>', NULL, NULL, 0, 4, 'Xiaomi', 'Mobile phones');
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB Red Special Edition China Mobile/Unicom/Telecom 4G Phone', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 1, 1, 0, 0, 97, 5499.00, 4799.00, 5499, 5499, 0, '[Limited-time Limited-quantity Sale] Apple Mid-year Carnival, enjoy great products, beauty in wisdom! Hurry to >> Check[Guarantee services][2-year original manufacturer warranty], get the AppleCare+ comprehensive service plan, original extended warranty for worry-free after-sales.', '', 5499.00, 100, 0, '', 0.00, 0, '1,2,3', '', '', '', '', '', '', '<div><img src=\"//img10.360buyimg.com/cms/jfs/t1/20020/38/9725/228440/5c7f9208Eeaf4bf87/13a713066f71791d.jpg!q70.dpg.webp\" /> <img src=\"//img12.360buyimg.com/cms/jfs/t1/12128/39/9607/265349/5c7f9209Ecff29b88/08620ba570705634.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/22731/40/9578/345163/5c7f9209E9ba056e5/a8a557060b84447e.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/29506/38/9439/299492/5c7f9209E0e51eb29/15dedd95416f3c68.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/26766/28/9574/257101/5c7f9209Eaca1b317/c7caa047b1566cf1.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/11059/8/10473/286531/5c7f9208E05da0120/9034ad8799ad9553.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/25641/2/9557/268826/5c7f9208Efbf0dc50/399580629e05e733.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/28964/25/9527/305902/5c7f9208E275ffb9c/8464934d67e69b7a.jpg!q70.dpg.webp\" /></div>', '2020-05-04 15:12:54', '2020-05-30 00:00:00', 0, 1, 'Apple', 'Mobile phones');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA Heilan Home Simple Animal Print Short Sleeve T-shirt', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018 Summer New Arrival Slightly Stretchy Comfortable New Short Tee for Men. June 6 - June 20, spend 300 save 30, join the event to win 100-yuan vouchers, share now to win big prizes', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Heilan Home', 'T T-shirt');
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA Heilan Home Blue-gray Pattern Crew Neck Knit Short Sleeve T-shirt', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018 Summer New Arrival Short Sleeve T-shirt Men HNTBJ2E080A Blue-gray Pattern 80 175/92A/L80A Blue-gray Pattern 80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Heilan Home', 'T T-shirt');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, 1, 'HLA Heilan Home Short Sleeve T-shirt Men Basic', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA Heilan Home Short Sleeve T-shirt Men Basic Simple Crew Neck HNTBJ2E153A Navy(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Heilan Home', 'T T-shirt');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, 12, 'Xiaomi (MI) Xiaomi TV 4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, 'Xiaomi (MI) Xiaomi TV 4A 55-inch L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K Ultra HD AI Network LCD Flat-panel TV', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Xiaomi', 'TV');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, 12, 'Xiaomi (MI) Xiaomi TV 4A 65-inch', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K Ultra HD AI Network LCD Flat-panel TV', '', 3999.00, 100, 0, '', 0.00, 0, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'Xiaomi', 'TV');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, 11, 'Nike NIKE Men’s Casual Shoes ROSHE RUN Sneakers 511881-010 Black Size 41', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, 'Nike NIKE Men’s Casual Shoes ROSHE RUN Sneakers 511881-010 Black Size 41', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', 'Men’s shoes');
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, 11, 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, 'Nike NIKE Men’s Air Cushion Casual Shoes AIR MAX 90 ESSENTIAL Sneakers AJ1285-101 White Size 41', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', 'Men’s shoes');
INSERT INTO `pms_product` VALUES (37, 51, 19, 0, 3, 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', '100038005189', 0, 1, 0, 0, 0, 200, 0, 5999.00, NULL, 0, 0, 0, '[11.11 Big Love Sale] Designated iPhone 14 products, limited-time coupon saves 601 yuan!!! Some iPhone products in stock, get a 10 yuan original phone case coupon upon confirming receipt!!! Click now ', '', 5999.00, 1000, 0, '', 208.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/58071/39/19839/119559/63190110Edac0cea7/b62a84f1b8775fef.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img20.360buyimg.com/cms/jfs/t1/138903/36/29400/86115/63190110E0a98c819/d2efbef39eeb2995.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img30.360buyimg.com/cms/jfs/t1/176347/20/28995/115695/63190110Ef5d766f9/aee3d2d866522f66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/120515/39/28721/142961/63190110Eec31e31a/3486d6a065a18ddc.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/30161/12/17674/81508/63190110E1385cf61/f05a2a43f4d304ff.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/100037/16/31071/62177/6319010fE871efe01/b01a6f981c268e38.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/90843/33/25852/74752/63190110E373559f4/74b6b52a3fb08c66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/181914/22/28400/126094/63190110Edefb838c/802a16e758be2b1d.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, 'Apple', 'Mobile phones');
INSERT INTO `pms_product` VALUES (38, 51, 53, 0, 3, 'Apple iPad 10.9-inch Tablet 2022', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', '100044025833', 0, 1, 0, 0, 0, 0, 0, 3599.00, NULL, 0, 0, 0, '[11.11 Big Love Sale] Limited-quantity iPad 9th gen sale, great prices, plus up to 325 yuan trade-in subsidy!! Come and grab it!! ', '', 3599.00, 1000, 0, '', 0.00, 0, '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img12.360buyimg.com/cms/jfs/t1/75040/28/21026/295081/634ed154E981e4d10/2ceef91d6f2b2273.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/191028/1/28802/401291/634ed15eEb234dc40/5ab89f83531e1023.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/32758/24/18599/330590/634ed15eEc3db173c/c52953dc8008a576.jpg!q70.dpg.webp\" /></div>', NULL, NULL, 0, 0, 'Apple', 'Tablet');
INSERT INTO `pms_product` VALUES (39, 6, 54, 0, 13, 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '100023207945', 0, 1, 0, 1, 0, 0, 0, 5599.00, NULL, 0, 0, 0, '[Double 11 Big Sale Is Coming] Up to 1000 off for selected models, up to 1000 yuan trade-in subsidy, post photos to win gifts', '', 5599.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', '', '', '', '<div class=\"ssd-module-mobile-wrap\">\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\"><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_05.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_06.png\" /></div>\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\">&nbsp;</div>\n<div class=\"ssd-module M16534569204241\" data-id=\"M16534569204241\">&nbsp;</div>\n<div class=\"ssd-module M16667778416884\" data-id=\"M16667778416884\">\n<div class=\"ssd-widget-text W16667778440496\">&nbsp;</div>\n</div>\n<div class=\"ssd-module M165303211067557\" data-id=\"M165303211067557\">&nbsp;</div>\n<div class=\"ssd-module M16530320459861\" data-id=\"M16530320459861\">&nbsp;</div>\n<div class=\"ssd-module M16530320460062\" data-id=\"M16530320460062\">&nbsp;</div>\n<div class=\"ssd-module M16530320460153\" data-id=\"M16530320460153\">&nbsp;</div>\n<div class=\"ssd-module M16530320460366\" data-id=\"M16530320460366\">&nbsp;</div>\n<div class=\"ssd-module M16530320460477\" data-id=\"M16530320460477\">&nbsp;</div>\n<div class=\"ssd-module M16530320460578\" data-id=\"M16530320460578\">&nbsp;</div>\n<div class=\"ssd-module M16530320460699\" data-id=\"M16530320460699\">&nbsp;</div>\n<div class=\"ssd-module M165303204608110\" data-id=\"M165303204608110\">&nbsp;</div>\n<div class=\"ssd-module M165303204609511\" data-id=\"M165303204609511\">&nbsp;</div>\n<div class=\"ssd-module M165303204611213\" data-id=\"M165303204611213\">&nbsp;</div>\n<div class=\"ssd-module M165303204612714\" data-id=\"M165303204612714\">&nbsp;</div>\n<div class=\"ssd-module M165303204614115\" data-id=\"M165303204614115\">&nbsp;</div>\n<div class=\"ssd-module M165303204615516\" data-id=\"M165303204615516\">&nbsp;</div>\n<div class=\"ssd-module M165303204617417\" data-id=\"M165303204617417\">&nbsp;</div>\n<div class=\"ssd-module M165303204618818\" data-id=\"M165303204618818\">&nbsp;</div>\n<div class=\"ssd-module M165303204620219\" data-id=\"M165303204620219\">&nbsp;</div>\n<div class=\"ssd-module M165303204621620\" data-id=\"M165303204621620\">&nbsp;</div>\n<div class=\"ssd-module M165303204622921\" data-id=\"M165303204622921\">&nbsp;</div>\n<div class=\"ssd-module M165303204624522\" data-id=\"M165303204624522\">&nbsp;</div>\n<div class=\"ssd-module M165303204626024\" data-id=\"M165303204626024\">&nbsp;</div>\n<div class=\"ssd-module M165303204627525\" data-id=\"M165303204627525\">&nbsp;</div>\n<div class=\"ssd-module M165303204629127\" data-id=\"M165303204629127\">&nbsp;</div>\n<div class=\"ssd-module M165303204632330\" data-id=\"M165303204632330\">&nbsp;</div>\n<div class=\"ssd-module M165303204634031\" data-id=\"M165303204634031\">&nbsp;</div>\n<div class=\"ssd-module M165303204635832\" data-id=\"M165303204635832\">&nbsp;</div>\n<div class=\"ssd-module M165303204637533\" data-id=\"M165303204637533\">&nbsp;</div>\n<div class=\"ssd-module M165303204639334\" data-id=\"M165303204639334\">&nbsp;</div>\n<div class=\"ssd-module M165303204642235\" data-id=\"M165303204642235\">&nbsp;</div>\n<div class=\"ssd-module M165303204647936\" data-id=\"M165303204647936\">&nbsp;</div>\n<div class=\"ssd-module M165303204651037\" data-id=\"M165303204651037\">&nbsp;</div>\n<div class=\"ssd-module M165303204653838\" data-id=\"M165303204653838\">&nbsp;</div>\n<div class=\"ssd-module M165303204656239\" data-id=\"M165303204656239\">&nbsp;</div>\n<div class=\"ssd-module M165303204659141\" data-id=\"M165303204659141\">&nbsp;</div>\n<div class=\"ssd-module M165303204661943\" data-id=\"M165303204661943\">&nbsp;</div>\n<div class=\"ssd-module M165303204665844\" data-id=\"M165303204665844\">&nbsp;</div>\n<div class=\"ssd-module M165303204668045\" data-id=\"M165303204668045\">&nbsp;</div>\n<div class=\"ssd-module M165303204670146\" data-id=\"M165303204670146\">&nbsp;</div>\n<div class=\"ssd-module M165303204672147\" data-id=\"M165303204672147\">&nbsp;</div>\n<div class=\"ssd-module M165303204674348\" data-id=\"M165303204674348\">&nbsp;</div>\n<div class=\"ssd-module M165303204676749\" data-id=\"M165303204676749\">&nbsp;</div>\n<div class=\"ssd-module M165303204681352\" data-id=\"M165303204681352\">&nbsp;</div>\n<div class=\"ssd-module M165303204683553\" data-id=\"M165303204683553\">&nbsp;</div>\n<div class=\"ssd-module M165303204685855\" data-id=\"M165303204685855\">&nbsp;</div>\n<div class=\"ssd-module M165303204688356\" data-id=\"M165303204688356\">&nbsp;</div>\n</div>', NULL, NULL, 0, 0, 'Xiaomi', 'Laptop');
INSERT INTO `pms_product` VALUES (40, 6, 19, 0, 3, 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '100027789721', 0, 1, 0, 1, 0, 0, 0, 2999.00, NULL, 0, 0, 0, 'Dimensity 9000+ processor, 5160mAh large battery, 2K AMOLED ultra-vision screen [Click to buy Xiaomi 11 Ultra, tap here] ', '', 2999.00, 500, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_05.png\" /></p>', NULL, NULL, 0, 4, 'Xiaomi', 'Mobile phones');
INSERT INTO `pms_product` VALUES (41, 6, 19, 0, 3, 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', '100035246702', 0, 1, 0, 0, 0, 0, 0, 2099.00, NULL, 0, 0, 0, '[Quality Goods] Dimensity 8100, 2K flat screen, 5500mAh large battery [Note12 Pro on hot sale] ', '', 2099.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, 'Xiaomi', 'Mobile phones');
INSERT INTO `pms_product` VALUES (42, 3, 19, 0, 3, 'HUAWEI Mate 50 Flat-screen Flagship Ultra-Light XMAGE Imaging BeiDou Satellite Messaging', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', '100035295081', 0, 1, 0, 0, 0, 0, 0, 4999.00, NULL, 0, 0, 0, '[Huawei Mate50 New Launch] Built-in 66W Huawei charging set, Ultra-Light XMAGE imaging,BeiDou satellite messaging, HarmonyOS 3.0! Buy now! Huawei sustainable new-product program, click here》 ', '', 4999.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, 'Huawei', 'Mobile phones');
INSERT INTO `pms_product` VALUES (43, 1, 39, 0, 14, 'Vanward (Vanward)Natural Gas Water Heater for Home, Four-fold Anti-freeze DC Inverter Energy Saving, Newly Upgraded Booster Water Servo Constant Temperature High Wind Resistance', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', '10044060351752', 0, 1, 0, 0, 0, 0, 0, 1799.00, NULL, 0, 0, 0, '[Home appliance 11.11 low prices, final price no more than 1199] [Post a review show to get gifts! Same price guarantee on 11.11, difference refunded] [Best-selling top energy efficiency zero cold water] ', '', 1799.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_16L_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_05.png\" /></p>', NULL, NULL, 0, 0, 'Vanward', 'Kitchen and bath appliances');
INSERT INTO `pms_product` VALUES (44, 2, 55, 0, 15, 'Samsung (SAMSUNG) 500GB SSD Solid State Drive M.2 Interface(NVMe Protocol)', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '100018768480', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '[Full speed, no cache! Draw a 100-yuan E-card in store, some models with 3-installment interest-free] Combines speed and reliability! Read speed up to 3500MB/s, full power mode! Click ', '', 369.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_03.png\" /></p>', NULL, NULL, 0, 0, 'Samsung', 'Hard drive');
INSERT INTO `pms_product` VALUES (45, 21, 19, 0, 3, 'OPPO Reno8 8GB+128GB Iris Purple New Colorway Launch 80W Super Flash Charge 50MP Water-light Portrait Triple Camera', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', '10052147850350', 0, 1, 0, 0, 0, 0, 0, 2299.00, 999.00, 0, 0, 0, '[11.11 Early purchase with price protection, no need to wait for good deals, apply for price protection with one click to get the difference refunded!] [Reno8 Pro Hot Deals] ', '', 2299.00, 1000, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_05.png\" /></p>', '2022-11-09 16:15:50', '2022-11-25 00:00:00', 0, 4, 'OPPO', 'Mobile phones');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(1) NULL DEFAULT NULL COMMENT 'Attribute selection type:0->Unique;1->Single choice;2->Multiple choice',
  `input_type` int(1) NULL DEFAULT NULL COMMENT 'Attribute input method:0->Manual entry;1->Select from list',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Optional value list, separated by commas',
  `sort` int(11) NULL DEFAULT NULL COMMENT 'Sort field: the highest one can upload an image separately',
  `filter_type` int(1) NULL DEFAULT NULL COMMENT 'Category filter style:1->Normal;1->Color',
  `search_type` int(1) NULL DEFAULT NULL COMMENT 'Search type;0->No search needed;1->Keyword search;2->Range search',
  `related_status` int(1) NULL DEFAULT NULL COMMENT 'Whether products with the same attribute are associated;0->Not associated;1->Associate',
  `hand_add_status` int(1) NULL DEFAULT NULL COMMENT 'Whether manual addition is supported;0->Not supported;1->Supports',
  `type` int(1) NULL DEFAULT NULL COMMENT 'Attribute type;0->Specifications;1->Parameters',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product attribute parameter table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, 'Size', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, 'Color', 2, 1, 'Black,Red,White,Pink', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, 'Release year', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, 'Release year 1', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, 'Release year 2', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, 'Release year 3', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, 'Release year 4', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, 'Release year 5', 1, 1, '2013 year,2014 year,2015 year,2016 year,2017 year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, 'Applicable to', 1, 1, 'Young women,Middle-aged women', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, 'Applicable to 1', 2, 1, 'Young women,Middle-aged women', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, 'Applicable to 3', 2, 1, 'Young women,Middle-aged women', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, 'Product number', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, 'Applicable seasons', 1, 1, 'Spring,Summer,Autumn,Winter', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, 'Target audience', 0, 1, 'Elderly,Youth,Middle-aged', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, 'Style', 0, 1, 'Hip-hop style,Volkswagen Basic,Business formal wear', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, 'Color', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, 'Target audience', 1, 1, 'Children,Youth,Middle-aged,Elderly', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, 'Release time', 1, 1, '2017 autumn of year,2017 winter of year,2018 spring of year,2018 summer of year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, 'Sleeve length', 1, 1, 'Short sleeve,Long sleeve,Mid sleeve', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, 'Size', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, 'Applicable scenarios', 0, 1, 'Home living,Sports,Formal wear', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, 'Release time', 0, 1, '2018 spring of year,2018 summer of year', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, 'Color', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, 'Capacity', 0, 1, '16G,32G,64G,128G,256G,512G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, 'Screen size', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, 'Network', 0, 1, '3G,4G,5G,WLAN', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, 'System', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, 'Battery capacity', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 11, 'Color', 0, 1, 'Red,Blue,Green', 0, 1, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (50, 11, 'Size', 0, 1, '38,39,40', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (51, 11, 'Style', 0, 1, 'Summer,Autumn', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (52, 12, 'Size', 0, 1, '50 inch,65 inch,70 inch', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (53, 12, 'Memory', 0, 1, '8G,16G,32G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (54, 12, 'Product number', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (55, 12, 'Product gross weight', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (56, 12, 'Product origin', 0, 1, 'Mainland China,Other', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (57, 12, 'TV type', 0, 1, 'Large screen,Educational TV,4K Ultra HD', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (58, 13, 'Color', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (59, 13, 'Version', 0, 1, 'R7 16G 512,R5 16G 512,I5 16G 512,I7 16G 512', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (60, 13, 'Screen size', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (61, 13, 'Screen resolution', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (62, 13, 'CPU Model', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (63, 14, 'Series', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (64, 14, 'Release time', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (65, 14, 'Gross weight', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (66, 14, 'Rated power', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (67, 15, 'Color', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (68, 15, 'Version', 0, 1, '512GB,1TB', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (69, 15, 'Series', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (70, 15, 'Model', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (71, 15, 'Flash memory type', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (72, 15, 'Sequential read speed', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (73, 15, 'Sequential write', 0, 0, '', 0, 0, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(11) NULL DEFAULT 0 COMMENT 'Attribute count',
  `param_count` int(11) NULL DEFAULT 0 COMMENT 'Parameter count',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product attribute category table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, 'Clothing - T-shirts', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, 'Clothing - Pants', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, 'Mobile and digital - Mobile phones', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, 'Accessories', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (5, 'Home living', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, 'Washing and care', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, 'Test category', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (11, 'Clothing - Shoes and hats', 3, 0);
INSERT INTO `pms_product_attribute_category` VALUES (12, 'Home appliances - TV', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (13, 'Computers and office - Laptops', 2, 3);
INSERT INTO `pms_product_attribute_category` VALUES (14, 'Home appliances - Kitchen and bath appliances', 1, 3);
INSERT INTO `pms_product_attribute_category` VALUES (15, 'Computers and office - Hard drives', 2, 5);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Manually add values for specifications or parameters; parameters take a single value, multiple specification values are separated by commas',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 517 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Table storing product parameter information' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, 'Spring');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, 'Youth');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018 spring of year');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, 'Long sleeve');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, 'Off-white,Light yellow');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, 'Spring');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, 'Youth');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018 spring of year');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, 'Long sleeve');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (243, 30, 7, 'Blue,White');
INSERT INTO `pms_product_attribute_value` VALUES (244, 30, 24, 'HNTBJ2E042A');
INSERT INTO `pms_product_attribute_value` VALUES (245, 30, 25, 'Summer');
INSERT INTO `pms_product_attribute_value` VALUES (246, 30, 37, 'Youth');
INSERT INTO `pms_product_attribute_value` VALUES (247, 30, 38, '2018 summer of year');
INSERT INTO `pms_product_attribute_value` VALUES (248, 30, 39, 'Short sleeve');
INSERT INTO `pms_product_attribute_value` VALUES (249, 31, 7, 'Light gray,Dark gray');
INSERT INTO `pms_product_attribute_value` VALUES (250, 31, 24, 'HNTBJ2E080A');
INSERT INTO `pms_product_attribute_value` VALUES (251, 31, 25, 'Summer');
INSERT INTO `pms_product_attribute_value` VALUES (252, 31, 37, 'Youth');
INSERT INTO `pms_product_attribute_value` VALUES (253, 31, 38, '2018 summer of year');
INSERT INTO `pms_product_attribute_value` VALUES (254, 31, 39, 'Short sleeve');
INSERT INTO `pms_product_attribute_value` VALUES (255, 32, 7, 'Black,White');
INSERT INTO `pms_product_attribute_value` VALUES (256, 32, 24, 'HNTBJ2E153A');
INSERT INTO `pms_product_attribute_value` VALUES (257, 32, 25, 'Summer');
INSERT INTO `pms_product_attribute_value` VALUES (258, 32, 37, 'Youth');
INSERT INTO `pms_product_attribute_value` VALUES (259, 32, 38, '2018 summer of year');
INSERT INTO `pms_product_attribute_value` VALUES (260, 32, 39, 'Short sleeve');
INSERT INTO `pms_product_attribute_value` VALUES (265, 33, 54, '4609652');
INSERT INTO `pms_product_attribute_value` VALUES (266, 33, 55, '28.6kg');
INSERT INTO `pms_product_attribute_value` VALUES (267, 33, 56, 'Mainland China');
INSERT INTO `pms_product_attribute_value` VALUES (268, 33, 57, 'Large screen');
INSERT INTO `pms_product_attribute_value` VALUES (269, 34, 54, '4609660');
INSERT INTO `pms_product_attribute_value` VALUES (270, 34, 55, '30.8kg');
INSERT INTO `pms_product_attribute_value` VALUES (271, 34, 56, 'Mainland China');
INSERT INTO `pms_product_attribute_value` VALUES (272, 34, 57, '4K Ultra HD');
INSERT INTO `pms_product_attribute_value` VALUES (288, 27, 43, 'Black,Blue');
INSERT INTO `pms_product_attribute_value` VALUES (289, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (290, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (291, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (292, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (303, 28, 43, 'Gold,Silver');
INSERT INTO `pms_product_attribute_value` VALUES (304, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (305, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (306, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (307, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (308, 29, 43, 'Gold,Silver');
INSERT INTO `pms_product_attribute_value` VALUES (309, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (310, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (311, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (312, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (338, 37, 43, 'Midnight,Starlight,Purple,Blue');
INSERT INTO `pms_product_attribute_value` VALUES (339, 37, 45, '6.1 inch');
INSERT INTO `pms_product_attribute_value` VALUES (340, 37, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (341, 37, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (342, 37, 48, '3000 mAh');
INSERT INTO `pms_product_attribute_value` VALUES (443, 38, 43, 'Silver,Blue');
INSERT INTO `pms_product_attribute_value` VALUES (444, 38, 45, '10.9 inch');
INSERT INTO `pms_product_attribute_value` VALUES (445, 38, 46, 'WLAN');
INSERT INTO `pms_product_attribute_value` VALUES (446, 38, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (447, 38, 48, '6000 mAh');
INSERT INTO `pms_product_attribute_value` VALUES (448, 39, 58, 'New Xiaomi Pro 14-inch 2.8K Screen,New Redmi Pro 15-inch 3.2K Screen');
INSERT INTO `pms_product_attribute_value` VALUES (449, 39, 60, '15.6 inch');
INSERT INTO `pms_product_attribute_value` VALUES (450, 39, 61, '3200*2000');
INSERT INTO `pms_product_attribute_value` VALUES (451, 39, 62, 'R5 6600H');
INSERT INTO `pms_product_attribute_value` VALUES (452, 41, 43, 'Ink Feather,Silver Trace');
INSERT INTO `pms_product_attribute_value` VALUES (453, 41, 45, '6.67 inch');
INSERT INTO `pms_product_attribute_value` VALUES (454, 41, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (455, 41, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (456, 41, 48, '5500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (457, 42, 43, 'Glossy Black,Frost Silver');
INSERT INTO `pms_product_attribute_value` VALUES (458, 42, 45, '6.7 inch');
INSERT INTO `pms_product_attribute_value` VALUES (459, 42, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (460, 42, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (461, 42, 48, '4460mAh');
INSERT INTO `pms_product_attribute_value` VALUES (462, 43, 63, 'JSQ25-565W13[13L] [Constant Temperature Flagship],JSQ30-565W16[16L] [Constant Temperature Flagship]');
INSERT INTO `pms_product_attribute_value` VALUES (463, 43, 64, '2021-05');
INSERT INTO `pms_product_attribute_value` VALUES (464, 43, 65, '15.5kg');
INSERT INTO `pms_product_attribute_value` VALUES (465, 43, 66, '30w');
INSERT INTO `pms_product_attribute_value` VALUES (466, 44, 67, 'New arrival 980 |NVMe PCIe3.0*4,980 PRO｜NVMe PCIe 4.0');
INSERT INTO `pms_product_attribute_value` VALUES (467, 44, 69, '980');
INSERT INTO `pms_product_attribute_value` VALUES (468, 44, 70, 'MZ-V8V500BW');
INSERT INTO `pms_product_attribute_value` VALUES (469, 44, 71, 'TLC');
INSERT INTO `pms_product_attribute_value` VALUES (470, 44, 72, '3100MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (471, 44, 73, '2600MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (472, 45, 43, 'Iris Purple,Sky Blue');
INSERT INTO `pms_product_attribute_value` VALUES (473, 45, 45, '6.43 inch');
INSERT INTO `pms_product_attribute_value` VALUES (474, 45, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (475, 45, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (476, 45, 48, '4500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (477, 40, 43, 'Black,Blue');
INSERT INTO `pms_product_attribute_value` VALUES (478, 40, 45, '6.73 inch');
INSERT INTO `pms_product_attribute_value` VALUES (479, 40, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (480, 40, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (481, 40, 48, '5160mAh');
INSERT INTO `pms_product_attribute_value` VALUES (512, 26, 43, 'Gold,Silver');
INSERT INTO `pms_product_attribute_value` VALUES (513, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (514, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (515, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (516, 26, 48, '3000');

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT 'Parent category ID: 0 means top-level category',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(1) NULL DEFAULT NULL COMMENT 'Category level:0->1 level;1->2 level',
  `product_count` int(11) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(1) NULL DEFAULT NULL COMMENT 'Whether to show in navigation bar:0->Not displayed;1->Show',
  `show_status` int(1) NULL DEFAULT NULL COMMENT 'Display status:0->Not displayed;1->Show',
  `sort` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Description',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product category' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, 'Clothing', 0, 100, 'pcs', 1, 1, 1, NULL, 'Clothing', 'Clothing categories');
INSERT INTO `pms_product_category` VALUES (2, 0, 'Mobile and digital', 0, 100, 'pcs', 1, 1, 1, NULL, 'Mobile and digital', 'Mobile and digital');
INSERT INTO `pms_product_category` VALUES (3, 0, 'Home appliances', 0, 100, 'pcs', 1, 1, 1, NULL, 'Home appliances', 'Home appliances');
INSERT INTO `pms_product_category` VALUES (4, 0, 'Furniture and home decor', 0, 100, 'pcs', 1, 1, 1, NULL, 'Furniture and home decor', 'Furniture and home decor');
INSERT INTO `pms_product_category` VALUES (5, 0, 'Automotive supplies', 0, 100, 'pcs', 1, 1, 1, NULL, 'Automotive supplies', 'Automotive supplies');
INSERT INTO `pms_product_category` VALUES (7, 1, 'Jacket', 1, 100, 'pcs', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac4780cN6087feb5.jpg', 'Jacket', 'Jacket');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T T-shirt', 1, 100, 'pcs', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47ffaN8a7b2e14.png', 'T T-shirt', 'T T-shirt');
INSERT INTO `pms_product_category` VALUES (9, 1, 'Casual pants', 1, 100, 'pcs', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47845N7374a31d.jpg', 'Casual pants', 'Casual pants');
INSERT INTO `pms_product_category` VALUES (10, 1, 'Jeans', 1, 100, 'pcs', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47841Nff658599.jpg', 'Jeans', 'Jeans');
INSERT INTO `pms_product_category` VALUES (11, 1, 'Shirt', 1, 100, 'pcs', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48007Nb30b2118.jpg', 'Shirt', 'Shirt categories');
INSERT INTO `pms_product_category` VALUES (13, 12, 'Home appliance subcategory 1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, 'Home appliance subcategory 2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, 'Mobile phones', 1, 0, 'pcs', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48d27N3f5bb821.jpg', 'Mobile phones', 'Mobile phones');
INSERT INTO `pms_product_category` VALUES (29, 1, 'Men’s shoes', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, 'Phone accessories', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48672N11cf61fe.jpg', 'Phone accessories', 'Phone accessories');
INSERT INTO `pms_product_category` VALUES (31, 2, 'Photography and videography', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1679f2Nc2f659b6.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, 'Audio and video entertainment', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a167859N01d8198b.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, 'Digital accessories', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1676e9N1ba70a81.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, 'Smart devices', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, 'TV', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f71eN25360979.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, 'Air conditioner', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6f6Ndfe746aa.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, 'Washing machine', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6eaN9ec936de.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, 'Refrigerator', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6c5Ne56d7e26.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, 'Kitchen and bath appliances', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f369N6a55ff3f.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, 'Small kitchen appliances', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, 'Household appliances', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, 'Personal care and health', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, 'Kitchen and bath', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb12cN5ab932bb.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, 'Lighting', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb115Na5705672.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, 'Hardware tools', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28e743Nf6d99998.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, 'Bedroom furniture', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb096N6326e0bd.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, 'Living room furniture', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb080N38c2e7b7.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, 'Brand new complete vehicle', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/ebe31b9cc535e122.png', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, 'Car electronics', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8d2N53bbd2ba.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, 'Repair and maintenance', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8baNbe801af8.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, 'Car accessories', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28ae20N34461e66.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (52, 0, 'Computers and office', 0, 0, 'pcs', 1, 1, 1, '', 'Computers and office', 'Computers and office');
INSERT INTO `pms_product_category` VALUES (53, 52, 'Tablet', 1, 0, 'pcs', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/pad_category_01.jpg', 'Tablet', 'Tablet');
INSERT INTO `pms_product_category` VALUES (54, 52, 'Laptop', 1, 0, 'pcs', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/computer_category_01.jpg', 'Laptop', 'Laptop');
INSERT INTO `pms_product_category` VALUES (55, 52, 'Hard drive', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/ssd_category_01.jpg', 'Hard drive', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between product categories and attributes, used to set category filter conditions (only top-level categories supported)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product full-reduction table(Only for the same product)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (78, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (79, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (83, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (84, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (85, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (87, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (88, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (93, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (96, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (97, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (98, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (104, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (126, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (127, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (128, 41, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (129, 42, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (130, 43, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (131, 44, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (132, 45, 2000.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (133, 40, 2000.00, 200.00);
INSERT INTO `pms_product_full_reduction` VALUES (146, 26, 3000.00, 300.00);
INSERT INTO `pms_product_full_reduction` VALUES (147, 26, 5000.00, 500.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT 'Qualifying product quantity',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Discount',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Price after discount',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product tiered price table(Only for the same product)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (83, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (84, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (88, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (89, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (90, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (92, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (93, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (99, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (100, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (103, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (104, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (110, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (133, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (134, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (135, 41, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (136, 42, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (137, 43, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (138, 44, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (139, 45, 1, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (140, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (147, 26, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(11) NULL DEFAULT NULL COMMENT 'Points awarded',
  `gift_point_new` int(11) NULL DEFAULT NULL,
  `use_point_limit_old` int(11) NULL DEFAULT NULL,
  `use_point_limit_new` int(11) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operator',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Reviewer',
  `status` int(1) NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Feedback details',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product review records' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, 'Verification passed');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, 'Verification passed');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku Code',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT 0 COMMENT 'In stock',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT 'Warning stock',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Display image',
  `sale` int(11) NULL DEFAULT NULL COMMENT 'Sales',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Single-item promotion price',
  `lock_stock` int(11) NULL DEFAULT 0 COMMENT 'Locked stock',
  `sp_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product sales attributes, JSON format',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku Stock of' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 86, NULL, NULL, NULL, NULL, -24, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 99, NULL, NULL, NULL, 4999.00, -8, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, NULL, NULL, 4999.00, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (110, 26, '201806070026001', 3788.00, 487, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (111, 26, '201806070026002', 3999.00, 499, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"Color\",\"value\":\"Gold\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (112, 26, '201806070026003', 3788.00, 500, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (113, 26, '201806070026004', 3999.00, 500, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (163, 36, '202002210036001', 100.00, 100, 25, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (164, 36, '202002210036002', 120.00, 98, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (165, 36, '202002210036003', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (166, 36, '202002210036004', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (167, 36, '202002210036005', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (168, 36, '202002210036006', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (169, 36, '202002210036007', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (170, 36, '202002210036008', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (171, 35, '202002250035001', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (172, 35, '202002250035002', 240.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (173, 35, '202002250035003', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (174, 35, '202002250035004', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Red\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (175, 35, '202002250035005', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (176, 35, '202002250035006', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"38\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (177, 35, '202002250035007', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Summer\"}]');
INSERT INTO `pms_sku_stock` VALUES (178, 35, '202002250035008', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"39\"},{\"key\":\"Style\",\"value\":\"Autumn\"}]');
INSERT INTO `pms_sku_stock` VALUES (179, 30, '202004190030001', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (180, 30, '202004190030002', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (181, 30, '202004190030003', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Size\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (182, 30, '202004190030004', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"White\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (183, 30, '202004190030005', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"White\"},{\"key\":\"Size\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (184, 30, '202004190030006', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"White\"},{\"key\":\"Size\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (185, 31, '202004190031001', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Light gray\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (186, 31, '202004190031002', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Light gray\"},{\"key\":\"Size\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (187, 31, '202004190031003', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Dark gray\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (188, 31, '202004190031004', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Dark gray\"},{\"key\":\"Size\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (189, 32, '202004190032001', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (190, 32, '202004190032002', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Size\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (191, 32, '202004190032003', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"White\"},{\"key\":\"Size\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (192, 32, '202004190032004', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"White\"},{\"key\":\"Size\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (193, 33, '202004190033001', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"50 inch\"},{\"key\":\"Memory\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (194, 33, '202004190033002', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"50 inch\"},{\"key\":\"Memory\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (195, 33, '202004190033003', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"65 inch\"},{\"key\":\"Memory\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (196, 33, '202004190033004', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"65 inch\"},{\"key\":\"Memory\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (197, 34, '202004190034001', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"65 inch\"},{\"key\":\"Memory\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (198, 34, '202004190034002', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"65 inch\"},{\"key\":\"Memory\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (199, 34, '202004190034003', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"70 inch\"},{\"key\":\"Memory\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (200, 34, '202004190034004', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"Size\",\"value\":\"70 inch\"},{\"key\":\"Memory\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (201, 37, '202210280037001', 5999.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 1, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (202, 37, '202210280037002', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (203, 37, '202210280037003', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Midnight\"},{\"key\":\"Capacity\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (204, 37, '202210280037004', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Starlight\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (205, 37, '202210280037005', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Starlight\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (206, 37, '202210280037006', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Starlight\"},{\"key\":\"Capacity\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (207, 37, '202210280037007', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Purple\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (208, 37, '202210280037008', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Purple\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (209, 37, '202210280037009', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Purple\"},{\"key\":\"Capacity\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (210, 37, '202210280037010', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (211, 37, '202210280037011', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (212, 37, '202210280037012', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (213, 38, '202210280038001', 3599.00, 198, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (214, 38, '202210280038002', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (215, 38, '202210280038003', 3599.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (216, 38, '202210280038004', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (217, 39, '202210280039001', 5999.00, 499, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (218, 39, '202210280039002', 5599.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New Xiaomi Pro 14-inch 2.8K Screen\"},{\"key\":\"Version\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (219, 39, '202210280039003', 5499.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New Redmi Pro 15-inch 3.2K Screen\"},{\"key\":\"Version\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (220, 39, '202210280039004', 4999.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New Redmi Pro 15-inch 3.2K Screen\"},{\"key\":\"Version\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (221, 40, '202211040040001', 2999.00, 91, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (222, 40, '202211040040002', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Black\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (223, 40, '202211040040003', 2999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (224, 40, '202211040040004', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Blue\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (225, 41, '202211040041001', 2099.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (226, 41, '202211040041002', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Ink Feather\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (227, 41, '202211040041003', 2099.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver Trace\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (228, 41, '202211040041004', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Silver Trace\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (229, 42, '202211040042001', 4999.00, 99, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Glossy Black\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (230, 42, '202211040042002', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Glossy Black\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (231, 42, '202211040042003', 4999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Frost Silver\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (232, 42, '202211040042004', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Frost Silver\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (233, 43, '202211040043001', 1649.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"Series\",\"value\":\"JSQ25-565W13[13L] [Constant Temperature Flagship]\"}]');
INSERT INTO `pms_sku_stock` VALUES (234, 43, '202211040043002', 1799.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"Series\",\"value\":\"JSQ30-565W16[16L] [Constant Temperature Flagship]\"}]');
INSERT INTO `pms_sku_stock` VALUES (235, 44, '202211080044001', 369.00, 99, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New arrival 980 |NVMe PCIe3.0*4\"},{\"key\":\"Version\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (236, 44, '202211080044002', 649.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"New arrival 980 |NVMe PCIe3.0*4\"},{\"key\":\"Version\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (237, 44, '202211080044003', 549.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"Version\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (238, 44, '202211080044004', 899.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"Version\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (239, 45, '202211080045001', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Iris Purple\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (240, 45, '202211080045002', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Iris Purple\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (241, 45, '202211080045003', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Sky Blue\"},{\"key\":\"Capacity\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (242, 45, '202211080045004', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"Color\",\"value\":\"Sky Blue\"},{\"key\":\"Capacity\",\"value\":\"256G\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT 'Coupon type;0->Storewide coupon;1->Member coupon;2->Shopping coupon;3->Registration coupon',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(1) NULL DEFAULT NULL COMMENT 'Usage platform:0->All;1->Mobile;2->PC',
  `count` int(11) NULL DEFAULT NULL COMMENT 'Quantity',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Amount',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT 'Claim limit per person',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Usage threshold; 0 means no threshold',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `use_type` int(1) NULL DEFAULT NULL COMMENT 'Usage type:0->Valid storewide;1->Specified category;2->Specified products',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Remarks',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT 'Issued quantity',
  `use_count` int(11) NULL DEFAULT NULL COMMENT 'Used quantity',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT 'Claimed quantity',
  `enable_time` datetime NULL DEFAULT NULL COMMENT 'Date on which it can be claimed',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Coupon code',
  `member_level` int(1) NULL DEFAULT NULL COMMENT 'Member types that can claim:0->Unlimited time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Coupon table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (27, 0, 'All-category coupon', 0, 94, 10.00, 10, 100.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 0, NULL, 100, 0, 6, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (28, 0, 'Phone category exclusive coupon', 0, 995, 100.00, 5, 1000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 1, NULL, 1000, 0, 5, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (29, 0, 'iPhone exclusive coupon', 0, 998, 600.00, 1, 4000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (30, 0, 'Xiaomi phone exclusive coupon', 0, 998, 200.00, 1, 2000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (31, 0, 'Limited-time coupon', 0, 999, 20.00, 5, 500.00, '2022-12-01 00:00:00', '2022-12-22 00:00:00', 0, NULL, 1000, 0, 1, '2022-12-23 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Claimer nickname',
  `get_type` int(1) NULL DEFAULT NULL COMMENT 'Get type:0->Granted by admin;1->Actively fetch',
  `create_time` datetime NULL DEFAULT NULL,
  `use_status` int(1) NULL DEFAULT NULL COMMENT 'Usage status:0->Unused;1->Used;2->Expired',
  `use_time` datetime NULL DEFAULT NULL COMMENT 'Usage time',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'Order number',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Order number',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Coupon usage and claim history table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (37, 30, 1, '7806895974110001', 'windir', 1, '2022-11-09 15:14:29', 1, '2022-11-09 15:14:58', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (38, 27, 1, '7872472849240001', 'windir', 1, '2022-11-09 15:25:25', 1, '2022-11-09 15:25:38', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (39, 29, 1, '7876204111480001', 'windir', 1, '2022-11-09 15:26:02', 1, '2022-11-09 15:26:11', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (40, 27, 1, '7911945030190001', 'windir', 1, '2022-11-09 15:31:59', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (41, 28, 1, '8194868687790001', 'windir', 1, '2022-11-09 16:19:09', 1, '2022-11-11 16:12:42', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (42, 28, 1, '1239565720390001', 'test', 1, '2022-12-21 16:46:36', 1, '2022-12-21 16:53:07', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (43, 31, 1, '6030247208280001', 'test', 1, '2022-12-23 09:51:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (44, 28, 1, '6050939443480001', 'test', 1, '2022-12-23 09:55:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (45, 27, 1, '4182437014580001', 'test', 1, '2023-01-10 17:10:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (46, 27, 11, '9011281751500011', 'member', 1, '2023-05-11 15:28:33', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (47, 28, 11, '9011495851370011', 'member', 1, '2023-05-11 15:28:35', 1, '2023-05-11 15:37:16', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (48, 30, 11, '9011677197430011', 'member', 1, '2023-05-11 15:28:37', 1, '2023-05-11 15:28:56', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (49, 27, 11, '9046676666610011', 'member', 1, '2023-05-11 15:34:27', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (50, 28, 11, '9046909751910011', 'member', 1, '2023-05-11 15:34:29', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (51, 29, 11, '9047077722990011', 'member', 1, '2023-05-11 15:34:31', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (52, 27, 11, '9075818288630011', 'member', 1, '2023-05-11 15:39:18', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product category name',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Parent category name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between coupons and product categories' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES (11, 28, 19, 'Mobile phones', 'Mobile and digital');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product name',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Product code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between coupons and products' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (18, 29, 37, 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', '100038005189');
INSERT INTO `sms_coupon_product_relation` VALUES (19, 29, 29, 'Apple iPhone 8 Plus 64GB Red Special Edition China Mobile/Unicom/Telecom 4G Phone', '7437799');
INSERT INTO `sms_coupon_product_relation` VALUES (21, 30, 41, 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery Ink Feather 12GB+256GB 5G Smartphone Xiaomi Redmi', '100035246702');
INSERT INTO `sms_coupon_product_relation` VALUES (22, 30, 40, 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', '100027789721');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Flash sale time slot name',
  `start_date` date NULL DEFAULT NULL COMMENT 'Start date',
  `end_date` date NULL DEFAULT NULL COMMENT 'End date',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Online/offline status',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Flash sale table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (14, 'Double 11 special sale', '2022-11-09', '2023-12-31', 1, '2022-11-09 14:56:48');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime NULL DEFAULT NULL COMMENT 'Member subscription time',
  `send_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Flash sale notification record' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `flash_promotion_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) NULL DEFAULT NULL COMMENT 'No.',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Flash sale price',
  `flash_promotion_count` int(11) NULL DEFAULT NULL COMMENT 'Flash sale quantity',
  `flash_promotion_limit` int(11) NULL DEFAULT NULL COMMENT 'Purchase limit per person',
  `sort` int(11) NULL DEFAULT NULL COMMENT 'Sort',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between product flash sales and products' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (21, 14, 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 14, 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 14, 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (24, 14, 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 14, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 14, 2, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (27, 14, 2, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (28, 14, 2, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (29, 14, 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (30, 14, 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (31, 14, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (32, 14, 3, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (33, 14, 4, 37, 5699.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (34, 14, 4, 38, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (35, 14, 4, 39, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (36, 14, 4, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 14, 5, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 14, 5, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 14, 5, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 14, 5, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 14, 5, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 14, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 14, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (44, 14, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (45, 14, 6, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (46, 14, 6, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (47, 14, 7, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (48, 14, 7, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (49, 14, 7, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (50, 14, 7, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (51, 14, 7, 35, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Session name',
  `start_time` time NULL DEFAULT NULL COMMENT 'Daily start time',
  `end_time` time NULL DEFAULT NULL COMMENT 'Daily end time',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Enabled status:0->Not enabled;1->Enable',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Flash sale session table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '10:00:00', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:00', '22:00:00', 1, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT 'Carousel position:0->PC Home carousel;1->app Home carousel',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT 'Online/offline status:0->Offline;1->Online',
  `click_count` int(11) NULL DEFAULT NULL COMMENT 'Click count',
  `order_count` int(11) NULL DEFAULT NULL COMMENT 'Orders placed',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Link URL',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Remarks',
  `sort` int(11) NULL DEFAULT 0 COMMENT 'Sort',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Home carousel ad table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (2, 'Summer hot sale promotion', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', 0, 0, 0, NULL, 'Summer hot sale promotion', 0);
INSERT INTO `sms_home_advertise` VALUES (3, 'Summer hot sale promotion 1', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, 'Summer hot sale promotion 1', 0);
INSERT INTO `sms_home_advertise` VALUES (4, 'Summer hot sale promotion 2', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad2.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, 'Summer hot sale promotion 2', 0);
INSERT INTO `sms_home_advertise` VALUES (9, 'Movie recommendation ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'www.baidu.com', 'Movie recommendation ad', 100);
INSERT INTO `sms_home_advertise` VALUES (10, 'Car promotion ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (11, 'Car recommended ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 0, 0, 0, 'xxx', NULL, 98);
INSERT INTO `sms_home_advertise` VALUES (12, 'Xiaomi recommended ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '2022-11-08 17:04:03', '2023-11-08 17:04:05', 1, 0, 0, '/pages/brand/brandDetail?id=6', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (13, 'Huawei recommended ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '2022-11-08 17:10:27', '2023-11-08 17:10:28', 1, 0, 0, '/pages/brand/brandDetail?id=3', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (14, 'Apple recommended ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '2022-11-08 17:12:54', '2023-11-08 17:12:55', 1, 0, 0, '/pages/brand/brandDetail?id=51', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (15, 'Samsung recommended ad', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '2022-11-08 17:15:38', '2023-11-08 17:15:39', 1, 0, 0, '/pages/brand/brandDetail?id=2', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (16, 'OPPO Recommended ads', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', '2022-11-08 17:20:10', '2023-11-08 17:20:11', 1, 0, 0, '/pages/brand/brandDetail?id=21', NULL, 0);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Home recommended brand table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (6, 6, 'Xiaomi', 1, 300);
INSERT INTO `sms_home_brand` VALUES (32, 50, 'Heilan Home', 1, 198);
INSERT INTO `sms_home_brand` VALUES (33, 51, 'Apple', 1, 199);
INSERT INTO `sms_home_brand` VALUES (34, 2, 'Samsung', 1, 195);
INSERT INTO `sms_home_brand` VALUES (35, 3, 'Huawei', 1, 200);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 197);
INSERT INTO `sms_home_brand` VALUES (45, 1, 'Vanward', 1, 0);
INSERT INTO `sms_home_brand` VALUES (46, 5, 'Fotile', 1, 0);
INSERT INTO `sms_home_brand` VALUES (47, 4, 'Gree', 1, 0);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Fresh picks table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (19, 37, 'Apple iPhone 14 (A2884) 128GB Supports China Mobile/Unicom/Telecom 5G Dual SIM Dual Standby Phone', 1, 197);
INSERT INTO `sms_home_new_product` VALUES (20, 38, 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (21, 39, 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop(New R5-6600H Standard Voltage 16G 512G win11)', 1, 198);
INSERT INTO `sms_home_new_product` VALUES (22, 40, 'Xiaomi 12 Pro Dimensity Edition Dimensity 9000+ Processor 50MP Fast Imaging 2K Ultra-vision Screen 120Hz High Refresh 67W Fast Charge 12GB+256GB Black 5G Phone', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (23, 41, 'Redmi K50 Dimensity 8100 2K Flexible Flat Screen OIS Optical Stabilization 67W Fast Charge 5500mAh Large Battery Ink Feather 12GB+256GB 5G Smartphone Xiaomi Redmi', 1, 199);
INSERT INTO `sms_home_new_product` VALUES (24, 42, 'HUAWEI Mate 50 Flat-screen Flagship Ultra-Light XMAGE Imaging BeiDou Satellite Messaging Low-battery Emergency Mode 128GB Glossy Black Huawei HarmonyOS Phone', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (25, 44, 'Samsung (SAMSUNG) 500GB SSD Solid State Drive M.2 Interface(NVMe Protocol) 980 (MZ-V8V500BW)', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (26, 45, 'OPPO Reno8 8GB+128GB Iris Purple New Colorway Launch 80W Super Flash Charge 50MP Water-light Portrait Triple Camera 32MP Front Sony Lens 5G Phone', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (27, 43, 'Vanward (Vanward)Natural Gas Water Heater for Home, Four-fold Anti-freeze DC Inverter Energy Saving, Newly Upgraded Booster Water Servo Constant Temperature High Wind Resistance JSQ30-565W16 [16L] [Constant Temperature Flagship]', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Popular recommended product table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (10, 38, 'Apple iPad 10.9-inch Tablet 2022 (64GB WLAN / A14 chip / 12MP / iPadOS MPQ03CH/A)', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (11, 39, 'Xiaomi Book Pro 14 2022 Ryzen Edition 2.8K Ultra-clear Master Screen High-end Thin and Light Laptop(New R5-6600H Standard Voltage 16G 512G win11)', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (12, 44, 'Samsung (SAMSUNG) 500GB SSD Solid State Drive M.2 Interface(NVMe Protocol) 980 (MZ-V8V500BW)', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (13, 43, 'Vanward (Vanward)Natural Gas Water Heater for Home, Four-fold Anti-freeze DC Inverter Energy Saving, Newly Upgraded Booster Water Servo Constant Temperature High Wind Resistance JSQ30-565W16 [16L] [Constant Temperature Flagship]', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (14, 45, 'OPPO Reno8 8GB+128GB Iris Purple New Colorway Launch 80W Super Flash Charge 50MP Water-light Portrait Triple Camera 32MP Front Sony Lens 5G Phone', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Home recommended topic table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo Shirts are stylish too', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, 'Big-brand phones at low prices', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, 'Snapdragon 845 new launch', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, 'What to wear in summer', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, 'Summer picks', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, 'Brand phone price cuts', 1, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Avatar',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nickname',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Remarks',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `login_time` datetime NULL DEFAULT NULL COMMENT 'Last login time',
  `status` int(1) NULL DEFAULT 1 COMMENT 'Account enabled status:0->Disabled;1->Enable',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin user table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 'test@qq.com', 'Test account', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'admin@163.com', 'System administrator', 'System administrator', '2018-10-08 13:32:47', '2019-04-20 12:45:16', 1);
INSERT INTO `ums_admin` VALUES (4, 'macro', '$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'macro@qq.com', 'macro', 'macro Dedicated', '2019-10-06 15:53:51', '2020-02-03 14:55:55', 1);
INSERT INTO `ums_admin` VALUES (6, 'productAdmin', '$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 'product@qq.com', 'Product admin', 'Product permission only', '2020-02-07 16:15:08', NULL, 1);
INSERT INTO `ums_admin` VALUES (7, 'orderAdmin', '$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_04.png', 'order@qq.com', 'Order admin', 'Order management permission only', '2020-02-07 16:15:50', NULL, 1);
INSERT INTO `ums_admin` VALUES (8, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:45:42', NULL, 1);
INSERT INTO `ums_admin` VALUES (9, 'test256', '$2a$10$kTMBrt8mkXcO8T4eHThFWOf3KuNK6tqevkiAf4YbtXtaCJ6ocYkJa', 'string', 'abc@qq.com', 'string', 'string', '2022-08-07 14:52:57', NULL, 1);
INSERT INTO `ums_admin` VALUES (10, 'test1267', '$2a$10$VUywDhXVPY13YZxMD/uPWeDqkzSozN7o8u/3MX6sBig2NK2VaTJZ2', NULL, 'test1267@qq.com', 'test1267', 'test1267', '2023-01-04 16:13:34', NULL, 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Browser login type',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 413 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin user login log table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (1, 3, '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (2, 3, '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (3, 3, '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (4, 3, '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 1, '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 1, '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 3, '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 3, '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 3, '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 3, '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 3, '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, 3, '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 4, '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 4, '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 4, '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 4, '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 4, '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 3, '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 3, '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 3, '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, 3, '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, 3, '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, 3, '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, 3, '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, 6, '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, 3, '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, 3, '2019-11-30 21:25:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, 3, '2019-11-30 21:27:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, 3, '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, 3, '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, 3, '2020-01-04 16:00:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, 3, '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, 3, '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, 3, '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, 3, '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, 3, '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, 3, '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, 3, '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, 3, '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, 3, '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, 3, '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, 3, '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, 3, '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, 3, '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, 3, '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, 3, '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, 3, '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (74, 3, '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, 3, '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (76, 3, '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, 3, '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (78, 3, '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (79, 3, '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (80, 3, '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (81, 3, '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (82, 3, '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (83, 3, '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (84, 3, '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (85, 3, '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (86, 3, '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (87, 3, '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (88, 3, '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (89, 3, '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (90, 3, '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (91, 3, '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (92, 3, '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (93, 3, '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (94, 3, '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (95, 3, '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (96, 3, '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (97, 3, '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (98, 3, '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (99, 3, '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (100, 3, '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (101, 3, '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (102, 3, '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (103, 3, '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (104, 3, '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (105, 3, '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (106, 3, '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (107, 3, '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (108, 3, '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (109, 3, '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (110, 3, '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (111, 3, '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (112, 3, '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (113, 3, '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (114, 3, '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (115, 3, '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (116, 3, '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (117, 3, '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (118, 5, '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (119, 5, '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (120, 5, '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (121, 3, '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (122, 5, '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (123, 3, '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (124, 3, '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (125, 5, '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (126, 3, '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (127, 1, '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (128, 3, '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (129, 3, '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (130, 3, '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (131, 3, '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (132, 3, '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (133, 4, '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (134, 3, '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (135, 3, '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (136, 3, '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (137, 3, '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (138, 1, '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (139, 3, '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (140, 3, '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (141, 3, '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (142, 3, '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (143, 3, '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (144, 3, '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (145, 3, '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (146, 6, '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (147, 7, '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (148, 3, '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (149, 7, '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (150, 3, '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (151, 3, '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (152, 3, '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (153, 3, '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (154, 3, '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (155, 3, '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (156, 3, '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (157, 3, '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (158, 3, '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (159, 3, '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (160, 3, '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (161, 3, '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (162, 3, '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (163, 3, '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (164, 6, '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (165, 6, '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (166, 6, '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (167, 6, '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (168, 3, '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (169, 6, '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (170, 3, '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (171, 3, '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (172, 3, '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (173, 3, '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (174, 3, '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (175, 3, '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (176, 3, '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (177, 3, '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (178, 3, '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (179, 3, '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (180, 6, '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (181, 6, '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (182, 3, '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (183, 3, '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (184, 8, '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (185, 8, '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (186, 8, '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (187, 8, '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (188, 8, '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (189, 8, '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (190, 8, '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (191, 8, '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (192, 8, '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (193, 3, '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (194, 3, '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (195, 3, '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (196, 3, '2020-03-07 16:33:59', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (197, 6, '2020-03-07 16:35:38', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (198, 3, '2020-03-07 17:00:09', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (199, 3, '2020-03-14 14:32:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (200, 8, '2020-03-14 14:32:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (201, 3, '2020-03-14 14:33:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (202, 8, '2020-03-14 14:34:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (203, 3, '2020-03-14 14:35:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (204, 8, '2020-03-14 14:36:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (205, 3, '2020-03-14 14:36:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (206, 8, '2020-03-14 14:37:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (207, 3, '2020-03-14 14:37:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (208, 8, '2020-03-14 14:38:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (209, 3, '2020-03-14 14:38:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (210, 8, '2020-03-14 14:39:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (211, 3, '2020-03-14 14:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (212, 3, '2020-03-15 14:23:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (213, 3, '2020-03-22 14:33:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (214, 3, '2020-03-22 14:59:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (215, 3, '2020-03-22 15:04:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (216, 3, '2020-03-29 16:14:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (217, 3, '2020-03-29 17:17:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (218, 3, '2020-04-06 16:54:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (219, 3, '2020-04-12 15:01:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (220, 3, '2020-04-19 09:50:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (221, 3, '2020-05-04 10:45:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (222, 3, '2020-05-05 11:02:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (223, 3, '2020-05-16 15:17:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (224, 3, '2020-05-17 14:58:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (225, 3, '2020-05-18 15:47:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (226, 3, '2020-05-23 16:51:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (227, 3, '2020-05-23 16:54:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (228, 3, '2020-05-23 17:00:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (229, 3, '2020-05-24 10:38:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (230, 3, '2020-06-07 09:39:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (231, 3, '2020-06-14 14:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (232, 3, '2020-06-14 17:11:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (233, 3, '2020-06-20 14:53:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (234, 3, '2020-06-21 14:57:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (235, 3, '2020-06-27 10:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (236, 3, '2020-07-05 15:54:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (237, 3, '2020-07-11 10:40:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (238, 3, '2020-07-11 10:45:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (239, 3, '2020-07-19 11:00:16', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (240, 3, '2020-07-19 11:46:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (241, 3, '2020-07-19 11:53:47', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (242, 3, '2020-07-19 14:17:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (243, 3, '2020-07-19 14:44:24', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (244, 3, '2020-07-19 14:44:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (245, 3, '2020-07-19 14:48:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (246, 3, '2020-07-19 14:48:57', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (247, 3, '2020-07-19 14:49:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (248, 3, '2020-07-19 14:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (249, 3, '2020-07-19 14:51:51', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (250, 3, '2020-07-19 14:55:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (251, 3, '2020-07-19 14:58:14', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (252, 6, '2020-07-19 15:04:21', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (253, 3, '2020-07-19 15:38:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (254, 6, '2020-07-19 16:26:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (255, 3, '2020-08-08 10:39:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (256, 3, '2020-08-09 11:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (257, 3, '2020-08-10 20:41:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (258, 3, '2020-08-15 10:12:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (259, 1, '2020-08-19 21:23:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (260, 1, '2020-08-19 21:25:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (261, 3, '2020-09-05 16:14:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (262, 3, '2020-09-05 16:15:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (263, 3, '2020-09-12 16:07:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (264, 6, '2020-09-12 16:08:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (265, 1, '2020-09-12 16:08:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (266, 6, '2020-09-12 16:09:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (267, 1, '2020-09-12 16:09:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (268, 3, '2020-09-13 14:22:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (269, 3, '2020-09-13 14:23:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (270, 3, '2020-09-13 14:24:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (271, 3, '2020-09-13 14:32:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (272, 1, '2020-09-19 15:43:31', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (273, 3, '2020-09-19 15:43:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (274, 3, '2020-09-19 15:49:44', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (275, 6, '2020-09-19 15:50:12', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (276, 6, '2020-09-19 15:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (277, 1, '2020-09-19 15:50:41', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (278, 6, '2020-09-19 15:52:28', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (279, 1, '2020-09-19 15:53:01', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (280, 1, '2020-09-19 15:53:48', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (281, 6, '2020-09-19 15:54:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (282, 3, '2020-09-20 11:13:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (283, 1, '2020-10-08 14:26:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (284, 1, '2020-10-08 14:30:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (285, 3, '2021-04-11 10:27:43', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (286, 1, '2021-04-11 10:29:19', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (287, 3, '2021-04-11 10:30:40', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (288, 3, '2021-04-11 10:37:50', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (289, 3, '2021-12-08 10:44:09', '192.168.3.4', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (290, 3, '2022-04-15 15:04:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (291, 1, '2022-05-10 15:25:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (292, 1, '2022-05-10 15:31:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (293, 1, '2022-05-10 15:32:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (294, 1, '2022-05-10 15:34:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (295, 1, '2022-05-10 15:34:38', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (296, 1, '2022-05-10 15:54:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (297, 1, '2022-05-10 16:31:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (298, 1, '2022-05-10 16:33:45', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (299, 1, '2022-05-10 16:39:07', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (300, 1, '2022-05-18 14:53:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (301, 3, '2022-06-07 17:28:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (302, 3, '2022-06-08 09:48:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (303, 3, '2022-06-08 10:34:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (304, 3, '2022-06-08 17:09:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (305, 3, '2022-06-08 17:10:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (306, 6, '2022-06-08 17:10:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (307, 3, '2022-06-08 17:23:05', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (308, 3, '2022-06-08 17:30:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (309, 3, '2022-06-08 17:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (310, 3, '2022-06-08 17:31:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (311, 3, '2022-06-08 21:03:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (312, 3, '2022-06-09 10:41:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (313, 3, '2022-06-09 15:18:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (314, 3, '2022-06-10 15:43:15', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (315, 3, '2022-06-10 15:52:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (316, 3, '2022-06-15 14:41:59', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (317, 3, '2022-06-23 16:24:09', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (318, 3, '2022-06-23 16:41:33', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (319, 3, '2022-06-23 16:42:50', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (320, 3, '2022-06-23 16:42:51', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (321, 3, '2022-06-23 16:42:52', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (322, 3, '2022-06-23 16:42:53', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (323, 3, '2022-06-23 16:43:07', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (324, 3, '2022-06-23 16:44:56', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (325, 3, '2022-06-23 16:45:42', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (326, 3, '2022-06-23 16:50:08', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (327, 3, '2022-06-24 15:19:04', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (328, 3, '2022-06-24 15:25:52', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (329, 3, '2022-06-24 15:40:29', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (330, 3, '2022-06-25 15:13:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (331, 3, '2022-06-25 15:25:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (332, 3, '2022-06-27 16:38:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (333, 3, '2022-07-24 10:10:06', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (334, 1, '2022-07-25 17:15:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (335, 3, '2022-07-27 09:41:32', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (336, 1, '2022-07-28 16:56:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (337, 1, '2022-07-28 16:56:25', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (338, 8, '2022-08-07 14:46:00', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (339, 9, '2022-08-07 14:53:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (340, 9, '2022-08-07 14:53:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (341, 9, '2022-08-07 14:56:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (342, 1, '2022-08-09 10:53:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (343, 1, '2022-08-09 10:54:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (344, 1, '2022-08-09 11:00:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (345, 1, '2022-08-09 11:02:04', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (346, 1, '2022-08-09 15:48:14', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (347, 1, '2022-08-16 16:35:24', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (348, 1, '2022-08-17 15:03:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (349, 1, '2022-08-20 16:49:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (350, 1, '2022-08-23 14:54:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (351, 1, '2022-08-31 17:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (352, 3, '2022-10-14 15:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (353, 3, '2022-10-14 15:42:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (354, 3, '2022-10-14 15:44:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (355, 3, '2022-10-14 15:46:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (356, 3, '2022-10-14 15:46:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (357, 3, '2022-10-14 16:06:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (358, 3, '2022-10-14 16:24:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (359, 3, '2022-10-17 16:44:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (360, 3, '2022-10-17 16:49:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (361, 3, '2022-10-17 16:49:53', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (362, 3, '2022-10-17 17:03:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (363, 3, '2022-10-17 17:03:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (364, 3, '2022-10-17 21:00:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (365, 3, '2022-10-24 16:32:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (366, 3, '2022-10-26 16:31:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (367, 3, '2022-10-26 16:50:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (368, 3, '2022-10-26 16:52:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (369, 3, '2022-10-27 17:21:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (370, 3, '2022-10-28 10:52:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (371, 3, '2022-11-04 16:09:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (372, 3, '2022-11-08 10:27:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (373, 3, '2022-11-09 10:42:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (374, 3, '2022-11-10 15:03:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (375, 3, '2022-11-11 10:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (376, 3, '2022-11-14 16:33:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (377, 3, '2022-11-15 10:54:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (378, 3, '2022-11-15 15:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (379, 3, '2022-11-15 15:17:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (380, 3, '2022-11-15 15:17:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (381, 1, '2022-11-15 15:19:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (382, 3, '2022-11-15 15:20:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (383, 3, '2022-11-15 15:22:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (384, 3, '2022-11-16 10:39:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (385, 1, '2022-11-24 20:02:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (386, 3, '2022-11-28 15:24:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (387, 3, '2022-11-30 09:34:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (388, 3, '2022-12-05 09:43:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (389, 3, '2022-12-09 17:18:09', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (390, 3, '2022-12-15 14:53:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (391, 3, '2022-12-15 16:11:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (392, 3, '2022-12-20 15:55:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (393, 3, '2022-12-21 14:49:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (394, 3, '2022-12-23 09:49:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (395, 3, '2023-01-04 10:17:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (396, 3, '2023-01-04 15:28:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (397, 3, '2023-01-05 10:13:43', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (398, 3, '2023-01-06 09:49:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (399, 3, '2023-01-06 10:04:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (400, 3, '2023-01-06 10:07:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (401, 3, '2023-01-06 16:21:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (402, 3, '2023-01-09 16:50:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (403, 3, '2023-01-10 10:05:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (404, 3, '2023-01-10 17:09:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (405, 3, '2023-01-11 10:17:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (406, 3, '2023-01-13 09:35:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (407, 3, '2023-01-13 09:40:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (408, 3, '2023-01-31 10:46:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (409, 3, '2023-02-08 17:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (410, 3, '2023-02-09 15:46:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (411, 3, '2023-02-10 17:23:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (412, 3, '2023-05-11 15:29:54', '192.168.56.1', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between admin users and permissions(Additional or subtracted permissions beyond those defined in the role)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between admin users and roles' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (26, 3, 5);
INSERT INTO `ums_admin_role_relation` VALUES (27, 6, 1);
INSERT INTO `ums_admin_role_relation` VALUES (28, 7, 2);
INSERT INTO `ums_admin_role_relation` VALUES (29, 1, 5);
INSERT INTO `ums_admin_role_relation` VALUES (30, 4, 5);
INSERT INTO `ums_admin_role_relation` VALUES (31, 8, 1);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT 'Change type:0->Add;1->Decrease',
  `change_count` int(11) NULL DEFAULT NULL COMMENT 'Points change amount',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operator',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operation remarks',
  `source_type` int(1) NULL DEFAULT NULL COMMENT 'Points source:0->Shopping;1->Modified by admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Growth value change history table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', 'For testing', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT 'Change type:0->Add;1->Decrease',
  `change_count` int(11) NULL DEFAULT NULL COMMENT 'Points change amount',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operator',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Operation remarks',
  `source_type` int(1) NULL DEFAULT NULL COMMENT 'Points source:0->Shopping;1->Modified by admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Points change history table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) NULL DEFAULT NULL COMMENT 'Points needed to deduct each yuan',
  `max_percent_per_order` int(11) NULL DEFAULT NULL COMMENT 'Maximum deduction percentage per order',
  `use_unit` int(11) NULL DEFAULT NULL COMMENT 'Minimum unit of points per use 100',
  `coupon_status` int(1) NULL DEFAULT NULL COMMENT 'Whether it can be combined with coupons;0->Not allowed;1->Allowed',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Points consumption settings' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Username',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Password',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nickname',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Phone number',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Account enabled status:0->Disabled;1->Enable',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Registration time',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Avatar',
  `gender` int(1) NULL DEFAULT NULL COMMENT 'Gender:0->Unknown;1->Male;2->Female',
  `birthday` date NULL DEFAULT NULL COMMENT 'Birthday',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'City',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Occupation',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Signature',
  `source_type` int(1) NULL DEFAULT NULL COMMENT 'User source',
  `integration` int(11) NULL DEFAULT NULL COMMENT 'Points',
  `growth` int(11) NULL DEFAULT NULL COMMENT 'Growth value',
  `luckey_count` int(11) NULL DEFAULT NULL COMMENT 'Remaining draws',
  `history_integration` int(11) NULL DEFAULT NULL COMMENT 'Historical points quantity',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 4, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'test', '18061581849', 1, '2018-08-02 10:35:44', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 1, '2009-06-01', 'Shanghai', 'Student', 'test', NULL, 3900, 1000, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (10, 4, 'guest', '$2a$10$WQiD4RzEs1iJVWU.2HVu8OdSlExJHWKmwndaw3SUfMyqfKZmXe1vq', NULL, '18911111111', 1, '2020-03-14 14:52:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (11, 4, 'member', '$2a$10$Q08uzqvtPj61NnpYQZsVvOnyilJ3AU4VdngAcJFGvPhEeqhhC.hhS', 'member', '18961511111', 1, '2023-05-11 15:22:38', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '2009-06-01', 'Shanghai', 'Student', 'member', NULL, 5000, 1000, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(11) NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT 'Whether default level:0->No;1->Yes',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Free shipping threshold',
  `comment_growth_point` int(11) NULL DEFAULT NULL COMMENT 'Growth value earned per review',
  `priviledge_free_freight` int(1) NULL DEFAULT NULL COMMENT 'Whether it has free shipping privilege',
  `priviledge_sign_in` int(1) NULL DEFAULT NULL COMMENT 'Whether it has check-in privilege',
  `priviledge_comment` int(1) NULL DEFAULT NULL COMMENT 'Whether it has review reward privilege',
  `priviledge_promotion` int(1) NULL DEFAULT NULL COMMENT 'Whether it has exclusive activity privilege',
  `priviledge_member_price` int(1) NULL DEFAULT NULL COMMENT 'Whether it has member price privilege',
  `priviledge_birthday` int(1) NULL DEFAULT NULL COMMENT 'Whether it has birthday privilege',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member level table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, 'Gold member', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, 'Platinum member', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, 'Diamond member', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, 'Regular member', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` int(1) NULL DEFAULT NULL COMMENT 'Login type:0->PC; 1->android;2->ios;3->Mini program',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member login record' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `tag_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between users and tags' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between members and product categories (categories the user likes)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Recipient name',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT 'Whether default',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Postal code',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Province/Municipality',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'City',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'District',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Detailed address(Street)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member shipping address table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, 'Big Pear', '18033441849', 0, '518000', 'Guangdong Province', 'Shenzhen', 'Nanshan District', 'Kexing Science Park');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, 'Big Pear', '18033441849', 0, '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, 'Big Pear', '18033441849', 1, '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict');
INSERT INTO `ums_member_receive_address` VALUES (5, 11, 'Xiao Li', '18961511111', 1, '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Dongxiao Subdistrict');
INSERT INTO `ums_member_receive_address` VALUES (6, 11, 'Xiao Li', '18961511111', NULL, '518000', 'Guangdong Province', 'Shenzhen', 'Futian District', 'Qingshuihe Subdistrict');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) NULL DEFAULT NULL COMMENT 'Consecutive check-in days',
  `continue_sign_point` int(11) NULL DEFAULT NULL COMMENT 'Amount awarded for consecutive check-in',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Earn 1 point for every this many yuan spent',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Minimum order amount to earn points',
  `max_point_per_order` int(11) NULL DEFAULT NULL COMMENT 'Maximum points per order',
  `type` int(1) NULL DEFAULT NULL COMMENT 'Type:0->Points rules;1->Growth value rules',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member points growth rule table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Cumulative spending amount',
  `order_count` int(11) NULL DEFAULT NULL COMMENT 'Order quantity',
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT 'Coupon quantity',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT 'Review count',
  `return_order_count` int(11) NULL DEFAULT NULL COMMENT 'Return quantity',
  `login_count` int(11) NULL DEFAULT NULL COMMENT 'Login count',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT 'Follow count',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT 'Follower count',
  `collect_product_count` int(11) NULL DEFAULT NULL,
  `collect_subject_count` int(11) NULL DEFAULT NULL,
  `collect_topic_count` int(11) NULL DEFAULT NULL,
  `collect_comment_count` int(11) NULL DEFAULT NULL,
  `invite_friend_count` int(11) NULL DEFAULT NULL,
  `recent_order_time` datetime NULL DEFAULT NULL COMMENT 'Time of last order',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member statistics' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(11) NULL DEFAULT NULL COMMENT 'Number of orders auto-tagged as completed',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Amount of orders auto-tagged as completed',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'User tag table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth` int(11) NULL DEFAULT NULL COMMENT 'Growth value awarded',
  `intergration` int(11) NULL DEFAULT NULL COMMENT 'Points awarded',
  `type` int(1) NULL DEFAULT NULL COMMENT 'Task type:0->Newcomer task;1->Daily tasks',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Member task table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT 'Parent ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Menu name',
  `level` int(4) NULL DEFAULT NULL COMMENT 'Menu level',
  `sort` int(4) NULL DEFAULT NULL COMMENT 'Menu sort',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Frontend name',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Frontend icon',
  `hidden` int(1) NULL DEFAULT NULL COMMENT 'Frontend hidden',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin menu table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, 0, '2020-02-02 14:50:36', 'Product', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '2020-02-02 14:51:50', 'Product list', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (3, 1, '2020-02-02 14:52:44', 'Add product', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` VALUES (4, 1, '2020-02-02 14:53:51', 'Product category', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` VALUES (5, 1, '2020-02-02 14:54:51', 'Product type', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` VALUES (6, 1, '2020-02-02 14:56:29', 'Brand management', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (7, 0, '2020-02-02 16:54:07', 'Order', 0, 0, 'oms', 'order', 0);
INSERT INTO `ums_menu` VALUES (8, 7, '2020-02-02 16:55:18', 'Order list', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (9, 7, '2020-02-02 16:56:46', 'Order settings', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` VALUES (10, 7, '2020-02-02 16:57:39', 'Return request handling', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` VALUES (11, 7, '2020-02-02 16:59:40', 'Return reason settings', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` VALUES (12, 0, '2020-02-04 16:18:00', 'Marketing', 0, 0, 'sms', 'sms', 0);
INSERT INTO `ums_menu` VALUES (13, 12, '2020-02-04 16:19:22', 'Flash sale activity list', 1, 0, 'flash', 'sms-flash', 0);
INSERT INTO `ums_menu` VALUES (14, 12, '2020-02-04 16:20:16', 'Coupon list', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` VALUES (16, 12, '2020-02-07 16:22:38', 'Brand recommendation', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (17, 12, '2020-02-07 16:23:14', 'New arrival recommendations', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` VALUES (18, 12, '2020-02-07 16:26:38', 'Popular recommendations', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` VALUES (19, 12, '2020-02-07 16:28:16', 'Topic recommendation', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` VALUES (20, 12, '2020-02-07 16:28:42', 'Ad list', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` VALUES (21, 0, '2020-02-07 16:29:13', 'Permission', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` VALUES (22, 21, '2020-02-07 16:29:51', 'User list', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` VALUES (23, 21, '2020-02-07 16:30:13', 'Role list', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` VALUES (24, 21, '2020-02-07 16:30:53', 'Menu list', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` VALUES (25, 21, '2020-02-07 16:31:13', 'Resource list', 1, 0, 'resource', 'ums-resource', 0);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT 'Parent permission id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Permission value',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `type` int(1) NULL DEFAULT NULL COMMENT 'Permission type:0->Directory;1->Menu;2->Button (API-bound permission)',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Frontend resource path',
  `status` int(1) NULL DEFAULT NULL COMMENT 'Enabled status;0->Disabled;1->Enable',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `sort` int(11) NULL DEFAULT NULL COMMENT 'Sort',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin user permission table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, 'Product', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, 'Product list', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, 'Add product', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, 'Product category', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, 'Product type', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, 'Brand management', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, 'Edit product', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, 'Delete product', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, 'Add product category', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, 'Modify product category', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, 'Delete product category', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, 'Add product type', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, 'Modify product type', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, 'Delete product type', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, 'Add brand', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, 'Modify brand', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, 'Delete brand', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, 'Home', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Resource name',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Resource URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Description',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT 'Resource category ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin resource table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55', 'Product brand management', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35', 'Product attribute category management', '/productAttribute/category/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13', 'Product attribute management', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15', 'Product category management', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16', 'Product management', '/product/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53', 'Product stock management', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37', 'Order management', '/order/**', '', 2);
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22', ' Order return request management', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08', 'Return reason management', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43', 'Order settings management', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23', 'Shipping address management', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22', 'Coupon management', '/coupon/**', '', 3);
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59', 'Coupon claim record management', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28', 'Flash sale activity management', '/flash/**', '', 3);
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59', 'Flash sale product relation management', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22', 'Flash sale session management', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07', 'Home carousel ad management', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34', 'Home brand management', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06', 'Home new arrival management', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16', 'Home popular recommendation management', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (22, '2020-02-07 16:42:48', 'Home topic recommendation management', '/home/recommendSubject/**', '', 3);
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56', ' Preferred product management', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39', 'Product topic management', '/subject/**', '', 5);
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34', 'Admin user management', '/admin/**', '', 4);
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24', 'Admin user role management', '/role/**', '', 4);
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48', 'Admin menu management', '/menu/**', '', 4);
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18', 'Admin resource category management', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45', 'Admin resource management', '/resource/**', '', 4);
INSERT INTO `ums_resource` VALUES (30, '2020-09-19 15:47:57', 'Member level management', '/memberLevel/**', '', 7);
INSERT INTO `ums_resource` VALUES (31, '2020-09-19 15:51:29', 'Get logged-in user info', '/admin/info', 'Required for user login', 4);
INSERT INTO `ums_resource` VALUES (32, '2020-09-19 15:53:34', 'User logout', '/admin/logout', 'Required for user logout', 4);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Category name',
  `sort` int(4) NULL DEFAULT NULL COMMENT 'Sort',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Resource category table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44', 'Product module', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34', 'Order module', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48', 'Marketing module', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04', 'Permission module', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27', 'Content module', 0);
INSERT INTO `ums_resource_category` VALUES (7, '2020-09-19 15:49:08', 'Other modules', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Description',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT 'Admin user count',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'Creation time',
  `status` int(1) NULL DEFAULT 1 COMMENT 'Enabled status:0->Disabled;1->Enable',
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Admin user role table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, 'Product admin', 'Can only view and operate products', 0, '2020-02-03 16:50:37', 1, 0);
INSERT INTO `ums_role` VALUES (2, 'Order admin', 'Can only view and operate orders', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (5, 'Super admin', 'Has all view and operation permissions', 0, '2020-02-02 15:11:05', 1, 0);

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT 'Role ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT 'Menu ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between admin roles and menus' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES (53, 2, 7);
INSERT INTO `ums_role_menu_relation` VALUES (54, 2, 8);
INSERT INTO `ums_role_menu_relation` VALUES (55, 2, 9);
INSERT INTO `ums_role_menu_relation` VALUES (56, 2, 10);
INSERT INTO `ums_role_menu_relation` VALUES (57, 2, 11);
INSERT INTO `ums_role_menu_relation` VALUES (72, 5, 1);
INSERT INTO `ums_role_menu_relation` VALUES (73, 5, 2);
INSERT INTO `ums_role_menu_relation` VALUES (74, 5, 3);
INSERT INTO `ums_role_menu_relation` VALUES (75, 5, 4);
INSERT INTO `ums_role_menu_relation` VALUES (76, 5, 5);
INSERT INTO `ums_role_menu_relation` VALUES (77, 5, 6);
INSERT INTO `ums_role_menu_relation` VALUES (78, 5, 7);
INSERT INTO `ums_role_menu_relation` VALUES (79, 5, 8);
INSERT INTO `ums_role_menu_relation` VALUES (80, 5, 9);
INSERT INTO `ums_role_menu_relation` VALUES (81, 5, 10);
INSERT INTO `ums_role_menu_relation` VALUES (82, 5, 11);
INSERT INTO `ums_role_menu_relation` VALUES (83, 5, 12);
INSERT INTO `ums_role_menu_relation` VALUES (84, 5, 13);
INSERT INTO `ums_role_menu_relation` VALUES (85, 5, 14);
INSERT INTO `ums_role_menu_relation` VALUES (86, 5, 16);
INSERT INTO `ums_role_menu_relation` VALUES (87, 5, 17);
INSERT INTO `ums_role_menu_relation` VALUES (88, 5, 18);
INSERT INTO `ums_role_menu_relation` VALUES (89, 5, 19);
INSERT INTO `ums_role_menu_relation` VALUES (90, 5, 20);
INSERT INTO `ums_role_menu_relation` VALUES (91, 5, 21);
INSERT INTO `ums_role_menu_relation` VALUES (92, 5, 22);
INSERT INTO `ums_role_menu_relation` VALUES (93, 5, 23);
INSERT INTO `ums_role_menu_relation` VALUES (94, 5, 24);
INSERT INTO `ums_role_menu_relation` VALUES (95, 5, 25);
INSERT INTO `ums_role_menu_relation` VALUES (121, 1, 1);
INSERT INTO `ums_role_menu_relation` VALUES (122, 1, 2);
INSERT INTO `ums_role_menu_relation` VALUES (123, 1, 3);
INSERT INTO `ums_role_menu_relation` VALUES (124, 1, 4);
INSERT INTO `ums_role_menu_relation` VALUES (125, 1, 5);
INSERT INTO `ums_role_menu_relation` VALUES (126, 1, 6);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between admin user roles and permissions' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT 'Role ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT 'Resource ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Relation table between admin roles and resources' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES (194, 5, 1);
INSERT INTO `ums_role_resource_relation` VALUES (195, 5, 2);
INSERT INTO `ums_role_resource_relation` VALUES (196, 5, 3);
INSERT INTO `ums_role_resource_relation` VALUES (197, 5, 4);
INSERT INTO `ums_role_resource_relation` VALUES (198, 5, 5);
INSERT INTO `ums_role_resource_relation` VALUES (199, 5, 6);
INSERT INTO `ums_role_resource_relation` VALUES (200, 5, 8);
INSERT INTO `ums_role_resource_relation` VALUES (201, 5, 9);
INSERT INTO `ums_role_resource_relation` VALUES (202, 5, 10);
INSERT INTO `ums_role_resource_relation` VALUES (203, 5, 11);
INSERT INTO `ums_role_resource_relation` VALUES (204, 5, 12);
INSERT INTO `ums_role_resource_relation` VALUES (205, 5, 13);
INSERT INTO `ums_role_resource_relation` VALUES (206, 5, 14);
INSERT INTO `ums_role_resource_relation` VALUES (207, 5, 15);
INSERT INTO `ums_role_resource_relation` VALUES (208, 5, 16);
INSERT INTO `ums_role_resource_relation` VALUES (209, 5, 17);
INSERT INTO `ums_role_resource_relation` VALUES (210, 5, 18);
INSERT INTO `ums_role_resource_relation` VALUES (211, 5, 19);
INSERT INTO `ums_role_resource_relation` VALUES (212, 5, 20);
INSERT INTO `ums_role_resource_relation` VALUES (213, 5, 21);
INSERT INTO `ums_role_resource_relation` VALUES (214, 5, 22);
INSERT INTO `ums_role_resource_relation` VALUES (215, 5, 23);
INSERT INTO `ums_role_resource_relation` VALUES (216, 5, 24);
INSERT INTO `ums_role_resource_relation` VALUES (217, 5, 25);
INSERT INTO `ums_role_resource_relation` VALUES (218, 5, 26);
INSERT INTO `ums_role_resource_relation` VALUES (219, 5, 27);
INSERT INTO `ums_role_resource_relation` VALUES (220, 5, 28);
INSERT INTO `ums_role_resource_relation` VALUES (221, 5, 29);
INSERT INTO `ums_role_resource_relation` VALUES (222, 5, 30);
INSERT INTO `ums_role_resource_relation` VALUES (232, 2, 8);
INSERT INTO `ums_role_resource_relation` VALUES (233, 2, 9);
INSERT INTO `ums_role_resource_relation` VALUES (234, 2, 10);
INSERT INTO `ums_role_resource_relation` VALUES (235, 2, 11);
INSERT INTO `ums_role_resource_relation` VALUES (236, 2, 12);
INSERT INTO `ums_role_resource_relation` VALUES (237, 2, 31);
INSERT INTO `ums_role_resource_relation` VALUES (238, 2, 32);
INSERT INTO `ums_role_resource_relation` VALUES (239, 1, 1);
INSERT INTO `ums_role_resource_relation` VALUES (240, 1, 2);
INSERT INTO `ums_role_resource_relation` VALUES (241, 1, 3);
INSERT INTO `ums_role_resource_relation` VALUES (242, 1, 4);
INSERT INTO `ums_role_resource_relation` VALUES (243, 1, 5);
INSERT INTO `ums_role_resource_relation` VALUES (244, 1, 6);
INSERT INTO `ums_role_resource_relation` VALUES (245, 1, 23);
INSERT INTO `ums_role_resource_relation` VALUES (246, 1, 24);
INSERT INTO `ums_role_resource_relation` VALUES (247, 1, 31);
INSERT INTO `ums_role_resource_relation` VALUES (248, 1, 32);

SET FOREIGN_KEY_CHECKS = 1;
