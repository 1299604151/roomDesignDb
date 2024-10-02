/*
 Navicat Premium Data Transfer

 Source Server         : 本地链接
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:3306
 Source Schema         : ruoyi_vue

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 26/08/2024 09:01:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for farmer
-- ----------------------------
DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `group_id` int(11) NOT NULL COMMENT '所属学习小组组号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1827872384732995590 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '农民信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
