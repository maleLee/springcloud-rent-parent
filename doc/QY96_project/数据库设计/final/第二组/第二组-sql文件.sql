/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : second

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 02/09/2019 01:19:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论id',
  `user_id` int(16) NOT NULL COMMENT '评论人id',
  `room_id` int(16) NOT NULL COMMENT '房源id',
  `comment_text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论id',
  `comment_star` int(16) NULL DEFAULT NULL COMMENT '评论星级',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `comment_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 1, 1, '采光不错，空间大', 4, '2019-09-11 23:10:03', NULL, NULL);
INSERT INTO `comment` VALUES ('2', 3, 10, '卫生条件好，好评', 5, '2019-09-11 23:10:46', NULL, NULL);
INSERT INTO `comment` VALUES ('3', 6, 2, '附近治安挺好', 4, '2019-09-10 23:11:30', NULL, NULL);
INSERT INTO `comment` VALUES ('4', 11, 4, '隔音太差', 3, '2019-09-04 23:12:12', NULL, NULL);
INSERT INTO `comment` VALUES ('5', 44, 1, '装修风格很好', 5, '2019-09-05 23:13:00', NULL, NULL);
INSERT INTO `comment` VALUES ('6', 33, 3, '垃圾房子，老子再也不住了', 1, '2019-09-17 23:13:58', NULL, NULL);
INSERT INTO `comment` VALUES ('7', 20, 22, '搬家拉货，请联系王先生，电话：135647859', 4, '2019-09-04 23:15:45', NULL, NULL);
INSERT INTO `comment` VALUES ('8', 14, 9, '傻逼房东，草，坑钱', 1, '2019-09-03 23:20:38', NULL, NULL);
INSERT INTO `comment` VALUES ('9', 15, 33, '同城约，加妹妹微信有福利 138456759', 3, '2019-09-03 23:24:06', NULL, NULL);

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `contract_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合同编号',
  `contract_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合同类型',
  `order_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `contract_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同ftp地址',
  `create_time` datetime(0) NOT NULL COMMENT '签订时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `contract_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合同表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('1', '租房', '10003', 'http://172.16.254.11/home/apps/data/contract/2019-08-31/10003', '2019-08-31 23:28:28', NULL, NULL);
INSERT INTO `contract` VALUES ('2', '贷款', '11002', 'http://172.16.254.11/home/apps/data/contract/2019-09-01/11002', '2019-09-01 23:30:11', NULL, NULL);
INSERT INTO `contract` VALUES ('3', '贷款', '10004', 'http://172.16.254.11/home/apps/data/contract/2019-08-29/10004', '2019-08-29 23:31:49', '2019-09-01 23:31:54', NULL);

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `dict_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(16) NOT NULL,
  `dict_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dict_code` int(16) NOT NULL,
  `dict_type_code` int(16) NOT NULL,
  `dict_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `dict_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 0, '男', 1, 1, '性别', '2019-09-01 23:33:28', NULL, NULL);
INSERT INTO `dictionary` VALUES ('2', 0, '女', 2, 1, '性别', '2019-09-01 23:43:48', NULL, NULL);
INSERT INTO `dictionary` VALUES ('3', 0, '租房', 3, 2, '合同类型', '2019-09-02 00:05:52', NULL, NULL);
INSERT INTO `dictionary` VALUES ('4', 0, '贷款', 4, 2, '合同类型', '2019-09-04 00:06:23', NULL, NULL);

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan`  (
  `loan_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款编号',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款申请人',
  `loan_money` int(16) NOT NULL COMMENT '申请贷款金额',
  `loan_type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款类型id',
  `loan_status` int(16) NOT NULL COMMENT '申请贷款状态',
  `loan_time` datetime(0) NOT NULL COMMENT '申请贷款的时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `loan_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`loan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '贷款申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loan
-- ----------------------------
INSERT INTO `loan` VALUES ('100001', '1', 1000, '1', 0, '2019-09-02 00:06:56', NULL, NULL);
INSERT INTO `loan` VALUES ('100002', '2', 3000, '2', 1, '2019-09-02 00:07:02', NULL, NULL);
INSERT INTO `loan` VALUES ('100003', '3', 8000, '1', 2, '2019-09-04 00:08:02', NULL, NULL);

-- ----------------------------
-- Table structure for loan_type
-- ----------------------------
DROP TABLE IF EXISTS `loan_type`;
CREATE TABLE `loan_type`  (
  `loan_type_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款类型编号',
  `loan_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '贷款类型',
  `loan_term` int(8) NOT NULL COMMENT '贷款期限',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `loan_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`loan_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '贷款类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loan_type
-- ----------------------------
INSERT INTO `loan_type` VALUES ('1', '3期', 3, '2019-09-02 00:09:15', NULL, NULL);
INSERT INTO `loan_type` VALUES ('2', '6期', 6, '2019-09-02 00:10:45', NULL, NULL);
INSERT INTO `loan_type` VALUES ('3', '12期', 12, '2019-09-02 00:10:56', '2019-09-03 00:11:04', NULL);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` int(11) NOT NULL COMMENT '日志编号',
  `user_id` int(11) NOT NULL COMMENT '操作者',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作者ip',
  `operation_goal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作目标',
  `operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型',
  `operation_time` datetime(0) NOT NULL COMMENT '操作时间',
  `operation_status` int(16) NOT NULL COMMENT '操作状态',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `log_other` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, '172.16.1.25', '房源信息', '添加', '2019-09-02 01:11:19', 1, NULL, NULL);
INSERT INTO `log` VALUES (2, 2, '172.16.1.78', '房源详情表', '修改', '2019-09-02 01:12:04', 0, NULL, NULL);
INSERT INTO `log` VALUES (3, 3, '172.16.1.44', '用户详情表', '删除', '2019-09-02 01:12:44', 0, NULL, NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单编号',
  `menu_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(16) NOT NULL COMMENT '菜单父级编号',
  `menu_type` int(16) NOT NULL COMMENT '菜单类型',
  `menu_status` int(16) NOT NULL COMMENT '菜单状态',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `menu_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '用户管理', 0, 1, 0, '2019-09-02 00:11:42', NULL, NULL);
INSERT INTO `menu` VALUES ('2', '用户信息管理', 1, 1, 0, '2019-09-02 00:12:35', NULL, NULL);
INSERT INTO `menu` VALUES ('3', '角色管理', 1, 1, 0, '2019-09-02 00:13:01', NULL, NULL);
INSERT INTO `menu` VALUES ('4', '权限管理', 1, 1, 1, '2019-09-02 00:13:22', NULL, NULL);
INSERT INTO `menu` VALUES ('5', '贷款管理', 0, 2, 0, '2019-09-02 00:13:47', NULL, NULL);
INSERT INTO `menu` VALUES ('6', '房源管理', 0, 3, 1, '2019-09-02 00:14:15', '2019-09-03 00:14:18', NULL);
INSERT INTO `menu` VALUES ('7', '房东房源管理', 6, 3, 0, '2019-09-02 00:14:53', NULL, NULL);
INSERT INTO `menu` VALUES ('8', '经纪人房源管理', 6, 3, 0, '2019-09-02 00:15:23', NULL, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL,
  `permission_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission_chinese_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `permission_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'room_add', '房源添加', 'http://192.168.1.17/add', '2019-09-02 00:16:43', NULL, NULL);
INSERT INTO `permission` VALUES (2, 'room_delete', '房源删除', 'http://192.168.1.17/delete', '2019-09-02 00:18:01', NULL, NULL);
INSERT INTO `permission` VALUES (3, 'room_update', '房源修改', 'http://192.168.1.17/update', '2019-09-02 00:19:10', NULL, NULL);
INSERT INTO `permission` VALUES (4, 'room_select', '房源查询', 'http://192.168.1.17', '2019-09-02 00:19:59', '2019-09-02 00:20:03', NULL);

-- ----------------------------
-- Table structure for repayment
-- ----------------------------
DROP TABLE IF EXISTS `repayment`;
CREATE TABLE `repayment`  (
  `re_id` int(16) NOT NULL COMMENT '还款订单id',
  `loan_type_id` int(16) NOT NULL COMMENT '贷款类型id',
  `user_id` int(16) NOT NULL COMMENT '用户id',
  `re_money` bigint(50) NOT NULL COMMENT '还款金额',
  `rest_loan` bigint(50) NULL DEFAULT NULL COMMENT '剩余贷款',
  `loan_id` int(16) NOT NULL COMMENT '贷款id',
  `re_time` datetime(0) NOT NULL COMMENT '还款时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `re_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`re_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '还款订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repayment
-- ----------------------------
INSERT INTO `repayment` VALUES (1, 1, 1, 800, 200, 1, '2019-09-02 00:20:41', NULL, NULL);
INSERT INTO `repayment` VALUES (2, 2, 2, 1500, 1500, 2, '2019-09-02 00:21:37', NULL, NULL);
INSERT INTO `repayment` VALUES (3, 1, 3, 200, 7200, 3, '2019-09-02 00:22:15', NULL, NULL);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `report_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '举报编号',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '举报人',
  `comment_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论id',
  `report_status` int(16) NULL DEFAULT NULL COMMENT '举报状态',
  `report_text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '投诉内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `report_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '1', '6', 1, '辱骂他人', '2019-09-02 00:23:30', NULL, NULL);
INSERT INTO `report` VALUES ('2', '44', '7', 1, '垃圾广告', '2019-09-02 00:24:09', NULL, NULL);
INSERT INTO `report` VALUES ('3', '12', '8', 1, '使用不当词汇', '2019-09-02 00:24:36', NULL, NULL);
INSERT INTO `report` VALUES ('4', '11', '9', 1, '涉嫌传播色情', '2019-09-02 00:25:54', NULL, NULL);
INSERT INTO `report` VALUES ('5', '7', '1', 0, '就是想举报，不顺眼', '2019-09-02 00:26:33', NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL COMMENT '角色编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_chinese_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色中文名称',
  `role_type` int(16) NOT NULL COMMENT '角色类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `role_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'tenant', '租客', 1, '2019-09-02 00:28:22', NULL, NULL);
INSERT INTO `role` VALUES (2, 'landlord', '房东', 1, '2019-09-02 00:29:11', NULL, NULL);
INSERT INTO `role` VALUES (3, 'admin', '超级管理员', 2, '2019-09-02 00:29:43', NULL, NULL);
INSERT INTO `role` VALUES (4, 'agent', '经纪人', 2, '2019-09-02 00:30:03', '2019-09-02 00:33:35', NULL);
INSERT INTO `role` VALUES (5, 'room_auditor_1', '房源一级审核员', 2, '2019-09-02 00:30:53', NULL, NULL);
INSERT INTO `role` VALUES (6, 'room_auditor_2', '房源二级审核员', 2, '2019-09-02 00:31:43', NULL, NULL);
INSERT INTO `role` VALUES (7, 'loan_auditor_1', '贷款一级审核员', 2, '2019-09-02 00:32:16', NULL, NULL);
INSERT INTO `role` VALUES (8, 'loan_auditor_2', '贷款二级审核员', 2, '2019-09-02 00:32:46', NULL, NULL);
INSERT INTO `role` VALUES (9, 'user_admin', '用户管理员', 2, '2019-09-02 00:33:16', NULL, NULL);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(16) NOT NULL COMMENT '对应角色表的主键id',
  `permission_id` int(16) NULL DEFAULT NULL COMMENT '对应权限表的主键id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `rp_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 4, '2019-09-02 00:41:55', NULL, NULL);
INSERT INTO `role_permission` VALUES (3, 1, '2019-09-02 00:42:07', NULL, NULL);
INSERT INTO `role_permission` VALUES (3, 2, '2019-09-02 00:42:39', NULL, NULL);
INSERT INTO `role_permission` VALUES (3, 3, '2019-09-02 00:42:47', NULL, NULL);
INSERT INTO `role_permission` VALUES (3, 4, '2019-09-02 00:42:57', NULL, NULL);
INSERT INTO `role_permission` VALUES (2, 1, '2019-09-02 00:43:15', NULL, NULL);
INSERT INTO `role_permission` VALUES (2, 4, '2019-09-02 00:43:22', NULL, NULL);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `room_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房源编号',
  `room_rent` bigint(16) NOT NULL COMMENT '房源租金',
  `room_star` int(16) NULL DEFAULT NULL COMMENT '房源星级评价',
  `room_status` int(16) NOT NULL COMMENT '房源状态',
  `room_payment_multiple` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房源押付倍数',
  `room_create_time` datetime(0) NOT NULL COMMENT '房源发布时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `room_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 3000, 4, 1, '3', '2019-09-02 00:46:00', NULL, NULL);
INSERT INTO `room` VALUES ('2', 6000, 5, 1, '3', '2019-09-02 00:46:23', NULL, NULL);
INSERT INTO `room` VALUES ('3', 4000, 4, 0, '6', '2019-09-02 00:46:51', NULL, NULL);

-- ----------------------------
-- Table structure for room_detail
-- ----------------------------
DROP TABLE IF EXISTS `room_detail`;
CREATE TABLE `room_detail`  (
  `room_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应房源主键id',
  `room_landlord` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房源的房东',
  `room_agent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房源的经纪人',
  `room_brove` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房产证',
  `room_photo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房源照片',
  `room_first_region` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '一级区域',
  `room_secondary_region` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '二级区域',
  `room_detail_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `room_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '户型',
  `room_area` int(16) NOT NULL COMMENT '面积',
  `room_detail_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房源详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_detail
-- ----------------------------
INSERT INTO `room_detail` VALUES ('1', '王建', '刘东', 'http://172.16.254.11/home/apps/data/1.jps', 'http://172.16.254.11/home/apps/room', '郑州', '二七区', '文化路97号', '3', 33, NULL, NULL, NULL);
INSERT INTO `room_detail` VALUES ('2', '李玉', '陈才', 'http://172.16.254.11/home/apps/room', 'http://172.16.254.11/home/apps/room/', '郑州', '中原区', '建设路22号', '2', 66, NULL, NULL, NULL);
INSERT INTO `room_detail` VALUES ('3', '刑文', '少杰', 'http://172.16.254.11/home/apps/room', 'http://172.16.254.11/home/apps/room', '开封', '龙亭区', '化工技师学院', '1', 22, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tenement
-- ----------------------------
DROP TABLE IF EXISTS `tenement`;
CREATE TABLE `tenement`  (
  `tenement_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租房订单编号',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `room_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房源主键id',
  `lease_term` int(16) NOT NULL COMMENT '租期',
  `tenement_money` int(16) NOT NULL COMMENT '总租金',
  `tenement_status` int(16) NOT NULL COMMENT '租房状态',
  `create_time` datetime(0) NOT NULL COMMENT '租房时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `tenement_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`tenement_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租房订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenement
-- ----------------------------
INSERT INTO `tenement` VALUES ('1', '1', '1', 3, 6000, 1, '2019-09-02 00:34:21', NULL, NULL);
INSERT INTO `tenement` VALUES ('2', '2', '2', 6, 4000, 1, '2019-09-02 00:34:27', NULL, NULL);
INSERT INTO `tenement` VALUES ('3', '3', '3', 12, 12000, 0, '2019-09-02 00:35:05', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户表唯一主键id标识',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册用户登录名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录用户密码',
  `real_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `status` int(16) NOT NULL COMMENT '用户当前状态',
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', 'b123.', '张三', 0, 'zs', '2019-09-01 23:47:22', NULL, NULL);
INSERT INTO `user` VALUES ('2', 'bbb', 'a123.', '李四', 0, 'ls', '2019-09-01 23:48:04', NULL, NULL);
INSERT INTO `user` VALUES ('3', 'ccc', 'C1234.', '王五', 1, 'ww', '2019-09-01 23:48:32', NULL, NULL);
INSERT INTO `user` VALUES ('4', 'ddd', 'rr2222', '赵六', 2, 'zl', '2019-09-01 23:49:02', '2019-09-02 23:49:35', NULL);

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail`  (
  `user_id` int(11) NOT NULL COMMENT '用户表的主键id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `id_card` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `card_photo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证照片',
  `phone` int(30) NULL DEFAULT NULL COMMENT '联系电话',
  `user_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `work_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `work_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作地址',
  `brove_photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房产证照片',
  `bank_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `achievement` int(16) NULL DEFAULT NULL COMMENT '业绩',
  `other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余字段'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_detail
-- ----------------------------
INSERT INTO `user_detail` VALUES (1, '张三', '男', 25, '412554545545', 'http://172.16.254.11/home/apps/data/id_card/1', 2132345646, '北京海淀区', '中国人民银行', '北京东城区复兴门内大街', 'http://172.16.254.11/home/apps/data/brove_photo/1/zz.jpg', '6000224955566441', NULL, NULL);
INSERT INTO `user_detail` VALUES (2, '李四', '男', 22, '41277566541', 'http://172.16.254.11/home/apps/data/id_card/1', 1234567879, '上海徐汇区东安路1号', '复旦大学', '上海徐汇区东安路130号', 'http://172.16.254.11/home/apps/data/brove_photo/2/33.jpg', '213245646465767', 2, NULL);
INSERT INTO `user_detail` VALUES (3, '王五', '男', 44, '4127767686871', 'http://172.16.254.11/home/apps/data/id_card/1', 1224244543, '郑州市中原区建设路', '建设银行', '郑州市建设东路11号', 'http://172.16.254.11/home/apps/data/brove_photo/2/33.jpg', '252534543534', NULL, NULL);
INSERT INTO `user_detail` VALUES (4, '赵六', '女', 21, '4127745346871', 'http://172.16.254.11/home/apps/data/id_card/1', 133333333, '南京市', '南京省政府', '南京', 'http://172.16.254.11/home/apps/data/brove_photo/2/44.jpg', '243223423432', NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户表的主键id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色表的主键id',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `ur_other` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, '2019-09-02 00:43:42', NULL, NULL);
INSERT INTO `user_role` VALUES (2, 2, '2019-09-02 00:43:49', NULL, NULL);
INSERT INTO `user_role` VALUES (3, 3, '2019-09-02 00:44:02', NULL, NULL);
INSERT INTO `user_role` VALUES (4, 4, '2019-09-02 00:44:16', NULL, NULL);
INSERT INTO `user_role` VALUES (1, 2, '2019-09-02 00:44:54', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
