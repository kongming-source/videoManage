-- MySQL dump 10.13  Distrib 5.7.19, for Win32 (AMD64)
--
-- Host: localhost    Database: video
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `comments` text,
  `createtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_user_fk_idx` (`user_id`),
  KEY `comment_video_fk_idx` (`video_id`),
  CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_video_fk` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `createtime` date DEFAULT NULL,
  `favorites_state` varchar(20) DEFAULT '有效',
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `favorites_video_fk_idx` (`video_id`),
  CONSTRAINT `favorites_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `favorites_video_fk` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,'2020-02-02','已失效'),(1,2,'2020-01-03','有效'),(12,1,'2020-03-25','有效'),(12,4,'2020-03-29','有效');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power` (
  `user_id` int(11) NOT NULL,
  `userpower_id` int(11) NOT NULL,
  `starttime` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `userpower_state` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`,`userpower_id`),
  KEY `userpower_fk_idx` (`userpower_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userpower_fk` FOREIGN KEY (`userpower_id`) REFERENCES `userpower` (`userpower_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES (1,1,'2020-02-02',99999999,1),(2,3,'2020-02-02',180,2),(3,4,'2020-02-02',180,1),(12,2,'2020-02-02',180,1),(13,3,'2020-02-02',180,1),(14,3,'2020-02-02',180,1),(15,3,'2020-02-02',180,1),(16,3,'2020-02-02',180,1),(17,3,'2020-02-02',180,1);
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'搞笑'),(2,'动作'),(3,'生活'),(4,'美食'),(5,'财经'),(6,'数码'),(7,'科技'),(8,'鬼畜'),(9,'惊悚'),(10,'国创');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typemanage`
--

DROP TABLE IF EXISTS `typemanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typemanage` (
  `video_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`,`type_id`),
  KEY `type_fk_idx` (`type_id`),
  CONSTRAINT `type_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `video_fk` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typemanage`
--

LOCK TABLES `typemanage` WRITE;
/*!40000 ALTER TABLE `typemanage` DISABLE KEYS */;
INSERT INTO `typemanage` VALUES (1,1),(4,1),(5,1),(16,1),(18,1),(1,2),(3,2),(6,2),(10,2),(12,2),(7,3),(8,3),(15,3),(2,7),(11,7),(17,7),(13,8),(9,9),(14,10),(20,10),(21,10);
/*!40000 ALTER TABLE `typemanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','男','14739957027','admin@163.com',1),(2,'user1','user1','女','18426783246',NULL,1),(3,'modTest','test','男','15372367433',NULL,1),(12,'user2','user2','男','12345368259','1234567890@163.com',1),(13,'user3','user3','男','12345657315','1234567890@163.com',1),(14,'user','user','女','12345678901','1234567890@163.com',1),(15,'addtest','addtest','女','13527748502','larry@qq.com',1),(16,'test','test','男','12353738590','test.com',2),(17,'test2','test2','女','15538037931','11@163',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpower`
--

DROP TABLE IF EXISTS `userpower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpower` (
  `userpower_id` int(11) NOT NULL AUTO_INCREMENT,
  `userpower_name` varchar(20) NOT NULL,
  PRIMARY KEY (`userpower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpower`
--

LOCK TABLES `userpower` WRITE;
/*!40000 ALTER TABLE `userpower` DISABLE KEYS */;
INSERT INTO `userpower` VALUES (1,'管理员'),(2,'普通用户'),(3,'VIP'),(4,'超级VIP');
/*!40000 ALTER TABLE `userpower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(20) NOT NULL,
  `online` date DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT '1',
  `state` int(11) NOT NULL DEFAULT '1',
  `pic` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `videopower_fk_idx` (`power`),
  CONSTRAINT `videopower_fk` FOREIGN KEY (`power`) REFERENCES `videopower` (`videopower_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'迪士尼公主','2020-01-12','tom','内陆',160,1,2,'c1.jpg'),(2,'test','2019-10-01','larry','欧美',90,1,2,'c2.jpg'),(3,'testtest','2018-05-06','吴正','港台',90,1,3,'c3.jpg'),(4,'冰雪女王4：魔镜世界','2018-09-07','tony','欧美',120,2,2,'bxnw.jpg'),(5,'昨日奇迹','2017-10-23','张三','内陆',72,3,2,'zrqj.jpg'),(6,'哪吒之魔童降世','2019-08-09','饺子','内陆',60,4,2,'nz.jpg'),(7,'银河补习班','2019-08-09','罗菲','内陆',60,2,2,'yhbxb.jpg'),(8,'送我上青云','2019-08-09','罗菲','内陆',60,1,2,'swsqy.jpg'),(9,'鼠胆英雄','2019-08-09','罗菲','港台',60,1,2,'sdyx.jpg'),(10,'八子','2019-08-09','王福','港台',60,1,2,'bz.jpg'),(11,'愤怒的小鸟2','2019-08-09','tony','欧美',60,4,2,'fndxn.jpg'),(12,'速度与激情：特别行动','2019-08-09','tony','欧美',60,2,2,'sdyjq.jpg'),(13,'铤而走险','2019-07-18','张天师','港台',60,3,2,'tezx.jpg'),(14,'白蛇：缘起','2019-07-18','王三宝','内陆',60,2,2,'bs.jpg'),(15,'何以为家','2019-07-18','larry','欧美',60,3,2,'hywj.jpg'),(16,'神奇马戏团','2019-07-18','迈克逊','欧美',60,3,2,'sqmxt.jpg'),(17,'帝企鹅日记：召唤','2019-06-21','杰克逊','欧美',60,1,2,'dqerj.jpg'),(18,'狮子王','2019-06-21','迈克逊','欧美',60,2,2,'szw.jpg'),(20,'测试','2020-03-25','user2','内陆',32,1,1,'a.jpg'),(21,'测试数据','2020-03-25','user2','内陆',7,1,3,'a.jpg');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videopower`
--

DROP TABLE IF EXISTS `videopower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videopower` (
  `videopower_id` int(11) NOT NULL AUTO_INCREMENT,
  `videopower_name` varchar(20) NOT NULL,
  PRIMARY KEY (`videopower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videopower`
--

LOCK TABLES `videopower` WRITE;
/*!40000 ALTER TABLE `videopower` DISABLE KEYS */;
INSERT INTO `videopower` VALUES (1,'免费'),(2,'VIP'),(3,'可下载'),(4,'收费');
/*!40000 ALTER TABLE `videopower` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-10 17:11:34
