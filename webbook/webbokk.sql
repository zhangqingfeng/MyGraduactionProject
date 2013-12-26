/*
SQLyog Community v10.4 Beta1
MySQL - 5.5.28 : Database - webbook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webbook` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webbook`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`id`,`email`,`username`,`password`,`role`,`createtime`) values (1001,'757166468@qq.com','qingfeng','000000','管理员','2013/01/06');

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(45) DEFAULT NULL,
  `bookAuthor` varchar(45) DEFAULT NULL,
  `publishDate` varchar(45) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `salePrice` float DEFAULT NULL,
  `content` text,
  `authorContent` text,
  `perface` text,
  `pic` varchar(45) DEFAULT NULL,
  `bookNum` int(11) DEFAULT NULL,
  `dangerNum` int(11) DEFAULT NULL,
  `statu` varchar(45) DEFAULT NULL,
  `createTime` varchar(45) DEFAULT NULL,
  `booktypeid` int(11) NOT NULL,
  `publishid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_book_t_booktype1_idx` (`booktypeid`),
  KEY `fk_t_book_t_publish1_idx` (`publishid`),
  CONSTRAINT `fk_t_book_t_booktype1` FOREIGN KEY (`booktypeid`) REFERENCES `t_booktype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_book_t_publish1` FOREIGN KEY (`publishid`) REFERENCES `t_publish` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`bookName`,`bookAuthor`,`publishDate`,`pageNum`,`price`,`salePrice`,`content`,`authorContent`,`perface`,`pic`,`bookNum`,`dangerNum`,`statu`,`createTime`,`booktypeid`,`publishid`) values (2,'c语言基础2','相约奶茶','06/14/2011',420,88,100,'<p>啊啊啊啊啊啊啊啊啊啊啊啊</p>','<p>版本棒棒棒棒棒棒棒棒棒</p>','<p>擦擦擦擦擦擦擦擦擦擦</p>','9478c18b-cf0a-455d-adf5-355a0b78983b.jpg',66,NULL,'在售','2013-05-17 21:19:15',5,2),(3,'天龙八部','金庸','06/09/2010',500,60,80,'<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>','<p>帮不棒棒棒棒棒棒棒棒棒棒棒棒棒棒棒</p>','<p>擦擦擦擦擦擦擦擦擦擦擦擦擦擦</p>','6e8ea3c1-18a4-428b-a806-0cea02e09478.jpg',50,5,'在售','2013-05-17 21:27:16',6,2),(4,'JSP项目开发案例全程实录','明日科技','06/15/2005',386,56,80,'<p>《JSP项目开发案例全程实录》以都市供求信息网、图书馆管理系统、企业电子商城、企业快信——短信+邮件、企业人力资源管理系统、办公自动化管理系统、物流信息网、网络在线考试系统、编程体验BBS——论坛系统、博客网、聊天室系统和在线音乐吧12个实际项目开发程序为案例，从软件工程的角度出发，按照项目的开发顺序，系统、全面地介绍了程序开发流程。从开发背景、需求分析、系统功能分析、数据库分析、数据库建模、网站开发到网站的发布，每一过程都作了详细的介绍。<br>《JSP项目开发案例全程实录》案例涉及行业广泛，实用性非常强。通过对本书的学习，读者可以了解各个行业的特点，能够针对某一行业进行软件开发，也可以通过光盘中提供的案例源代码和数据库进行二次开发，以减少开发系统所需要的时间。<br>《JSP项目开发案例全程实录》光盘提供12个项目开发完整案例的同步教学视频，12个项目开发完整案例及其源程序，《JSP项目开发案例全程实录》的服务网站还提供了内容丰富的素材库、题库、模块库、案例库和本书的答疑服务。《JSP项目开发案例全程实录》是一本项目开发案例方面的参考书，适合有基本编程知识但还没有项目开发经验的软件开发的初学者使用，尤其适合高校在校生进行毕业设计、课题设计时做参考。<br></p>','<p>明日科技,专业的软件开发公司，该公司是一家以计算机软件技术为核心的高科技企业，是专业的应用软件开发和服务企业，多年来始终致力于行业管理软件开发、行业电子商务网站开发等领域，涉及生产、管理、控制、仓储、物流、营销、服务等行业，公司现有各类软件工程师50余人。另外，公司还致力于软件技术的普及和传播，先后创作软件开发类图书多部，其中多部图书荣获“全国优秀畅销书”奖。&nbsp;<br></p>','<p>《JSP项目开发案例全程实录》以都市供求信息网、图书馆管理系统、企业电子商城、企业快信——短信+邮件、企业人力资源管理系统、办公自动化管理系统、物流信息网、网络在线考试系统、编程体验BBS——论坛系统、博客网、聊天室系统和在线音乐吧12个实际项目开发程序为案例，从软件工程的角度出发，按照项目的开发顺序，系统、全面地介绍了程序开发流程。从开发背景、需求分析、系统功能分析、数据库分析、数据库建模、网站开发到网站的发布，每一过程都作了详细的介绍<br></p>','5a67a112-594e-4b30-972c-c0b39cdf3b97.jpg',50,5,'在售','2013-05-21 17:20:52',5,2);

/*Table structure for table `t_booktype` */

DROP TABLE IF EXISTS `t_booktype`;

CREATE TABLE `t_booktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(45) DEFAULT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_booktype` */

insert  into `t_booktype`(`id`,`typeName`,`createtime`) values (3,'自然科学','2013-05-15 18:05:12'),(4,'哲学','2013-05-15 18:05:19'),(5,'计算机','2013-05-16 18:16:45'),(6,'小说','2013-05-17 21:15:15');

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `createTime` varchar(45) DEFAULT NULL,
  `bookid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_Comment_t_book_idx` (`bookid`),
  KEY `fk_t_Comment_t_user1_idx` (`userid`),
  CONSTRAINT `fk_t_Comment_t_book` FOREIGN KEY (`bookid`) REFERENCES `t_book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_Comment_t_user1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`id`,`title`,`content`,`createTime`,`bookid`,`userid`) values (1,'樊总，课间休息时能别把大门锁住不',NULL,'2013-05-20 20:31:15',2,1),(2,'樊总，课间休息时能别把大门锁住不',NULL,'2013-05-20 20:32:06',2,1),(3,'这本书不错','<p><b>我非常喜欢这本书的</b></p>','2013-05-20 21:01:53',2,1),(4,'很好的武侠小说','<p>金庸，我最喜欢的武侠小说作者，顶你</p>','2013-05-21 19:50:41',3,1);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `content` text,
  `paytype` varchar(45) DEFAULT NULL,
  `pay` tinyint(1) DEFAULT NULL,
  `totle` float DEFAULT NULL,
  `createtime` varchar(45) DEFAULT NULL,
  `statu` varchar(45) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_order_t_user1_idx` (`userid`),
  CONSTRAINT `fk_t_order_t_user1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`name`,`address`,`tel`,`content`,`paytype`,`pay`,`totle`,`createtime`,`statu`,`userid`) values (4,'张清风','焦作','15239128121','我是一个好人','货到付款',1,148,'2013-05-19 16:20:53','成功',1),(5,'feng','jiaozuo','','','货到付款',1,88,'2013-05-19 16:31:18','成功',1),(6,'啊啊','jiaozuo','15239128121','','货到付款',1,88,'2013-05-19 16:40:04','成功',1),(7,'毕业实习','焦作','15239128188','','货到付款',1,60,'2013-05-19 21:27:53','成功',1),(8,'岳瑞杰','焦作','15239128909','我是阿棍','货到付款',1,60,'2013-05-21 15:41:55','付款成功',1),(9,'袁建龙','濮阳','15239128909','我最近好忙啊','货到付款',1,88,'2013-05-21 16:49:31','成功',3);

/*Table structure for table `t_orderitem` */

DROP TABLE IF EXISTS `t_orderitem`;

CREATE TABLE `t_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `bookprice` float DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `totle` float DEFAULT NULL,
  `orderid` int(11) NOT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_OrderItem_t_order1_idx` (`orderid`),
  CONSTRAINT `fk_t_OrderItem_t_order1` FOREIGN KEY (`orderid`) REFERENCES `t_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_orderitem` */

insert  into `t_orderitem`(`id`,`bookname`,`bookprice`,`num`,`totle`,`orderid`,`createtime`) values (2,'c语言基础2',88,1,88,4,'2013-05-19 16:20:53'),(3,'天龙八部',60,1,60,4,'2013-05-19 16:20:53'),(4,'c语言基础2',88,1,88,5,'2013-05-19 16:31:18'),(5,'c语言基础2',88,1,88,6,'2013-05-19 16:40:04'),(6,'天龙八部',60,1,60,7,'2013-05-19 21:27:53'),(7,'天龙八部',60,1,60,8,'2013-05-21 15:41:56'),(8,'c语言基础2',88,1,88,9,'2013-05-21 16:49:31');

/*Table structure for table `t_publish` */

DROP TABLE IF EXISTS `t_publish`;

CREATE TABLE `t_publish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pubname` varchar(45) DEFAULT NULL,
  `createTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_publish` */

insert  into `t_publish`(`id`,`pubname`,`createTime`) values (1,'河南工业出版社','2013-05-16 18:51:40'),(2,'北京出版社','2013-05-17 21:16:29'),(3,'深圳出版社','2013-05-17 21:16:40');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `lastAccessTime` varchar(45) DEFAULT NULL,
  `pic` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`password`,`email`,`lastAccessTime`,`pic`,`active`,`enable`,`createtime`) values (1,'qingfeng','c984aed014aec7623a54f0591da07a85fd4b762d','1213534470@qq.com',NULL,'5a67a112-594e-4b30-972c-c0b39cdf3b97.jpg',1,1,'2013-05-18 17:18:26'),(3,'袁建龙','c984aed014aec7623a54f0591da07a85fd4b762d','804795012@qq.com',NULL,NULL,1,1,'2013-05-21 16:01:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
