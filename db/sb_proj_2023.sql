/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - sb_proj_2023
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sb_proj_2023` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sb_proj_2023`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(100) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`) values 
(1,'2023-08-14 10:53:53','2023-08-14 10:53:53','제목1','내용1'),
(2,'2023-08-14 10:53:53','2023-08-14 10:53:53','제목2','내용2'),
(3,'2023-08-14 10:53:53','2023-08-14 10:53:53','제목3','내용3');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `loginId` char(20) NOT NULL,
  `loginPw` char(60) NOT NULL,
  `authLevel` smallint(2) unsigned DEFAULT 3 COMMENT '(3=일반, 7=관리자)',
  `name` char(20) NOT NULL,
  `nickname` char(20) NOT NULL,
  `cellphoneNo` char(20) NOT NULL,
  `email` char(20) NOT NULL,
  `delStatus` tinyint(1) unsigned DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전, 1=탈퇴)',
  `delDate` datetime DEFAULT NULL COMMENT '탈퇴날짜',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`authLevel`,`name`,`nickname`,`cellphoneNo`,`email`,`delStatus`,`delDate`) values 
(1,'2023-08-14 10:53:53','2023-08-14 10:53:53','admin','admin',7,'관리자','관리자','010-1234-1234','admin@admin.com',0,NULL),
(2,'2023-08-14 10:53:53','2023-08-14 10:53:53','user1','user1',3,'사용자1','사용자1','010-1234-1234','user1@admin.com',0,NULL),
(3,'2023-08-14 10:53:53','2023-08-14 10:53:53','user2','user2',3,'사용자2','사용자2','010-1234-1234','user2@admin.com',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
