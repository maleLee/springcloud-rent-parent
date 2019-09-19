/*
Navicat MySQL Data Transfer

Source Server         : qy96
Source Server Version : 50619
Source Host           : 192.168.1.56:3306
Source Database       : fourth

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2019-09-02 01:42:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agent_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `agent_evaluate`;
CREATE TABLE `agent_evaluate` (
  `evaluate_id` varchar(32) NOT NULL COMMENT '评价表id',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `agent_id` varchar(32) NOT NULL COMMENT '经纪人id',
  `striking_star` int(2) NOT NULL COMMENT '打星',
  `evaluate` varchar(128) NOT NULL COMMENT '评价内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(1) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`evaluate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='经纪人评价表';

-- ----------------------------
-- Records of agent_evaluate
-- ----------------------------
INSERT INTO `agent_evaluate` VALUES ('1', '2', '2', '2', '服务态度差，差评', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);
INSERT INTO `agent_evaluate` VALUES ('2', '1', '1', '5', '人挺好', '2019-09-02 00:32:10', '2019-09-18 00:32:14', '1', null);
INSERT INTO `agent_evaluate` VALUES ('3', '1', '3', '3', '中评', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);

-- ----------------------------
-- Table structure for audit_history
-- ----------------------------
DROP TABLE IF EXISTS `audit_history`;
CREATE TABLE `audit_history` (
  `audit_id` varchar(32) NOT NULL COMMENT '审核编号',
  `audit_type` int(2) NOT NULL COMMENT '审核类型(0：发布房源审核:1：贷款申审核)',
  `application_id` varchar(32) NOT NULL COMMENT '申请编号(引用loan_apply的loan_apply_id或者)',
  `audit_first_person` varchar(32) NOT NULL COMMENT '一审人',
  `audit_first_time` datetime NOT NULL COMMENT '一审日期',
  `audit_second_person` varchar(32) DEFAULT NULL COMMENT '二审人',
  `audit_second_time` datetime DEFAULT NULL COMMENT '二审日期',
  `audit_status` int(2) NOT NULL COMMENT '审核状态(0：不通过 1：通过)',
  `result_reason` varchar(100) NOT NULL COMMENT '驳回理由',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审核记录表';

-- ----------------------------
-- Records of audit_history
-- ----------------------------
INSERT INTO `audit_history` VALUES ('1', '2', '1', '2', '0000-00-00 00:00:00', '1', '2019-09-02 00:59:30', '2', '1', '2019-09-02 00:59:53', '2019-09-02 01:00:01', null);
INSERT INTO `audit_history` VALUES ('2', '1', '2', '1', '0000-00-00 00:00:00', '2', '2019-09-02 00:59:34', '1', '2', '2019-09-02 00:59:56', '2019-09-02 01:00:04', null);
INSERT INTO `audit_history` VALUES ('3', '3', '3', '3', '0000-00-00 00:00:00', '3', '2019-09-02 00:59:36', '3', '3', '2019-09-02 00:59:59', '2019-09-02 01:00:08', null);

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `contract_id` varchar(32) NOT NULL COMMENT '合同编号',
  `contract_name` varchar(32) NOT NULL COMMENT '合同名称',
  `contract_type` int(2) NOT NULL COMMENT '合同类型(0：租房合同  1：贷款合同)',
  `contract_status` int(2) NOT NULL COMMENT '合同状态(0:失效 1:生效)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合同表';

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('1', '易居客用户合同', '1', '1', '2019-09-03 01:10:24', '0000-00-00 00:00:00', null);

-- ----------------------------
-- Table structure for contract_detail
-- ----------------------------
DROP TABLE IF EXISTS `contract_detail`;
CREATE TABLE `contract_detail` (
  `contract_id` varchar(32) NOT NULL COMMENT '合同编号',
  `contract_effect_time` datetime NOT NULL COMMENT '合同生效时间',
  `contract_lost_effect_time` datetime NOT NULL COMMENT '合同失效时间',
  `house_in` varchar(32) NOT NULL COMMENT '租赁方',
  `house_out` varchar(32) NOT NULL COMMENT '出租方',
  `signing_time` datetime NOT NULL COMMENT '签订时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合同详情表';

-- ----------------------------
-- Records of contract_detail
-- ----------------------------
INSERT INTO `contract_detail` VALUES ('1', '2019-09-01 01:10:55', '2019-10-01 01:11:14', '易小川', '张大伟', '2019-09-03 01:13:20', '2019-09-03 01:13:32', null, null);

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` varchar(32) NOT NULL COMMENT '字段id',
  `pid` varchar(32) NOT NULL COMMENT '字段父级id(一级为0)',
  `dict_type_code` int(8) NOT NULL COMMENT '字典类型编号',
  `dict_type_name` varchar(32) NOT NULL COMMENT '字典类型名称',
  `dict_code` int(8) NOT NULL COMMENT '字典字段编号',
  `dict_name` varchar(32) NOT NULL COMMENT '字典字段名称',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', '0', '1', 'sex', '1', '男', null);
INSERT INTO `dictionary` VALUES ('2', '0', '1', 'sex', '2', '女', null);
INSERT INTO `dictionary` VALUES ('3', '0', '2', 'loan_type', '1', '三期', null);
INSERT INTO `dictionary` VALUES ('4', '0', '2', 'loan_type', '2', '六期', null);
INSERT INTO `dictionary` VALUES ('5', '0', '2', 'loan_type', '3', '九期', null);
INSERT INTO `dictionary` VALUES ('6', '0', '2', 'loan_type', '4', '十二期', null);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `house_id` varchar(20) NOT NULL COMMENT '房源编号',
  `owner_id` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `status` varchar(1) DEFAULT NULL COMMENT '出租状态',
  `zent` varchar(20) DEFAULT NULL COMMENT '租金',
  `house_type` varchar(100) DEFAULT NULL COMMENT '户型',
  `house_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `house_area` varchar(100) DEFAULT NULL COMMENT '地区',
  `house_name` varchar(20) DEFAULT NULL COMMENT '小区名',
  `house_require` varchar(100) DEFAULT NULL COMMENT '出租要求',
  `is_hot` varchar(1) DEFAULT NULL COMMENT '热门房源',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(20) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房源表';

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '1', '1', '500', '三室一厅', '求租', '河南省郑州市金水区', '锦绣家园', '不准做饭', '1', '2019-09-02 00:15:16', '2019-09-02 00:15:22', null);
INSERT INTO `house` VALUES ('2', '2', '1', '1000', '一室一厅', '着急出租', '河南省郑州市金水区文化路97号', '碧桂园', '不能擅自砸墙', '1', '2019-09-01 00:16:47', '2019-09-02 00:16:51', null);
INSERT INTO `house` VALUES ('3', '1', '1', '780', '一室', '出租', '河南省郑州市金水区文化路101号', '建业房产', '不可以在墙上乱涂乱画', '0', '2019-09-01 00:18:26', '2019-09-02 00:18:30', null);

-- ----------------------------
-- Table structure for house_collection
-- ----------------------------
DROP TABLE IF EXISTS `house_collection`;
CREATE TABLE `house_collection` (
  `hc_id` varchar(20) NOT NULL COMMENT '收藏编号',
  `house_id` varchar(20) DEFAULT NULL COMMENT '房源编号',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(100) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`hc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房源收藏表';

-- ----------------------------
-- Records of house_collection
-- ----------------------------
INSERT INTO `house_collection` VALUES ('1', '1', '1', '张三', '2019-09-01 00:18:59', '2019-09-02 00:19:02', null);
INSERT INTO `house_collection` VALUES ('2', '2', '1', '张三', '2019-09-02 00:19:19', '2019-09-02 00:19:22', null);
INSERT INTO `house_collection` VALUES ('3', '3', '2', '李四', '2019-09-02 00:19:37', '2019-09-02 00:19:40', null);

-- ----------------------------
-- Table structure for house_detail
-- ----------------------------
DROP TABLE IF EXISTS `house_detail`;
CREATE TABLE `house_detail` (
  `hd_id` varchar(20) NOT NULL COMMENT '房源详情编号',
  `house_id` varchar(20) DEFAULT NULL COMMENT '房源编号',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `photo_in` varchar(100) DEFAULT NULL COMMENT '室内照片',
  `photo_out` varchar(100) DEFAULT NULL COMMENT '室外照片',
  `desc` varchar(100) DEFAULT NULL COMMENT '详情描述',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `have_lift` varchar(1) DEFAULT NULL COMMENT '电梯与否',
  `floor` varchar(1) DEFAULT NULL COMMENT '楼层',
  `owner` varchar(1) DEFAULT NULL COMMENT '所属人:房东？经纪人',
  `space` varchar(20) DEFAULT NULL COMMENT '面积',
  `deco` varchar(20) DEFAULT NULL COMMENT '装修状况',
  `face` varchar(10) DEFAULT NULL COMMENT '朝向',
  `installations` varchar(20) DEFAULT NULL COMMENT '房屋设施',
  `comment` varchar(100) DEFAULT NULL COMMENT '评论',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`hd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房源详情表';

-- ----------------------------
-- Records of house_detail
-- ----------------------------
INSERT INTO `house_detail` VALUES ('1', '1', '河南省郑州市金水区文化路97号', '1.jpg', '2.jpg', '很好', '河南省郑州市金水区文化路97号', '有', '7', '2', '河南省郑州市金水区文化路97号', '精装修', '朝阳', '家电齐全', '好好好', '2019-09-02 00:22:42', '2019-09-02 00:22:44', null);
INSERT INTO `house_detail` VALUES ('2', '2', '河南省郑州市金水区文化路87号', '3.jpg', '4.jpg', '一般', '河南省郑州市金水区文化路877号', '没', '8', '1', '河南省郑州市金水区文化路87号', '简单装修', '朝阳', '洗衣机，电视', '好好好', '2019-09-02 00:23:55', '2019-09-02 00:23:58', null);

-- ----------------------------
-- Table structure for loan_apply
-- ----------------------------
DROP TABLE IF EXISTS `loan_apply`;
CREATE TABLE `loan_apply` (
  `loan_apply_id` varchar(32) NOT NULL COMMENT '贷款申请编号',
  `loan_user_id` varchar(32) NOT NULL COMMENT '贷款用户编号(引用user的user_id )',
  `loan_money` double(6,0) NOT NULL COMMENT '贷款金额',
  `loan_type` int(8) NOT NULL COMMENT '贷款类型',
  `loan_account` varchar(20) NOT NULL COMMENT '贷款账号',
  `unit_addr` varchar(64) NOT NULL COMMENT '单位地址',
  `unit_phone` varchar(11) NOT NULL COMMENT '单位电话',
  `emergency_contract` varchar(11) NOT NULL COMMENT '紧急联系人',
  `apply_date` datetime NOT NULL COMMENT '申请日期',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`loan_apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='贷款申请表';

-- ----------------------------
-- Records of loan_apply
-- ----------------------------
INSERT INTO `loan_apply` VALUES ('1', '1', '8000', '3', '4194154914', '郑州市金水区杨金路牛顿国际', '15638520459', '18838206899', '2019-09-02 00:00:00', null);
INSERT INTO `loan_apply` VALUES ('2', '2', '5000', '1', '1204124125', '郑州市中原区', '13838790456', '17707255415', '2019-08-27 00:00:00', null);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` varchar(32) NOT NULL COMMENT '日志编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号(引用user的user_id)',
  `permission_id` varchar(32) NOT NULL COMMENT '权限编号(permission的permission_id)',
  `ip` varchar(32) NOT NULL COMMENT 'Ip地址',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '写入时间',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', '1', '127.0.0.1', '2019-09-02 01:09:45', '');
INSERT INTO `log` VALUES ('2', '2', '2', '192.168.1.78', '2019-09-02 01:10:51', null);
INSERT INTO `log` VALUES ('3', '3', '3', '192.168.1.79', '2019-09-02 01:10:56', null);
INSERT INTO `log` VALUES ('4', '4', '1', '192.168.1.1', '2019-09-02 01:11:01', null);
INSERT INTO `log` VALUES ('5', '5', '2', '192.168.1.7', '2019-09-02 01:11:07', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` varchar(32) NOT NULL COMMENT 'id',
  `parent_id` varchar(32) NOT NULL COMMENT '父id',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(32) NOT NULL COMMENT '菜单图标',
  `menu_type` int(8) NOT NULL COMMENT '菜单类型:一级、二级',
  `menu_url` varchar(32) NOT NULL COMMENT '菜单路径',
  `order_num` int(8) NOT NULL COMMENT '同级排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '菜单', '', '0', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('10', '2', '员工管理', '', '2', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('11', '2', '租客房东管理', '', '2', '', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('12', '3', '贷款申请审核', '', '2', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('13', '3', '房源发布审核', '', '2', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('14', '12', '贷款一级审核', '', '3', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('15', '12', '贷款二级审核', '', '3', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('16', '13', '房源一级审核', '', '3', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('17', '13', '房源二级审核', '', '3', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('2', '1', '用户管理', '', '1', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('3', '1', '审核管理', '', '1', '', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('4', '1', '房源管理', '', '1', '', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('5', '1', '贷款管理', '', '1', '', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('6', '1', '租赁管理', '', '1', '', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('7', '1', '结算分析', '', '1', '', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('8', '1', '日志管理', '', '1', '', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `menu` VALUES ('9', '2', '个人中心', '', '2', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` varchar(32) NOT NULL COMMENT 'Id主键',
  `menu_id` varchar(32) DEFAULT NULL COMMENT '菜单编号,外键',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色编号,外键',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '10', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);
INSERT INTO `menu_role` VALUES ('2', '14', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);
INSERT INTO `menu_role` VALUES ('3', '15', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);
INSERT INTO `menu_role` VALUES ('4', '16', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);
INSERT INTO `menu_role` VALUES ('5', '16', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null);

-- ----------------------------
-- Table structure for oder
-- ----------------------------
DROP TABLE IF EXISTS `oder`;
CREATE TABLE `oder` (
  `oder_id` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `house_id` varchar(20) DEFAULT NULL COMMENT '房源编号',
  `pay_money` varchar(20) DEFAULT NULL COMMENT '实付金额',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  `status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `deal_num` varchar(20) DEFAULT NULL COMMENT '交易单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(100) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`oder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of oder
-- ----------------------------
INSERT INTO `oder` VALUES ('1', '1', '1', '500', '2019-09-02 00:24:21', '出租', '支付宝支付', '201900902789789789', '2019-09-02 00:24:47', '2019-09-02 00:24:49', null);
INSERT INTO `oder` VALUES ('2', '2', '2', '1000', '2019-09-02 00:25:01', '出租', '贷款', '20190902789789456', '2019-09-02 00:25:18', '2019-09-02 00:25:20', null);

-- ----------------------------
-- Table structure for oder_detail
-- ----------------------------
DROP TABLE IF EXISTS `oder_detail`;
CREATE TABLE `oder_detail` (
  `od_id` varchar(20) NOT NULL COMMENT '订单详情编号',
  `oder_id` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `lease_term` varchar(20) DEFAULT NULL COMMENT '租期',
  `zent_type` varchar(20) DEFAULT NULL COMMENT '租金类型',
  `registe_date` datetime DEFAULT NULL COMMENT '入住时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(100) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情表';

-- ----------------------------
-- Records of oder_detail
-- ----------------------------
INSERT INTO `oder_detail` VALUES ('1', '2', '3个月', '贷款', '2019-09-02 00:26:01', '2019-09-02 00:26:05', '2019-09-02 00:26:08', null);
INSERT INTO `oder_detail` VALUES ('2', '1', '一年', '支付宝', '2019-09-02 00:26:25', '2019-09-02 00:26:28', '2019-09-02 00:26:30', null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` varchar(32) NOT NULL COMMENT '权限编号',
  `permission_name` varchar(32) NOT NULL COMMENT '权限名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '允许访问', '0000-00-00 00:00:00', '2019-09-02 01:11:57', '0', null);
INSERT INTO `permission` VALUES ('2', '没有权限', '0000-00-00 00:00:00', '2019-09-02 01:12:01', '0', null);
INSERT INTO `permission` VALUES ('3', '没有该类型的访问权', '0000-00-00 00:00:00', '2019-09-02 01:12:04', '0', null);
INSERT INTO `permission` VALUES ('4', '权限不足', '0000-00-00 00:00:00', '2019-09-02 01:12:07', '0', null);

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `preview_id` varchar(20) NOT NULL COMMENT '预约编号',
  `house_id` varchar(20) DEFAULT NULL COMMENT '房源编号',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户(租户)编号',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `uuser_id` varchar(20) DEFAULT NULL COMMENT '用户(房东)编号',
  `jjr_id` varchar(20) DEFAULT NULL COMMENT '经纪人编号',
  `pre_time` datetime DEFAULT NULL COMMENT '预约时间',
  `pre_date` datetime DEFAULT NULL COMMENT '预约日期',
  `pre_comment` varchar(100) DEFAULT NULL COMMENT '预约留言',
  `pre_space` varchar(30) DEFAULT NULL COMMENT '预约地点',
  `status` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`preview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预约看房表';

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '1', '1', '张三', '', '1', '2019-09-01 00:30:21', '2019-09-02 00:30:31', '好好好', '河南省郑州市金水区文化路97号', '1', '2019-09-01 00:31:11', '2019-09-02 00:31:24', null);
INSERT INTO `preview` VALUES ('2', '2', '2', '李四', '', '2', '2019-09-01 00:30:25', '2019-09-02 00:30:35', '一般一般', '河南省郑州市金水区文化路87号', '1', '2019-09-01 00:31:15', '2019-09-02 00:31:28', null);
INSERT INTO `preview` VALUES ('3', '3', '3', '王五', '1', null, '2019-09-01 00:30:28', '2019-09-02 00:30:37', '好好好', '河南省郑州市金水区文化路77号', '0', '2019-09-01 00:31:21', '2019-09-02 00:31:31', null);

-- ----------------------------
-- Table structure for repayment_record
-- ----------------------------
DROP TABLE IF EXISTS `repayment_record`;
CREATE TABLE `repayment_record` (
  `repayment_id` varchar(32) NOT NULL COMMENT '还款记录编号',
  `user_id` varchar(32) NOT NULL COMMENT '用户id(引用user的user_id)',
  `repayment_account` varchar(32) NOT NULL COMMENT '还款账号',
  `repayment_stage` varchar(32) NOT NULL COMMENT '还款期数',
  `repayment_money` double(6,0) NOT NULL COMMENT '还款金额',
  `repayment_date` datetime NOT NULL COMMENT '还款日期',
  `status` int(1) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`repayment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='还款记录表';

-- ----------------------------
-- Records of repayment_record
-- ----------------------------
INSERT INTO `repayment_record` VALUES ('1', '1', '4194154914', '12', '800', '2019-09-02 00:43:38', '1', null);
INSERT INTO `repayment_record` VALUES ('2', '2', '1204124125', '3', '600', '2019-09-02 00:44:08', '1', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` varchar(32) NOT NULL COMMENT 'id主键',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_type` int(8) NOT NULL COMMENT '角色类型',
  `role_level` int(8) NOT NULL COMMENT '角色等级',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('2', '经纪人', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('3', '贷款一级审核', '2', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('4', '贷款二级审核', '2', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('5', '房源一级审核', '3', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('6', '房源二级审核', '3', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('7', '房东', '4', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);
INSERT INTO `role` VALUES ('8', '租客', '5', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, null);

-- ----------------------------
-- Table structure for role_ permission
-- ----------------------------
DROP TABLE IF EXISTS `role_ permission`;
CREATE TABLE `role_ permission` (
  `id` varchar(32) NOT NULL COMMENT 'Id主键',
  `permission_id` varchar(32) NOT NULL COMMENT '权限编号(引用permission的permission_id)',
  `role _id` varchar(32) NOT NULL COMMENT '角色编号(引用role的role_id)',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` varchar(32) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_ permission
-- ----------------------------
INSERT INTO `role_ permission` VALUES ('', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', null);
INSERT INTO `role_ permission` VALUES ('1', '1', '1', '2019-09-02 01:40:29', '2019-09-02 01:40:29', '', null);
INSERT INTO `role_ permission` VALUES ('3', '1', '3', '2019-09-02 01:40:36', '2019-09-02 01:40:36', '', null);
INSERT INTO `role_ permission` VALUES ('4', '2', '3', '2019-09-02 01:40:36', '2019-09-02 01:40:36', '', null);
INSERT INTO `role_ permission` VALUES ('5', '3', '3', '2019-09-02 01:40:37', '2019-09-02 01:40:37', '', null);
INSERT INTO `role_ permission` VALUES ('6', '4', '4', '2019-09-02 01:40:40', '2019-09-02 01:40:40', '', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL COMMENT '盐值',
  `phone` varchar(32) NOT NULL COMMENT '手机号',
  `status` int(2) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李向镇', '123456', 'qwer123', '18835645682', '1', '');
INSERT INTO `user` VALUES ('2', '王向镇', '123456', 'qwer123', '1882634522', '0', null);
INSERT INTO `user` VALUES ('3', '宋向镇', '123456', 'qwer123', '16601560524', '1', null);

-- ----------------------------
-- Table structure for user_detil
-- ----------------------------
DROP TABLE IF EXISTS `user_detil`;
CREATE TABLE `user_detil` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` int(2) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月',
  `IDcard` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `icon` varchar(32) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_detil
-- ----------------------------
INSERT INTO `user_detil` VALUES ('1', '乔碧罗万岁', '1', '1996-07-25 01:32:03', '410726199607255410', '1', '1', '2019-09-02 01:33:06', null, null);
INSERT INTO `user_detil` VALUES ('2', '乔碧罗的小奶狗', '0', '1997-01-01 01:36:42', '41072619901015420', '2', '2', '2019-09-02 01:38:38', null, null);
INSERT INTO `user_detil` VALUES ('3', '乔碧罗的大狼狗', '1', '1998-02-02 01:37:02', '41726199802025413', '3', '3', '2019-09-02 01:38:42', null, null);

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
  `feedback_id` varchar(32) NOT NULL COMMENT '反馈表id',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `feedback` varchar(128) NOT NULL COMMENT '反馈内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';

-- ----------------------------
-- Records of user_feedback
-- ----------------------------
INSERT INTO `user_feedback` VALUES ('1', '1', '58同城', '2019-09-02 00:25:11', '1', null);
INSERT INTO `user_feedback` VALUES ('2', '2', '这个网站还不赖', '2019-09-01 00:26:17', '0', null);
INSERT INTO `user_feedback` VALUES ('3', '3', '垃圾租房网站', '2019-09-02 00:26:25', '1', null);
INSERT INTO `user_feedback` VALUES ('4', '4', '垃圾网站，浪费时间', '2019-09-02 00:26:28', '0', null);
INSERT INTO `user_feedback` VALUES ('5', '5', '网站很好，有很大帮助', '2019-09-02 00:26:31', '1', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` varchar(32) NOT NULL COMMENT 'Id主键',
  `user_id` varchar(32) NOT NULL COMMENT '用户编号(引用user的user_id)',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号(引用role的role_id)',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态标记',
  `extend` varchar(32) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色的关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1', '2019-09-02 01:35:11', '2019-09-02 01:35:11', '0', null);
INSERT INTO `user_role` VALUES ('2', '1', '2', '2019-09-02 01:35:42', '2019-09-02 01:35:42', '0', null);
INSERT INTO `user_role` VALUES ('3', '2', '2', '2019-09-02 01:35:54', '2019-09-02 01:35:54', '0', null);
INSERT INTO `user_role` VALUES ('4', '3', '2', '2019-09-02 01:36:32', '2019-09-02 01:36:32', '0', null);
INSERT INTO `user_role` VALUES ('5', '3', '7', '2019-09-02 01:36:28', '2019-09-02 01:36:28', '0', null);

-- ----------------------------
-- Table structure for water_record
-- ----------------------------
DROP TABLE IF EXISTS `water_record`;
CREATE TABLE `water_record` (
  `water_id` varchar(32) NOT NULL COMMENT '流水编号(引用user的user_id)',
  `target_id` varchar(32) NOT NULL COMMENT '用户编号(引用user的user_id)',
  `water_src` int(2) NOT NULL COMMENT '流水来源(0：经纪人提成 1：房客贷款 2：房客还款 3：房客租金)',
  `water_type` int(2) NOT NULL COMMENT '流水类型(0:收入 1:支出)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `extend` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  PRIMARY KEY (`water_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流水记录表';

-- ----------------------------
-- Records of water_record
-- ----------------------------
INSERT INTO `water_record` VALUES ('1', '1', '1', '1', '2019-09-03 01:26:52', null, null);
