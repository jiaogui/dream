/*
 Navicat Premium Data Transfer

 Source Server         : LX
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 28/12/2018 18:35:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物表',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `gid` int(11) NOT NULL COMMENT '商品id',
  `oid` int(11) NULL DEFAULT 0 COMMENT '订单id:0没下单 不为0时下单了',
  `parent` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父级的邀请码',
  `number` int(11) NULL DEFAULT 1 COMMENT '数量',
  `shopprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '价格',
  `expressprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '快递费',
  `integralprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分抵扣',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '购物类型:1立即购买 2购物车购买',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注留言',
  `iscomment` tinyint(255) NULL DEFAULT 0 COMMENT '是否评论:0没评论 1评论过 2追加评论',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `endtime` int(10) NULL DEFAULT 0 COMMENT '下单时间：0代表没下单',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cartorder
-- ----------------------------
DROP TABLE IF EXISTS `cartorder`;
CREATE TABLE `cartorder`  (
  `o_id` int(11) NOT NULL COMMENT '订单id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '购物id',
  `eid` int(11) NOT NULL COMMENT '快递id',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否完成：0没完成 1待发货 2已发货 3已完成 4已取消 5已删除',
  `countprice` decimal(10, 2) NOT NULL COMMENT '总支付额',
  `expressprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '快递费',
  `integralprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '积分抵扣',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单描述',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `endtime` int(10) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express`  (
  `e_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递自增id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `s_id` int(11) NOT NULL COMMENT '购物id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后货地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件名',
  `userphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件手机',
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `adminuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `adminphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `endtime` datetime(0) NULL DEFAULT NULL COMMENT '收获时间',
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收件和发货的快递表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
