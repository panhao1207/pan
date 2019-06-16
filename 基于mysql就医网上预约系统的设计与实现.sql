/*
Navicat MySQL Data Transfer

Source Server         : gzx
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : java_wq

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2018-09-27 19:06:02
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin_wq`
-- ----------------------------
DROP TABLE IF EXISTS `admin_wq`;
CREATE TABLE `admin_wq` (
  `Aid_wq` int(11) NOT NULL AUTO_INCREMENT,
  `Abianhao_wq` varchar(100) DEFAULT NULL,
  `Aname_wq` varchar(500) DEFAULT NULL,
  `Apwd_wq` varchar(100) DEFAULT NULL,
  `AtypeId_wq` int(11) DEFAULT NULL,
  `AloginTime_wq` datetime DEFAULT NULL,
  PRIMARY KEY (`Aid_wq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_wq
-- ----------------------------
INSERT INTO `admin_wq` VALUES ('1', '1', 'admin', '1234', '1', '2018-09-27 00:00:00');

-- ----------------------------
-- Table structure for `dock_wq`
-- ----------------------------
DROP TABLE IF EXISTS `dock_wq`;
CREATE TABLE `dock_wq` (
  `Yid_wq` int(11) NOT NULL AUTO_INCREMENT,
  `Ybianhao_wq` varchar(255) DEFAULT NULL,
  `Yname_wq` varchar(150) DEFAULT NULL,
  `Ypwd_wq` varchar(100) DEFAULT NULL,
  `Ytel_wq` varchar(100) DEFAULT NULL,
  `Ysex_wq` varchar(100) DEFAULT NULL,
  `YkeshiId_wq` int(11) DEFAULT NULL,
  `Yimg_wq` varchar(500) DEFAULT NULL,
  `Yattr_wq` varchar(500) DEFAULT NULL,
  `Yjianjie_wq` varchar(2000) DEFAULT NULL,
  `yaddTime_wq` datetime DEFAULT NULL,
  `Yage_wq` int(11) DEFAULT NULL,
  PRIMARY KEY (`Yid_wq`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dock_wq
-- ----------------------------
INSERT INTO `dock_wq` VALUES ('21', '1538041884542', ' 章医生', '123', '123', '女', '2', '/20180927175122486828.jpg', ' 发斯蒂芬斯蒂芬', ' 撒旦法士大夫', '2018-09-27 00:00:00', '0');
INSERT INTO `dock_wq` VALUES ('22', '1538042649996', '高医生', '123', '123', '男', '3', '/20180927180408153177.gif', '李村步行街', '发士大夫撒旦', '2018-09-27 00:00:00', '3545');

-- ----------------------------
-- Table structure for `keshi_wq`
-- ----------------------------
DROP TABLE IF EXISTS `keshi_wq`;
CREATE TABLE `keshi_wq` (
  `Kid_wq` int(11) NOT NULL AUTO_INCREMENT,
  `Kname_wq` varchar(500) DEFAULT NULL,
  `Kfuzeren_wq` varchar(500) DEFAULT NULL,
  `Ktel_wq` varchar(255) DEFAULT NULL,
  `Ktime_wq` datetime DEFAULT NULL,
  `Kjianjie_wq` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Kid_wq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keshi_wq
-- ----------------------------
INSERT INTO `keshi_wq` VALUES ('2', ' 内科', ' 小刚', '124', '2018-09-19 00:00:00', '负责内科所有工作');
INSERT INTO `keshi_wq` VALUES ('3', '儿科', '小号', '234', '2018-09-19 00:00:00', '儿科手术');

-- ----------------------------
-- Table structure for `treat_wq`
-- ----------------------------
DROP TABLE IF EXISTS `treat_wq`;
CREATE TABLE `treat_wq` (
  `Tid_wq` int(11) NOT NULL AUTO_INCREMENT,
  `Ttitle_wq` varchar(2000) DEFAULT NULL,
  `TUid_wq` int(11) DEFAULT NULL,
  `TDid_wq` int(11) DEFAULT NULL,
  `TKeshiId_wq` int(11) DEFAULT NULL,
  `Ttreattime_wq` datetime DEFAULT NULL,
  `TpreIndex_wq` int(11) DEFAULT NULL,
  `Ttotal_wq` int(11) DEFAULT NULL,
  `TpreTime_wq` datetime DEFAULT NULL,
  `Tbianhao_wq` varchar(200) DEFAULT NULL,
  `Tshenfenzheng_wq` varchar(150) DEFAULT NULL,
  `Tstatus_wq` int(11) DEFAULT NULL COMMENT '0 预约中  1 已就诊',
  `TstatusStr_wq` varchar(150) DEFAULT NULL,
  `TisUse_wq` int(11) DEFAULT NULL COMMENT '1 未删除 0 已删除',
  PRIMARY KEY (`Tid_wq`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of treat_wq
-- ----------------------------
INSERT INTO `treat_wq` VALUES ('45', '43543', '53', '15', '3', null, '1', '1', '2018-09-22 00:00:00', '1537593844124', '45345', '0', '预约中', '0');
INSERT INTO `treat_wq` VALUES ('46', '54645', '54', '15', '3', null, '1', '1', '2018-09-22 00:00:00', '1537593852116', '64546', '1', '已就诊', '1');
INSERT INTO `treat_wq` VALUES ('47', '765756', '55', '15', '3', null, '1', '1', '2018-09-22 00:00:00', '1537593859363', '765765', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('48', 'fsdadsfds', '57', '15', '2', '2018-09-27 00:00:00', '2', '2', '2018-09-27 00:00:00', '1538018806188', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('49', 'jjjjjjjjjjjjj', '57', '15', '2', '2018-09-27 00:00:00', '3', '3', '2018-09-27 00:00:00', '1538018836010', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('50', 'nnnnnnnn', '57', '15', '2', '2018-09-27 00:00:00', '4', '4', '2018-09-27 00:00:00', '1538019377465', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('51', 'nnnnnnnn', '57', '15', '2', '2018-09-27 00:00:00', '5', '5', '2018-09-27 00:00:00', '1538019381298', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('52', 'nnnnnnnn', '57', '15', '2', '2018-09-27 00:00:00', '6', '6', '2018-09-27 00:00:00', '1538019384730', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('53', 'jjjjjjjjugrrrfyy', '57', '15', '2', '2018-09-27 00:00:00', '7', '7', '2018-09-27 00:00:00', '1538019490948', '123456', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('54', 'bjgcjmh', '58', '15', '2', '2018-09-27 00:00:00', '8', '8', '2018-09-27 00:00:00', '1538029597085', '258', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('55', 'bjhbhgggiftyhfungu', '59', '15', '2', '2018-09-27 00:00:00', '9', '9', '2018-09-27 00:00:00', '1538029837043', '789', '0', '预约中', '1');
INSERT INTO `treat_wq` VALUES ('56', '牙疼', '60', '21', '2', '2018-09-27 00:00:00', '1', '1', '2018-09-27 00:00:00', '1538045610469', '45', '0', '预约中', '1');

-- ----------------------------
-- Table structure for `user_wq`
-- ----------------------------
DROP TABLE IF EXISTS `user_wq`;
CREATE TABLE `user_wq` (
  `Uid_wq` int(11) NOT NULL AUTO_INCREMENT,
  `Uname_wq` varchar(250) DEFAULT NULL,
  `Utel_wq` varchar(100) DEFAULT NULL,
  `Usex_wq` varchar(100) DEFAULT NULL,
  `Uimg_wq` varchar(500) DEFAULT NULL,
  `Uattr_wq` varchar(1000) DEFAULT NULL,
  `Ushenfenzheng_wq` varchar(100) DEFAULT NULL,
  `Ujianjie_wq` varchar(2000) DEFAULT NULL,
  `Upwd_wq` varchar(100) DEFAULT NULL,
  `UTime_wq` datetime DEFAULT NULL,
  `UtypeId_wq` int(11) DEFAULT NULL,
  `Ubianhao_wq` varchar(150) DEFAULT NULL,
  `Uage_wq` int(11) DEFAULT NULL,
  `Upower_wq` int(10) DEFAULT 0,
  PRIMARY KEY (`Uid_wq`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_wq
-- ----------------------------
INSERT INTO `user_wq` VALUES ('57', 'aa', '123', '', '', '', '123456', '', '123', '2018-09-26 00:00:00', '3', '1537945105724', '0');
INSERT INTO `user_wq` VALUES ('58', 'uu', '825', '', '', '', '258', '', '123', '2018-09-27 00:00:00', '3', '1538029546610', '0');
INSERT INTO `user_wq` VALUES ('59', 'yy', '56', '男', '', '我吐了', '789', '855556', '123', '2018-09-27 00:00:00', '3', '1538029665348', '86');
INSERT INTO `user_wq` VALUES ('60', 'ttt', '123', '男', '', '', '45', '', '123', '2018-09-27 00:00:00', '3', '1538045023556', '0');

-- ----------------------------
-- Table structure for `usertype_wq`
-- ----------------------------
DROP TABLE IF EXISTS `usertype_wq`;
CREATE TABLE `usertype_wq` (
  `TyId` int(11) NOT NULL AUTO_INCREMENT,
  `TyName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype_wq
-- ----------------------------
INSERT INTO `usertype_wq` VALUES ('1', '管理员');
INSERT INTO `usertype_wq` VALUES ('2', '医生');
INSERT INTO `usertype_wq` VALUES ('3', '患者');
