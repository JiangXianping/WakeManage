/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : bookmanage

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2017-05-11 21:37:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `book_name` varchar(255) NOT NULL COMMENT '图书名称',
  `book_author` varchar(255) NOT NULL COMMENT '图书作者',
  `book_publishing` varchar(255) NOT NULL COMMENT '图书出版社',
  `book_publication_date` date NOT NULL COMMENT '出版日期',
  `book_updatetime` datetime NOT NULL COMMENT '更新时间',
  `book_islend` int(11) NOT NULL COMMENT '0:未借出 1:已借出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Java', 'Ann', '中国科技出版社', '1995-08-08', '2017-05-10 00:00:00', '0');
INSERT INTO `book` VALUES ('2', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('3', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('4', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('5', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('6', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('7', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('8', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('9', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('10', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('11', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('12', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('13', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('14', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('15', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('16', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('17', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('18', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('19', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('20', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('21', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('22', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('23', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('24', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('25', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('26', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('27', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('28', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('29', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('30', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('31', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('32', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('33', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('34', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('35', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('36', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('37', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('38', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('39', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('40', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('41', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('42', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('43', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('44', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('45', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('46', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('47', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('48', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('49', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('50', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');
INSERT INTO `book` VALUES ('51', 'JavaScript', 'Jack', '中国科技出版社', '1994-06-06', '2017-05-10 10:59:20', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('echo', '123');
INSERT INTO `user` VALUES ('jiang', '123');
