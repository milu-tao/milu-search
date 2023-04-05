/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : milu_search

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 05/04/2023 15:59:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1643233875152445444 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1643497369357602818, 'Java教程', '地址：https://www.runoob.com/java/java-tutorial.html', '[\"资源\",\"菜鸟教程\",\"Java\",\"后端\",\"教程\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369357602819, 'Java', '地址：https://docs.oracle.com/en/java/', '[\"资源\",\"文档\",\"Java\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369357602820, 'java知识库', 'java知识库 | 2021最全最新最热JAVA面试题 | Java面试题 | java面试题及答案 |java面试题总结\n地址：https://www.javaoffers.com/', '[\"资源\",\"Java\",\"后端\",\"面试\",\"网页\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369357602821, 'java 设计模式', 'github：https://github.com/iluwatar/java-design-patterns\n地址：https://java-design-patterns.com/', '[\"资源\",\"Java\",\"设计模式\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369374380034, 'JAVA8 官网笔记教程', '非常全面清晰的 Java 学习指南，根据java官方文档翻译记录而来。\n地址：https://zq99299.github.io/java-tutorial/', '[\"资源\",\"Java\",\"文档\",\"后端\",\"教程\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369374380035, 'awesome-java', '地址：https://github.com/CodingDocs/awesome-java', '[\"资源\",\"Java\",\"项目\",\"GitHub\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369374380036, 'Java 8 中文版', '在线Java 8 中文版 API手册\n地址：https://www.matools.com/api/java8', '[\"资源\",\"Java\",\"API接口\",\"网页\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497369374380037, 'Java Software | Oracle', '学习Java时用于下载JDK官方版本的网站。\n地址：https://www.oracle.com/java/technologies/downloads/', '[\"资源\",\"工具\",\"Java\"]', 0, 0, 1, '2023-04-05 14:14:42', '2023-04-05 14:14:42', 0);
INSERT INTO `post` VALUES (1643497624497033217, 'thinking-in-java-zh', '地址：https://github.com/apachecn/thinking-in-java-zh', '[\"资源\",\"书籍\",\"GitHub\",\"Java\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033218, '《On Java 8》', 'java编程思想最新中文版\n地址：https://www.aliyundrive.com/s/a5WuhkRmhvp', '[\"资源\",\"书籍\",\"Java\",\"后端\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033219, 'java大厂面试题汇总', '地址：https://github.com/CoderLeixiaoshuai/java-eight-part/blob/master/docs/java/base/Java%E5%9F%BA%E7%A1%80%E5%85%A5%E9%97%A880%E9%97%AE.md', '[\"资源\",\"Java\",\"GitHub\",\"面试\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033220, 'Alibaba Java 技术图谱', '<a href=\"https://www.code-nav.cn/vip\" target=\"_blank\">成为会员解锁所有内容</a>', '[\"资源\",\"教程\",\"Java\",\"后端\",\"阿里\",\"实战\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033221, 'java8-tutorial', '地址：https://github.com/winterbe/java8-tutorial', '[\"资源\",\"Java\",\"项目\",\"GitHub\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033222, 'Java零基础学习视频通俗易懂', 'Java零基础学习视频通俗易懂\n地址：https://www.bilibili.com/video/BV12J41137hu', '[\"资源\",\"Java\",\"B站\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033223, 'Scalable IO in Java', 'Java并发包作者Doug Lea的关于NIO和Reactor的课件\n地址：http://gee.cs.oswego.edu/dl/cpjslides/nio.pdf', '[\"资源\",\"设计模式\",\"Java\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);
INSERT INTO `post` VALUES (1643497624497033224, 'advanced-java', '地址：https://github.com/doocs/advanced-java', '[\"资源\",\"教程\",\"书籍\",\"Java\",\"GitHub\"]', 0, 0, 1, '2023-04-05 14:15:43', '2023-04-05 14:15:43', 0);

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint NOT NULL COMMENT '帖子 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1642771058309726210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1642771058309726209, 'milu', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, 'milu', 'https://www.medianauka.pl/biologia/grafika/ssaki/big/milu-3.jpg', 'milu', 'user', '2023-04-03 14:08:36', '2023-04-05 14:17:59', 0);
INSERT INTO `user` VALUES (1642771058309726210, 'java', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, 'java', 'http://www.java1234.com/uploads/allimg/131130/1-131130225R0340.jpg', 'java', 'user', '2023-04-05 14:17:12', '2023-04-05 14:17:45', 0);
INSERT INTO `user` VALUES (1642771058309726211, 'java2', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, 'java2', 'http://www.java1234.com/uploads/allimg/131130/1-131130225R0340.jpg', 'java2', 'user', '2023-04-05 14:18:34', '2023-04-05 14:18:37', 0);

SET FOREIGN_KEY_CHECKS = 1;
