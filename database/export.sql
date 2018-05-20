CREATE DATABASE  IF NOT EXISTS `instagram` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `instagram`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: instagram
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(72) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `lock` tinyint(1) DEFAULT NULL,
  `datetime_update` datetime DEFAULT NULL,
  `datetime_create` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `verify_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('a','a','manhpcpro@gmail.com',1,0,'2018-05-17 03:52:23','2018-05-17 03:52:23','a','d8dcee83d5a92e7e565e3101808c0e05'),('a1','a','Lankawaii@yahoo.com',1,0,'2016-05-03 00:00:00','2015-03-04 00:00:00','Lan Le Thi',NULL),('huonggiang123','huonggiang123','huonggiang@gmail.com',1,0,'2015-01-02 00:00:00','2014-12-22 00:00:00','Huong Giang',NULL),('Minh98','123456','minh98sun2gmal.com',1,0,'2018-05-05 00:00:00','2018-05-05 00:00:00','Minh Nguyen',NULL),('NgocNhan123','NhanLolli','loliruletheworld@gmail.com',1,0,'2017-04-06 00:00:00','2014-03-05 00:00:00','Tran ngoc Duc Nhan',NULL),('PhamHoangAnh16','anhanhanh','phanh@outlook.com',0,0,'2018-05-05 00:00:00','2014-04-06 00:00:00','Hoàng Anh Phạm',NULL),('rgg35fsd','asfdfaf','fsfafafa',0,0,'2018-05-17 02:14:47','2018-05-17 02:14:47','fasff','e6b565379177738e01388704a94ff56a'),('werwerewr','rerwr','ewrwe',0,0,'2018-05-17 02:28:01','2018-05-17 02:28:01','wer','476c7855372326f428a1dc77aa04fe92');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_account_insert` AFTER INSERT ON `account` FOR EACH ROW BEGIN
	INSERT INTO setting(username,private_acc)
    VALUES (NEW.username,1);
    INSERT INTO profile (username)
    VALUES (NEW.username);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avatar` (
  `avatar_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`avatar_id`),
  UNIQUE KEY `filename_UNIQUE` (`filename`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_avatar_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'HuongGiangLe1.jpg','huonggiang123','2018-01-01 00:00:00'),(2,'Lancute11.jpg','a1','2017-02-04 00:00:00'),(3,'Minh98.jpg','NgocNhan123','2018-03-02 00:00:00'),(4,'NgocNhan123.jpg','NgocNhan123','2016-03-12 00:00:00'),(5,'PhamHoangAnh16.jpg','PhamHoangAnh16','2018-12-11 00:00:00'),(6,'a.jpg','PhamHoangAnh16','2018-12-12 00:00:00');
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `block` (
  `username1` varchar(50) NOT NULL,
  `username2` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`username1`,`username2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
INSERT INTO `block` VALUES ('a','a','2018-05-19 22:49:54'),('Minh98','Lancute11','2018-01-01 00:00:00'),('PhamHoangAnh16','Minh98','2017-03-02 00:00:00');
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_username_idx` (`username`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_comment_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Commet gi do','2018-01-01 00:00:00','Minh98',2),(2,'lol choi','2017-06-04 00:00:00','huonggiang123',4),(3,'aka na bobo','2018-03-02 00:00:00','a1',5),(4,'wakanda forever','2018-02-04 00:00:00','a1',6),(5,'holy moly','2018-04-03 00:00:00','NgocNhan123',7),(6,'holy bless','2018-02-04 00:00:00','PhamHoangAnh16',5),(7,'random','2018-02-03 00:00:00','PhamHoangAnh16',6),(8,'pRNG=psuedo','2018-02-12 00:00:00','huonggiang123',4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_comment_insert` AFTER INSERT ON `comment` FOR EACH ROW BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM photo
    WHERE photo_id = NEW.photo_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,0,NEW.comment_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `reply` varchar(300) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_feedback_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `username1` varchar(50) NOT NULL,
  `username2` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL,
  `noti_when_post` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`follow_id`),
  UNIQUE KEY `username1_UNIQUE` (`username1`,`username2`),
  KEY `fk_follow_username_idx` (`username2`),
  CONSTRAINT `fk_follow_username1` FOREIGN KEY (`username1`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_follow_username2` FOREIGN KEY (`username2`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,'huonggiang123','Minh98','2017-01-03 00:00:00',NULL),(2,'huonggiang123','PhamHoangAnh16','2017-03-31 00:00:00',NULL),(3,'a1','huonggiang123','2018-03-02 00:00:00',NULL),(4,'Minh98','PhamHoangAnh16','2018-03-01 00:00:00',NULL),(5,'NgocNhan123','PhamHoangAnh16','2017-12-03 00:00:00',NULL),(6,'PhamHoangAnh16','Minh98','2018-01-03 00:00:00',NULL),(7,'PhamHoangAnh16','NgocNhan123','2018-03-13 00:00:00',NULL),(42,'a','huonggiang123','2018-05-20 11:30:31',0),(43,'a','NgocNhan123','2018-05-20 11:30:43',0),(80,'a','PhamHoangAnh16','2018-05-20 16:10:45',0),(82,'a','Minh98','2018-05-20 20:07:45',0),(83,'a','a1','2018-05-20 23:34:18',0);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_follow_insert` AFTER INSERT ON `follow` FOR EACH ROW BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username2,0,2,NEW.follow_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hashtag` (
  `hashtag_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  `photo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hashtag_id`),
  KEY `fk__idx` (`photo_id`),
  CONSTRAINT `fk_hashtag_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES (1,'NgocNhan123',2),(2,'Lancute11',5),(3,'Lancute11',7),(4,'PhamHoangAnh16',3),(5,'Minh98',6),(6,'HuongGiangLe1',7);
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `like` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  UNIQUE KEY `photo_id_UNIQUE` (`photo_id`,`username`),
  KEY `fk_like_username` (`username`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_like_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,'huonggiang123',5,'2018-01-03 00:00:00'),(2,'huonggiang123',6,'2018-03-12 00:00:00'),(3,'a1',1,'2018-01-30 00:00:00'),(4,'Minh98',3,'2018-04-21 00:00:00'),(5,'Minh98',4,'2017-03-01 00:00:00'),(6,'Minh98',7,'2018-03-16 00:00:00'),(7,'NgocNhan123',2,'2018-03-12 00:00:00'),(8,'PhamHoangAnh16',7,'2018-03-27 00:00:00');
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_like_insert` AFTER INSERT ON `like` FOR EACH ROW BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM photo
    WHERE photo_id = NEW.photo_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,3,NEW.like_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'HCM'),(2,'Ha Noi'),(3,'Da Nang'),(4,'Istanbul'),(5,'Yggdrasil');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `username1` varchar(50) DEFAULT NULL,
  `username2` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `attachment_file` varchar(50) DEFAULT NULL,
  `datetime_create` datetime DEFAULT NULL,
  `datetime_delete` datetime DEFAULT NULL,
  `read` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `fk_username_idx` (`username1`),
  KEY `fk_message_username2_idx` (`username2`),
  CONSTRAINT `fk_message_username1` FOREIGN KEY (`username1`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_message_username2` FOREIGN KEY (`username2`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'PhamHoangAnh16','Minh98','i love u xoxo',NULL,'2018-01-01 00:00:00',NULL,1),(2,'Minh98','PhamHoangAnh16','i dont care lol',NULL,'2018-01-01 00:00:00',NULL,1),(3,'PhamHoangAnh16','Minh98','nani really',NULL,'2018-01-01 00:00:00',NULL,1),(4,'NgocNhan123','huonggiang123','tra tien day',NULL,'2018-04-02 00:00:00',NULL,1),(5,'a1','Minh98','di an may',NULL,'2018-01-03 00:00:00',NULL,0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti`
--

DROP TABLE IF EXISTS `noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti` (
  `noti_id` int(11) NOT NULL AUTO_INCREMENT,
  `read` tinyint(1) DEFAULT '0',
  `noti_type` tinyint(4) DEFAULT NULL,
  `username_rev` varchar(50) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `fk_noti_username_idx` (`username_rev`),
  CONSTRAINT `fk_noti_username` FOREIGN KEY (`username_rev`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti`
--

LOCK TABLES `noti` WRITE;
/*!40000 ALTER TABLE `noti` DISABLE KEYS */;
INSERT INTO `noti` VALUES (2,0,2,'PhamHoangAnh16',8),(3,0,2,'PhamHoangAnh16',11),(4,0,2,'PhamHoangAnh16',12),(5,0,2,'PhamHoangAnh16',13),(6,0,2,'PhamHoangAnh16',14),(7,0,2,'PhamHoangAnh16',15),(8,0,2,'PhamHoangAnh16',16),(9,0,2,'PhamHoangAnh16',17),(10,0,2,'PhamHoangAnh16',18),(11,0,2,'PhamHoangAnh16',19),(12,0,2,'PhamHoangAnh16',20),(13,0,2,'PhamHoangAnh16',21),(14,0,2,'PhamHoangAnh16',22),(15,0,2,'PhamHoangAnh16',23),(16,0,2,'PhamHoangAnh16',24),(17,0,2,'PhamHoangAnh16',25),(18,0,2,'PhamHoangAnh16',26),(19,0,2,'PhamHoangAnh16',27),(20,0,2,'PhamHoangAnh16',28),(21,0,2,'PhamHoangAnh16',29),(22,0,2,'PhamHoangAnh16',30),(23,0,2,'PhamHoangAnh16',31),(24,0,2,'PhamHoangAnh16',32),(25,0,2,'PhamHoangAnh16',33),(26,0,2,'PhamHoangAnh16',34),(27,0,2,'PhamHoangAnh16',35),(28,0,2,'PhamHoangAnh16',36),(29,0,2,'PhamHoangAnh16',37),(30,0,2,'PhamHoangAnh16',38),(31,0,2,'PhamHoangAnh16',39),(32,0,2,'PhamHoangAnh16',40),(33,0,2,'PhamHoangAnh16',41),(34,0,2,'huonggiang123',42),(35,0,2,'NgocNhan123',43),(36,0,2,'a1',44),(37,0,2,'a1',45),(38,0,2,'a1',46),(39,0,2,'a1',47),(40,0,2,'a1',48),(41,0,2,'a1',49),(42,0,2,'a1',50),(43,0,2,'a1',51),(44,0,2,'a1',52),(45,0,2,'a1',53),(46,0,2,'a1',54),(47,0,2,'a1',55),(48,0,2,'a1',56),(49,0,2,'a1',57),(50,0,2,'a1',58),(51,0,2,'a1',59),(52,0,2,'a1',60),(53,0,2,'a1',61),(54,0,2,'a1',62),(55,0,2,'a1',63),(56,0,2,'a1',64),(57,0,2,'a1',65),(58,0,2,'a1',66),(59,0,2,'a1',67),(60,0,2,'a1',68),(61,0,2,'a1',69),(62,0,2,'a1',70),(63,0,2,'a1',71),(64,0,2,'a1',72),(65,0,2,'a1',73),(66,0,2,'PhamHoangAnh16',74),(67,0,2,'PhamHoangAnh16',75),(68,0,2,'a1',76),(69,0,2,'a1',77),(70,0,2,'PhamHoangAnh16',78),(71,0,2,'PhamHoangAnh16',79),(72,0,2,'PhamHoangAnh16',80),(73,0,2,'a1',81),(74,0,2,'Minh98',82),(75,0,2,'a1',83);
/*!40000 ALTER TABLE `noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(200) DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  `datetime_upload` datetime DEFAULT NULL,
  `datetime_update` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `camera_model` varchar(50) DEFAULT NULL,
  `fstop` varchar(45) DEFAULT NULL,
  `exposure_time` char(10) DEFAULT NULL,
  `ISO` int(11) DEFAULT NULL,
  `focal_length` int(11) DEFAULT NULL,
  `flash_mode` tinyint(1) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `fk_location_id_idx` (`location_id`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_photo_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'vo va vo van','1.jpg','2017-01-01 00:00:00','2017-03-01 00:00:00',4,'CanonD90','120',NULL,800,NULL,NULL,'a1'),(2,'biet chet lien','2.jpg','2018-02-01 00:00:00','2018-03-01 00:00:00',5,'Nikon1000','122',NULL,123,NULL,NULL,'a1'),(3,'thoi dep','3.jpg','2017-01-03 00:00:00','2018-02-03 00:00:00',5,'Fuji11',NULL,NULL,NULL,NULL,NULL,'PhamHoangAnh16'),(4,'aa','HuongGiangLe1_1.jpg','2017-03-01 00:00:00','2017-03-04 00:00:00',2,'NIKON',NULL,NULL,NULL,NULL,NULL,'huonggiang123'),(5,'final loli','NgocNhan123_1.jpg','2017-02-01 00:00:00','2017-05-03 00:00:00',4,'CANON',NULL,NULL,NULL,NULL,NULL,'NgocNhan123'),(6,'ahiihi','Minh98_1.jpg','2017-01-05 00:00:00','2017-08-04 00:00:00',3,'SONY','8','1',900,3,1,'Minh98'),(7,'test choi','Minh98_2.jpg','2018-04-05 00:00:00','2018-04-05 00:00:00',5,'SONY',NULL,NULL,NULL,NULL,NULL,'Minh98');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile` (
  `username` varchar(50) NOT NULL,
  `biography` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_profile_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('a',NULL,NULL,NULL,NULL),('a1','aka','0904470694','male','www.google.com'),('huonggiang123','null','016773355123','female',NULL),('Minh98',NULL,'0921243335','male',NULL),('NgocNhan123','loli','09235215335','female','www.loliruletheworld.org'),('PhamHoangAnh16','beautiful girl','113','female','itian.com'),('rgg35fsd',NULL,NULL,NULL,NULL),('werwerewr',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `username_idx` (`username`),
  KEY `comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_reply_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reply_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'2018-01-01 00:00:00','rep choi',1,'PhamHoangAnh16'),(2,'2018-02-04 00:00:00','you loser',4,'huonggiang123'),(3,'2018-02-12 00:00:00','true random',8,'Minh98'),(4,NULL,'them moi',2,'huonggiang123');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_reply_insert` AFTER INSERT ON `reply` FOR EACH ROW BEGIN
	DECLARE usern VARCHAR(50);
    SELECT username
    FROM comment
    WHERE comment_id = NEW.comment_id
    INTO usern;
    
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (usern,0,1,NEW.reply_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `report` (
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`username`,`photo_id`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_report_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_report_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('Minh98',5,'dont like it','2018-03-04 00:00:00'),('NgocNhan123',4,'test chuc nang','2018-02-04 00:00:00');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save`
--

DROP TABLE IF EXISTS `save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `save` (
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`username`,`photo_id`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_save_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_save_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save`
--

LOCK TABLES `save` WRITE;
/*!40000 ALTER TABLE `save` DISABLE KEYS */;
INSERT INTO `save` VALUES ('Minh98',2),('PhamHoangAnh16',2),('PhamHoangAnh16',3),('NgocNhan123',5),('Minh98',6),('huonggiang123',7);
/*!40000 ALTER TABLE `save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `setting` (
  `username` varchar(50) NOT NULL,
  `language` varchar(10) DEFAULT NULL,
  `private_acc` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_setting_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('a',NULL,1),('a1','en',1),('huonggiang123','en',0),('Minh98','vn',0),('NgocNhan123','english',1),('PhamHoangAnh16','vietnamese',1),('rgg35fsd',NULL,1),('werwerewr',NULL,1);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `story` (
  `story_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`story_id`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_story_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,'2018-01-22 00:00:00','HuongGiangLe1_Story1.png','huonggiang123'),(2,'2018-02-12 00:00:00','NgocNhan123_Story1.png','NgocNhan123'),(3,'2018-03-13 00:00:00','PhamHoangAnh16_Story1.png','PhamHoangAnh16'),(4,'2018-04-13 00:00:00','PhamHoangAnh16_Story2.png','PhamHoangAnh16');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_in_comment`
--

DROP TABLE IF EXISTS `tag_in_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag_in_comment` (
  `tag_in_comment_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tag_in_comment_id`),
  KEY `fk_tag_in_comment_idx` (`comment_id`),
  CONSTRAINT `fk_tag_in_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_in_comment`
--

LOCK TABLES `tag_in_comment` WRITE;
/*!40000 ALTER TABLE `tag_in_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_in_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_tag_in_comment_insert` AFTER INSERT ON `tag_in_comment` FOR EACH ROW BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,5,NEW.tag_in_comment_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tag_in_photo`
--

DROP TABLE IF EXISTS `tag_in_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag_in_photo` (
  `tag_in_photo_id` int(11) NOT NULL,
  `x_axis` int(11) DEFAULT NULL,
  `y_axis` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_in_photo_id`),
  KEY `fk_username_idx` (`username`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_tag_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_in_photo`
--

LOCK TABLES `tag_in_photo` WRITE;
/*!40000 ALTER TABLE `tag_in_photo` DISABLE KEYS */;
INSERT INTO `tag_in_photo` VALUES (1,1,2,'NgocNhan123',4),(2,4,5,'huonggiang123',7),(3,4,4,'a1',5),(4,13,43,'NgocNhan123',4);
/*!40000 ALTER TABLE `tag_in_photo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_tag_in_photo_insert` AFTER INSERT ON `tag_in_photo` FOR EACH ROW BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,4,NEW.tag_in_photo_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tag_in_reply`
--

DROP TABLE IF EXISTS `tag_in_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag_in_reply` (
  `tag_in_reply_id` int(11) NOT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tag_in_reply_id`),
  KEY `fk_tag_in_reply_reply_id_idx` (`reply_id`),
  CONSTRAINT `fk_tag_in_reply_reply_id` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_in_reply`
--

LOCK TABLES `tag_in_reply` WRITE;
/*!40000 ALTER TABLE `tag_in_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_in_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_tag_in_reply_insert` AFTER INSERT ON `tag_in_reply` FOR EACH ROW BEGIN
	INSERT INTO noti(username_rev,`read`,noti_type,type_id)
    VALUES (NEW.username,0,6,NEW.tag_in_reply_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'instagram'
--

--
-- Dumping routines for database 'instagram'
--
/*!50003 DROP FUNCTION IF EXISTS `check_block` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_block`(username1 VARCHAR(50),username2 VARCHAR(50)) RETURNS tinyint(1)
BEGIN
	DECLARE temp1 INT;
    DECLARE temp2 INT;
    DECLARE output BOOLEAN;
    
    SELECT COUNT(*) INTO temp1
    FROM block AS F
    WHERE F.username1=username1 AND F.username2=username2;
    
    SELECT COUNT(*) INTO temp2
    FROM block AS B
    WHERE B.username1=username2 AND B.username2=username1;
    
    IF temp1 = 1 OR temp2 = 1 THEN
		SET output=true;
	ELSE
		SET output=false;
	END IF;
    
RETURN output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_follow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_follow`(username1 VARCHAR(50),username2 VARCHAR(50)) RETURNS tinyint(1)
BEGIN
	DECLARE output BOOLEAN;
	SELECT COUNT(*) FROM follow WHERE follow.username1 = username1 AND follow.username2 = username2
    INTO output;
    
RETURN output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_avatar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_avatar`(user varchar(50)) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
BEGIN
DECLARE var VARCHAR(50); 
SELECT filename INTO var FROM instagram.avatar WHERE username=user ORDER BY datetime DESC LIMIT 0, 1;
IF var IS NULL THEN SET var='default.jpg';
END IF;
RETURN var;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_comment_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_comment_num`(photo_id int) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
    FROM `comment` WHERE comment.photo_id = photo_id;
    
	RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_follower_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_follower_num`(username VARCHAR(50)) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
	FROM follow
	WHERE username2 = username;
    
    RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_following_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_following_num`(username VARCHAR(50)) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
	FROM follow
	WHERE username1 = username;
    RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_like_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_like_num`(photo_id INT(11)) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
	FROM `like` AS L
	WHERE L.photo_id = photo_id;
    
    RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_name`(username VARCHAR(50)) RETURNS varchar(50) CHARSET utf8
BEGIN
	DECLARE x varchar(50);
	SELECT name 
	FROM account AS A
	WHERE A.username = username
    INTO x;
    
    RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_photo_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_photo_num`(username VARCHAR(50)) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
	FROM photo
	WHERE photo.username = username;
    
    RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_reply_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_reply_num`(comment_id int) RETURNS int(11)
BEGIN
	DECLARE x INT;
	SELECT COUNT(*) INTO x 
    FROM reply WHERE reply.comment_id = comment_id;
    
	RETURN x;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_block` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_block`(IN username1 VARCHAR(50),IN username2 VARCHAR(50),OUT output boolean)
BEGIN
	DECLARE dem INT;
    SELECT COUNT(*) INTO dem
    FROM block AS F
    WHERE F.username1=username1 AND F.username2=username2;
    IF dem = 1 THEN
			SET output=FALSE;
	ELSE
		SET output=TRUE;
        INSERT INTO block
        VALUES (username1,username2,NOW());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_like`(IN username1 VARCHAR(50),IN photo_id INT(11),OUT output boolean)
BEGIN
	DECLARE dem INT;
    SELECT COUNT(*) INTO dem
    FROM `like` AS L
    WHERE L.username1=username1 AND L.phto_id=photo_id;
    IF dem = 1 THEN
			SET output=FALSE;
	ELSE
		SET output=TRUE;
        INSERT INTO `like`
        VALUES (username1,photo_id,NOW());
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_unlike` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_unlike`(IN username1 VARCHAR(50),IN ph_id INT(11),OUT output boolean)
BEGIN
	DECLARE dem INT;
    SELECT COUNT(*) INTO dem
    FROM `like` AS L
    WHERE L.username=username1 AND L.photo_id=ph_id;
    IF dem = 1 THEN
			SET output=TRUE;
            DELETE FROM `like`
            WHERE username=username1 AND photo_id= ph_id;
	ELSE
		SET output=FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_block_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_block_proc`(IN username1 VARCHAR(50),IN username2 VARCHAR(50),OUT output boolean)
BEGIN
	DECLARE temp1 INT;
    DECLARE temp2 INT;
    
    SELECT COUNT(*) INTO temp1
    FROM block AS F
    WHERE F.username1=username1 AND F.username2=username2;
    
    SELECT COUNT(*) INTO temp2
    FROM block AS B
    WHERE B.username1=username2 AND B.username2=username1;
    
    IF temp1 = 1 OR temp2 = 1 THEN
		SET output=true;
	ELSE
		SET output=false;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_follow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_follow`(IN username1 VARCHAR(50),IN username2 VARCHAR(50),OUT output boolean)
BEGIN
	DECLARE dem INT;
    SELECT COUNT(*) INTO dem
    FROM follow AS F
    WHERE F.username1=username1 AND F.username2=username2;
    IF dem = 1 THEN
		SET output=true;
	ELSE
		SET output=false;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_private_acc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_private_acc`(IN username VARCHAR(50),OUT output boolean)
BEGIN
	DECLARE dem INT;
    SELECT private_acc
    FROM setting AS F
    WHERE F.username= username
    INTO  dem;
    
    if dem=1 THEN 
		SET output=TRUE;
	ELSE
		SET output= FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user_to_photo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user_to_photo`(IN username1 VARCHAR(50), IN username2 VARCHAR(50), OUT output BOOLEAN)
BEGIN
	DECLARE temp1 BOOLEAN;
    DECLARE temp2 BOOLEAN;
    DECLARE temp3 BOOLEAN;
	CALL check_follow(username1, username2, temp1);
    CALL check_private_acc(username2, temp2);
    CALL check_block_proc(username1, username2, temp3);
    
    IF NOT ((temp1 = false AND temp2 = true) OR temp3) THEN 
		SET output=TRUE;
	ELSE
		SET output= FALSE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_follow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_follow`(IN user1 VARCHAR(50),IN user2 VARCHAR(50),OUT output tinyint(1))
BEGIN
    DECLARE temp INT;
    SELECT COUNT(*) INTO temp
    FROM `follow` AS F
    WHERE username1=user1 AND username2=user2;
    
    SET output = TRUE;
    
    IF temp = 1 THEN
		DELETE FROM follow WHERE username1=user1 AND username2=user2;
		SET output=FALSE;
	ELSE
        INSERT INTO `follow` (username1, username2, datetime)
        VALUES (user1, user2, NOW());
		SET output=TRUE;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21  2:30:14
