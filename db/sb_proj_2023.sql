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
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  `title` char(100) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`memberId`,`boardId`,`title`,`body`) values 
(1,'2023-08-23 11:16:54','2023-08-23 11:16:54',2,1,'제목 1','내용 1'),
(2,'2023-08-23 11:16:54','2023-08-23 11:16:54',2,1,'제목 2','내용 2'),
(3,'2023-08-23 11:16:54','2023-08-23 11:16:54',2,1,'제목 3','내용 3'),
(4,'2023-08-23 11:16:54','2023-08-23 11:16:54',3,2,'제목_0.9374802968813855','내용_0.3177930929863761'),
(5,'2023-08-23 11:16:54','2023-08-23 11:16:54',3,2,'제목_0.3166451000763523','내용_0.7954942004713176'),
(6,'2023-08-23 11:16:54','2023-08-23 11:16:54',1,2,'제목_0.6733733002779757','내용_0.11327825124680833'),
(7,'2023-08-23 11:19:07','2023-08-23 11:19:07',2,1,'제목_0.31879691064245713','내용_0.41941796095987594'),
(8,'2023-08-23 11:19:07','2023-08-23 11:19:07',1,1,'제목_0.8041110493281027','내용_0.6848302797273084'),
(9,'2023-08-23 11:19:07','2023-08-23 11:19:07',1,1,'제목_0.9875481789815689','내용_0.9239391301981538'),
(10,'2023-08-23 11:19:07','2023-08-23 11:19:07',2,2,'제목_0.5960384165831268','내용_0.4398770215361165'),
(11,'2023-08-23 11:19:07','2023-08-23 11:19:07',2,2,'제목_0.44978241198675933','내용_0.03875686231884813'),
(12,'2023-08-23 11:19:07','2023-08-23 11:19:07',3,1,'제목_0.9962635897065174','내용_0.6635730524208145'),
(14,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,2,'제목_0.2860439198892973','내용_0.46625915399404166'),
(15,'2023-08-23 11:19:08','2023-08-23 11:19:08',2,2,'제목_0.4157217772823961','내용_0.17748059535164443'),
(16,'2023-08-23 11:19:08','2023-08-23 11:19:08',2,2,'제목_0.423020118310135','내용_0.1088607535780042'),
(17,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,1,'제목_0.42244464198355064','내용_0.9633182752535848'),
(18,'2023-08-23 11:19:08','2023-08-23 11:19:08',2,2,'제목_0.6338906387182797','내용_0.6004553936426112'),
(19,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,2,'제목_0.2064811011836688','내용_0.9274277453566229'),
(20,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,1,'제목_0.47788399129908904','내용_0.47083779375146867'),
(21,'2023-08-23 11:19:08','2023-08-23 11:19:08',3,1,'제목_0.1892478411917089','내용_0.3757239043486527'),
(22,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,1,'제목_0.20341425501128124','내용_0.735445919200262'),
(23,'2023-08-23 11:19:08','2023-08-23 11:19:08',1,1,'제목_0.44202235382238625','내용_0.8243220549303313'),
(24,'2023-08-23 11:19:08','2023-08-23 11:19:08',3,2,'제목_0.13712072664603658','내용_0.17135340736373644'),
(25,'2023-08-23 11:19:08','2023-08-23 11:19:08',2,2,'제목_0.2286066014586078','내용_0.004140297886114845');

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `code` char(50) NOT NULL COMMENT 'notice(공지사항),free(자유게시판)...',
  `name` char(50) NOT NULL COMMENT '게시판 이름',
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '삭제여부(0=탈퇴전, 1=탈퇴)',
  `delDate` datetime DEFAULT NULL COMMENT '삭제날짜',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `board` */

insert  into `board`(`id`,`regDate`,`updateDate`,`code`,`name`,`delStatus`,`delDate`) values 
(1,'2023-08-23 11:16:54','2023-08-23 11:16:54','notice','공지사항',0,NULL),
(2,'2023-08-23 11:16:54','2023-08-23 11:16:54','free','자유',0,NULL);

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
  `email` char(50) NOT NULL,
  `delStatus` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전, 1=탈퇴)',
  `delDate` datetime DEFAULT NULL COMMENT '탈퇴날짜',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`authLevel`,`name`,`nickname`,`cellphoneNo`,`email`,`delStatus`,`delDate`) values 
(1,'2023-08-23 11:16:54','2023-08-23 11:16:54','admin','admin',7,'관리자','관리자','01011111111','admin@gmail.com',0,NULL),
(2,'2023-08-23 11:16:54','2023-08-23 11:16:54','user1','user1',3,'사용자1','사용자1','01011112222','user1@gmail.com',0,NULL),
(3,'2023-08-23 11:16:54','2023-08-23 11:16:54','user2','user2',3,'사용자2','사용자2','01022222222','user2@gmail.com',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
