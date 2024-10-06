/*
 Navicat Premium Data Transfer

 Source Server         : 本地链接
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:3306
 Source Schema         : poetize

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 03/10/2024 11:48:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for im_chat_group
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group`;
CREATE TABLE `im_chat_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群名称',
  `master_user_id` int(11) NOT NULL COMMENT '群主用户ID',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群头像',
  `introduction` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `notice` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告',
  `in_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '进入方式[0:无需验证，1:需要群主或管理员同意]',
  `group_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '类型[1:聊天群，2:话题]',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for im_chat_group_user
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_group_user`;
CREATE TABLE `im_chat_group_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(11) NOT NULL COMMENT '群ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `verify_user_id` int(11) NULL DEFAULT NULL COMMENT '审核用户ID',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `admin_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否管理员[0:否，1:是]',
  `user_status` tinyint(2) NOT NULL COMMENT '用户状态[0:未审核，1:审核通过，2:禁言]',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天群成员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for im_chat_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_friend`;
CREATE TABLE `im_chat_user_friend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `friend_id` int(11) NOT NULL COMMENT '好友ID',
  `friend_status` tinyint(2) NOT NULL COMMENT '朋友状态[0:未审核，1:审核通过]',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '好友' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for im_chat_user_group_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_group_message`;
CREATE TABLE `im_chat_user_group_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(11) NOT NULL COMMENT '群ID',
  `from_id` int(11) NOT NULL COMMENT '发送ID',
  `to_id` int(11) NULL DEFAULT NULL COMMENT '接收ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群聊记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for im_chat_user_message
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_user_message`;
CREATE TABLE `im_chat_user_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `from_id` int(11) NOT NULL COMMENT '发送ID',
  `to_id` int(11) NOT NULL COMMENT '接收ID',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `message_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读[0:未读，1:已读]',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `union_index`(`to_id`, `message_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单聊记录' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
