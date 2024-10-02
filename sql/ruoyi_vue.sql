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

 Date: 29/09/2024 17:05:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `course_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程描述',
  `venue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授课场地',
  `class_time` datetime NULL DEFAULT NULL COMMENT '授课时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (10, '123', '12', '3123', '123', '2024-08-26 20:04:18');
INSERT INTO `course` VALUES (11, '123123', '123', '123', '123', '2024-08-26 20:17:55');
INSERT INTO `course` VALUES (12, 'test', 'test', '123', '123', '2024-08-26 21:54:13');
INSERT INTO `course` VALUES (13, '123123333', '最新的课程', '123123', '长阳区', '2024-08-26 22:04:13');

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `course_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程编号',
  `class_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选课信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_selection
-- ----------------------------
INSERT INTO `course_selection` VALUES (7, '123123', '123123', '2024-08-26 20:17:55');
INSERT INTO `course_selection` VALUES (8, '456456', '123', '2024-08-26 20:04:18');
INSERT INTO `course_selection` VALUES (9, '123123', '123', '2024-08-26 20:04:18');
INSERT INTO `course_selection` VALUES (11, '789789', 'test', '2024-08-26 21:54:13');
INSERT INTO `course_selection` VALUES (12, '789789', '123', '2024-08-26 20:04:18');
INSERT INTO `course_selection` VALUES (13, '789789', '123123', '2024-08-26 20:17:55');

-- ----------------------------
-- Table structure for farmer
-- ----------------------------
DROP TABLE IF EXISTS `farmer`;
CREATE TABLE `farmer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `gender` int(11) NOT NULL COMMENT '性别 0 男 1 女',
  `age` int(11) NOT NULL COMMENT '年龄',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `group_id` int(11) NOT NULL COMMENT '所属学习小组组号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '农民信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of farmer
-- ----------------------------
INSERT INTO `farmer` VALUES (14, '123123', 0, 11, '123123', 123123123, 23);
INSERT INTO `farmer` VALUES (15, '456456', 0, 11, '456456', 123123123, 24);
INSERT INTO `farmer` VALUES (16, '789789', 0, 11, '小明', 1333, 26);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'farmer', '农民信息表', NULL, NULL, 'Farmer', 'crud', '', 'com.ruoyi.system', 'system', 'farmer', '农民信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:42:12', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'technician', '技术员信息表', NULL, NULL, 'Technician', 'crud', '', 'com.ruoyi.system', 'system', 'technician', '技术员信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:43:45', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'course', '课程信息表', NULL, NULL, 'Course', 'crud', '', 'com.ruoyi.system', 'system', 'course', '课程信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:43:51', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'venue', '场地信息表', NULL, NULL, 'Venue', 'crud', '', 'com.ruoyi.system', 'system', 'venue', '场地信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:43:57', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'course_selection', '选课信息表', NULL, NULL, 'CourseSelection', 'crud', '', 'com.ruoyi.system', 'system', 'selection', '选课信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:44:21', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'teaching_record', '授课信息表', NULL, NULL, 'TeachingRecord', 'crud', '', 'com.ruoyi.system', 'system', 'record', '授课信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:44:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'schedule', '排班信息表', NULL, NULL, 'Schedule', 'crud', '', 'com.ruoyi.system', 'system', 'schedule', '排班信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:44:37', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'study_group', '学习小组信息表', NULL, NULL, 'StudyGroup', 'crud', '', 'com.ruoyi.system', 'system', 'group', '学习小组信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-08-25 22:47:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (2, 1, 'student_id', '学号', 'varchar(20)', 'String', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (3, 1, 'gender', '性别', 'enum(\'男\',\'女\')', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 3, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (4, 1, 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (5, 1, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (6, 1, 'group_id', '所属学习小组组号', 'int(11)', 'Long', 'groupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-25 22:42:12', '', '2024-08-25 22:42:21');
INSERT INTO `gen_table_column` VALUES (7, 2, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (8, 2, 'employee_id', '工号', 'varchar(20)', 'String', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (9, 2, 'gender', '性别', 'enum(\'男\',\'女\')', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 3, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (10, 2, 'age', '年龄', 'int(11)', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (11, 2, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (12, 2, 'title', '职称', 'varchar(50)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (13, 2, 'speciality', '专长', 'varchar(100)', 'String', 'speciality', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-25 22:43:45', '', '2024-08-25 22:47:42');
INSERT INTO `gen_table_column` VALUES (14, 3, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (15, 3, 'course_id', '课程编号', 'varchar(20)', 'String', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (16, 3, 'course_name', '课程名称', 'varchar(100)', 'String', 'courseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (17, 3, 'course_description', '课程描述', 'text', 'String', 'courseDescription', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (18, 3, 'venue', '授课场地', 'varchar(100)', 'String', 'venue', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (19, 3, 'class_time', '授课时间', 'datetime', 'Date', 'classTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-08-25 22:43:51', '', '2024-08-25 22:47:44');
INSERT INTO `gen_table_column` VALUES (20, 4, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:43:57', '', '2024-08-25 22:47:45');
INSERT INTO `gen_table_column` VALUES (21, 4, 'venue_id', '场地编号', 'varchar(20)', 'String', 'venueId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:43:57', '', '2024-08-25 22:47:45');
INSERT INTO `gen_table_column` VALUES (22, 4, 'location', '场地位置', 'varchar(100)', 'String', 'location', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-25 22:43:57', '', '2024-08-25 22:47:45');
INSERT INTO `gen_table_column` VALUES (23, 4, 'capacity', '场地容量', 'int(11)', 'Long', 'capacity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-25 22:43:57', '', '2024-08-25 22:47:45');
INSERT INTO `gen_table_column` VALUES (24, 4, 'status', '场地状态（是否被占用）', 'enum(\'空闲\',\'占用\')', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-08-25 22:43:57', '', '2024-08-25 22:47:45');
INSERT INTO `gen_table_column` VALUES (25, 5, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:44:21', '', '2024-08-25 22:47:46');
INSERT INTO `gen_table_column` VALUES (26, 5, 'student_id', '学号', 'varchar(20)', 'String', 'studentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:44:21', '', '2024-08-25 22:47:46');
INSERT INTO `gen_table_column` VALUES (27, 5, 'course_id', '课程编号', 'varchar(20)', 'String', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-25 22:44:21', '', '2024-08-25 22:47:46');
INSERT INTO `gen_table_column` VALUES (28, 5, 'class_time', '上课时间', 'datetime', 'Date', 'classTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-08-25 22:44:21', '', '2024-08-25 22:47:46');
INSERT INTO `gen_table_column` VALUES (29, 6, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:44:32', '', '2024-08-25 22:47:48');
INSERT INTO `gen_table_column` VALUES (30, 6, 'employee_id', '工号', 'varchar(20)', 'String', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:44:32', '', '2024-08-25 22:47:48');
INSERT INTO `gen_table_column` VALUES (31, 6, 'course_id', '课程编号', 'varchar(20)', 'String', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-25 22:44:32', '', '2024-08-25 22:47:48');
INSERT INTO `gen_table_column` VALUES (32, 6, 'venue_id', '场地编号', 'varchar(20)', 'String', 'venueId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-25 22:44:32', '', '2024-08-25 22:47:48');
INSERT INTO `gen_table_column` VALUES (33, 6, 'class_time', '上课时间', 'datetime', 'Date', 'classTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-08-25 22:44:32', '', '2024-08-25 22:47:48');
INSERT INTO `gen_table_column` VALUES (34, 7, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:44:37', '', '2024-08-25 22:47:49');
INSERT INTO `gen_table_column` VALUES (35, 7, 'employee_id', '工号', 'varchar(20)', 'String', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:44:37', '', '2024-08-25 22:47:49');
INSERT INTO `gen_table_column` VALUES (36, 7, 'course_id', '课程编号', 'varchar(20)', 'String', 'courseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-08-25 22:44:37', '', '2024-08-25 22:47:49');
INSERT INTO `gen_table_column` VALUES (37, 7, 'class_time', '授课时间', 'datetime', 'Date', 'classTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-08-25 22:44:37', '', '2024-08-25 22:47:49');
INSERT INTO `gen_table_column` VALUES (38, 7, 'venue_id', '场地编号', 'varchar(20)', 'String', 'venueId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-08-25 22:44:37', '', '2024-08-25 22:47:49');
INSERT INTO `gen_table_column` VALUES (39, 8, 'id', '主键ID', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-25 22:47:31', '', '2024-08-25 22:47:51');
INSERT INTO `gen_table_column` VALUES (40, 8, 'group_id', '组号', 'int(11)', 'Long', 'groupId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-25 22:47:31', '', '2024-08-25 22:47:51');
INSERT INTO `gen_table_column` VALUES (41, 8, 'group_name', '名称', 'varchar(100)', 'String', 'groupName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-08-25 22:47:31', '', '2024-08-25 22:47:51');
INSERT INTO `gen_table_column` VALUES (42, 8, 'region', '所属地区', 'varchar(100)', 'String', 'region', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-08-25 22:47:31', '', '2024-08-25 22:47:51');
INSERT INTO `gen_table_column` VALUES (43, 8, 'member_number', '成员数量', 'int(11)', 'Long', 'memberNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-08-25 22:47:31', '', '2024-08-25 22:47:51');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `employee_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `course_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程编号',
  `class_time` datetime NULL DEFAULT NULL COMMENT '授课时间',
  `venue_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场地编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `employee_id`(`employee_id`, `course_id`, `class_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排班信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, '1299604151', '123', '2024-08-26 20:04:18', '123');
INSERT INTO `schedule` VALUES (2, '1299604151', '123123', '2024-08-26 20:17:55', '123');
INSERT INTO `schedule` VALUES (3, '1299604152', 'test', '2024-08-26 21:54:13', '123');
INSERT INTO `schedule` VALUES (4, '345345', '123123333', '2024-08-26 22:04:13', '长阳区');

-- ----------------------------
-- Table structure for study_group
-- ----------------------------
DROP TABLE IF EXISTS `study_group`;
CREATE TABLE `study_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` int(11) NOT NULL COMMENT '组号',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属地区',
  `member_number` int(11) NULL DEFAULT NULL COMMENT '成员数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学习小组信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_group
-- ----------------------------
INSERT INTO `study_group` VALUES (3, 123, '123', '123', 0);
INSERT INTO `study_group` VALUES (5, 123123123, '名称测试', '地区', 2);
INSERT INTO `study_group` VALUES (6, 1333, '最新的小组', '河南', 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-08-25 22:36:56', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '农技培训学习管理系统', 0, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2024-08-25 22:36:55', 'admin', '2024-08-26 10:16:19');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-08-25 22:36:55', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-08-25 22:36:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-25 22:38:09');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-25 22:38:12');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-25 22:59:01');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-25 23:02:12');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-25 23:02:24');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-25 23:15:06');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-25 23:16:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-25 23:16:03');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-25 23:16:38');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 07:54:42');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 07:57:38');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 07:57:42');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 08:45:42');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 11:07:03');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 11:40:27');
INSERT INTO `sys_logininfor` VALUES (115, '123124433', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 13:27:06');
INSERT INTO `sys_logininfor` VALUES (116, '123124433', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 13:35:23');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 13:35:27');
INSERT INTO `sys_logininfor` VALUES (118, '123124433', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 14:14:05');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-26 15:09:30');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 15:09:35');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 16:14:28');
INSERT INTO `sys_logininfor` VALUES (122, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 18:29:31');
INSERT INTO `sys_logininfor` VALUES (123, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 18:31:28');
INSERT INTO `sys_logininfor` VALUES (124, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 18:31:32');
INSERT INTO `sys_logininfor` VALUES (125, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 19:12:57');
INSERT INTO `sys_logininfor` VALUES (126, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 19:13:02');
INSERT INTO `sys_logininfor` VALUES (127, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 19:46:00');
INSERT INTO `sys_logininfor` VALUES (128, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-26 19:55:01');
INSERT INTO `sys_logininfor` VALUES (129, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 19:55:03');
INSERT INTO `sys_logininfor` VALUES (130, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 20:26:21');
INSERT INTO `sys_logininfor` VALUES (131, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-26 20:26:25');
INSERT INTO `sys_logininfor` VALUES (132, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 20:26:44');
INSERT INTO `sys_logininfor` VALUES (133, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 20:27:47');
INSERT INTO `sys_logininfor` VALUES (134, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-26 20:28:01');
INSERT INTO `sys_logininfor` VALUES (135, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-26 20:28:15');
INSERT INTO `sys_logininfor` VALUES (136, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-26 20:28:37');
INSERT INTO `sys_logininfor` VALUES (137, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-26 20:28:38');
INSERT INTO `sys_logininfor` VALUES (138, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-26 20:28:38');
INSERT INTO `sys_logininfor` VALUES (139, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 20:30:24');
INSERT INTO `sys_logininfor` VALUES (140, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:12:01');
INSERT INTO `sys_logininfor` VALUES (141, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 21:37:38');
INSERT INTO `sys_logininfor` VALUES (142, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:37:41');
INSERT INTO `sys_logininfor` VALUES (143, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 21:43:38');
INSERT INTO `sys_logininfor` VALUES (144, '123123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:43:54');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 21:44:58');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-26 21:45:02');
INSERT INTO `sys_logininfor` VALUES (147, '456456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 21:45:17');
INSERT INTO `sys_logininfor` VALUES (148, '123123', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 21:50:54');
INSERT INTO `sys_logininfor` VALUES (149, '1299604151', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:51:03');
INSERT INTO `sys_logininfor` VALUES (150, '456456', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2024-08-26 21:51:06');
INSERT INTO `sys_logininfor` VALUES (151, '1299604152', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-08-26 21:51:26');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:57:50');
INSERT INTO `sys_logininfor` VALUES (153, '789789', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 21:59:48');
INSERT INTO `sys_logininfor` VALUES (154, '789789', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-26 22:02:57');
INSERT INTO `sys_logininfor` VALUES (155, '345345', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-26 22:03:19');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2053 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-08-25 22:36:56', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2024-08-25 22:36:56', 'admin', '2024-08-25 23:14:27', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2024-08-25 22:36:56', 'admin', '2024-08-25 23:14:24', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-08-25 22:36:56', 'admin', '2024-08-25 23:14:30', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-08-25 22:36:56', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-08-25 22:36:56', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-08-25 22:36:56', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-08-25 22:36:56', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-08-25 22:36:56', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-08-25 22:36:56', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-08-25 22:36:56', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-08-25 22:36:56', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-08-25 22:36:56', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-08-25 22:36:56', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-08-25 22:36:56', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-08-25 22:36:56', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-08-25 22:36:56', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-08-25 22:36:56', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-08-25 22:36:56', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-08-25 22:36:56', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-08-25 22:36:56', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-08-25 22:36:56', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-08-25 22:36:56', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-08-25 22:36:56', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '农民管理', 2001, 1, 'farmer', 'system/farmer/index', NULL, '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-08-25 22:53:41', 'admin', '2024-08-25 22:58:09', '');
INSERT INTO `sys_menu` VALUES (2001, '业务系统', 0, 1, 'buss', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'list', 'admin', '2024-08-25 22:57:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '技术员列表', 2001, 1, 'technician', 'system/technician/index', NULL, '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-08-25 23:10:20', 'admin', '2024-08-26 19:32:43', '');
INSERT INTO `sys_menu` VALUES (2003, '课程信息列表', 2001, 1, 'course', 'system/course/index', NULL, '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-08-25 23:10:52', 'admin', '2024-08-26 19:32:51', '');
INSERT INTO `sys_menu` VALUES (2005, '选课列表', 2001, 1, 'selection', 'system/selection/index', NULL, '', 1, 0, 'C', '0', '0', '', 'example', 'admin', '2024-08-25 23:12:03', 'admin', '2024-08-26 19:33:08', '');
INSERT INTO `sys_menu` VALUES (2006, '授课记录管理', 2001, 1, 'record', 'system/record/index', NULL, '', 1, 0, 'C', '0', '0', '', 'druid', 'admin', '2024-08-25 23:12:44', 'admin', '2024-08-26 07:58:17', '');
INSERT INTO `sys_menu` VALUES (2007, '排班管理', 2001, 1, 'schedule', 'system/schedule/index', NULL, '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2024-08-25 23:13:12', 'admin', '2024-08-26 07:55:36', '');
INSERT INTO `sys_menu` VALUES (2008, '学习小组管理', 2001, 1, 'group', 'system/group/index', NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-08-25 23:13:40', 'admin', '2024-08-25 23:13:56', '');
INSERT INTO `sys_menu` VALUES (2009, '列表', 2000, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:list', '#', 'admin', '2024-08-26 13:48:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '导出', 2000, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:export', '#', 'admin', '2024-08-26 13:48:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '详情', 2000, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:query', '#', 'admin', '2024-08-26 13:48:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '新增', 2000, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:add', '#', 'admin', '2024-08-26 13:48:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '编辑', 2000, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:edit', '#', 'admin', '2024-08-26 13:49:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '移除', 2000, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:farmer:remove', '#', 'admin', '2024-08-26 13:49:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '列表', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:list', '#', 'admin', '2024-08-26 13:51:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '导出', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:export', '#', 'admin', '2024-08-26 13:53:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '详情', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:query', '#', 'admin', '2024-08-26 13:53:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '新增', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:add', '#', 'admin', '2024-08-26 13:54:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '编辑', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:edit', '#', 'admin', '2024-08-26 13:54:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '删除', 2002, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:technician:remove', '#', 'admin', '2024-08-26 13:55:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '列表', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:list', '#', 'admin', '2024-08-26 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '导出', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:export', '#', 'admin', '2024-08-26 13:56:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '详情', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:query', '#', 'admin', '2024-08-26 13:56:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '添加', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:add', '#', 'admin', '2024-08-26 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '编辑', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:edit', '#', 'admin', '2024-08-26 13:58:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '删除', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:remove', '#', 'admin', '2024-08-26 13:58:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '列表', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:list', '#', 'admin', '2024-08-26 13:59:25', 'admin', '2024-08-26 13:59:38', '');
INSERT INTO `sys_menu` VALUES (2028, '导出', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:export', '#', 'admin', '2024-08-26 13:59:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '详情', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:query', '#', 'admin', '2024-08-26 14:00:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '添加', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:add', '#', 'admin', '2024-08-26 14:01:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '编辑', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:edit', '#', 'admin', '2024-08-26 14:02:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '删除', 2005, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:selection:remove', '#', 'admin', '2024-08-26 14:02:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '列表', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:list', '#', 'admin', '2024-08-26 14:05:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '导出', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:export', '#', 'admin', '2024-08-26 14:05:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '详情', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:query', '#', 'admin', '2024-08-26 14:05:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '添加', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:add', '#', 'admin', '2024-08-26 14:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '编辑', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:edit', '#', 'admin', '2024-08-26 14:05:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '删除', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:remove', '#', 'admin', '2024-08-26 14:06:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '列表', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:list', '#', 'admin', '2024-08-26 14:06:29', 'admin', '2024-08-26 14:06:46', '');
INSERT INTO `sys_menu` VALUES (2040, '导出', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:export', '#', 'admin', '2024-08-26 14:07:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '详情', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:query', '#', 'admin', '2024-08-26 14:07:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '添加', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:add', '#', 'admin', '2024-08-26 14:08:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '编辑', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:edit', '#', 'admin', '2024-08-26 14:09:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '删除', 2007, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:schedule:remove', '#', 'admin', '2024-08-26 14:09:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '列表', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:list', '#', 'admin', '2024-08-26 14:10:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '导出', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:export', '#', 'admin', '2024-08-26 14:10:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '详情', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:query', '#', 'admin', '2024-08-26 14:10:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '添加', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:add', '#', 'admin', '2024-08-26 14:10:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '编辑', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:edit', '#', 'admin', '2024-08-26 14:10:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '删除', 2008, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:group:remove', '#', 'admin', '2024-08-26 14:11:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '选课', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:course:select', '#', 'admin', '2024-08-26 18:54:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '授课', 2006, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:teach', '#', 'admin', '2024-08-26 21:29:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"①农民：学号、性别、年龄、姓名、所属学习小组组号\\n②技术员：工号、性别、年龄、姓名、职称、专长\\n③课程：课程编号、课程名称、课程描述、授课场地、授课时间\\n④场地：场地编号、场地位置、场地容量、场地状态（是否被占用）\\n⑤学习小组：组号、名称、所属地区（XX村）、成员人数\\n⑥选课信息：选课记录编号、学号、课程编号、上课时间……\\n⑦授课信息：授课记录编号、工号、课程编号、场地编号、上课时间……\\n⑧排班信息：工号、课程编号、授课时间、场地编号\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:41:59', 7);
INSERT INTO `sys_oper_log` VALUES (101, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE farmer (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    student_id VARCHAR(20) UNIQUE NOT NULL COMMENT \'学号\',\\n    gender ENUM(\'男\', \'女\') NOT NULL COMMENT \'性别\',\\n    age INT NOT NULL COMMENT \'年龄\',\\n    name VARCHAR(50) NOT NULL COMMENT \'姓名\',\\n    group_id INT NOT NULL COMMENT \'所属学习小组组号\'\\n) COMMENT \'农民信息表\';\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:42:12', 129);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/farmer', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:42:21', 35);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"farmer\"}', NULL, 0, NULL, '2024-08-25 22:42:37', 77);
INSERT INTO `sys_oper_log` VALUES (104, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE technician (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    employee_id VARCHAR(20) UNIQUE NOT NULL COMMENT \'工号\',\\n    gender ENUM(\'男\', \'女\') NOT NULL COMMENT \'性别\',\\n    age INT NOT NULL COMMENT \'年龄\',\\n    name VARCHAR(50) NOT NULL COMMENT \'姓名\',\\n    title VARCHAR(50) COMMENT \'职称\',\\n    speciality VARCHAR(100) COMMENT \'专长\'\\n) COMMENT \'技术员信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:43:45', 76);
INSERT INTO `sys_oper_log` VALUES (105, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE course (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    course_id VARCHAR(20) UNIQUE NOT NULL COMMENT \'课程编号\',\\n    course_name VARCHAR(100) NOT NULL COMMENT \'课程名称\',\\n    course_description TEXT COMMENT \'课程描述\',\\n    venue VARCHAR(100) COMMENT \'授课场地\',\\n    class_time DATETIME COMMENT \'授课时间\'\\n) COMMENT \'课程信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:43:51', 94);
INSERT INTO `sys_oper_log` VALUES (106, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE venue (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    venue_id VARCHAR(20) UNIQUE NOT NULL COMMENT \'场地编号\',\\n    location VARCHAR(100) NOT NULL COMMENT \'场地位置\',\\n    capacity INT NOT NULL COMMENT \'场地容量\',\\n    status ENUM(\'空闲\', \'占用\') NOT NULL COMMENT \'场地状态（是否被占用）\'\\n) COMMENT \'场地信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:43:57', 69);
INSERT INTO `sys_oper_log` VALUES (107, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE study_group (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    group_id INT UNIQUE NOT NULL COMMENT \'组号\',\\n    group_name VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    region VARCHAR(100) NOT NULL COMMENT \'所属地区（XX村）\',\\n    member_count INT NOT NULL COMMENT \'成员人数\'\\n) COMMENT \'学习小组信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:44:02', 3);
INSERT INTO `sys_oper_log` VALUES (108, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE study_group (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    group_id INT UNIQUE NOT NULL COMMENT \'组号\',\\n    group_name VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    region VARCHAR(100) NOT NULL COMMENT \'所属地区（XX村）\',\\n    member_count INT NOT NULL COMMENT \'成员人数\'\\n) COMMENT \'学习小组信息表\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:44:08', 0);
INSERT INTO `sys_oper_log` VALUES (109, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE course_selection (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    student_id VARCHAR(20) NOT NULL COMMENT \'学号\',\\n    course_id VARCHAR(20) NOT NULL COMMENT \'课程编号\',\\n    class_time DATETIME COMMENT \'上课时间\',\\n    FOREIGN KEY (student_id) REFERENCES farmer(student_id),\\n    FOREIGN KEY (course_id) REFERENCES course(course_id)\\n) COMMENT \'选课信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:44:21', 166);
INSERT INTO `sys_oper_log` VALUES (110, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE teaching_record (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    employee_id VARCHAR(20) NOT NULL COMMENT \'工号\',\\n    course_id VARCHAR(20) NOT NULL COMMENT \'课程编号\',\\n    venue_id VARCHAR(20) NOT NULL COMMENT \'场地编号\',\\n    class_time DATETIME COMMENT \'上课时间\',\\n    FOREIGN KEY (employee_id) REFERENCES technician(employee_id),\\n    FOREIGN KEY (course_id) REFERENCES course(course_id),\\n    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)\\n) COMMENT \'授课信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:44:32', 93);
INSERT INTO `sys_oper_log` VALUES (111, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE schedule (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    employee_id VARCHAR(20) NOT NULL COMMENT \'工号\',\\n    course_id VARCHAR(20) NOT NULL COMMENT \'课程编号\',\\n    class_time DATETIME COMMENT \'授课时间\',\\n    venue_id VARCHAR(20) NOT NULL COMMENT \'场地编号\',\\n    UNIQUE KEY (employee_id, course_id, class_time),\\n    FOREIGN KEY (employee_id) REFERENCES technician(employee_id),\\n    FOREIGN KEY (course_id) REFERENCES course(course_id),\\n    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)\\n) COMMENT \'排班信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:44:37', 72);
INSERT INTO `sys_oper_log` VALUES (112, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE study_group (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    group_id INT UNIQUE NOT NULL COMMENT \'组号\',\\n    group_name VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    region VARCHAR(100) NOT NULL COMMENT \'所属地区（XX村）\',\\n    member_count INT NOT NULL COMMENT \'成员人数\'\\n) COMMENT \'学习小组信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:44:59', 1);
INSERT INTO `sys_oper_log` VALUES (113, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE study_group (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    group_id INT UNIQUE NOT NULL COMMENT \'组号\',\\n    group_name VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    region VARCHAR(100) NOT NULL COMMENT \'所属地区（XX村）\',\\n    member_count INT NOT NULL COMMENT \'成员人数\'\\n) COMMENT \'学习小组信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:45:47', 1);
INSERT INTO `sys_oper_log` VALUES (114, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE study_group (\\n    id INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    group_id INT UNIQUE NOT NULL COMMENT \'组号\',\\n    group_name VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    region VARCHAR(100) NOT NULL COMMENT \'所属地区（XX村）\',\\n    member_count INT NOT NULL COMMENT \'成员人数\'\\n) COMMENT \'学习小组信息表\';\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-08-25 22:46:50', 19370);
INSERT INTO `sys_oper_log` VALUES (115, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `study_group` (\\n    `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT \'主键ID\',\\n    `group_id` INT UNIQUE NOT NULL COMMENT \'组号\',\\n    `group_name` VARCHAR(100) NOT NULL COMMENT \'名称\',\\n    `region` VARCHAR(100) NOT NULL COMMENT \'所属地区\',\\n    `member_number` INT NOT NULL COMMENT \'成员数量\'\\n) COMMENT=\'学习小组信息表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:31', 2750);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/technician', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:42', 24);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:44', 20);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/venue', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:45', 17);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/course_selection', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:46', 17);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/teaching_record', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:48', 22);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/schedule', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:49', 17);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/study_group', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:47:51', 17);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"technician,course,venue,course_selection,teaching_record,schedule,study_group\"}', NULL, 0, NULL, '2024-08-25 22:47:53', 425);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"technician,course,venue,course_selection,teaching_record,schedule,study_group,farmer\"}', NULL, 0, NULL, '2024-08-25 22:47:59', 463);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农民管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"system/farmer/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:53:42', 97);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/farmer/index\",\"createTime\":\"2024-08-25 22:53:41\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"农民管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"farmer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:55:27', 14);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业务系统\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"buss\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:57:25', 12);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/farmer/index\",\"createTime\":\"2024-08-25 22:53:41\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"农民管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"farmer\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 22:58:09', 9);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/technician/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"技术员管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"technician\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:10:20', 14);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/course/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程信息表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"course\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:10:52', 9);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/course/index\",\"createTime\":\"2024-08-25 23:10:52\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"课程信息表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:11:00', 11);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/venue/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"场地信息表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"venue\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:11:20', 11);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/selection/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选课管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"selection\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:12:03', 9);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/teaching-record/index\",\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"授课记录管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:12:44', 8);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/schedule/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"排班管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:13:12', 9);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/group/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习小组管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"group\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:13:40', 9);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/schedule/index\",\"createTime\":\"2024-08-25 23:13:12\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"排班管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:13:51', 10);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/group/index\",\"createTime\":\"2024-08-25 23:13:40\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"学习小组管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"group\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:13:56', 9);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/venue/index\",\"createTime\":\"2024-08-25 23:11:20\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"场地信息表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"venue\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:14:06', 11);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-25 22:36:56\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:14:24', 11);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-25 22:36:56\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:14:27', 12);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-25 22:36:56\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:14:30', 9);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/course/index\",\"createTime\":\"2024-08-25 23:10:52\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"课程信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:17:20', 15);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/venue/index\",\"createTime\":\"2024-08-25 23:11:20\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"场地信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"venue\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-25 23:17:26', 11);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/record/index\",\"createTime\":\"2024-08-25 23:12:44\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"授课记录管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"1\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 07:55:25', 24);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/schedule/index\",\"createTime\":\"2024-08-25 23:13:12\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"排班管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"schedule\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 07:55:36', 11);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\" system/record/index\",\"createTime\":\"2024-08-25 23:12:44\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"授课记录管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"record\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 07:55:42', 19);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2024-08-25 23:12:44\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"授课记录管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"record\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 07:58:17', 14);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2024-08-25 23:10:52\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"课程信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 07:58:25', 12);
INSERT INTO `sys_oper_log` VALUES (150, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":123,\"groupId\":123,\"id\":1,\"name\":\"123\",\"params\":{},\"studentId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:01:26', 17);
INSERT INTO `sys_oper_log` VALUES (151, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":31,\"groupId\":123,\"name\":\"12\",\"params\":{},\"studentId\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'student_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\FarmerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insertFarmer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into farmer          ( student_id,                          age,             name,             group_id )           values ( ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'student_id\'\n; Duplicate entry \'123\' for key \'student_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'student_id\'', '2024-08-26 08:45:55', 47);
INSERT INTO `sys_oper_log` VALUES (152, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":31,\"groupId\":123,\"id\":3,\"name\":\"12\",\"params\":{},\"studentId\":\"12333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:46:00', 10);
INSERT INTO `sys_oper_log` VALUES (153, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/farmer/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:46:06', 13);
INSERT INTO `sys_oper_log` VALUES (154, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":31,\"gender\":\"男\",\"groupId\":123,\"id\":3,\"name\":\"12\",\"params\":{},\"studentId\":\"1233333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:46:09', 9);
INSERT INTO `sys_oper_log` VALUES (155, '农民信息', 5, 'com.ruoyi.system.controller.FarmerController.export()', 'POST', 1, 'admin', '研发部门', '/system/farmer/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-08-26 08:46:13', 492);
INSERT INTO `sys_oper_log` VALUES (156, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":4,\"groupId\":44,\"name\":\"44\",\"params\":{},\"studentId\":\"44\"}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\r\n### The error may exist in com/ruoyi/system/mapper/FarmerMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2024-08-26 08:50:39', 15);
INSERT INTO `sys_oper_log` VALUES (157, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":4,\"groupId\":44,\"name\":\"44\",\"params\":{},\"studentId\":\"44\"}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\r\n### The error may exist in com/ruoyi/system/mapper/FarmerMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2024-08-26 08:51:38', 31700);
INSERT INTO `sys_oper_log` VALUES (158, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":4,\"groupId\":44,\"name\":\"44\",\"params\":{},\"studentId\":\"44\"}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.\r\n### The error may exist in com/ruoyi/system/mapper/FarmerMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'params\'. It was either not specified and/or could not be found for the javaType (java.util.Map) : jdbcType (null) combination.', '2024-08-26 08:51:44', 2660);
INSERT INTO `sys_oper_log` VALUES (159, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":4,\"groupId\":44,\"id\":1827872135599726594,\"name\":\"44\",\"studentId\":\"44\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may exist in com/ruoyi/system/mapper/FarmerMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO farmer  ( id, student_id,  age, name, group_id )  VALUES  ( ?, ?,  ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2024-08-26 08:54:12', 118);
INSERT INTO `sys_oper_log` VALUES (160, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":11,\"groupId\":11,\"id\":1827872268907290626,\"name\":\"11\",\"studentId\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\r\n### The error may exist in com/ruoyi/system/mapper/FarmerMapper.java (best guess)\r\n### The error may involve com.ruoyi.system.mapper.FarmerMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO farmer  ( id, student_id,  age, name, group_id )  VALUES  ( ?, ?,  ?, ?, ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1\n; Data truncation: Out of range value for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'id\' at row 1', '2024-08-26 08:54:43', 3);
INSERT INTO `sys_oper_log` VALUES (161, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":11,\"groupId\":11,\"id\":1827872384732995586,\"name\":\"11\",\"studentId\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:55:11', 9);
INSERT INTO `sys_oper_log` VALUES (162, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3123,\"groupId\":312,\"id\":1827872384732995587,\"name\":\"12\",\"studentId\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:56:37', 107);
INSERT INTO `sys_oper_log` VALUES (163, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3,\"groupId\":11,\"id\":1827872384732995588,\"name\":\"1\",\"studentId\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 08:58:31', 10);
INSERT INTO `sys_oper_log` VALUES (164, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3,\"gender\":\"男\",\"groupId\":11,\"id\":\"1827872384732995588\",\"name\":\"1\",\"studentId\":\"1233\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:01:06', 25);
INSERT INTO `sys_oper_log` VALUES (165, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3,\"groupId\":33,\"id\":\"1827872384732995589\",\"name\":\"333\",\"studentId\":\"33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:01:27', 11);
INSERT INTO `sys_oper_log` VALUES (166, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":31,\"groupId\":33,\"id\":\"1827872384732995590\",\"name\":\"3\",\"studentId\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:02:25', 10);
INSERT INTO `sys_oper_log` VALUES (167, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"groupId\":123,\"id\":\"1\",\"name\":\"23\",\"studentId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:03:23', 98);
INSERT INTO `sys_oper_log` VALUES (168, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3,\"groupId\":3,\"id\":\"1\",\"name\":\"3\",\"studentId\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:12:43', 10);
INSERT INTO `sys_oper_log` VALUES (169, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3,\"gender\":\"男\",\"groupId\":333,\"id\":\"1\",\"name\":\"3\",\"studentId\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 09:12:48', 16);
INSERT INTO `sys_oper_log` VALUES (170, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '研发部门', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123,\"groupName\":\"3123\",\"params\":{},\"region\":\"12\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'member_number\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\StudyGroupMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudyGroupMapper.insertStudyGroup-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into study_group          ( group_id,             group_name,             region )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'member_number\' doesn\'t have a default value\n; Field \'member_number\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'member_number\' doesn\'t have a default value', '2024-08-26 10:04:37', 5);
INSERT INTO `sys_oper_log` VALUES (171, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '研发部门', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123,\"groupName\":\"3123\",\"id\":1,\"params\":{},\"region\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:04:53', 9);
INSERT INTO `sys_oper_log` VALUES (172, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '研发部门', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":12,\"groupName\":\"3123\",\"id\":2,\"memberNumber\":0,\"params\":{},\"region\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:06:57', 103);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:09:27', 24);
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2005,2006],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:14:36', 108);
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2005,2006],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:14:49', 40);
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2005,2006,2007],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:15:09', 19);
INSERT INTO `sys_oper_log` VALUES (177, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"农技培训学习管理系统\",\"email\":\"admin@qq.com\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:16:19', 17);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-08-25 22:36:56\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:17:11', 26);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2024-08-26 08:45:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-08-26 10:18:16', 0);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2024-08-26 08:45:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-08-26 10:18:17', 0);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2024-08-26 08:45:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-08-26 10:18:18', 1);
INSERT INTO `sys_oper_log` VALUES (182, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-08-26 10:18:37', 2);
INSERT INTO `sys_oper_log` VALUES (183, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-08-26 10:18:39', 4);
INSERT INTO `sys_oper_log` VALUES (184, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:42', 14);
INSERT INTO `sys_oper_log` VALUES (185, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:44', 11);
INSERT INTO `sys_oper_log` VALUES (186, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:46', 11);
INSERT INTO `sys_oper_log` VALUES (187, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:48', 17);
INSERT INTO `sys_oper_log` VALUES (188, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:50', 10);
INSERT INTO `sys_oper_log` VALUES (189, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:52', 12);
INSERT INTO `sys_oper_log` VALUES (190, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:18:53', 12);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2024-08-26 08:45:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-08-26 10:19:23', 1);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-25 22:36:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2024-08-26 08:45:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:20:12', 72);
INSERT INTO `sys_oper_log` VALUES (193, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:20:23', 12);
INSERT INTO `sys_oper_log` VALUES (194, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:20:24', 11);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"sex\":\"0\",\"status\":\"0\",\"userId\":3,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:34:12', 179);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test2\",\"params\":{},\"postIds\":[],\"roleIds\":[4],\"status\":\"0\",\"userId\":4,\"userName\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:34:43', 78);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:35:00', 30);
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:35:03', 19);
INSERT INTO `sys_oper_log` VALUES (199, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":5,\"userName\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:35:17', 77);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"test2\",\"params\":{},\"postIds\":[],\"roleIds\":[4],\"status\":\"0\",\"userId\":6,\"userName\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:35:35', 79);
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 10:35:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"农技培训学习管理系统\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"test2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:43:28', 24);
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-26 10:35:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"农技培训学习管理系统\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"test2\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 10:43:39', 18);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:48:02', 20);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:48:16', 15);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:48:33', 13);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:48:47', 12);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:49:02', 13);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"移除\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"perms\":\"system:farmer:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:49:19', 11);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:51:44', 11);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:53:22', 34);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:53:50', 12);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:54:01', 13);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:54:09', 11);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"system:technician:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:55:10', 11);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:55:50', 12);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:56:04', 10);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:56:15', 10);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'详情\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2024-08-26 13:58:22', 5);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:58:32', 11);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:58:43', 11);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:58:51', 15);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:59:25', 10);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-26 13:59:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"\",\"perms\":\"system:selection:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:59:39', 16);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 13:59:52', 15);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:00:06', 12);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'详情\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2024-08-26 14:01:41', 3);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:01:54', 10);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:02:04', 22);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"perms\":\"system:selection:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:02:11', 10);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:03', 10);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:25', 13);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:34', 9);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:44', 9);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:05:54', 10);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:06:01', 11);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:06:29', 11);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-26 14:06:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2039,\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"\",\"perms\":\"system:schedule:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:06:46', 13);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:07:03', 9);
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:07:13', 10);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'详情\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2024-08-26 14:08:45', 3);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:08:53', 9);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:09:00', 9);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:schedule:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:09:09', 10);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"列表\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:10:13', 11);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:10:27', 15);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"详情\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:10:42', 10);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:10:50', 9);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:10:59', 11);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:group:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:11:06', 11);
INSERT INTO `sys_oper_log` VALUES (250, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2021,2022,2023,2024,2025,2026,2005,2027,2028,2029,2030,2031,2032,2006,2033,2034,2035,2036,2037,2038],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:13:08', 39);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2021,2022,2023,2024,2025,2026,2005,2027,2028,2029,2030,2031,2032,2006,2033,2034,2035,2036,2037,2038,2007,2039,2040,2041,2042,2043,2044],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:13:28', 25);
INSERT INTO `sys_oper_log` VALUES (252, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.add()', 'POST', 1, '123124433', '农技培训学习管理系统', '/system/record', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-08\",\"courseId\":\"123\",\"employeeId\":\"123\",\"id\":1,\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 14:14:14', 16);
INSERT INTO `sys_oper_log` VALUES (253, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26\",\"courseDescription\":\"123\",\"courseId\":\"1\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:15:32', 14);
INSERT INTO `sys_oper_log` VALUES (254, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"1\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:19:09', 24);
INSERT INTO `sys_oper_log` VALUES (255, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:15:09\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"12\",\"id\":1,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:19:13', 12);
INSERT INTO `sys_oper_log` VALUES (256, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-28 15:15:09\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"12\",\"id\":1,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:19:19', 9);
INSERT INTO `sys_oper_log` VALUES (257, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-28 16:15:09\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"12\",\"id\":1,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:19:28', 9);
INSERT INTO `sys_oper_log` VALUES (258, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:43\",\"courseDescription\":\"11\",\"courseId\":\"123\",\"courseName\":\"11\",\"id\":1827969158596378626,\"venue\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course          ( course_id,             course_name,             course_description,             venue,             class_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\n; Duplicate entry \'123\' for key \'course_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'', '2024-08-26 15:19:44', 39);
INSERT INTO `sys_oper_log` VALUES (259, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:43\",\"courseDescription\":\"11\",\"courseId\":\"123\",\"courseName\":\"11\",\"id\":1827969168608182273,\"venue\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course          ( course_id,             course_name,             course_description,             venue,             class_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\n; Duplicate entry \'123\' for key \'course_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'', '2024-08-26 15:19:46', 7);
INSERT INTO `sys_oper_log` VALUES (260, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:43\",\"courseDescription\":\"11\",\"courseId\":\"123\",\"courseName\":\"11\",\"id\":1827969173783953409,\"venue\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into course          ( course_id,             course_name,             course_description,             venue,             class_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\n; Duplicate entry \'123\' for key \'course_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'', '2024-08-26 15:19:47', 7);
INSERT INTO `sys_oper_log` VALUES (261, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CourseMapper.updateCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update course          SET course_id = ?,             course_name = ?,             course_description = ?,             venue = ?,             class_time = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'\n; Duplicate entry \'123\' for key \'course_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'course_id\'', '2024-08-26 15:20:00', 7);
INSERT INTO `sys_oper_log` VALUES (262, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"courseDescription\":\"1\",\"courseId\":\"123\",\"courseName\":\"11\"}', '{\"msg\":\"新增课程\'123\'失败，课程编号已存在\",\"code\":500}', 0, NULL, '2024-08-26 15:21:18', 28);
INSERT INTO `sys_oper_log` VALUES (263, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"courseDescription\":\"1\",\"courseId\":\"123\",\"courseName\":\"11\"}', '{\"msg\":\"新增课程\'123\'失败，课程编号已存在\",\"code\":500}', 0, NULL, '2024-08-26 15:21:19', 4);
INSERT INTO `sys_oper_log` VALUES (264, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"新增课程\'123\'失败，课程编号已存在\",\"code\":500}', 0, NULL, '2024-08-26 15:24:09', 11);
INSERT INTO `sys_oper_log` VALUES (265, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"1231\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:24:11', 10);
INSERT INTO `sys_oper_log` VALUES (266, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"12313\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"修改课程\'12313\'失败，课程编号不能修改\",\"code\":500}', 0, NULL, '2024-08-26 15:26:06', 11);
INSERT INTO `sys_oper_log` VALUES (267, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 15:19:08\",\"courseDescription\":\"123\",\"courseId\":\"12313\",\"courseName\":\"23123\",\"id\":2,\"venue\":\"123\"}', '{\"msg\":\"修改课程\'12313\'失败，课程编号不能修改\",\"code\":500}', 0, NULL, '2024-08-26 15:26:08', 4);
INSERT INTO `sys_oper_log` VALUES (268, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"groupId\":123,\"name\":\"231\",\"studentId\":\"123\"}', NULL, 1, 'rawPassword cannot be null', '2024-08-26 15:36:56', 20);
INSERT INTO `sys_oper_log` VALUES (269, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":12,\"groupId\":123,\"id\":\"5\",\"name\":\"3123\",\"studentId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:39:47', 4251);
INSERT INTO `sys_oper_log` VALUES (270, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":3123,\"groupId\":3123,\"id\":\"6\",\"name\":\"12\",\"studentId\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 15:40:52', 10741);
INSERT INTO `sys_oper_log` VALUES (271, '技术员信息', 1, 'com.ruoyi.system.controller.TechnicianController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":12,\"employeeId\":\"123\",\"name\":\"3123\",\"speciality\":\"123\",\"title\":\"123\"}', NULL, 1, 'rawPassword cannot be null', '2024-08-26 15:45:14', 11);
INSERT INTO `sys_oper_log` VALUES (272, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/1,2,3,4,5,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:15:32', 18);
INSERT INTO `sys_oper_log` VALUES (273, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/1,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:15:39', 36);
INSERT INTO `sys_oper_log` VALUES (274, '授课信息', 3, 'com.ruoyi.system.controller.TeachingRecordController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/record/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:15:46', 14);
INSERT INTO `sys_oper_log` VALUES (275, '学习小组信息', 3, 'com.ruoyi.system.controller.StudyGroupController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/group/1,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:15:53', 17);
INSERT INTO `sys_oper_log` VALUES (276, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123,\"groupName\":\"123\",\"id\":3,\"memberNumber\":0,\"region\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:21:23', 101);
INSERT INTO `sys_oper_log` VALUES (277, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123,\"groupName\":\"123\",\"id\":1827984711234879490,\"memberNumber\":0,\"region\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'group_id\'\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\StudyGroupMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudyGroupMapper.insertStudyGroup-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into study_group          ( group_id,             group_name,             region,             member_number )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'group_id\'\n; Duplicate entry \'123\' for key \'group_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'group_id\'', '2024-08-26 16:21:32', 40);
INSERT INTO `sys_oper_log` VALUES (278, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123123123,\"groupName\":\"名称测试\",\"id\":5,\"memberNumber\":0,\"region\":\"地区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:42:23', 114);
INSERT INTO `sys_oper_log` VALUES (279, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":123,\"gender\":\"0\",\"groupId\":123123123,\"id\":\"9\",\"name\":\"3333\",\"studentId\":\"555555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:52:37', 22);
INSERT INTO `sys_oper_log` VALUES (280, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":123,\"gender\":\"1\",\"groupId\":123123123,\"id\":\"9\",\"name\":\"3333\",\"studentId\":\"555555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:52:43', 9);
INSERT INTO `sys_oper_log` VALUES (281, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":11,\"gender\":\"0\",\"groupId\":123123,\"id\":\"10\",\"name\":\"11\",\"studentId\":\"123333\",\"userId\":15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 16:56:00', 85);
INSERT INTO `sys_oper_log` VALUES (282, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"gender\":\"0\",\"groupId\":123,\"id\":\"7\",\"name\":\"123\",\"studentId\":\"12344\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:04:07', 11);
INSERT INTO `sys_oper_log` VALUES (283, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"gender\":\"0\",\"groupId\":123123123,\"id\":\"7\",\"name\":\"123\",\"studentId\":\"12344\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:04:10', 9);
INSERT INTO `sys_oper_log` VALUES (284, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":123,\"gender\":\"1\",\"groupId\":123123123,\"id\":\"9\",\"name\":\"3333\",\"studentId\":\"555555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:54:43', 51);
INSERT INTO `sys_oper_log` VALUES (285, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"gender\":\"0\",\"groupId\":123123123,\"id\":\"7\",\"name\":\"123\",\"studentId\":\"12344\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:55:36', 4259);
INSERT INTO `sys_oper_log` VALUES (286, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":11,\"gender\":\"0\",\"groupId\":123123,\"id\":\"10\",\"name\":\"11\",\"studentId\":\"123333\"}', NULL, 1, '学习小组不存在', '2024-08-26 17:55:52', 13);
INSERT INTO `sys_oper_log` VALUES (287, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Farmer.getGroupId()\" because \"item\" is null', '2024-08-26 17:56:06', 33);
INSERT INTO `sys_oper_log` VALUES (288, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":11,\"gender\":\"0\",\"groupId\":123,\"id\":\"8\",\"name\":\"444\",\"studentId\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:57:19', 1986);
INSERT INTO `sys_oper_log` VALUES (289, '农民信息', 2, 'com.ruoyi.system.controller.FarmerController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":1,\"gender\":\"0\",\"groupId\":123123123,\"id\":\"7\",\"name\":\"123\",\"studentId\":\"12344\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 17:59:02', 45);
INSERT INTO `sys_oper_log` VALUES (290, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/8', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Farmer.getGroupId()\" because \"item\" is null', '2024-08-26 17:59:23', 24);
INSERT INTO `sys_oper_log` VALUES (291, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/9', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.system.domain.Farmer.getGroupId()\" because \"item\" is null', '2024-08-26 17:59:59', 24);
INSERT INTO `sys_oper_log` VALUES (292, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:03:03', 77);
INSERT INTO `sys_oper_log` VALUES (293, '农民信息', 1, 'com.ruoyi.system.controller.FarmerController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/farmer', '127.0.0.1', '内网IP', '{\"age\":123,\"gender\":\"0\",\"groupId\":123,\"id\":\"11\",\"name\":\"123\",\"studentId\":\"1333\",\"userId\":17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:03:24', 135);
INSERT INTO `sys_oper_log` VALUES (294, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:03:30', 30);
INSERT INTO `sys_oper_log` VALUES (295, '技术员信息', 1, 'com.ruoyi.system.controller.TechnicianController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"1\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\",\"userId\":18}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:09:35', 244);
INSERT INTO `sys_oper_log` VALUES (296, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'1\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\n; Data truncated for column \'gender\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'gender\' at row 1', '2024-08-26 18:11:21', 48);
INSERT INTO `sys_oper_log` VALUES (297, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'0\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\n; Data truncated for column \'gender\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'gender\' at row 1', '2024-08-26 18:11:26', 6);
INSERT INTO `sys_oper_log` VALUES (298, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'0\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\n; Data truncated for column \'gender\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'gender\' at row 1', '2024-08-26 18:11:30', 6);
INSERT INTO `sys_oper_log` VALUES (299, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'0\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Data truncated for column \'gender\' at row 1\n; Data truncated for column \'gender\' at row 1; nested exception is java.sql.SQLException: Data truncated for column \'gender\' at row 1', '2024-08-26 18:11:34', 6);
INSERT INTO `sys_oper_log` VALUES (300, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'0\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1', '2024-08-26 18:12:26', 7);
INSERT INTO `sys_oper_log` VALUES (301, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'0\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'\'0\'\' for column \'gender\' at row 1', '2024-08-26 18:12:27', 6);
INSERT INTO `sys_oper_log` VALUES (302, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"\'1\'\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'\'1\'\' for column \'gender\' at row 1\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\TechnicianMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TechnicianMapper.updateTechnician-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update technician          SET employee_id = ?,             gender = ?,             age = ?,             name = ?,             title = ?,             speciality = ?          where id = ?\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'\'1\'\' for column \'gender\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'\'1\'\' for column \'gender\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'\'1\'\' for column \'gender\' at row 1', '2024-08-26 18:12:37', 5);
INSERT INTO `sys_oper_log` VALUES (303, '技术员信息', 2, 'com.ruoyi.system.controller.TechnicianController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/technician', '127.0.0.1', '内网IP', '{\"age\":123123,\"employeeId\":\"123123123\",\"gender\":\"0\",\"id\":\"2\",\"name\":\"11\",\"speciality\":\"zgh\",\"title\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:13:04', 12);
INSERT INTO `sys_oper_log` VALUES (304, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-30 00:00:00\",\"courseDescription\":\"123\",\"courseId\":\"123aa\",\"courseName\":\"123\",\"id\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:15:04', 38);
INSERT INTO `sys_oper_log` VALUES (305, '课程信息', 2, 'com.ruoyi.system.controller.CourseController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-30 00:00:00\",\"courseDescription\":\"123\",\"courseId\":\"123aa\",\"courseName\":\"123\",\"id\":\"6\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:15:10', 14);
INSERT INTO `sys_oper_log` VALUES (306, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/record', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26\",\"courseId\":\"123\",\"employeeId\":\"123123123\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:17:33', 15);
INSERT INTO `sys_oper_log` VALUES (307, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2005,2021,2022,2023,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:30:24', 28);
INSERT INTO `sys_oper_log` VALUES (308, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2003,2005,2015,2016,2017,2021,2022,2023,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:31:09', 22);
INSERT INTO `sys_oper_log` VALUES (309, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2003,2005,2015,2016,2017,2021,2022,2023,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:32:04', 25);
INSERT INTO `sys_oper_log` VALUES (310, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2003,2005,2015,2016,2017,2021,2022,2023,2026,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:42:39', 26);
INSERT INTO `sys_oper_log` VALUES (311, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2003,2005,2015,2016,2017,2021,2022,2023,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:43:16', 22);
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选课\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"system:course:select\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:54:53', 17);
INSERT INTO `sys_oper_log` VALUES (313, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:14:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002,2003,2005,2015,2016,2017,2051,2021,2022,2023,2027,2028,2029,2032],\"params\":{},\"roleId\":3,\"roleKey\":\"farmer\",\"roleName\":\"农户\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 18:55:14', 46);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/technician/index\",\"createTime\":\"2024-08-25 23:10:20\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"技术员列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"technician\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:32:43', 36);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/course/index\",\"createTime\":\"2024-08-25 23:10:52\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"课程信息列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"course\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:32:51', 11);
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/selection/index\",\"createTime\":\"2024-08-25 23:12:03\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"选课列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"selection\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:33:08', 13);
INSERT INTO `sys_oper_log` VALUES (317, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:50:47', 21);
INSERT INTO `sys_oper_log` VALUES (318, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"123\",\"id\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:51:04', 18);
INSERT INTO `sys_oper_log` VALUES (319, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/selection/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:51:10', 14);
INSERT INTO `sys_oper_log` VALUES (320, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:55:35', 20);
INSERT INTO `sys_oper_log` VALUES (321, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/selection/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:55:42', 12);
INSERT INTO `sys_oper_log` VALUES (322, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 19:55:51\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"123\",\"id\":\"8\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:55:52', 16);
INSERT INTO `sys_oper_log` VALUES (323, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:58:33', 35);
INSERT INTO `sys_oper_log` VALUES (324, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/selection/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:58:38', 12);
INSERT INTO `sys_oper_log` VALUES (325, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 19:58:45\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"123\",\"id\":\"9\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 19:58:46', 16);
INSERT INTO `sys_oper_log` VALUES (326, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:00:09', 32805);
INSERT INTO `sys_oper_log` VALUES (327, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, '1299604151', '农技培训学习管理系统', '/system/selection/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:04:10', 27);
INSERT INTO `sys_oper_log` VALUES (328, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseDescription\":\"3123\",\"courseId\":\"123\",\"courseName\":\"12\",\"id\":\"10\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:04:19', 38);
INSERT INTO `sys_oper_log` VALUES (329, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除课程\'123\'失败，课程已被选课\",\"code\":500}', 0, NULL, '2024-08-26 20:04:55', 12600);
INSERT INTO `sys_oper_log` VALUES (330, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除课程\'123\'失败，课程已被选课\",\"code\":500}', 0, NULL, '2024-08-26 20:05:00', 5);
INSERT INTO `sys_oper_log` VALUES (331, '课程信息', 3, 'com.ruoyi.system.controller.CourseController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/course/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除课程\'123\'失败，课程已被选课\",\"code\":500}', 0, NULL, '2024-08-26 20:05:02', 5);
INSERT INTO `sys_oper_log` VALUES (332, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseDescription\":\"123\",\"courseId\":\"123\",\"courseName\":\"123\",\"venue\":\"123\"}', '{\"msg\":\"新增课程\'123\'失败，课程编号已存在\",\"code\":500}', 0, NULL, '2024-08-26 20:17:56', 21);
INSERT INTO `sys_oper_log` VALUES (333, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseDescription\":\"123\",\"courseId\":\"123123\",\"courseName\":\"123\",\"id\":\"11\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:17:59', 20);
INSERT INTO `sys_oper_log` VALUES (334, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:18:38', 46);
INSERT INTO `sys_oper_log` VALUES (335, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/selection/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:18:45', 11);
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/user/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:18:58', 24);
INSERT INTO `sys_oper_log` VALUES (337, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/user/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:19:00', 15);
INSERT INTO `sys_oper_log` VALUES (338, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/user/7,8,9,10,11,12,13,14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:19:09', 21);
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/user/15,16,17,18,19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:19:13', 20);
INSERT INTO `sys_oper_log` VALUES (340, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/13', '127.0.0.1', '内网IP', '{}', NULL, 1, '该用户已经关联选课，无法删除', '2024-08-26 20:27:12', 9);
INSERT INTO `sys_oper_log` VALUES (341, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, '1299604151', '农技培训学习管理系统', '/system/selection/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:27:22', 15);
INSERT INTO `sys_oper_log` VALUES (342, '农民信息', 3, 'com.ruoyi.system.controller.FarmerController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/farmer/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:27:37', 49);
INSERT INTO `sys_oper_log` VALUES (343, '技术员信息', 3, 'com.ruoyi.system.controller.TechnicianController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/technician/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:30:04', 41);
INSERT INTO `sys_oper_log` VALUES (344, '技术员信息', 3, 'com.ruoyi.system.controller.TechnicianController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/technician/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:30:06', 26);
INSERT INTO `sys_oper_log` VALUES (345, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2007,2021,2022,2023,2024,2025,2026,2005,2027,2028,2029,2030,2031,2032,2006,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:30:47', 27);
INSERT INTO `sys_oper_log` VALUES (346, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2007,2021,2005,2027,2028,2029,2030,2031,2032,2006,2033,2034,2035,2036,2037,2038,2039,2040,2041],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:31:05', 15);
INSERT INTO `sys_oper_log` VALUES (347, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2006,2007,2021,2033,2034,2035,2036,2039,2040,2041],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:32:36', 19);
INSERT INTO `sys_oper_log` VALUES (348, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2006,2007,2021,2033,2034,2035,2039,2040,2041],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:33:47', 18);
INSERT INTO `sys_oper_log` VALUES (349, '授课信息', 3, 'com.ruoyi.system.controller.TeachingRecordController.remove()', 'DELETE', 1, 'admin', '农技培训学习管理系统', '/system/record/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 20:41:54', 12);
INSERT INTO `sys_oper_log` VALUES (350, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( employee_id,             course_id,             class_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\n; Field \'venue_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value', '2024-08-26 21:07:04', 123);
INSERT INTO `sys_oper_log` VALUES (351, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( employee_id,             course_id,             class_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\n; Field \'venue_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value', '2024-08-26 21:07:07', 7);
INSERT INTO `sys_oper_log` VALUES (352, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( employee_id,             course_id,             class_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value\n; Field \'venue_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'venue_id\' doesn\'t have a default value', '2024-08-26 21:07:25', 7);
INSERT INTO `sys_oper_log` VALUES (353, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"\",\"venueId\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( course_id,             class_time,             venue_id )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-08-26 21:08:39', 7);
INSERT INTO `sys_oper_log` VALUES (354, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"\",\"venueId\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( course_id,             class_time,             venue_id )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-08-26 21:08:40', 7);
INSERT INTO `sys_oper_log` VALUES (355, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"\",\"venueId\":\"123\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\bishe0711\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\system\\ScheduleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ScheduleMapper.insertSchedule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into schedule          ( course_id,             class_time,             venue_id )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-08-26 21:08:56', 8);
INSERT INTO `sys_oper_log` VALUES (356, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"\",\"venueId\":\"123\"}', NULL, 1, '请选择技术人员', '2024-08-26 21:10:14', 11);
INSERT INTO `sys_oper_log` VALUES (357, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"1299604151\",\"id\":\"1\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:10:20', 16);
INSERT INTO `sys_oper_log` VALUES (358, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"1299604151\",\"venueId\":\"123\"}', NULL, 1, '排班信息已存在', '2024-08-26 21:10:26', 3);
INSERT INTO `sys_oper_log` VALUES (359, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"1299604151\",\"venueId\":\"123\"}', NULL, 1, '排班信息已存在', '2024-08-26 21:10:28', 3);
INSERT INTO `sys_oper_log` VALUES (360, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:10:30', 16);
INSERT INTO `sys_oper_log` VALUES (361, '学习小组信息', 2, 'com.ruoyi.system.controller.StudyGroupController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":123123123,\"groupName\":\"名称测试\",\"id\":\"5\",\"memberNumber\":0,\"region\":\"地区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:15:59', 17);
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"授课\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"perms\":\"system:record:teach\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:29:12', 163);
INSERT INTO `sys_oper_log` VALUES (363, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '农技培训学习管理系统', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-08-26 10:15:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2006,2007,2021,2052,2033,2034,2035,2039,2040,2041],\"params\":{},\"roleId\":4,\"roleKey\":\"tech\",\"roleName\":\"技术员\",\"roleSort\":1,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:29:59', 49);
INSERT INTO `sys_oper_log` VALUES (364, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604151', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:37:45', 43);
INSERT INTO `sys_oper_log` VALUES (365, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604151', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"您已授课，无法重复授课\",\"code\":500}', 0, NULL, '2024-08-26 21:37:51', 6);
INSERT INTO `sys_oper_log` VALUES (366, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604151', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"您已授课，无法重复授课\",\"code\":500}', 0, NULL, '2024-08-26 21:38:14', 5);
INSERT INTO `sys_oper_log` VALUES (367, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604151', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:04:18\",\"courseId\":\"123\",\"employeeId\":\"1299604151\",\"id\":\"1\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:38:16', 19);
INSERT INTO `sys_oper_log` VALUES (368, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"venueId\":\"123\"}', NULL, 1, '排班信息已存在', '2024-08-26 21:53:28', 13);
INSERT INTO `sys_oper_log` VALUES (369, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604152\",\"venueId\":\"123\"}', NULL, 1, '排班信息已存在', '2024-08-26 21:53:30', 3);
INSERT INTO `sys_oper_log` VALUES (370, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604152\",\"venueId\":\"123\"}', NULL, 1, '排班信息已存在', '2024-08-26 21:53:35', 2);
INSERT INTO `sys_oper_log` VALUES (371, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 20:17:55\",\"courseId\":\"123123\",\"employeeId\":\"1299604151\",\"id\":\"2\",\"venueId\":\"123\"}', '{\"msg\":\"您不是技术人员，无法授课\",\"code\":500}', 0, NULL, '2024-08-26 21:53:44', 10);
INSERT INTO `sys_oper_log` VALUES (372, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 21:54:13\",\"courseDescription\":\"123\",\"courseId\":\"test\",\"courseName\":\"test\",\"id\":\"12\",\"venue\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:54:15', 20);
INSERT INTO `sys_oper_log` VALUES (373, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 21:54:13\",\"courseId\":\"test\",\"employeeId\":\"1299604152\",\"id\":\"3\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:54:26', 11);
INSERT INTO `sys_oper_log` VALUES (374, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604152', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 21:54:13\",\"courseId\":\"test\",\"employeeId\":\"1299604152\",\"id\":\"3\",\"venueId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:54:51', 16);
INSERT INTO `sys_oper_log` VALUES (375, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '1299604152', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 21:54:13\",\"courseId\":\"test\",\"employeeId\":\"1299604152\",\"id\":\"3\",\"venueId\":\"123\"}', '{\"msg\":\"您已授课，无法重复授课\",\"code\":500}', 0, NULL, '2024-08-26 21:54:55', 6);
INSERT INTO `sys_oper_log` VALUES (376, '学习小组信息', 1, 'com.ruoyi.system.controller.StudyGroupController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/group', '127.0.0.1', '内网IP', '{\"groupId\":1333,\"groupName\":\"最新的小组\",\"id\":\"6\",\"memberNumber\":0,\"region\":\"河南\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 21:59:03', 17);
INSERT INTO `sys_oper_log` VALUES (377, '选课信息', 3, 'com.ruoyi.system.controller.CourseSelectionController.remove()', 'DELETE', 1, '789789', '农技培训学习管理系统', '/system/selection/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 22:02:19', 14);
INSERT INTO `sys_oper_log` VALUES (378, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseDescription\":\"123123\",\"courseId\":\"123123\",\"courseName\":\"最新的课程\",\"venue\":\"长阳区\"}', '{\"msg\":\"新增课程\'123123\'失败，课程编号已存在\",\"code\":500}', 0, NULL, '2024-08-26 22:04:14', 4);
INSERT INTO `sys_oper_log` VALUES (379, '课程信息', 1, 'com.ruoyi.system.controller.CourseController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/course', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseDescription\":\"123123\",\"courseId\":\"123123333\",\"courseName\":\"最新的课程\",\"id\":\"13\",\"venue\":\"长阳区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 22:04:19', 48);
INSERT INTO `sys_oper_log` VALUES (380, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseId\":\"123123333\",\"employeeId\":\"345345\",\"id\":\"4\",\"venueId\":\"长阳区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 22:04:43', 15);
INSERT INTO `sys_oper_log` VALUES (381, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseId\":\"123123333\",\"employeeId\":\"345345\",\"venueId\":\"长阳区\"}', NULL, 1, '排班信息已存在', '2024-08-26 22:04:51', 3);
INSERT INTO `sys_oper_log` VALUES (382, '排班信息', 1, 'com.ruoyi.system.controller.ScheduleController.add()', 'POST', 1, 'admin', '农技培训学习管理系统', '/system/schedule', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseId\":\"123123333\",\"employeeId\":\"1299604152\",\"venueId\":\"长阳区\"}', NULL, 1, '排班信息已存在', '2024-08-26 22:04:54', 2);
INSERT INTO `sys_oper_log` VALUES (383, '授课信息', 1, 'com.ruoyi.system.controller.TeachingRecordController.teach()', 'POST', 1, '345345', '农技培训学习管理系统', '/system/record/teach', '127.0.0.1', '内网IP', '{\"classTime\":\"2024-08-26 22:04:13\",\"courseId\":\"123123333\",\"employeeId\":\"345345\",\"id\":\"4\",\"venueId\":\"长阳区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-26 22:05:18', 15);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-08-25 22:36:56', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-08-25 22:36:56', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '农户', 'farmer', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-26 10:14:36', 'admin', '2024-08-26 18:55:14', NULL);
INSERT INTO `sys_role` VALUES (4, '技术员', 'tech', 1, '1', 1, 1, '0', '0', 'admin', '2024-08-26 10:15:09', 'admin', '2024-08-26 21:29:59', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (3, 2002);
INSERT INTO `sys_role_menu` VALUES (3, 2003);
INSERT INTO `sys_role_menu` VALUES (3, 2005);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2017);
INSERT INTO `sys_role_menu` VALUES (3, 2021);
INSERT INTO `sys_role_menu` VALUES (3, 2022);
INSERT INTO `sys_role_menu` VALUES (3, 2023);
INSERT INTO `sys_role_menu` VALUES (3, 2027);
INSERT INTO `sys_role_menu` VALUES (3, 2028);
INSERT INTO `sys_role_menu` VALUES (3, 2029);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (4, 2001);
INSERT INTO `sys_role_menu` VALUES (4, 2003);
INSERT INTO `sys_role_menu` VALUES (4, 2006);
INSERT INTO `sys_role_menu` VALUES (4, 2007);
INSERT INTO `sys_role_menu` VALUES (4, 2021);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2034);
INSERT INTO `sys_role_menu` VALUES (4, 2035);
INSERT INTO `sys_role_menu` VALUES (4, 2039);
INSERT INTO `sys_role_menu` VALUES (4, 2040);
INSERT INTO `sys_role_menu` VALUES (4, 2041);
INSERT INTO `sys_role_menu` VALUES (4, 2052);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-08-26 21:57:50', 'admin', '2024-08-25 22:36:56', 'admin', '2024-08-26 21:57:50', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-08-25 22:36:56', 'admin', '2024-08-25 22:36:56', 'admin', '2024-08-26 10:17:11', '测试员');
INSERT INTO `sys_user` VALUES (3, 100, 'test', 'test', '00', '', '', '0', '', '$2a$10$gVmQE6NgFkL1ai7AmbPhiOUUz8p5th2639VThSdtRP4ofq4yIJIHW', '0', '2', '', NULL, 'admin', '2024-08-26 10:34:12', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, NULL, 'test2', 'test2', '00', '', '', '0', '', '$2a$10$.DfRvpT0oFiGiV2bOSnjKuCPPbDl/StvP2IWrHGhHVPBWKwaOD8Pi', '0', '2', '', NULL, 'admin', '2024-08-26 10:34:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, 100, 'test', 'test', '00', '', '', '0', '', '$2a$10$t.P8dyLsmp6PEnGpo1zKHeK7D1WZhP2xaseV2rMbc47GfaPoi3MQu', '0', '2', '', NULL, 'admin', '2024-08-26 10:35:17', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 100, 'test2', 'test2', '00', '', '', '0', '', '$2a$10$r55za6S6b2FL/4nexDxCmeplieJWlzK7osVyb4vAiJCynriCpfzZe', '0', '2', '', NULL, 'admin', '2024-08-26 10:35:35', 'admin', '2024-08-26 10:43:39', NULL);
INSERT INTO `sys_user` VALUES (7, 100, '12312', '123', '00', '', '', '0', '', '$2a$10$1GXBBiRsy5xUPZtQ.ukG0.Bbn3NP9qKSC22waRCy5VzDShlDWDNXy', '0', '2', '', NULL, 'admin', '2024-08-26 13:24:23', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 100, '1231244', '123', '00', '', '', '0', '', '$2a$10$RgJ29ePs85x1m4nRYZGbo.snfFRPoVCbC3AMLYCddPkSTKnCJXpyq', '0', '2', '', NULL, 'admin', '2024-08-26 13:24:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 100, '123124433', '123', '00', '', '', '0', '', '$2a$10$hB4H0qtUezJaFlUMVbrKXeq8aUYZio90sL82V42Agitja9gGW6YSG', '0', '2', '127.0.0.1', '2024-08-26 14:14:05', 'admin', '2024-08-26 13:26:47', '', '2024-08-26 14:14:05', NULL);
INSERT INTO `sys_user` VALUES (10, 100, '123', '3123', '00', '', '', '0', '', '$2a$10$Ne.pkZHnXJbWLxKZqZboGOV/69M72cnsZaYAP0SSc.nj7uGeqzFBe', '0', '2', '', NULL, 'admin', '2024-08-26 15:39:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 100, '12', '12', '00', '', '', '0', '', '$2a$10$4zKaOvtyjOd9WfjIkrHNwedimzfBqFvA7F0CRjzuRg6XDoQK4K/ae', '0', '2', '', NULL, 'admin', '2024-08-26 15:40:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 100, '12344', '123', '00', '', '', '0', '', '$2a$10$oQxa05u/Ciwza6WnwDkGVejR8Q.a7QsjlR8Pzvt1IIxQ4H4qS3Gau', '0', '2', '', NULL, 'admin', '2024-08-26 16:42:59', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 100, '444', '444', '00', '', '', '0', '', '$2a$10$Orh9t3RiN8JcQ89n9jUmFORcCUUyv7v1dRqX8BX.8D35uAgkmL4r.', '0', '2', '', NULL, 'admin', '2024-08-26 16:48:12', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (14, 100, '555555', '3333', '00', '', '', '0', '', '$2a$10$Lgg9RuXkY0wLxTjyWb1MI.rSA0NQ9HYpCJDOaUNQfS2/bioJtyVk.', '0', '2', '', NULL, 'admin', '2024-08-26 16:50:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (15, 100, '123333', '11', '00', '', '', '0', '', '$2a$10$bnWt0EI57PO0oirF0BRXxOmwUQJ9DKsJUYRb3idAYl2spNLoo/yYC', '0', '2', '', NULL, 'admin', '2024-08-26 16:56:00', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 100, '1231233', '王五', '00', '', '', '0', '', '$2a$10$YKa3sBum0i7Aa110GCCjX.UgEezl7TXCIxabrV0JzmBrJFC1Qbn7W', '0', '2', '', NULL, 'admin', '2024-08-26 17:54:19', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (17, 100, '1333', '123', '00', '', '', '0', '', '$2a$10$AW53cM6d.qU6ykk8ldMCROlHVgxuZGL5AXsO6vVJPoEiJzfMwqBbG', '0', '2', '', NULL, 'admin', '2024-08-26 18:03:24', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, 100, '123123123', '11', '00', '', '', '1', '', '$2a$10$BzDHWq5Iy4g.NLfuv8npdercqLn8RxjfnrrLrgcZg80/HroOnr0LS', '0', '2', '', NULL, 'admin', '2024-08-26 18:09:35', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (19, 100, '1299604151', '小明', '00', '', '', '0', '', '$2a$10$GsfkIWaNnHEAnxdEb1uY4OFBu.RYmunCA1oZ6gcxfR5BDtlxIIO8K', '0', '2', '127.0.0.1', '2024-08-26 19:55:04', 'admin', '2024-08-26 18:29:25', '', '2024-08-26 19:55:03', NULL);
INSERT INTO `sys_user` VALUES (20, 100, '1299604151', '1299604151', '00', '', '', '0', '', '$2a$10$jxaZsRsBww4ll4c.YJymFuz9wvGc6KTf8HJ/3zBum3szqdsaw0bXG', '0', '2', '127.0.0.1', '2024-08-26 20:26:45', 'admin', '2024-08-26 20:26:34', '', '2024-08-26 20:26:44', NULL);
INSERT INTO `sys_user` VALUES (21, 100, '1299604151', '1299604151', '00', '', '', '0', '', '$2a$10$EuFNSHH5TUhzRgrFscaTou4H4fhjBud3Y8ejMRRNnHcGBApj9l9Be', '0', '2', '', NULL, 'admin', '2024-08-26 20:27:56', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (22, 100, '1299604151', '1299604151', '00', '', '', '0', '', '$2a$10$cO.J1mLDA8O4yb46iRoF9.LlnGAuDxfSsoPCL3M0wyOr5nHiKhWZG', '0', '0', '127.0.0.1', '2024-08-26 21:51:03', 'admin', '2024-08-26 20:30:18', '', '2024-08-26 21:51:03', NULL);
INSERT INTO `sys_user` VALUES (23, 100, '123123', '123123', '00', '', '', '0', '', '$2a$10$fbk9hXSeU9DzKWEGlFcF7.p687pzd5mhqwHTQW39N2Qa29pfyLyPO', '0', '0', '127.0.0.1', '2024-08-26 21:43:54', 'admin', '2024-08-26 21:43:50', '', '2024-08-26 21:43:54', NULL);
INSERT INTO `sys_user` VALUES (24, 100, '456456', '456456', '00', '', '', '0', '', '$2a$10$AGhkosJgs1Q587RAKt4A5ulw.i0PhOGFKzZ8DBQazdsLc51xLSvRC', '0', '0', '127.0.0.1', '2024-08-26 21:45:17', 'admin', '2024-08-26 21:45:13', '', '2024-08-26 21:45:17', NULL);
INSERT INTO `sys_user` VALUES (25, 100, '1299604152', '1299604152', '00', '', '', '0', '', '$2a$10$HfoiHB06Aqz5mHEpns4DFuGJoqnB5MQwDyfo6ClR.CPncUD67VDN6', '0', '0', '127.0.0.1', '2024-08-26 21:51:26', 'admin', '2024-08-26 21:51:20', '', '2024-08-26 21:51:26', NULL);
INSERT INTO `sys_user` VALUES (26, 100, '789789', '小明', '00', '', '', '0', '', '$2a$10$Zbx8fkDwj92aIu/Kw0c9cOdk0yo1JI1zoXoDVNlZS9HVSNir.UTR2', '0', '0', '127.0.0.1', '2024-08-26 21:59:49', 'admin', '2024-08-26 21:59:27', '', '2024-08-26 21:59:48', NULL);
INSERT INTO `sys_user` VALUES (27, 100, '345345', '345345', '00', '', '', '0', '', '$2a$10$cJ2nEnes/.uDmQHU8v5MY.0d5jLXoI3PR0Tm5CqoKYEWqWliYTzlm', '0', '0', '127.0.0.1', '2024-08-26 22:03:20', 'admin', '2024-08-26 22:03:15', '', '2024-08-26 22:03:19', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (22, 4);
INSERT INTO `sys_user_role` VALUES (23, 3);
INSERT INTO `sys_user_role` VALUES (24, 3);
INSERT INTO `sys_user_role` VALUES (25, 4);
INSERT INTO `sys_user_role` VALUES (26, 3);
INSERT INTO `sys_user_role` VALUES (27, 4);

-- ----------------------------
-- Table structure for teaching_record
-- ----------------------------
DROP TABLE IF EXISTS `teaching_record`;
CREATE TABLE `teaching_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `employee_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `course_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程编号',
  `venue_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场地编号',
  `class_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '授课信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teaching_record
-- ----------------------------
INSERT INTO `teaching_record` VALUES (1, '1299604151', '123', '123', '2024-08-26 20:04:18');
INSERT INTO `teaching_record` VALUES (2, '1299604151', '123123', '123', '2024-08-26 20:17:55');
INSERT INTO `teaching_record` VALUES (3, '1299604152', 'test', '123', '2024-08-26 21:54:13');
INSERT INTO `teaching_record` VALUES (4, '345345', '123123333', '长阳区', '2024-08-26 22:04:13');

-- ----------------------------
-- Table structure for technician
-- ----------------------------
DROP TABLE IF EXISTS `technician`;
CREATE TABLE `technician`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `employee_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `gender` int(11) NOT NULL COMMENT '性别 0 男 1 女',
  `age` int(11) NOT NULL COMMENT '年龄',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称',
  `speciality` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专长',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `employee_id`(`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '技术员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of technician
-- ----------------------------
INSERT INTO `technician` VALUES (4, '1299604151', 0, 11, '1299604151', '11', '11', 22);
INSERT INTO `technician` VALUES (5, '1299604152', 0, 11, '1299604152', '11', '11', 25);
INSERT INTO `technician` VALUES (6, '345345', 0, 11, '345345', '11', '11', 27);

SET FOREIGN_KEY_CHECKS = 1;
