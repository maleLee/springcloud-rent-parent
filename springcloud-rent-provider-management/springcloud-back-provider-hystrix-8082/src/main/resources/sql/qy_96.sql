/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : qy_96

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-09-19 11:43:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eldk_loan
-- ----------------------------
DROP TABLE IF EXISTS `eldk_loan`;
CREATE TABLE `eldk_loan` (
  `id` varchar(10) NOT NULL COMMENT '贷款订单的编号',
  `user_id` varchar(10) NOT NULL COMMENT '贷款用户的编号',
  `loan_money` double NOT NULL COMMENT '贷款金额',
  `pay_times` int(2) NOT NULL COMMENT '还款的期数（不和字典表关联）',
  `rent_type` varchar(10) NOT NULL COMMENT '贷款类型（对应数据字典里的贷款类型）',
  `loan_time` datetime NOT NULL COMMENT '贷款时间',
  `update_time` datetime NOT NULL,
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='贷款表，记录了贷款的用户和贷款的详细信息。';

-- ----------------------------
-- Records of eldk_loan
-- ----------------------------
INSERT INTO `eldk_loan` VALUES ('1', '1', '10000', '3', '20001', '2019-09-26 21:48:24', '2019-09-01 21:48:28', null, '30003');
INSERT INTO `eldk_loan` VALUES ('2', '2', '20000', '12', '20002', '2019-09-04 21:55:20', '2019-09-05 21:55:23', null, '30005');
INSERT INTO `eldk_loan` VALUES ('3', '3', '10000', '6', '20002', '2019-09-01 21:55:43', '2019-09-01 21:55:45', null, '30005');
INSERT INTO `eldk_loan` VALUES ('4', '4', '8000', '6', '20002', '2019-09-01 22:34:06', '2019-09-01 22:34:09', null, '30010');
INSERT INTO `eldk_loan` VALUES ('5', '5', '4000', '3', '20001', '2019-09-01 22:34:20', '2019-09-01 22:34:22', null, '30006');

-- ----------------------------
-- Table structure for eldk_repay
-- ----------------------------
DROP TABLE IF EXISTS `eldk_repay`;
CREATE TABLE `eldk_repay` (
  `id` varchar(16) NOT NULL COMMENT '还款订单的id',
  `loan_id` varchar(10) NOT NULL COMMENT '贷款id',
  `user_id` varchar(16) NOT NULL COMMENT '贷款人外键',
  `repay` double(8,0) DEFAULT NULL COMMENT '还款金额',
  `rest_repay` double(8,0) NOT NULL COMMENT '剩余未还金额',
  `repay_time` datetime NOT NULL COMMENT '还款时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '贷款状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of eldk_repay
-- ----------------------------
INSERT INTO `eldk_repay` VALUES ('1', '1', '1', '600', '1200', '2019-09-02 21:45:23', '2019-09-01 21:45:36', null, '30015');
INSERT INTO `eldk_repay` VALUES ('2', '2', '2', '400', '5000', '2019-09-10 21:46:29', '2019-09-05 21:46:38', null, '30015');
INSERT INTO `eldk_repay` VALUES ('3', '3', '3', '800', '3600', '2019-08-31 21:46:59', '2019-09-01 21:47:05', null, '30016');
INSERT INTO `eldk_repay` VALUES ('4', '4', '4', '1000', '2400', '2019-09-01 22:34:39', '2019-09-01 22:34:45', null, '30015');
INSERT INTO `eldk_repay` VALUES ('5', '5', '5', '800', '3200', '2019-09-01 22:34:55', '2019-09-01 22:35:01', null, '30014');

-- ----------------------------
-- Table structure for elzf_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `elzf_evaluate`;
CREATE TABLE `elzf_evaluate` (
  `id` varchar(10) NOT NULL COMMENT '主键ID',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `user_id` varchar(10) NOT NULL COMMENT '租客外键',
  `text` text NOT NULL COMMENT '评价的内容',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  `rent_id` varchar(10) DEFAULT NULL COMMENT '房源外键',
  `evaluate_point` int(3) DEFAULT NULL COMMENT '评价分数',
  `evaluate_time` datetime DEFAULT NULL COMMENT '评价时间',
  `evaluate_status` varchar(10) DEFAULT NULL COMMENT '评价状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈';

-- ----------------------------
-- Records of elzf_evaluate
-- ----------------------------
INSERT INTO `elzf_evaluate` VALUES ('1', '2019-09-01 21:15:52', '1', '网站速度太慢了建议多开几个服务器', null, '1', '90', '2019-09-03 15:05:48', '所有人可见');
INSERT INTO `elzf_evaluate` VALUES ('2', '2019-09-01 21:15:52', '3', '网站很多房间照片都是假的建议审核', '', '1', '80', '2019-09-03 15:05:52', '所有人可见');
INSERT INTO `elzf_evaluate` VALUES ('3', '2019-09-01 21:15:52', '3', '没啥想说的试一试功能', '', '2', '70', '2019-09-03 15:05:55', '所有人可见');
INSERT INTO `elzf_evaluate` VALUES ('4', '2019-09-01 21:15:52', '3', '网站很好但没有收藏功能', '', '2', '80', '2019-09-03 15:05:59', '所有人可见');
INSERT INTO `elzf_evaluate` VALUES ('5', '2019-09-01 21:15:52', '3', '希望越做越好', '', '3', '85', '2019-09-03 15:06:01', '所有人可见');

-- ----------------------------
-- Table structure for elzf_favorite
-- ----------------------------
DROP TABLE IF EXISTS `elzf_favorite`;
CREATE TABLE `elzf_favorite` (
  `id` varchar(10) NOT NULL COMMENT '主键',
  `user_id` varchar(10) NOT NULL COMMENT '收藏人的外键',
  `favorite_time` datetime NOT NULL COMMENT '收藏时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_favorite
-- ----------------------------
INSERT INTO `elzf_favorite` VALUES ('1', '1', '2019-09-03 15:40:56', '2019-09-03 15:40:58', null);
INSERT INTO `elzf_favorite` VALUES ('2', '2', '2019-09-03 15:41:05', '2019-09-03 15:41:09', null);
INSERT INTO `elzf_favorite` VALUES ('3', '3', '2019-09-03 15:41:25', '2019-09-05 15:41:28', null);
INSERT INTO `elzf_favorite` VALUES ('4', '4', '2019-09-03 15:41:30', '2019-09-03 15:41:33', null);
INSERT INTO `elzf_favorite` VALUES ('5', '5', '2019-09-03 15:41:36', '2019-09-03 15:41:39', null);

-- ----------------------------
-- Table structure for elzf_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `elzf_order_detail`;
CREATE TABLE `elzf_order_detail` (
  `id` varchar(10) NOT NULL COMMENT '主键',
  `user_id` varchar(10) NOT NULL COMMENT '租客外键（一对多）',
  `rent_id` varchar(10) NOT NULL COMMENT '房源外键',
  `total` double(6,0) NOT NULL COMMENT '总租金',
  `live_time` datetime NOT NULL COMMENT '入住时间',
  `pay_way` varchar(8) NOT NULL COMMENT '付款方式',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_order_detail
-- ----------------------------
INSERT INTO `elzf_order_detail` VALUES ('1', '1', '1', '20000', '2019-09-03 15:36:10', '40001', null);
INSERT INTO `elzf_order_detail` VALUES ('2', '2', '2', '18000', '2019-09-03 15:36:29', '40002', null);
INSERT INTO `elzf_order_detail` VALUES ('3', '3', '3', '12000', '2019-09-04 22:23:41', '40003', null);

-- ----------------------------
-- Table structure for elzf_rent
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent`;
CREATE TABLE `elzf_rent` (
  `id` varchar(10) NOT NULL COMMENT '房源编号',
  `user_id` varchar(10) NOT NULL COMMENT '发布者外键',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `trapeze` varchar(15) NOT NULL COMMENT '经度与纬度',
  `area` varchar(16) NOT NULL COMMENT '地区',
  `community` varchar(11) NOT NULL COMMENT '小区名',
  `pay` double(11,0) NOT NULL COMMENT '租金',
  `house_type` varchar(16) NOT NULL COMMENT '户型',
  `house_size` double(5,0) NOT NULL COMMENT '面积',
  `floor` varchar(16) NOT NULL COMMENT '楼层',
  `orientation` varchar(11) NOT NULL COMMENT '朝向',
  `charge_strategy` varchar(10) NOT NULL COMMENT '押租策略',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent
-- ----------------------------
INSERT INTO `elzf_rent` VALUES ('1', '2', '新房1', '113.65,34.78', '金水区', '花园小区', '1000', '60001', '120', '16', '南', '50001', '2019-09-01 21:56:23', '2019-09-01 21:56:26', null, '30008');
INSERT INTO `elzf_rent` VALUES ('2', '4', '新房2', '113.65,33.78', '惠济区', '幸福小区', '1200', '60002', '100', '3', '东', '50002', '2019-09-01 22:24:29', '2019-09-26 22:24:33', null, '30008');
INSERT INTO `elzf_rent` VALUES ('3', '6', '新房3', '112.65,34.78', '农业路', '金水小区', '800', '60003', '80', '9', '北', '50001', '2019-09-01 22:30:35', '2019-09-11 22:30:38', null, '30008');
INSERT INTO `elzf_rent` VALUES ('4', '5', '新房4', '113.35,34.28', '经三路', 'AAA小区', '1800', '60003', '110', '17', '西', '50003', '2019-09-13 22:32:11', '2019-09-01 22:32:14', null, '30008');
INSERT INTO `elzf_rent` VALUES ('5', '10', '新房5', '113.05,34.08', '杨金路', '辉瑞财智广场', '1200', '60005', '90', '10', '南', '50003', '2019-09-01 22:35:26', '2019-09-01 22:35:29', null, '30008');

-- ----------------------------
-- Table structure for elzf_rent_detail
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent_detail`;
CREATE TABLE `elzf_rent_detail` (
  `id` varchar(10) NOT NULL COMMENT '房源详情表主键',
  `rent_id` varchar(10) NOT NULL COMMENT '与房源表关联的外键',
  `rent_type` varchar(10) NOT NULL COMMENT '房源类型',
  `rent_address` varchar(50) NOT NULL COMMENT '房源地址',
  `room_facilities` varchar(50) DEFAULT NULL COMMENT '房间设施',
  `real_picture` varchar(50) NOT NULL COMMENT '实景图',
  `house_property_certification` varchar(50) NOT NULL COMMENT '房产证',
  `house_description` varchar(60) NOT NULL COMMENT '房屋描述',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent_detail
-- ----------------------------
INSERT INTO `elzf_rent_detail` VALUES ('1', '1', '商品房', '河南省郑州市金水区花园路101', '空调,暖气，洗衣机', 'ftp://192.168.1.131/home/pic1', 'ftp://192.168.1.131/home/hosecertifaction1/', '房间大离市区近所有家具一应俱全', null);
INSERT INTO `elzf_rent_detail` VALUES ('2', '2', '商品房', '河南省郑州市金水区花园路102', '空调,暖气', 'ftp://192.168.1.131/home/pic2', 'ftp://192.168.1.131/home/hosecertifaction2/', '房间大所有家具一应俱全', '');
INSERT INTO `elzf_rent_detail` VALUES ('3', '3', '学区房', '河南省郑州市金水区花园路103', '空调', 'ftp://192.168.1.131/home/pic3', 'ftp://192.168.1.131/home/hosecertifaction3/', '离学校近上学方便', '');
INSERT INTO `elzf_rent_detail` VALUES ('4', '4', '地铁房', '河南省郑州市金水区花园路104', '洗衣机', 'ftp://192.168.1.131/home/pic4', 'ftp://192.168.1.131/home/hosecertifaction4/', '离地铁近交通方便', '');
INSERT INTO `elzf_rent_detail` VALUES ('5', '5', '普通房', '河南省郑州市金水区花园路105', '无', 'ftp://192.168.1.131/home/pic5', 'ftp://192.168.1.131/home/hosecertifaction5/', '无明显特色', '');

-- ----------------------------
-- Table structure for elzf_rent_favorite
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent_favorite`;
CREATE TABLE `elzf_rent_favorite` (
  `rent_id` varchar(10) NOT NULL COMMENT '房源主键',
  `favorite_id` varchar(10) NOT NULL COMMENT '收藏主键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`rent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent_favorite
-- ----------------------------
INSERT INTO `elzf_rent_favorite` VALUES ('1', '1', '2019-09-03 15:44:26', '2019-09-03 15:44:29');
INSERT INTO `elzf_rent_favorite` VALUES ('2', '2', '2019-09-03 15:44:50', '2019-09-04 15:45:04');
INSERT INTO `elzf_rent_favorite` VALUES ('3', '3', '2019-09-03 15:44:54', '2019-09-13 15:45:09');
INSERT INTO `elzf_rent_favorite` VALUES ('4', '4', '2019-09-03 15:44:58', '2019-09-05 15:45:13');
INSERT INTO `elzf_rent_favorite` VALUES ('5', '5', '2019-09-03 15:45:02', '2019-09-06 15:45:17');

-- ----------------------------
-- Table structure for elzf_rent_tag
-- ----------------------------
DROP TABLE IF EXISTS `elzf_rent_tag`;
CREATE TABLE `elzf_rent_tag` (
  `rent_id` varchar(10) NOT NULL COMMENT '关联的房源表id',
  `tag_id` varchar(10) NOT NULL COMMENT '关联的标签表的id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rent_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_rent_tag
-- ----------------------------
INSERT INTO `elzf_rent_tag` VALUES ('1', '1', '2019-09-03 15:40:02', '2019-09-03 15:40:05');
INSERT INTO `elzf_rent_tag` VALUES ('1', '2', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('1', '3', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('1', '4', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('1', '5', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('2', '2', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('2', '4', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('3', '2', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('3', '5', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('4', '1', '2019-09-03 15:40:02', '2019-09-03 15:40:02');
INSERT INTO `elzf_rent_tag` VALUES ('5', '5', '2019-09-03 15:40:02', '2019-09-03 15:40:02');

-- ----------------------------
-- Table structure for elzf_tag
-- ----------------------------
DROP TABLE IF EXISTS `elzf_tag`;
CREATE TABLE `elzf_tag` (
  `id` varchar(10) NOT NULL COMMENT '标签表主键',
  `key` varchar(10) NOT NULL COMMENT '标签的key',
  `value` varchar(20) NOT NULL COMMENT '标签的值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余',
  `status` varchar(10) NOT NULL COMMENT '可用状态与字典表关联',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of elzf_tag
-- ----------------------------
INSERT INTO `elzf_tag` VALUES ('1', '1', '独立卫生间', '2019-09-03 15:31:42', '2019-09-03 15:31:44', null, '30001');
INSERT INTO `elzf_tag` VALUES ('2', '2', '距离地铁很近', '2019-09-03 15:32:02', '2019-09-03 15:32:04', null, '30001');
INSERT INTO `elzf_tag` VALUES ('3', '3', '离学校很近', '2019-09-03 15:33:49', '2019-09-03 15:33:51', null, '30001');
INSERT INTO `elzf_tag` VALUES ('4', '4', '家具齐全', '2019-09-03 15:34:08', '2019-09-03 15:34:11', null, '30001');
INSERT INTO `elzf_tag` VALUES ('5', '5', '房子很大', '2019-09-03 15:34:28', '2019-09-03 15:34:32', null, '30001');

-- ----------------------------
-- Table structure for el_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `el_dictionary`;
CREATE TABLE `el_dictionary` (
  `id` varchar(10) NOT NULL COMMENT '编号',
  `dict_code` varchar(10) NOT NULL COMMENT '字典编号',
  `dict_name` varchar(10) NOT NULL COMMENT '字典名称',
  `dict_type_code` varchar(10) NOT NULL COMMENT '类型编号',
  `dict_type_name` varchar(20) NOT NULL COMMENT '字典类型名称',
  `pid` varchar(10) NOT NULL COMMENT '父级编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据字典表，存放了本系统的所有公共数据';

-- ----------------------------
-- Records of el_dictionary
-- ----------------------------
INSERT INTO `el_dictionary` VALUES ('1', '10001', '男', '1', '性别', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('12', '30005', '审核未通过', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('13', '30006', '未审核', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('14', '30007', '已发布', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('15', '30008', '已入住', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('16', '30009', '已预约', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('17', '30010', '已放贷', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('18', '30011', '已还清', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('19', '30014', '逾期未还', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('2', '10002', '女', '1', '性别', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('20', '30013', '已读', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('21', '30012', '未读', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('22', '30015', '提前还款', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('23', '30016', '正常还款', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('24', '30017', '交易完成', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('25', '30018', '交易关闭', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('26', '40001', '支付宝', '4', '支付方式', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('27', '40002', '微信', '4', '支付方式', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('28', '40003', '现金', '4', '支付方式', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('29', '50001', '押一付三', '5', '押付方式', '0', '2019-09-05 16:50:23', '2019-09-05 16:50:25', '1');
INSERT INTO `el_dictionary` VALUES ('3', '20001', '等额本息', '2', '还款类型', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('30', '50002', '押一付六', '5', '押付方式', '0', '2019-09-05 16:50:44', '2019-09-05 16:50:46', '1');
INSERT INTO `el_dictionary` VALUES ('31', '50003', '押一付十二', '5', '押付方式', '0', '2019-09-05 16:51:08', '2019-09-05 16:51:11', '1');
INSERT INTO `el_dictionary` VALUES ('32', '60001', '一室一厅', '6', '房源户型', '0', '2019-09-05 16:53:35', '2019-09-05 16:53:37', '1');
INSERT INTO `el_dictionary` VALUES ('33', '60002', '两室一厅', '6', '房源户型', '0', '2019-09-05 16:53:58', '2019-09-05 16:54:00', '1');
INSERT INTO `el_dictionary` VALUES ('34', '60003', '两室两厅', '6', '房源户型', '0', '2019-09-05 16:54:17', '2019-09-05 16:54:19', '1');
INSERT INTO `el_dictionary` VALUES ('35', '60004', '三室两厅两卫', '6', '房源户型', '0', '2019-09-05 16:54:46', '2019-09-05 16:54:48', '1');
INSERT INTO `el_dictionary` VALUES ('36', '60005', '三室两厅一卫', '6', '房源户型', '0', '2019-09-05 16:55:32', '2019-09-05 16:55:34', '1');
INSERT INTO `el_dictionary` VALUES ('4', '20002', '先息后本', '2', '还款类型', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('6', '30003', '一级审核通过', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('7', '30001', '启用', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');
INSERT INTO `el_dictionary` VALUES ('8', '30002', '禁用', '3', '状态', '0', '2019-09-05 15:09:10', '2019-09-05 15:09:16', '1');

-- ----------------------------
-- Table structure for el_log
-- ----------------------------
DROP TABLE IF EXISTS `el_log`;
CREATE TABLE `el_log` (
  `id` varchar(10) NOT NULL COMMENT '主键ID',
  `user_id` varchar(10) NOT NULL COMMENT '用户id',
  `ip` varchar(15) NOT NULL COMMENT 'ip地址',
  `operational_content` varchar(200) NOT NULL COMMENT '操作内容',
  `operational_type` varchar(10) NOT NULL COMMENT '操作类型',
  `operational_target` varchar(30) NOT NULL COMMENT '操作目标',
  `create_time` varchar(100) NOT NULL COMMENT '操作时间',
  `redundant` varchar(10) NOT NULL COMMENT '冗余',
  `update_time` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';

-- ----------------------------
-- Records of el_log
-- ----------------------------
INSERT INTO `el_log` VALUES ('1', '3', '192.168.127.1', '登录', '1', '192.168.127.1', '2019-09-01 21:07:10', '', '2019-09-01 21:07:10');
INSERT INTO `el_log` VALUES ('2', '2', '192.168.127.1', '修改个人信息', '1', '192.168.127.1', '2019-09-01 21:07:10', '', '2019-09-01 21:07:10');
INSERT INTO `el_log` VALUES ('3', '3', '192.168.127.1', '删除', '2', '192.168.127.1', '2019-09-01 21:07:10', '', '2019-09-01 21:07:10');
INSERT INTO `el_log` VALUES ('4', '2', '192.168.127.1', '修改个人信息', '2', '192.168.127.1', '2019-09-01 21:07:10', '', '2019-09-01 21:07:10');
INSERT INTO `el_log` VALUES ('5', '1', '192.168.127.1', '修改个人信息', '3', '192.168.127.1', '2019-09-01 21:07:10', '', '2019-09-01 21:07:10');

-- ----------------------------
-- Table structure for el_message
-- ----------------------------
DROP TABLE IF EXISTS `el_message`;
CREATE TABLE `el_message` (
  ` id` varchar(10) NOT NULL COMMENT '消息编号',
  `user_id` varchar(10) NOT NULL COMMENT '用户编号',
  `content` varchar(100) NOT NULL COMMENT '消息内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(100) NOT NULL COMMENT '消息状态',
  PRIMARY KEY (` id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统的消息表，用于记录系统向用户发送的消息。';

-- ----------------------------
-- Records of el_message
-- ----------------------------
INSERT INTO `el_message` VALUES ('1', '1', '审核通过，房源发布成功！', '2019-09-03 15:48:49', '2019-09-03 15:48:51', null, '30013');
INSERT INTO `el_message` VALUES ('2', '2', '审核通过，贷款申请成功！', '2019-09-03 15:49:38', '2019-09-03 15:49:42', null, '30013');
INSERT INTO `el_message` VALUES ('3', '3', '审核未通过，发布房源失败！原因：信息与实际不符！', '2019-09-03 15:50:25', '2019-09-03 15:50:28', null, '30013');
INSERT INTO `el_message` VALUES ('4', '4', '正在审核中。。。', '2019-09-03 15:50:53', '2019-09-03 15:50:55', null, '30014');
INSERT INTO `el_message` VALUES ('5', '5', '审核未通过，贷款失败！原因：缺少关键信息！', '2019-09-03 15:51:53', '2019-09-03 15:51:55', null, '30014');

-- ----------------------------
-- Table structure for el_order
-- ----------------------------
DROP TABLE IF EXISTS `el_order`;
CREATE TABLE `el_order` (
  `id` varchar(10) NOT NULL COMMENT '订单表主键',
  `expiration_time` datetime DEFAULT NULL COMMENT '到期时间',
  `status` varchar(10) NOT NULL COMMENT '订单状态',
  `order_type` varchar(10) NOT NULL COMMENT '订单类型',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `rent_detailid` varchar(10) DEFAULT NULL COMMENT '关联的租房详情id',
  `loan_id` varchar(255) DEFAULT NULL COMMENT '关联的贷款表id',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '更新时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of el_order
-- ----------------------------
INSERT INTO `el_order` VALUES ('1', '2019-12-01 15:49:34', '30017', '租房', '2019-09-03 15:50:11', '1', null, '2019-09-03 15:50:19', '2019-09-03 15:50:23', null);
INSERT INTO `el_order` VALUES ('2', null, '30017', '贷款', null, '', '1', '2019-09-03 15:51:05', '2019-09-03 15:51:10', null);
INSERT INTO `el_order` VALUES ('3', '2019-10-01 15:51:18', '30017', '租房', '2019-09-03 15:51:29', '2', null, '2019-09-03 15:51:44', '2019-09-03 15:51:47', null);
INSERT INTO `el_order` VALUES ('4', '2019-10-01 15:52:37', '30018', '租房', '2019-09-03 15:52:53', '3', '', '2019-09-03 15:51:05', '2019-09-03 15:51:10', '');
INSERT INTO `el_order` VALUES ('5', null, '30018', '贷款', null, null, '2', '2019-09-03 15:53:26', '2019-09-03 15:53:29', null);

-- ----------------------------
-- Table structure for el_permission
-- ----------------------------
DROP TABLE IF EXISTS `el_permission`;
CREATE TABLE `el_permission` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '权限编号',
  `permission_name` varchar(16) NOT NULL COMMENT '权限名称',
  `permission_chinese_name` varchar(20) NOT NULL COMMENT '权限中文名称',
  `permission_type` varchar(10) NOT NULL COMMENT '权限类型',
  `permission_discribe` varchar(30) NOT NULL COMMENT '权限描述',
  `pid` varchar(10) NOT NULL COMMENT '父级id',
  `menu_url` varchar(30) NOT NULL COMMENT '菜单地址',
  `menu_icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `create_time` varchar(100) NOT NULL COMMENT '生成日期',
  `update_time` varchar(100) NOT NULL COMMENT '修改时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `is_leaf` varchar(10) DEFAULT NULL COMMENT '是否为叶子节点(1:是，0:不是)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统的权限表。';

-- ----------------------------
-- Records of el_permission
-- ----------------------------
INSERT INTO `el_permission` VALUES ('1', 'user_manager', '用户信息管理', '管理员权限', '用于贷款审核', '0', '/loan/update', 'fa fa-bar-chart fa-fw', '2019-09-01 23:06:59', '2019-09-01 23:07:01', null, '30001', '0');
INSERT INTO `el_permission` VALUES ('2', 'zf:permission', '租房审核权限', '管理员权限', '用于租房审核', '0', '/rent/update', 'fa fa-bar-chart fa-fw', '2019-09-01 23:15:34', '2019-09-01 23:15:36', null, '30001', '0');
INSERT INTO `el_permission` VALUES ('3', 'fdxq', '查看房东详情权限', '管理员权限', '用于查看房东信息', '0', '/rent/select/user', 'fa fa-bar-chart fa-fw', '2019-09-01 23:16:36', '2019-09-01 23:16:39', null, '30001', '0');
INSERT INTO `el_permission` VALUES ('4', 'manager_user', '用户管理', '管理员权限', '用户管理', '0', '', 'el-icon-success', '2019-09-01 23:16:36', '2019-09-01 23:16:36', null, '30001', '0');
INSERT INTO `el_permission` VALUES ('5', 'user_info', '用户信息', '管理员权限', '用户管理-用户信息', '4', '/userInfo', 'el-icon-news', '2019-09-01 23:16:36', '2019-09-01 23:16:36', null, '30001', '1');
INSERT INTO `el_permission` VALUES ('6', 'admin_info', '管理员信息', '管理员权限', '用户管理-管理员信息', '4', '/adminInfo', 'el-icon-news', '2019-09-01 23:16:36', '2019-09-01 23:16:36', null, '30001', '1');

-- ----------------------------
-- Table structure for el_role
-- ----------------------------
DROP TABLE IF EXISTS `el_role`;
CREATE TABLE `el_role` (
  `id` varchar(10) NOT NULL COMMENT '角色编号',
  `role_name` varchar(50) NOT NULL COMMENT '角色名',
  `role_chinese_name` varchar(20) NOT NULL COMMENT '角色中文名称',
  `role_describe` varchar(20) NOT NULL COMMENT '角色描述',
  `create_time` varchar(100) NOT NULL COMMENT '创建时间',
  `update_time` varchar(100) NOT NULL COMMENT '更新时间',
  `redundant` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统角色表。';

-- ----------------------------
-- Records of el_role
-- ----------------------------
INSERT INTO `el_role` VALUES ('1', 'manager', '超级管理员', '超级管理员', '2019-09-01 20:59:55', '2019-09-01 20:59:58', '', '1');
INSERT INTO `el_role` VALUES ('2', 'first:dk:manager', '一级贷款审核员', '管理员', '2019-09-01 21:00:53', '2019-09-01 21:00:55', '', '2');
INSERT INTO `el_role` VALUES ('3', 'second:dk:manager', '二级贷款审核员', '管理员', '2019-09-01 21:01:06', '2019-09-01 21:01:09', null, '3');
INSERT INTO `el_role` VALUES ('4', 'first:zf:manager', '一级租房审核员', '管理员', '2019-09-01 21:01:36', '2019-09-01 21:01:38', null, '4');
INSERT INTO `el_role` VALUES ('5', 'second:zf:manager', '二级租房审核员', '管理员', '2019-09-01 21:02:08', '2019-09-01 21:02:10', null, '1');
INSERT INTO `el_role` VALUES ('6', 'agent', '经纪人', '中间转出租房子的用户', '2019-09-01 21:02:41', '2019-09-01 21:02:44', null, '2');
INSERT INTO `el_role` VALUES ('7', 'landloard', '房东', '出租房子的用户', '2019-09-01 21:03:08', '2019-09-01 21:03:11', null, '1');
INSERT INTO `el_role` VALUES ('8', 'zuker', '租客', '租房子的用户', '2019-09-01 21:03:59', '2019-09-01 21:04:01', null, '3');

-- ----------------------------
-- Table structure for el_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `el_role_permission`;
CREATE TABLE `el_role_permission` (
  `role_id` varchar(10) NOT NULL COMMENT '角色id',
  `permission_id` varchar(10) NOT NULL COMMENT '权限id',
  `create_time` varchar(100) NOT NULL COMMENT '生成时间',
  `update_time` varchar(100) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统的角色权限关联表。';

-- ----------------------------
-- Records of el_role_permission
-- ----------------------------
INSERT INTO `el_role_permission` VALUES ('1', '4', '2019-09-01 23:17:28', '2019-09-01 23:17:30');
INSERT INTO `el_role_permission` VALUES ('2', '4', '2019-09-01 23:17:43', '2019-09-01 23:17:46');
INSERT INTO `el_role_permission` VALUES ('2', '5', '2019-09-01 23:17:55', '2019-09-01 23:17:57');
INSERT INTO `el_role_permission` VALUES ('3', '6', '2019-09-01 23:18:20', '2019-09-01 23:18:23');

-- ----------------------------
-- Table structure for el_user
-- ----------------------------
DROP TABLE IF EXISTS `el_user`;
CREATE TABLE `el_user` (
  `id` varchar(10) NOT NULL COMMENT '用户编号',
  `username` varchar(15) NOT NULL COMMENT '用户登录名',
  `phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `salt` varchar(10) NOT NULL COMMENT '盐值',
  `create_time` varchar(100) NOT NULL COMMENT '创建时间',
  `update_time` varchar(100) NOT NULL COMMENT '更新时间',
  `redundant` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表，包括用户的主要信息。';

-- ----------------------------
-- Records of el_user
-- ----------------------------
INSERT INTO `el_user` VALUES ('1', 'admin', '15514507017', '123456', 'admin', '2019-09-01 20:55:30', '2019-09-01 20:55:36', null, '30001');
INSERT INTO `el_user` VALUES ('2', 'zhangsan', '15514504144', '625795771d425d3598605ac3640c82f7', '98k', '2019-09-01 21:46:10', '2019-09-01 21:46:13', null, '30001');
INSERT INTO `el_user` VALUES ('3', 'lisi', '15514514447', '123456', 'lisi', '2019-09-01 21:46:42', '2019-09-01 21:46:44', null, '30001');
INSERT INTO `el_user` VALUES ('4', 'wangwu', '14587478455', '123456', 'wangwu', '2019-09-01 21:47:14', '2019-09-01 21:47:17', null, '30002');
INSERT INTO `el_user` VALUES ('5', 'renliu', '16584987584', '123456', 'renliu', '2019-09-01 21:48:02', '2019-09-01 21:48:04', null, '30002');
INSERT INTO `el_user` VALUES ('6', 'handong', '12545154587', '123456', 'handong', '2019-09-01 21:48:30', '2019-09-01 21:48:33', null, '30001');
INSERT INTO `el_user` VALUES ('7', 'huangyaxiang', '14551418491', '123456', 'huangyaxia', '2019-09-01 21:49:35', '2019-09-01 21:49:37', null, '30001');
INSERT INTO `el_user` VALUES ('8', 'haowenkang', '14946568791', '123456', 'haowenkang', '2019-09-01 21:50:04', '2019-09-01 21:50:05', null, '30001');
INSERT INTO `el_user` VALUES ('9', 'sunyijing', '11546156498', '123456', 'sunyijing', '2019-09-01 21:50:29', '2019-09-01 21:50:32', null, '30001');

-- ----------------------------
-- Table structure for el_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `el_user_detail`;
CREATE TABLE `el_user_detail` (
  `id` varchar(10) NOT NULL DEFAULT '' COMMENT '用户编号',
  `user_id` varchar(10) DEFAULT NULL,
  `real_name` varchar(13) DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `bank_card` varchar(16) DEFAULT NULL COMMENT '银行卡号',
  `job` varchar(16) DEFAULT NULL COMMENT '工作',
  `address` varchar(30) DEFAULT NULL COMMENT '联系地址',
  `header_image` varchar(100) DEFAULT NULL COMMENT '头像图片地址',
  `idcard_image` varchar(100) DEFAULT NULL COMMENT '身份证正反面地址（图片中间使用,分开）',
  `emergency_contact` varchar(13) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_phone` varchar(11) DEFAULT NULL COMMENT '紧急联系人电话',
  `company_name` varchar(25) DEFAULT NULL COMMENT '公司名',
  `company_tel` varchar(15) DEFAULT NULL COMMENT '公司联系电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `redundante` varchar(1) DEFAULT NULL COMMENT '冗余字段',
  `status` varchar(10) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详情表，和用户是一对一的关系，包括了用户的详细信息。';

-- ----------------------------
-- Records of el_user_detail
-- ----------------------------
INSERT INTO `el_user_detail` VALUES ('2', '2', '张三', '415756988996654554', '6217002430029897', '教师', '郑州市杨金路牛顿国际', null, null, '罗丽莉', '15455656565', 'aaa软件教育', '0371-65080815', '2019-09-01 21:50:53', '2019-09-01 21:50:56', null, '30001');
INSERT INTO `el_user_detail` VALUES ('3', '3', '李四', '646516516541651651', '6254645561261641', '公务员', '郑州市三泉路87号院', null, null, '杨旭', '15546598941', '工商局信息处', '0371-62654646', '2019-09-01 22:50:53', '2019-09-01 21:50:56', '', '30001');
INSERT INTO `el_user_detail` VALUES ('4', '4', '王五', '412648964515416516', '6265464918461654', '司机', '郑州市花园路56号院', null, null, '徐思远', '15654615615', '致远出租公司', '0371-64684554', '2019-09-01 22:54:53', '2019-09-01 21:50:56', '', '30001');
INSERT INTO `el_user_detail` VALUES ('5', '5', '任六', '463546856154154545', '6232456165645615', '餐厅老板', '郑州市红专路48号院', null, null, '景瑞阳', '15645846415', '春川里餐厅', '0371-64654545', '2019-09-01 23:54:53', '2019-09-01 21:50:56', '', '30001');

-- ----------------------------
-- Table structure for el_user_role
-- ----------------------------
DROP TABLE IF EXISTS `el_user_role`;
CREATE TABLE `el_user_role` (
  `user_id` varchar(10) NOT NULL COMMENT '用户编号',
  `role_id` varchar(10) NOT NULL COMMENT '角色编号',
  `create_time` varchar(100) NOT NULL COMMENT '创建时间',
  `update_time` varchar(100) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统的用户角色关联表。';

-- ----------------------------
-- Records of el_user_role
-- ----------------------------
INSERT INTO `el_user_role` VALUES ('1', '1', '2019-09-01 21:05:52', '2019-09-01 21:05:54');
INSERT INTO `el_user_role` VALUES ('2', '1', '2019-09-19 09:16:20', '2019-09-19 09:16:22');
INSERT INTO `el_user_role` VALUES ('2', '6', '2019-09-01 22:09:43', '2019-09-01 22:09:49');
INSERT INTO `el_user_role` VALUES ('3', '7', '2019-09-01 22:09:46', '2019-09-01 22:09:52');
INSERT INTO `el_user_role` VALUES ('4', '8', '2019-09-01 22:09:54', '2019-09-01 22:09:57');
INSERT INTO `el_user_role` VALUES ('5', '8', '2019-09-01 22:10:00', '2019-09-01 22:10:02');
INSERT INTO `el_user_role` VALUES ('6', '2', '2019-09-01 22:10:04', '2019-09-01 22:10:07');
INSERT INTO `el_user_role` VALUES ('7', '3', '2019-09-01 22:10:11', '2019-09-01 22:10:14');
INSERT INTO `el_user_role` VALUES ('8', '4', '2019-09-01 22:10:16', '2019-09-01 22:10:18');
INSERT INTO `el_user_role` VALUES ('9', '5', '2019-09-01 22:10:20', '2019-09-01 22:10:24');
