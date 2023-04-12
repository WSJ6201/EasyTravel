/*
 Navicat Premium Data Transfer

 Source Server         : localMysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : easytravel

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 11/03/2023 12:35:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/picture1.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/picture2.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/picture3.jpg');

-- ----------------------------
-- Table structure for discussjiaotongxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussjiaotongxinxi`;
CREATE TABLE `discussjiaotongxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交通信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussjiaotongxinxi
-- ----------------------------
INSERT INTO `discussjiaotongxinxi` VALUES (141, '2022-03-12 15:35:31', 1, 1, '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discussjiaotongxinxi` VALUES (142, '2022-03-12 15:35:31', 2, 2, '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discussjiaotongxinxi` VALUES (143, '2022-03-12 15:35:31', 3, 3, '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discussjiaotongxinxi` VALUES (144, '2022-03-12 15:35:31', 4, 4, '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discussjiaotongxinxi` VALUES (145, '2022-03-12 15:35:31', 5, 5, '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discussjiaotongxinxi` VALUES (146, '2022-03-12 15:35:31', 6, 6, '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for discussjingdianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussjingdianxinxi`;
CREATE TABLE `discussjingdianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '景点信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussjingdianxinxi
-- ----------------------------
INSERT INTO `discussjingdianxinxi` VALUES (101, '2022-03-12 15:35:31', 1, 1, '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discussjingdianxinxi` VALUES (102, '2022-03-12 15:35:31', 2, 2, '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discussjingdianxinxi` VALUES (103, '2022-03-12 15:35:31', 3, 3, '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discussjingdianxinxi` VALUES (104, '2022-03-12 15:35:31', 4, 4, '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discussjingdianxinxi` VALUES (105, '2022-03-12 15:35:31', 5, 5, '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discussjingdianxinxi` VALUES (106, '2022-03-12 15:35:31', 6, 6, '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for discussjiudianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussjiudianxinxi`;
CREATE TABLE `discussjiudianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussjiudianxinxi
-- ----------------------------
INSERT INTO `discussjiudianxinxi` VALUES (131, '2022-03-12 15:35:31', 1, 1, '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discussjiudianxinxi` VALUES (132, '2022-03-12 15:35:31', 2, 2, '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discussjiudianxinxi` VALUES (133, '2022-03-12 15:35:31', 3, 3, '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discussjiudianxinxi` VALUES (134, '2022-03-12 15:35:31', 4, 4, '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discussjiudianxinxi` VALUES (135, '2022-03-12 15:35:31', 5, 5, '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discussjiudianxinxi` VALUES (136, '2022-03-12 15:35:31', 6, 6, '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for discussmeishixinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussmeishixinxi`;
CREATE TABLE `discussmeishixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '美食信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussmeishixinxi
-- ----------------------------
INSERT INTO `discussmeishixinxi` VALUES (111, '2022-03-12 15:35:31', 1, 1, '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discussmeishixinxi` VALUES (112, '2022-03-12 15:35:31', 2, 2, '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discussmeishixinxi` VALUES (113, '2022-03-12 15:35:31', 3, 3, '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discussmeishixinxi` VALUES (114, '2022-03-12 15:35:31', 4, 4, '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discussmeishixinxi` VALUES (115, '2022-03-12 15:35:31', 5, 5, '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discussmeishixinxi` VALUES (116, '2022-03-12 15:35:31', 6, 6, '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for discusstechanxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discusstechanxinxi`;
CREATE TABLE `discusstechanxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '特产信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discusstechanxinxi
-- ----------------------------
INSERT INTO `discusstechanxinxi` VALUES (121, '2022-03-12 15:35:31', 1, 1, '用户名1', '评论内容1', '回复内容1');
INSERT INTO `discusstechanxinxi` VALUES (122, '2022-03-12 15:35:31', 2, 2, '用户名2', '评论内容2', '回复内容2');
INSERT INTO `discusstechanxinxi` VALUES (123, '2022-03-12 15:35:31', 3, 3, '用户名3', '评论内容3', '回复内容3');
INSERT INTO `discusstechanxinxi` VALUES (124, '2022-03-12 15:35:31', 4, 4, '用户名4', '评论内容4', '回复内容4');
INSERT INTO `discusstechanxinxi` VALUES (125, '2022-03-12 15:35:31', 5, 5, '用户名5', '评论内容5', '回复内容5');
INSERT INTO `discusstechanxinxi` VALUES (126, '2022-03-12 15:35:31', 6, 6, '用户名6', '评论内容6', '回复内容6');

-- ----------------------------
-- Table structure for jiaotongxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jiaotongxinxi`;
CREATE TABLE `jiaotongxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `mingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `fangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方式',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `chengshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `dianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `wangzhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `jiaotongjieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交通介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交通信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiaotongxinxi
-- ----------------------------
INSERT INTO `jiaotongxinxi` VALUES (61, '2022-03-12 15:35:31', '名称1', '飞机', 'upload/jiaotongxinxi_tupian1.jpg', '城市1', '电话1', '网址1', '交通介绍1');
INSERT INTO `jiaotongxinxi` VALUES (62, '2022-03-12 15:35:31', '名称2', '飞机', 'upload/jiaotongxinxi_tupian2.jpg', '城市2', '电话2', '网址2', '交通介绍2');
INSERT INTO `jiaotongxinxi` VALUES (63, '2022-03-12 15:35:31', '名称3', '飞机', 'upload/jiaotongxinxi_tupian3.jpg', '城市3', '电话3', '网址3', '交通介绍3');
INSERT INTO `jiaotongxinxi` VALUES (64, '2022-03-12 15:35:31', '名称4', '飞机', 'upload/jiaotongxinxi_tupian4.jpg', '城市4', '电话4', '网址4', '交通介绍4');
INSERT INTO `jiaotongxinxi` VALUES (65, '2022-03-12 15:35:31', '名称5', '飞机', 'upload/jiaotongxinxi_tupian5.jpg', '城市5', '电话5', '网址5', '交通介绍5');
INSERT INTO `jiaotongxinxi` VALUES (66, '2022-03-12 15:35:31', '名称6', '飞机', 'upload/jiaotongxinxi_tupian6.jpg', '城市6', '电话6', '网址6', '交通介绍6');

-- ----------------------------
-- Table structure for jingdianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jingdianxinxi`;
CREATE TABLE `jingdianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `jingdianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `jingdianleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点类型',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `jingdianshipin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点视频',
  `kaifangshijian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放时间',
  `fuwudianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务电话',
  `suozaichengshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `xiangxidizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `jingdianjieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '景点介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '景点信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jingdianxinxi
-- ----------------------------
INSERT INTO `jingdianxinxi` VALUES (21, '2022-03-12 15:35:31', '景点名称1', '自然生态', 'upload/jingdianxinxi_tupian1.jpg', '', '开放时间1', '020-89819991', '所在城市1', '详细地址1', '景点介绍1');
INSERT INTO `jingdianxinxi` VALUES (22, '2022-03-12 15:35:31', '景点名称2', '自然生态', 'upload/jingdianxinxi_tupian2.jpg', '', '开放时间2', '020-89819992', '所在城市2', '详细地址2', '景点介绍2');
INSERT INTO `jingdianxinxi` VALUES (23, '2022-03-12 15:35:31', '景点名称3', '自然生态', 'upload/jingdianxinxi_tupian3.jpg', '', '开放时间3', '020-89819993', '所在城市3', '详细地址3', '景点介绍3');
INSERT INTO `jingdianxinxi` VALUES (24, '2022-03-12 15:35:31', '景点名称4', '自然生态', 'upload/jingdianxinxi_tupian4.jpg', '', '开放时间4', '020-89819994', '所在城市4', '详细地址4', '景点介绍4');
INSERT INTO `jingdianxinxi` VALUES (25, '2022-03-12 15:35:31', '景点名称5', '自然生态', 'upload/jingdianxinxi_tupian5.jpg', '', '开放时间5', '020-89819995', '所在城市5', '详细地址5', '景点介绍5');
INSERT INTO `jingdianxinxi` VALUES (26, '2022-03-12 15:35:31', '景点名称6', '自然生态', 'upload/jingdianxinxi_tupian6.jpg', '', '开放时间6', '020-89819996', '所在城市6', '详细地址6', '景点介绍6');

-- ----------------------------
-- Table structure for jiudianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jiudianxinxi`;
CREATE TABLE `jiudianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `jiudianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名称',
  `jiudianleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店类型',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `junjia` int(11) NOT NULL COMMENT '均价',
  `chengshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `jiudianweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店位置',
  `jiudianxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '酒店详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiudianxinxi
-- ----------------------------
INSERT INTO `jiudianxinxi` VALUES (51, '2022-03-12 15:35:31', '酒店名称1', '星级酒店', 'upload/jiudianxinxi_tupian1.jpg', 1, '城市1', '酒店位置1', '酒店详情1');
INSERT INTO `jiudianxinxi` VALUES (52, '2022-03-12 15:35:31', '酒店名称2', '星级酒店', 'upload/jiudianxinxi_tupian2.jpg', 2, '城市2', '酒店位置2', '酒店详情2');
INSERT INTO `jiudianxinxi` VALUES (53, '2022-03-12 15:35:31', '酒店名称3', '星级酒店', 'upload/jiudianxinxi_tupian3.jpg', 3, '城市3', '酒店位置3', '酒店详情3');
INSERT INTO `jiudianxinxi` VALUES (54, '2022-03-12 15:35:31', '酒店名称4', '星级酒店', 'upload/jiudianxinxi_tupian4.jpg', 4, '城市4', '酒店位置4', '酒店详情4');
INSERT INTO `jiudianxinxi` VALUES (55, '2022-03-12 15:35:31', '酒店名称5', '星级酒店', 'upload/jiudianxinxi_tupian5.jpg', 5, '城市5', '酒店位置5', '酒店详情5');
INSERT INTO `jiudianxinxi` VALUES (56, '2022-03-12 15:35:31', '酒店名称6', '星级酒店', 'upload/jiudianxinxi_tupian6.jpg', 6, '城市6', '酒店位置6', '酒店详情6');

-- ----------------------------
-- Table structure for meishixinxi
-- ----------------------------
DROP TABLE IF EXISTS `meishixinxi`;
CREATE TABLE `meishixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `meishimingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食名称',
  `meishileixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食类型',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `suozaichengshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `xiangxidizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `meishixiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '美食详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '美食信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meishixinxi
-- ----------------------------
INSERT INTO `meishixinxi` VALUES (31, '2022-03-12 15:35:31', '美食名称1', '陕北', 'upload/meishixinxi_tupian1.jpg', '所在城市1', '详细地址1', '美食详情1');
INSERT INTO `meishixinxi` VALUES (32, '2022-03-12 15:35:31', '美食名称2', '陕北', 'upload/meishixinxi_tupian2.jpg', '所在城市2', '详细地址2', '美食详情2');
INSERT INTO `meishixinxi` VALUES (33, '2022-03-12 15:35:31', '美食名称3', '陕北', 'upload/meishixinxi_tupian3.jpg', '所在城市3', '详细地址3', '美食详情3');
INSERT INTO `meishixinxi` VALUES (34, '2022-03-12 15:35:31', '美食名称4', '陕北', 'upload/meishixinxi_tupian4.jpg', '所在城市4', '详细地址4', '美食详情4');
INSERT INTO `meishixinxi` VALUES (35, '2022-03-12 15:35:31', '美食名称5', '陕北', 'upload/meishixinxi_tupian5.jpg', '所在城市5', '详细地址5', '美食详情5');
INSERT INTO `meishixinxi` VALUES (36, '2022-03-12 15:35:31', '美食名称6', '陕北', 'upload/meishixinxi_tupian6.jpg', '所在城市6', '详细地址6', '美食详情6');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `cpicture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言图片',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `rpicture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (91, '2022-03-12 15:35:31', 1, '用户名1', '留言内容1', 'upload/messages_cpicture1.jpg', '回复内容1', 'upload/messages_rpicture1.jpg');
INSERT INTO `messages` VALUES (92, '2022-03-12 15:35:31', 2, '用户名2', '留言内容2', 'upload/messages_cpicture2.jpg', '回复内容2', 'upload/messages_rpicture2.jpg');
INSERT INTO `messages` VALUES (93, '2022-03-12 15:35:31', 3, '用户名3', '留言内容3', 'upload/messages_cpicture3.jpg', '回复内容3', 'upload/messages_rpicture3.jpg');
INSERT INTO `messages` VALUES (94, '2022-03-12 15:35:31', 4, '用户名4', '留言内容4', 'upload/messages_cpicture4.jpg', '回复内容4', 'upload/messages_rpicture4.jpg');
INSERT INTO `messages` VALUES (95, '2022-03-12 15:35:31', 5, '用户名5', '留言内容5', 'upload/messages_cpicture5.jpg', '回复内容5', 'upload/messages_rpicture5.jpg');
INSERT INTO `messages` VALUES (96, '2022-03-12 15:35:31', 6, '用户名6', '留言内容6', 'upload/messages_cpicture6.jpg', '回复内容6', 'upload/messages_rpicture6.jpg');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (81, '2022-03-12 15:35:31', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/news_picture1.jpg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `news` VALUES (82, '2022-03-12 15:35:31', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/news_picture2.jpg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES (83, '2022-03-12 15:35:31', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture3.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES (84, '2022-03-12 15:35:31', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/news_picture4.jpg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news` VALUES (85, '2022-03-12 15:35:31', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/news_picture5.jpg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `news` VALUES (86, '2022-03-12 15:35:31', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture6.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏图片',
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for techanxinxi
-- ----------------------------
DROP TABLE IF EXISTS `techanxinxi`;
CREATE TABLE `techanxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `techanmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特产名称',
  `techanleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '特产类型',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `suozaichengshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在城市',
  `xiangxidizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `techanjieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特产介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '特产信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of techanxinxi
-- ----------------------------
INSERT INTO `techanxinxi` VALUES (41, '2022-03-12 15:35:31', '特产名称1', '当地特产', 'upload/techanxinxi_tupian1.jpg', '所在城市1', '详细地址1', '特产介绍1');
INSERT INTO `techanxinxi` VALUES (42, '2022-03-12 15:35:31', '特产名称2', '当地特产', 'upload/techanxinxi_tupian2.jpg', '所在城市2', '详细地址2', '特产介绍2');
INSERT INTO `techanxinxi` VALUES (43, '2022-03-12 15:35:31', '特产名称3', '当地特产', 'upload/techanxinxi_tupian3.jpg', '所在城市3', '详细地址3', '特产介绍3');
INSERT INTO `techanxinxi` VALUES (44, '2022-03-12 15:35:31', '特产名称4', '当地特产', 'upload/techanxinxi_tupian4.jpg', '所在城市4', '详细地址4', '特产介绍4');
INSERT INTO `techanxinxi` VALUES (45, '2022-03-12 15:35:31', '特产名称5', '当地特产', 'upload/techanxinxi_tupian5.jpg', '所在城市5', '详细地址5', '特产介绍5');
INSERT INTO `techanxinxi` VALUES (46, '2022-03-12 15:35:31', '特产名称6', '当地特产', 'upload/techanxinxi_tupian6.jpg', '所在城市6', '详细地址6', '特产介绍6');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'abo', 'abo', '管理员', '2022-03-12 15:35:31');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `youxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `shouji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuming`(`yonghuming`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2022-03-12 15:35:31', '用户名1', '123456', '姓名1', '男', 'upload/yonghu_touxiang1.jpg', '773890001@qq.com', '13823888881');
INSERT INTO `yonghu` VALUES (12, '2022-03-12 15:35:31', '用户名2', '123456', '姓名2', '男', 'upload/yonghu_touxiang2.jpg', '773890002@qq.com', '13823888882');
INSERT INTO `yonghu` VALUES (13, '2022-03-12 15:35:31', '用户名3', '123456', '姓名3', '男', 'upload/yonghu_touxiang3.jpg', '773890003@qq.com', '13823888883');
INSERT INTO `yonghu` VALUES (14, '2022-03-12 15:35:31', '用户名4', '123456', '姓名4', '男', 'upload/yonghu_touxiang4.jpg', '773890004@qq.com', '13823888884');
INSERT INTO `yonghu` VALUES (15, '2022-03-12 15:35:31', '用户名5', '123456', '姓名5', '男', 'upload/yonghu_touxiang5.jpg', '773890005@qq.com', '13823888885');
INSERT INTO `yonghu` VALUES (16, '2022-03-12 15:35:31', '用户名6', '123456', '姓名6', '男', 'upload/yonghu_touxiang6.jpg', '773890006@qq.com', '13823888886');

SET FOREIGN_KEY_CHECKS = 1;
