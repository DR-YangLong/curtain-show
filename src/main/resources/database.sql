/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- CREATE DATABASE /*!32312 IF NOT EXISTS*/`curtain_show` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `curtain_show`;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `user_info`;
DROP TABLE IF EXISTS `curtain_imgs`;
DROP TABLE IF EXISTS `curtain`;
SET FOREIGN_KEY_CHECKS=1;
/*Table structure for table `curtain` */
CREATE TABLE `curtain` (
  `curtainId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '窗帘id',
  `curtainNo` varchar(45) NOT NULL COMMENT '窗帘货号',
  `curtainName` varchar(30) NOT NULL COMMENT '窗帘名称',
  `curtainDate` datetime DEFAULT NULL COMMENT '发布日期',
  `curtainCover` varchar(128) DEFAULT NULL COMMENT '窗帘展示首图，只存文件名',
  `curtainDetail` varchar(1280) DEFAULT NULL COMMENT '整体介绍',
  `curtainRecommend` varchar(256) DEFAULT NULL COMMENT '推荐理由',
  `curtainDesign` varchar(128) DEFAULT NULL COMMENT '窗帘图案设计说明',
  `curtainPrice` char(3) DEFAULT NULL COMMENT '单价元/平米',
  `curtainThickness` char(1) DEFAULT NULL COMMENT '厚度：0厚重，1适中，2较薄，3轻薄',
  `curtainVertical` char(1) DEFAULT NULL COMMENT '垂感：0较好，1适中，2轻飘',
  `curtainHandfeel` char(1) DEFAULT NULL COMMENT '手感：0细滑，1柔软，2适中，3厚实',
  `curtainSuspend` char(1) DEFAULT NULL COMMENT '悬挂方式：0挂钩，1打孔，2韩式S钩',
  `curtainStatus` char(1) DEFAULT '0' COMMENT '状态:0正常，1下架',
  PRIMARY KEY (`curtainId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='主表';

/*Data for the table `curtain` */
insert into curtain(curtainNo,curtainName,curtainDate,curtainDetail,curtainRecommend,curtainDesign,curtainPrice,curtainThickness,curtainVertical,curtainHandfeel)
values("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1"),
("货号213545","名称",sysdate(),"详情介绍领导空间弗兰克圣诞节ldjflksdajf adjfl;djf;ldjf;ldg","推荐理由领导是解放路；觉得是费德勒解放路；是的积分大家法律可读积分奥兰多积分啦","花样描述地方","50","1","1","1");


/*Table structure for table `user_info` */
CREATE TABLE `user_info` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(45) NOT NULL COMMENT '用户名',
  `userPassword` varchar(45) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`userId`,`userName`,`userPassword`) values (1,'410357434@163.com','96028b412cbb8ce996f652c7d02abcfc');

/*Table structure for table `curtain_imgs` */
CREATE TABLE `curtain_imgs` (
  `imgId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `curtainId` bigint(20) DEFAULT NULL COMMENT '图片对应的窗帘',
  `img` varchar(128) DEFAULT NULL COMMENT '图片名称',
  `imgsDescribe` varchar(1024) DEFAULT NULL COMMENT '图片对应文字描述',
  `imgStatus` char(1) DEFAULT '0' COMMENT '状态：0正常，1删除',
  PRIMARY KEY (`imgId`),
  KEY `fk_curtain_imgs_idx` (`curtainId`),
  CONSTRAINT `fk_curtain_imgs` FOREIGN KEY (`curtainId`) REFERENCES `curtain` (`curtainId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='展示图片表';

/*Data for the table `curtain_imgs` */
insert into curtain_imgs(curtainId,imgsDescribe) values(1,"图片详情描述圣诞节科服好啦电视卡的科服你考虑第三方"),(1,"图片详情描述圣诞节科服好啦电视卡的科服你考虑第三方");

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;