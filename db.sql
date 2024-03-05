/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - cantingdiancanxiaochengxu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cantingdiancanxiaochengxu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cantingdiancanxiaochengxu`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '所属用户',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `buy_number` int(11) DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

/*Data for the table `cart` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/cantingdiancanxiaochengxu/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/cantingdiancanxiaochengxu/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/cantingdiancanxiaochengxu/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (74,'shangxia_types','上下架',1,'上架',NULL,NULL,'2022-02-18 21:15:01'),(75,'shangxia_types','上下架',2,'下架',NULL,NULL,'2022-02-18 21:15:01'),(76,'goods_types','菜品名称',1,'菜品类型1',NULL,NULL,'2022-02-18 21:15:01'),(77,'goods_types','菜品名称',2,'菜品类型2',NULL,NULL,'2022-02-18 21:15:01'),(78,'goods_types','菜品名称',3,'菜品类型3',NULL,NULL,'2022-02-18 21:15:01'),(79,'goods_order_payment_types','支付方式',1,'余额支付',NULL,NULL,'2022-02-18 21:15:01'),(80,'sex_types','性别类型名称',2,'女',NULL,NULL,'2022-02-18 21:15:01'),(81,'sex_types','性别类型名称',1,'男',NULL,NULL,'2022-02-18 21:15:01'),(82,'goods_order_types','订单类型名称',1,'退款',NULL,NULL,'2022-02-18 21:15:01'),(83,'goods_order_types','订单类型名称',2,'已支付',NULL,NULL,'2022-02-18 21:15:01'),(84,'goods_order_types','订单类型名称',3,'已出餐',NULL,NULL,'2022-02-18 21:15:01'),(85,'goods_order_types','订单类型名称',4,'已取餐',NULL,NULL,'2022-02-18 21:15:01'),(86,'goods_order_types','订单类型名称',5,'已评价',NULL,NULL,'2022-02-18 21:15:01'),(87,'news_types','新闻类型名称',1,'优惠活动',NULL,NULL,'2022-02-18 21:15:01'),(88,'news_types','新闻类型名称',2,'紧急情况',NULL,NULL,'2022-02-18 21:15:01'),(89,'canzhuo_types','餐桌',1,'餐桌1',NULL,NULL,'2022-02-18 21:15:01'),(90,'canzhuo_types','餐桌',2,'餐桌2',NULL,NULL,'2022-02-18 21:15:01'),(91,'canzhuo_types','餐桌',3,'餐桌3',NULL,NULL,'2022-02-18 21:15:01'),(92,'goods_order_types','订单类型名称',6,'已做',NULL,NULL,'2022-02-18 21:15:01');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '菜品名称  Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '菜品类型  Search111 ',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '菜品照片',
  `goods_kucun_number` int(11) DEFAULT '0' COMMENT '菜品库存',
  `goods_old_money` decimal(10,2) DEFAULT NULL COMMENT '菜品原价 ',
  `goods_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价 ',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '是否上架 ',
  `shangxia_xiaoliang` int(11) DEFAULT NULL COMMENT '总销量',
  `goods_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `goods_content` text COMMENT '菜品简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='菜品信息';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`goods_photo`,`goods_kucun_number`,`goods_old_money`,`goods_new_money`,`shangxia_types`,`shangxia_xiaoliang`,`goods_delete`,`goods_content`,`create_time`) values (1,'菜品名称1',2,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175392090.webp',10001,'544.37','324.67',1,13,1,'菜品简介1','2022-02-18 21:15:22'),(2,'菜品名称2',2,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175383271.webp',10002,'795.86','124.65',1,170,1,'菜品简介2','2022-02-18 21:15:22'),(3,'菜品名称3',1,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175374562.webp',10002,'876.78','223.57',1,416,1,'菜品简介3','2022-02-18 21:15:22'),(4,'菜品名称4',3,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175365749.webp',10003,'700.49','288.74',1,281,1,'菜品简介4','2022-02-18 21:15:22'),(5,'菜品名称5',1,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175357177.webp',10004,'947.79','376.47',1,427,1,'菜品简介5','2022-02-18 21:15:22'),(6,'菜品名称6',3,'http://localhost:8080/cantingdiancanxiaochengxu/upload/1645175349142.webp',10004,'838.89','297.03',1,36,1,'菜品简介6','2022-02-18 21:15:22');

/*Table structure for table `goods_commentback` */

DROP TABLE IF EXISTS `goods_commentback`;

CREATE TABLE `goods_commentback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `goods_commentback_text` text COMMENT '评价内容',
  `reply_text` text COMMENT '回复内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜品评价';

/*Data for the table `goods_commentback` */

insert  into `goods_commentback`(`id`,`goods_id`,`yonghu_id`,`goods_commentback_text`,`reply_text`,`insert_time`,`update_time`,`create_time`) values (1,1,1,'评价内容1','回复信息1','2022-02-18 21:15:22','2022-02-18 21:15:22','2022-02-18 21:15:22'),(2,2,1,'评价内容2','回复信息2','2022-02-18 21:15:22','2022-02-18 21:15:22','2022-02-18 21:15:22'),(3,3,3,'评价内容3','回复信息3','2022-02-18 21:15:22','2022-02-18 21:15:22','2022-02-18 21:15:22'),(4,4,3,'评价内容4','回复信息4','2022-02-18 21:15:22','2022-02-18 21:15:22','2022-02-18 21:15:22'),(5,5,1,'评价内容5','回复信息5','2022-02-18 21:15:22','2022-02-18 21:15:22','2022-02-18 21:15:22'),(6,6,1,'评价内容6','用户购买完菜后可以评论','2022-02-18 21:15:22','2022-02-19 10:42:08','2022-02-18 21:15:22'),(12,6,1,'购买完成后可评论',NULL,'2022-02-19 10:53:24',NULL,'2022-02-19 10:53:24');

/*Table structure for table `goods_order` */

DROP TABLE IF EXISTS `goods_order`;

CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '菜品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `canzhuo_types` int(11) DEFAULT NULL COMMENT '餐桌',
  `buy_number` int(200) DEFAULT NULL COMMENT '购买的数量',
  `goods_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格 ',
  `goods_order_types` int(11) DEFAULT NULL COMMENT '订单类型',
  `goods_order_payment_types` int(11) DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='菜品订单';

/*Data for the table `goods_order` */

insert  into `goods_order`(`id`,`goods_order_uuid_number`,`goods_id`,`yonghu_id`,`canzhuo_types`,`buy_number`,`goods_order_true_price`,`goods_order_types`,`goods_order_payment_types`,`insert_time`,`create_time`) values (1,'1645233289043',1,1,1,1,'376.47',2,1,'2022-02-19 09:14:49','2022-02-19 09:14:49'),(2,'1645233289043',2,2,2,2,'376.47',2,1,'2022-02-19 09:14:49','2022-03-19 09:14:49'),(3,'1645233289043',3,3,3,3,'376.47',2,1,'2022-02-19 09:14:49','2022-02-19 09:14:49'),(4,'1645233289043',4,1,1,4,'376.47',2,1,'2022-02-19 09:14:49','2022-02-19 09:14:49'),(5,'1645233289043',5,2,2,5,'376.47',2,1,'2022-02-19 09:14:49','2022-02-19 09:14:49'),(6,'1645233289043',1,3,3,1,'376.47',2,1,'2022-02-19 09:14:49','2022-02-19 09:14:49'),(7,'1645233289043',2,1,1,2,'376.47',3,1,'2022-03-19 09:14:49','2022-03-19 09:14:49'),(8,'1645233289043',3,2,2,3,'376.47',3,1,'2022-04-19 09:14:49','2022-02-19 09:14:49'),(9,'1645233289043',4,3,3,4,'376.47',2,1,'2021-05-19 09:14:49','2022-02-19 09:14:49'),(10,'1645233289043',5,1,1,5,'376.47',2,1,'2021-06-19 09:14:49','2022-02-19 09:14:49'),(11,'1645237805893',6,1,2,1,'297.03',5,1,'2022-02-19 10:30:06','2022-02-19 10:30:06'),(12,'1645239112133',3,1,1,1,'223.57',2,1,'2022-02-19 10:51:52','2022-02-19 10:51:52'),(13,'1645239112133',4,1,1,1,'288.74',2,1,'2022-02-19 10:51:52','2022-02-19 10:51:52'),(14,'1645239112133',5,1,1,1,'376.47',1,1,'2022-02-19 10:51:52','2022-02-19 10:51:52'),(15,'1645239112133',6,1,1,1,'297.03',6,1,'2022-02-19 10:51:52','2022-02-19 10:51:52');

/*Table structure for table `houchu` */

DROP TABLE IF EXISTS `houchu`;

CREATE TABLE `houchu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账号',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `houchu_name` varchar(200) DEFAULT NULL COMMENT '后厨姓名  Search111',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111',
  `houchu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `houchu_phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `houchu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `houchu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后厨';

/*Data for the table `houchu` */

insert  into `houchu`(`id`,`username`,`password`,`houchu_name`,`sex_types`,`houchu_id_number`,`houchu_phone`,`houchu_photo`,`houchu_delete`,`create_time`) values (1,'a1','123456','后厨1',1,'410224199610232001','17703786901','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645234056402.jpg',1,'2022-02-19 09:27:06'),(2,'a2','123456','后厨2',1,'410224199610232002','17703786902','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645234049521.jpg',1,'2022-02-19 09:27:06'),(3,'a3','123456','后厨3',2,'410224199610232003','17703786903','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645234043539.jpg',1,'2022-02-19 09:27:06');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻名称 Search111  ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻图片 ',
  `news_types` int(11) NOT NULL COMMENT '新闻类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻发布时间 ',
  `news_content` text COMMENT '新闻详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_photo`,`news_types`,`insert_time`,`news_content`,`create_time`) values (1,'新闻名称1','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191211154.jpg',2,'2022-02-18 21:15:22','<p>新闻详情1</p>','2022-02-18 21:15:22'),(2,'新闻名称2','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191203718.jpg',1,'2022-02-18 21:15:22','<p>新闻详情2</p>','2022-02-18 21:15:22'),(3,'新闻名称3','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191197357.webp',2,'2022-02-18 21:15:22','<p>新闻详情3</p>','2022-02-18 21:15:22'),(4,'新闻名称4','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191190781.webp',2,'2022-02-18 21:15:22','<p>新闻详情4</p>','2022-02-18 21:15:22');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','his5wg6t8degh99blgyal91krhb0fl5j','2022-02-18 21:23:24','2022-02-19 11:44:02'),(2,1,'a1','yonghu','用户','7b1qk4pkphoxpxejhpitto587ct3o3j7','2022-02-18 21:35:56','2022-02-19 11:53:06'),(3,1,'a1','houchu','后厨','hooik5pcgtrwqlym6pcst4oyosmeicq4','2022-02-19 09:28:58','2022-03-01 15:51:03'),(4,2,'a2','houchu','后厨','jzf31hb1qllhsmhaf2r0g70ptqcrov5w','2022-02-19 10:48:57','2022-02-19 11:48:57');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`yonghu_phone`,`yonghu_id_number`,`yonghu_email`,`sex_types`,`new_money`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191240666.jpg','17703786901','410224199610232001','1@qq.com',1,'9463.75',1,'2022-02-18 21:15:22'),(2,'a2','123456','用户姓名2','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191232454.jpg','17703786902','410224199610232002','2@qq.com',2,'152.79',1,'2022-02-18 21:15:22'),(3,'a3','123456','用户姓名3','http://localhost:8080/cantingdiancanxiaochengxu/upload/1645191224935.jpg','17703786903','410224199610232003','3@qq.com',1,'457.19',1,'2022-02-18 21:15:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
