/*
Navicat MySQL Data Transfer

Source Server         : handong
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : el_live

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2019-09-01 23:21:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eldk_contract
-- ----------------------------
DROP TABLE IF EXISTS `eldk_contract`;
CREATE TABLE `eldk_contract` (
  `id` varchar(16) NOT NULL COMMENT '合同id',
  `user_id` varchar(10) NOT NULL COMMENT '贷款用户的id',
  `contract_url` varchar(50) NOT NULL COMMENT '合同的ftp地址',
  `dk_type` varchar(4) NOT NULL COMMENT '贷款类型期数',
  `create_time` datetime NOT NULL COMMENT '生成时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of eldk_contract
-- ----------------------------
INSERT INTO `eldk_contract` VALUES ('1', '2', 'ftp:192.168.1.68/resource/contract', '3', '2019-09-01 22:14:18', '2019-09-01 22:14:20', null, '11');
INSERT INTO `eldk_contract` VALUES ('2', '3', 'ftp:192.168.1.68/resource/contract', '6', '2019-09-01 22:14:26', '2019-09-01 22:14:24', null, '11');
INSERT INTO `eldk_contract` VALUES ('3', '4', 'ftp:192.168.1.68/resource/contract', '9', '2019-09-01 22:14:29', '2019-09-01 22:14:37', null, '11');
INSERT INTO `eldk_contract` VALUES ('4', '5', 'ftp:192.168.1.68/resource/contract', '12', '2019-09-01 22:14:32', '2019-09-01 22:14:34', null, '11');

-- ----------------------------
-- Table structure for eldk_loan
-- ----------------------------
DROP TABLE IF EXISTS `eldk_loan`;
CREATE TABLE `eldk_loan` (
  `loan_id` varchar(16) NOT NULL COMMENT '贷款订单的id',
  `user_id` varchar(16) NOT NULL COMMENT '贷款用户的id',
  `loan_money` int(8) NOT NULL COMMENT '贷款金额',
  `re_type` varchar(10) NOT NULL COMMENT '贷款类型（对应数据字典里的贷款类型）',
  `loan_time` datetime NOT NULL COMMENT '贷款时间',
  `update_time` datetime NOT NULL,
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of eldk_loan
-- ----------------------------
INSERT INTO `eldk_loan` VALUES ('1', '1', '10000', '1', '2019-09-26 21:48:24', '2019-09-01 21:48:28', null, '1');
INSERT INTO `eldk_loan` VALUES ('2', '2', '20000', '2', '2019-09-04 21:55:20', '2019-09-05 21:55:23', null, '2');
INSERT INTO `eldk_loan` VALUES ('3', '3', '10000', '3', '2019-09-01 21:55:43', '2019-09-01 21:55:45', null, '3');
INSERT INTO `eldk_loan` VALUES ('4', '4', '8000', '4', '2019-09-01 22:34:06', '2019-09-01 22:34:09', null, '4');
INSERT INTO `eldk_loan` VALUES ('5', '5', '4000', '5', '2019-09-01 22:34:20', '2019-09-01 22:34:22', null, '5');

-- ----------------------------
-- Table structure for eldk_rest_loan
-- ----------------------------
DROP TABLE IF EXISTS `eldk_rest_loan`;
CREATE TABLE `eldk_rest_loan` (
  `re_id` varchar(16) NOT NULL COMMENT '还款订单的id',
  `user_id` varchar(16) NOT NULL COMMENT '贷款用户的id',
  `re_money` double(2,0) NOT NULL COMMENT '还款金额',
  `rest_loan` double(2,0) NOT NULL COMMENT '剩余贷款',
  `loan_id` varchar(10) NOT NULL COMMENT '贷款id',
  `rest_time` datetime NOT NULL COMMENT '还款时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of eldk_rest_loan
-- ----------------------------
INSERT INTO `eldk_rest_loan` VALUES ('1', '1', '99', '99', '1', '2019-09-02 21:45:23', '2019-09-01 21:45:32', '2019-09-01 21:45:36', null, '1');
INSERT INTO `eldk_rest_loan` VALUES ('2', '2', '99', '99', '2', '2019-09-10 21:46:29', '2019-08-28 21:46:34', '2019-09-05 21:46:38', null, '2');
INSERT INTO `eldk_rest_loan` VALUES ('3', '3', '99', '99', '3', '2019-08-31 21:46:59', '2019-09-01 21:47:03', '2019-09-01 21:47:05', null, '3');
INSERT INTO `eldk_rest_loan` VALUES ('4', '4', '99', '49', '4', '2019-09-01 22:34:39', '2019-09-01 22:34:43', '2019-09-01 22:34:45', null, '4');
INSERT INTO `eldk_rest_loan` VALUES ('5', '5', '99', '99', '5', '2019-09-01 22:34:55', '2019-09-01 22:34:59', '2019-09-01 22:35:01', null, '5');

-- ----------------------------
-- Table structure for elzf_conmment
-- ----------------------------
DROP TABLE IF EXISTS `elzf_conmment`;
CREATE TABLE `elzf_conmment` (
  `id` varchar(10) NOT NULL COMMENT '主键ID',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `rent_id` varchar(10) NOT NULL COMMENT '房源id与房源表关联',
  `content` text NOT NULL COMMENT '评论内容',
  `tenant_id` varchar(10) NOT NULL COMMENT '租客id与用户表关联',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  `status` varchar(10) NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_conmment
-- ----------------------------
INSERT INTO `elzf_conmment` VALUES ('1', '2019-09-01 21:24:33', '2019-09-01 21:24:36', '1', '房子有点漏水', '1', null, '11');
INSERT INTO `elzf_conmment` VALUES ('2', '2019-09-01 21:24:33', '2019-09-01 21:24:36', '2', '房子实际与图片不符', '3', '', '11');
INSERT INTO `elzf_conmment` VALUES ('3', '2019-09-01 21:24:33', '2019-09-01 21:24:36', '3', '房子经常停电', '5', '', '11');
INSERT INTO `elzf_conmment` VALUES ('4', '2019-09-01 21:24:33', '2019-09-01 21:24:36', '4', '房子很好但邻居太吵', '7', '', '11');
INSERT INTO `elzf_conmment` VALUES ('5', '2019-09-01 21:29:34', '2019-09-01 21:29:37', '5', '房子太大有点空旷', '9', null, '11');

-- ----------------------------
-- Table structure for elzf_contract
-- ----------------------------
DROP TABLE IF EXISTS `elzf_contract`;
CREATE TABLE `elzf_contract` (
  `id` varchar(10) NOT NULL COMMENT '合同表的ID',
  `forrent_id` varchar(10) NOT NULL COMMENT '房东的ID',
  `tenant_id` varchar(10) NOT NULL COMMENT '租客的ID',
  `lease_term` int(22) NOT NULL COMMENT '合同的租期',
  `contract_rent` int(22) NOT NULL COMMENT '合同的总租金',
  `status` varchar(10) NOT NULL COMMENT '合同状态',
  `contract_sign_datetime` datetime(6) NOT NULL COMMENT '合同的签订日期',
  `contract_deadline` datetime(6) NOT NULL COMMENT '合同的截止日期',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租房合同表';

-- ----------------------------
-- Records of elzf_contract
-- ----------------------------
INSERT INTO `elzf_contract` VALUES ('1', '1', '2', '3', '12000', '可用', '2019-08-31 17:01:37.000000', '2019-11-01 17:01:52.000000', '2019-08-31 17:02:11', null);
INSERT INTO `elzf_contract` VALUES ('2', '3', '4', '6', '14000', '可用', '2019-08-31 17:03:39.000000', '2019-11-01 17:01:52.000000', '2019-08-31 17:03:53', null);
INSERT INTO `elzf_contract` VALUES ('3', '5', '6', '9', '30000', '可用', '2019-08-31 17:03:39.000000', '2019-11-01 17:01:52.000000', '2019-08-31 17:03:53', '');
INSERT INTO `elzf_contract` VALUES ('4', '7', '8', '3', '8000', '可用', '2019-08-31 17:03:39.000000', '2019-11-01 17:01:52.000000', '2019-08-31 17:03:53', '');
INSERT INTO `elzf_contract` VALUES ('5', '9', '10', '6', '14000', '可用', '2019-08-31 17:03:39.000000', '2019-11-01 17:01:52.000000', '2019-08-31 17:03:53', '');

-- ----------------------------
-- Table structure for elzf_rent
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent`;
CREATE TABLE `elzf_rent` (
  `id` varchar(10) NOT NULL COMMENT '房源编号',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `user_id` varchar(10) NOT NULL COMMENT '房源发布人',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `area` varchar(16) NOT NULL COMMENT '地区',
  `community` varchar(11) NOT NULL COMMENT '小区名',
  `pay` double(11,0) NOT NULL COMMENT '租金',
  `content` text NOT NULL COMMENT '详情',
  `house_type` varchar(16) NOT NULL COMMENT '户型',
  `house_size` double(5,0) NOT NULL COMMENT '面积',
  `fitment` varchar(16) NOT NULL COMMENT '装修',
  `floor` varchar(16) NOT NULL COMMENT '楼层',
  `orientation` varchar(11) NOT NULL COMMENT '朝向',
  `real_picture` varchar(50) NOT NULL COMMENT '实景图',
  `charge_strategy` varchar(10) NOT NULL COMMENT '押租策略',
  `room_brove` varchar(50) NOT NULL COMMENT '房产证',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '房源状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent
-- ----------------------------
INSERT INTO `elzf_rent` VALUES ('1', '2019-09-01 21:56:23', '2019-09-01 21:56:26', '1', '新房1', '金水区', '花园小区', '1000', '非常好非常好快来', '户型1', '120', '精装修', '16', '南', '548648645.jpg', '押一付三', '房产证', null, '存在');
INSERT INTO `elzf_rent` VALUES ('2', '2019-09-01 22:24:29', '2019-09-26 22:24:33', '2', '新房2', '惠济区', '幸福小区', '1200', '好房快来看看', '户型2', '100', '普通装修', '3', '东', '486463156.jpg', '押一付六', '房产证', null, '存在');
INSERT INTO `elzf_rent` VALUES ('3', '2019-09-01 22:30:35', '2019-09-11 22:30:38', '3', '新房3', '农业路', '金水小区', '800', '来啊好房快来瞅瞅', '户型3', '80', '普通装修', '9', '北', '4654641231.jpg', '押一付十二', '房产证', null, '存在');
INSERT INTO `elzf_rent` VALUES ('4', '2019-09-13 22:32:11', '2019-09-01 22:32:14', '4', '新房4', '经三路', 'AAA小区', '1800', '非常好非常好', '户型4', '110', '精装修', '17', '西', '8564134541.jpg', '押一付六', '房产证', null, '存在');
INSERT INTO `elzf_rent` VALUES ('5', '2019-09-01 22:35:26', '2019-09-01 22:35:29', '5', '新房5', '杨金路', '辉瑞财智广场', '1200', '还行不太好', '户型5', '90', '没装修', '10', '南', '256444565.jpg', '押一付十二', '房产证', null, '不存在');

-- ----------------------------
-- Table structure for elzf_rent_rate
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent_rate`;
CREATE TABLE `elzf_rent_rate` (
  `id` varchar(10) NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `rent_id` varchar(10) NOT NULL COMMENT '房源id 与房源表Elzf_rent的id关联',
  `tenant_id` varchar(10) NOT NULL COMMENT '租客id',
  `rate` double(2,0) NOT NULL COMMENT '评星 范围[0,5]，对应页面上的星星',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  `status` varchar(10) NOT NULL COMMENT '状态 逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent_rate
-- ----------------------------
INSERT INTO `elzf_rent_rate` VALUES ('1', '2019-09-11 22:26:59', '2019-09-01 22:27:02', '1', '1', '5', null, '1');
INSERT INTO `elzf_rent_rate` VALUES ('2', '2019-09-01 22:27:41', '2019-09-01 22:27:44', '2', '2', '4', null, '2');
INSERT INTO `elzf_rent_rate` VALUES ('3', '2019-09-01 22:27:50', '2019-09-01 22:27:47', '3', '3', '5', null, '3');
INSERT INTO `elzf_rent_rate` VALUES ('4', '2019-09-13 22:28:58', '2019-09-20 22:29:01', '4', '4', '5', null, '4');
INSERT INTO `elzf_rent_rate` VALUES ('5', '2019-09-06 22:29:18', '2019-09-01 22:29:21', '5', '5', '4', null, '5');

-- ----------------------------
-- Table structure for el_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `el_dictionary`;
CREATE TABLE `el_dictionary` (
  `id` varchar(10) NOT NULL COMMENT '编号',
  `dict_type_code` varchar(10) NOT NULL COMMENT '类型编号',
  `pid` varchar(10) NOT NULL COMMENT '父级编号',
  `dict_code` varchar(10) NOT NULL COMMENT '字典编号',
  `dict_name` varchar(10) NOT NULL COMMENT '字典名称',
  `dict_type_name` varchar(20) NOT NULL COMMENT '字典类型名称',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_dictionary
-- ----------------------------
INSERT INTO `el_dictionary` VALUES ('1', '1', '0', '1', '男', '性别', null);
INSERT INTO `el_dictionary` VALUES ('10', '4', '0', '20000', '二级审核', '订单审核', null);
INSERT INTO `el_dictionary` VALUES ('2', '1', '0', '2', '女', '性别', null);
INSERT INTO `el_dictionary` VALUES ('3', '2', '0', '3', '三期', '分期数', null);
INSERT INTO `el_dictionary` VALUES ('4', '2', '0', '6', '六期', '分期数', null);
INSERT INTO `el_dictionary` VALUES ('5', '2', '0', '9', '九期', '分期数', null);
INSERT INTO `el_dictionary` VALUES ('6', '2', '0', '12', '十二期', '分期数', null);
INSERT INTO `el_dictionary` VALUES ('7', '3', '0', '11', '可用', '状态', null);
INSERT INTO `el_dictionary` VALUES ('8', '3', '0', '10', '不可用', '状态', null);
INSERT INTO `el_dictionary` VALUES ('9', '4', '0', '10000', '一级审核', '订单审核', null);

-- ----------------------------
-- Table structure for el_feedback
-- ----------------------------
DROP TABLE IF EXISTS `el_feedback`;
CREATE TABLE `el_feedback` (
  `id` varchar(10) NOT NULL COMMENT '主键ID',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `user_id` varchar(10) NOT NULL COMMENT '与用户表id关联',
  `text` text NOT NULL COMMENT '反馈内容',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  `status` varchar(10) NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈';

-- ----------------------------
-- Records of el_feedback
-- ----------------------------
INSERT INTO `el_feedback` VALUES ('1', '2019-09-01 21:15:49', '2019-09-01 21:15:52', '1', '网站速度太慢了建议多开几个服务器', null, '11');
INSERT INTO `el_feedback` VALUES ('2', '2019-09-01 21:15:49', '2019-09-01 21:15:52', '3', '网站很多房间照片都是假的建议审核', '', '11');
INSERT INTO `el_feedback` VALUES ('3', '2019-09-01 21:15:49', '2019-09-01 21:15:52', '3', '没啥想说的试一试功能', '', '11');
INSERT INTO `el_feedback` VALUES ('4', '2019-09-01 21:15:49', '2019-09-01 21:15:52', '3', '网站很好但没有收藏功能', '', '11');
INSERT INTO `el_feedback` VALUES ('5', '2019-09-01 21:15:49', '2019-09-01 21:15:52', '3', '希望越做越好', '', '11');

-- ----------------------------
-- Table structure for el_log
-- ----------------------------
DROP TABLE IF EXISTS `el_log`;
CREATE TABLE `el_log` (
  `id` varchar(10) NOT NULL COMMENT '主键ID',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '更新日期',
  `log_type` varchar(10) NOT NULL COMMENT '日志类型',
  `log_path` varchar(200) NOT NULL COMMENT '日志地址',
  `redundant` varchar(1) NOT NULL COMMENT '冗余',
  `status` varchar(10) NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';

-- ----------------------------
-- Records of el_log
-- ----------------------------
INSERT INTO `el_log` VALUES ('1', '2019-09-01 21:07:10', '2019-09-01 21:07:13', '系统日志', 'ftp://192.168.1.139/home/logs', '', '11');
INSERT INTO `el_log` VALUES ('2', '2019-09-01 21:07:10', '2019-09-01 21:07:13', '应用程序日志', 'ftp://192.168.1.139/home/logs', '', '11');
INSERT INTO `el_log` VALUES ('3', '2019-09-01 21:07:10', '2019-09-01 21:07:13', '应用程序日志', 'ftp://192.168.1.139/home/logs', '', '11');
INSERT INTO `el_log` VALUES ('4', '2019-09-01 21:07:10', '2019-09-01 21:07:13', '安全日志', 'ftp://192.168.1.139/home/logs', '', '11');
INSERT INTO `el_log` VALUES ('5', '2019-09-01 21:07:10', '2019-09-01 21:07:13', '安全日志', 'ftp://192.168.1.139/home/logs', '', '11');

-- ----------------------------
-- Table structure for el_menu
-- ----------------------------
DROP TABLE IF EXISTS `el_menu`;
CREATE TABLE `el_menu` (
  `id` varchar(10) NOT NULL COMMENT '菜单id',
  `menu_name` varchar(10) NOT NULL COMMENT '菜单名称',
  `pid` varchar(10) NOT NULL COMMENT '菜单父级id',
  `menu_url` varchar(30) NOT NULL COMMENT '菜单路径',
  `menu_icon` varchar(20) NOT NULL COMMENT '菜单图标',
  `create_time` datetime NOT NULL COMMENT '生成时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_menu
-- ----------------------------
INSERT INTO `el_menu` VALUES ('1', '管理员节点', '0', '', 'el-icon-menu', '2019-09-01 22:04:55', '2019-09-01 22:04:58', null, '11');
INSERT INTO `el_menu` VALUES ('10', '贷款二级审核', '8', 'rentVerify_2.html', 'el-icon-document', '2019-09-01 22:26:15', '2019-09-01 22:26:18', null, '11');
INSERT INTO `el_menu` VALUES ('11', '房源一级审核', '8', 'houseVerify_1.html', 'el-icon-document', '2019-09-01 22:28:16', '2019-09-01 22:28:18', null, '11');
INSERT INTO `el_menu` VALUES ('12', '房源二级审核', '8', 'houseVerify_2.html', 'el-icon-document', '2019-09-01 22:28:56', '2019-09-01 22:28:58', null, '11');
INSERT INTO `el_menu` VALUES ('13', '经纪人节点', '0', '', 'el-icon-menu', '2019-09-01 22:57:01', '2019-09-01 22:57:04', null, '11');
INSERT INTO `el_menu` VALUES ('14', '我的房源', '13', 'agent_myHouse.html', 'el-icon-document', '2019-09-01 22:32:58', '2019-09-01 22:33:00', null, '11');
INSERT INTO `el_menu` VALUES ('15', '发布房源', '13', 'agent_upHouse.html', 'el-icon-document', '2019-09-01 22:34:04', '2019-09-01 22:34:06', null, '11');
INSERT INTO `el_menu` VALUES ('16', '个人中心', '13', '', 'el-icon-document', '2019-09-01 22:34:45', '2019-09-01 22:34:51', null, '11');
INSERT INTO `el_menu` VALUES ('17', '我的资料', '16', 'agent_myCenter.html', 'el-icon-document', '2019-09-01 22:36:23', '2019-09-01 22:36:25', null, '11');
INSERT INTO `el_menu` VALUES ('18', '我的消息', '16', 'agent_notify.html', 'el-icon-document', '2019-09-01 22:37:22', '2019-09-01 22:37:24', null, '11');
INSERT INTO `el_menu` VALUES ('19', '个人中心', '1', '', 'el-icon-document', '2019-09-01 22:38:35', '2019-09-01 22:38:38', null, '11');
INSERT INTO `el_menu` VALUES ('2', '用户管理', '1', '', 'el-icon-menu', '2019-09-01 22:05:34', '2019-09-01 22:05:37', null, '11');
INSERT INTO `el_menu` VALUES ('20', '我的资料', '19', 'admin_myCenter.html', 'el-icon-document', '2019-09-01 22:39:29', '2019-09-01 22:39:32', null, '11');
INSERT INTO `el_menu` VALUES ('21', '我的消息', '19', 'admin_notify.html', 'el-icon-document', '2019-09-01 22:40:27', '2019-09-01 22:40:29', null, '11');
INSERT INTO `el_menu` VALUES ('22', '房源管理', '1', 'houseManage.html', 'el-icon-document', '2019-09-01 22:43:24', '2019-09-01 22:43:27', null, '11');
INSERT INTO `el_menu` VALUES ('23', '贷款管理', '1', 'rentManage.html', 'el-icon-document', '2019-09-01 22:43:48', '2019-09-01 22:43:51', null, '11');
INSERT INTO `el_menu` VALUES ('24', '反馈管理', '1', 'feedback.html', 'el-icon-document', '2019-09-01 22:53:15', '2019-09-01 22:53:17', null, '11');
INSERT INTO `el_menu` VALUES ('25', '日志管理', '1', 'log.html', 'el-icon-document', '2019-09-01 22:50:46', '2019-09-01 22:50:49', null, '11');
INSERT INTO `el_menu` VALUES ('26', '字典管理', '1', 'dictionary.html', 'el-icon-document', '2019-09-01 22:53:51', '2019-09-01 22:53:53', null, '11');
INSERT INTO `el_menu` VALUES ('27', '菜单管理', '1', 'menu.html', 'el-icon-document', '2019-09-01 23:05:36', '2019-09-01 23:05:38', null, '11');
INSERT INTO `el_menu` VALUES ('3', '前台用户管理', '2', 'userManage_customer.html', 'el-icon-document', '2019-09-01 22:07:03', '2019-09-01 22:07:06', null, '11');
INSERT INTO `el_menu` VALUES ('4', '管理员管理', '2', 'userManage_admin.html', 'el-icon-document', '2019-09-01 22:08:57', '2019-09-01 22:09:00', null, '11');
INSERT INTO `el_menu` VALUES ('5', '角色权限管理', '1', '', 'el-icon-menu', '2019-09-01 22:15:01', '2019-09-01 22:15:03', null, '11');
INSERT INTO `el_menu` VALUES ('6', '角色管理', '5', 'roleManage.html', 'el-icon-document', '2019-09-01 22:19:47', '2019-09-01 22:19:50', null, '11');
INSERT INTO `el_menu` VALUES ('7', '权限管理', '5', 'permissionManage.html', 'el-icon-document', '2019-09-01 22:20:15', '2019-09-01 22:20:17', null, '11');
INSERT INTO `el_menu` VALUES ('8', '审核管理', '1', '', 'el-icon-menu', '2019-09-01 22:24:12', '2019-09-01 22:24:14', null, '11');
INSERT INTO `el_menu` VALUES ('9', '贷款一级审核', '8', 'rentVerify_1.html', 'el-icon-document', '2019-09-01 22:25:11', '2019-09-01 22:25:14', null, '11');

-- ----------------------------
-- Table structure for el_permission
-- ----------------------------
DROP TABLE IF EXISTS `el_permission`;
CREATE TABLE `el_permission` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '权限编号',
  `permission_name` varchar(16) NOT NULL COMMENT '权限名称',
  `permission_url` varchar(30) NOT NULL COMMENT '权限路径',
  `create_time` datetime NOT NULL COMMENT '生成日期',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_permission
-- ----------------------------
INSERT INTO `el_permission` VALUES ('1', '贷款审核权限', '/loan/update', '2019-09-01 23:06:59', '2019-09-01 23:07:01', null, '11');
INSERT INTO `el_permission` VALUES ('2', '租房审核权限', '/rent/update', '2019-09-01 23:15:34', '2019-09-01 23:15:36', null, '11');
INSERT INTO `el_permission` VALUES ('3', '查看房东详情权限', '/rent/select/user', '2019-09-01 23:16:36', '2019-09-01 23:16:39', null, '11');

-- ----------------------------
-- Table structure for el_role
-- ----------------------------
DROP TABLE IF EXISTS `el_role`;
CREATE TABLE `el_role` (
  `id` varchar(10) NOT NULL COMMENT '角色编号',
  `role_name` varchar(16) DEFAULT NULL COMMENT '角色名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `redundant` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_role
-- ----------------------------
INSERT INTO `el_role` VALUES ('1', '超级管理员', '2019-09-01 20:59:55', '2019-09-01 20:59:58', '', '11');
INSERT INTO `el_role` VALUES ('2', '一级贷款审核员', '2019-09-01 21:00:53', '2019-09-01 21:00:55', '', '11');
INSERT INTO `el_role` VALUES ('3', '二级贷款审核员', '2019-09-01 21:01:06', '2019-09-01 21:01:09', null, '11');
INSERT INTO `el_role` VALUES ('4', '一级租房审核员', '2019-09-01 21:01:36', '2019-09-01 21:01:38', null, '11');
INSERT INTO `el_role` VALUES ('5', '二级租房审核员', '2019-09-01 21:02:08', '2019-09-01 21:02:10', null, '11');
INSERT INTO `el_role` VALUES ('6', '经纪人', '2019-09-01 21:02:41', '2019-09-01 21:02:44', null, '11');
INSERT INTO `el_role` VALUES ('7', '房东', '2019-09-01 21:03:08', '2019-09-01 21:03:11', null, '11');
INSERT INTO `el_role` VALUES ('8', '租客', '2019-09-01 21:03:59', '2019-09-01 21:04:01', null, '11');

-- ----------------------------
-- Table structure for el_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `el_role_permission`;
CREATE TABLE `el_role_permission` (
  `role_id` varchar(10) NOT NULL COMMENT '角色id',
  `permission_id` varchar(10) NOT NULL COMMENT '权限id',
  `create_time` datetime NOT NULL COMMENT '生成时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_role_permission
-- ----------------------------
INSERT INTO `el_role_permission` VALUES ('1', '2', '2019-09-01 23:17:17', '2019-09-01 23:17:19', null, '11');
INSERT INTO `el_role_permission` VALUES ('1', '3', '2019-09-01 23:17:28', '2019-09-01 23:17:30', null, '11');
INSERT INTO `el_role_permission` VALUES ('2', '4', '2019-09-01 23:17:43', '2019-09-01 23:17:46', null, '11');
INSERT INTO `el_role_permission` VALUES ('2', '5', '2019-09-01 23:17:55', '2019-09-01 23:17:57', null, '11');
INSERT INTO `el_role_permission` VALUES ('3', '6', '2019-09-01 23:18:20', '2019-09-01 23:18:23', null, '11');

-- ----------------------------
-- Table structure for el_user
-- ----------------------------
DROP TABLE IF EXISTS `el_user`;
CREATE TABLE `el_user` (
  `id` varchar(10) NOT NULL COMMENT '用户编号',
  `username` varchar(15) NOT NULL COMMENT '用户登录名',
  `phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `salt` varchar(10) NOT NULL COMMENT '盐值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_user
-- ----------------------------
INSERT INTO `el_user` VALUES ('1', 'admin', '15514507017', '123456', 'admin', '2019-09-01 20:55:30', '2019-09-01 20:55:36', null, '11');
INSERT INTO `el_user` VALUES ('2', 'zhangsan', '15514504144', '123456', 'zhangsan', '2019-09-01 21:46:10', '2019-09-01 21:46:13', null, '11');
INSERT INTO `el_user` VALUES ('3', 'lisi', '15514514447', '123456', 'lisi', '2019-09-01 21:46:42', '2019-09-01 21:46:44', null, '11');
INSERT INTO `el_user` VALUES ('4', 'wangwu', '14587478455', '123456', 'wangwu', '2019-09-01 21:47:14', '2019-09-01 21:47:17', null, '11');
INSERT INTO `el_user` VALUES ('5', 'renliu', '16584987584', '123456', 'renliu', '2019-09-01 21:48:02', '2019-09-01 21:48:04', null, '11');
INSERT INTO `el_user` VALUES ('6', 'handong', '12545154587', '123456', 'handong', '2019-09-01 21:48:30', '2019-09-01 21:48:33', null, '11');
INSERT INTO `el_user` VALUES ('7', 'huangyaxiang', '14551418491', '123456', 'huangyaxia', '2019-09-01 21:49:35', '2019-09-01 21:49:37', null, '11');
INSERT INTO `el_user` VALUES ('8', 'haowenkang', '14946568791', '123456', 'haowenkang', '2019-09-01 21:50:04', '2019-09-01 21:50:05', null, '11');
INSERT INTO `el_user` VALUES ('9', 'sunyijing', '11546156498', '123456', 'sunyijing', '2019-09-01 21:50:29', '2019-09-01 21:50:32', null, '11');

-- ----------------------------
-- Table structure for el_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `el_user_detail`;
CREATE TABLE `el_user_detail` (
  `id` varchar(10) NOT NULL DEFAULT '' COMMENT '用户编号',
  `creditcard` varchar(16) DEFAULT '' COMMENT '信用卡号',
  `bankcard` varchar(16) DEFAULT NULL COMMENT '银行卡号',
  `job` varchar(16) DEFAULT NULL COMMENT '工作',
  `address` varchar(30) DEFAULT NULL COMMENT '联系地址',
  `emergency_contact_phone` varchar(11) DEFAULT NULL COMMENT '紧急联系人电话',
  `emergency_contact` varchar(13) DEFAULT NULL COMMENT '紧急联系人',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `real_name` varchar(13) DEFAULT NULL COMMENT '真实姓名',
  `company_name` varchar(25) DEFAULT NULL COMMENT '公司名',
  `company_tel` varchar(15) DEFAULT NULL COMMENT '公司联系电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundante` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_user_detail
-- ----------------------------
INSERT INTO `el_user_detail` VALUES ('2', '6217002430029897', '6217002430029897', '教师', '郑州市杨金路牛顿国际', '15455656565', '罗丽莉', '415756988996654554', '张三', 'aaa软件教育', '0371-65080815', '2019-09-01 21:50:53', '2019-09-01 21:50:56', null, '11');
INSERT INTO `el_user_detail` VALUES ('3', '6216546516154655', '6254645561261641', '公务员', '郑州市三泉路87号院', '15546598941', '杨旭', '646516516541651651', '李四', '工商局信息处', '0371-62654646', '2019-09-01 22:50:53', '2019-09-01 21:50:56', '', '11');
INSERT INTO `el_user_detail` VALUES ('4', '6224654961651654', '6265464918461654', '司机', '郑州市花园路56号院', '15654615615', '徐思远', '412648964515416516', '王五', '致远出租公司', '0371-64684554', '2019-09-01 22:54:53', '2019-09-01 21:50:56', '', '11');
INSERT INTO `el_user_detail` VALUES ('5', '6265415165416545', '6232456165645615', '餐厅老板', '郑州市红专路48号院', '15645846415', '景瑞阳', '463546856154154545', '任六', '春川里餐厅', '0371-64654545', '2019-09-01 23:54:53', '2019-09-01 21:50:56', '', '11');

-- ----------------------------
-- Table structure for el_user_role
-- ----------------------------
DROP TABLE IF EXISTS `el_user_role`;
CREATE TABLE `el_user_role` (
  `user_id` varchar(10) NOT NULL COMMENT '用户编号',
  `role_id` varchar(10) NOT NULL COMMENT '角色编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_user_role
-- ----------------------------
INSERT INTO `el_user_role` VALUES ('1', '1', '2019-09-01 21:05:52', '2019-09-01 21:05:54', null, '11');
INSERT INTO `el_user_role` VALUES ('2', '6', '2019-09-01 22:09:43', '2019-09-01 22:09:49', null, '11');
INSERT INTO `el_user_role` VALUES ('3', '7', '2019-09-01 22:09:46', '2019-09-01 22:09:52', null, '11');
INSERT INTO `el_user_role` VALUES ('4', '8', '2019-09-01 22:09:54', '2019-09-01 22:09:57', null, '11');
INSERT INTO `el_user_role` VALUES ('5', '8', '2019-09-01 22:10:00', '2019-09-01 22:10:02', null, '11');
INSERT INTO `el_user_role` VALUES ('6', '2', '2019-09-01 22:10:04', '2019-09-01 22:10:07', null, '11');
INSERT INTO `el_user_role` VALUES ('7', '3', '2019-09-01 22:10:11', '2019-09-01 22:10:14', null, '11');
INSERT INTO `el_user_role` VALUES ('8', '4', '2019-09-01 22:10:16', '2019-09-01 22:10:18', null, '11');
INSERT INTO `el_user_role` VALUES ('9', '5', '2019-09-01 22:10:20', '2019-09-01 22:10:24', null, '11');
