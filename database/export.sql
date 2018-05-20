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
INSERT INTO `account` VALUES ('bku.vnu','bku.vnu','bku.vnu@hcmut.edu.vn',1,0,'2018-03-02 00:00:00','2010-01-03 00:00:00','bku.vnu',NULL),('chrissycostanza','chrissycostanza','chrissycostanza@outlook.com',1,0,'2018-05-21 00:00:00','2008-04-02 00:00:00','Chrissy Costanza',NULL),('dave2dtv','dave2dtv','dave2dtv@gmail.com',1,0,'2018-03-04 00:00:00','2009-03-01 00:00:00','dave',NULL),('huyentrang','huyentrang','huyentrang@gmail.com',1,0,'2018-04-02 00:00:00','2010-03-01 00:00:00','Huyen Trang',NULL),('quoctebachkhoa','quoctebachkhoa','quoctebachkhoa@hcmut.edu.vn',1,0,'2018-05-19 00:00:00','2007-11-03 00:00:00','Quoc Te Dai Hoc Bach Khoa',NULL),('tiendung','tiendung','tiendung@yahoo.com',1,0,'2018-03-05 00:00:00','2016-04-02 00:00:00','Bui Tien Dung',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'bku.vnu.jpg','bku.vnu','2018-05-12 00:00:00'),(2,'chrissycostanza.jpg','chrissycostanza','2018-03-05 00:00:00'),(3,'dave2dtv.jpg','dave2dtv','2017-04-02 00:00:00'),(4,'huyentrang.jpg','huyentrang','2018-04-04 00:00:00'),(5,'quoctebachkhoa.jpg','quoctebachkhoa','2017-04-05 00:00:00'),(6,'tiendung.jpg','tiendung','2016-06-05 00:00:00');
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
INSERT INTO `comment` VALUES (1,'Chuc mung nha truong co le ky niem thanh cong tot dep',NULL,'huyentrang',1),(2,'Chuc mung toan the can bo nha truong',NULL,'quoctebachkhoa',1),(3,'Ca la bach khoe se thang',NULL,'tiendung',5),(4,'I love ur song and allways love ur band',NULL,'dave2dtv',43),(5,'The final match was so excited',NULL,'tiendung',43),(6,'I love this song, ur voice is cool',NULL,'huyentrang',30),(7,'When do u guy start new concert ???',NULL,'dave2dtv',30),(8,'The VR Drake is really cool',NULL,'huyentrang',43);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti`
--

LOCK TABLES `noti` WRITE;
/*!40000 ALTER TABLE `noti` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'Le ky niem 60 nam Phu Tho Bach Khoa','0.jpg','2018-05-20 01:35:47','2018-05-20 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(2,'Hoi dong ban dieu hanh OISP','1.jpg','2018-05-20 01:35:47','2018-05-20 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(3,'Goc nho Bach Khoa','10.jpg','2018-05-20 01:35:47','2018-05-20 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(4,'Buoi toi tai Bach Khoa','11.jpg','2018-05-20 01:35:47','2018-05-20 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(5,'BKU vs USSH, ngay 14-4-2017','12.jpg','2018-05-19 01:35:47','2018-05-19 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(6,'No Caption','13.jpg','2018-05-19 01:35:47','2018-05-19 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(7,'Co vu cho HCMUT BLUE SHARK','14.jpg','2018-05-19 01:35:47','2018-05-19 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(8,'No Caption','15.jpg','2018-05-19 01:35:47','2018-05-19 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(9,'No Caption','16.jpg','2018-05-18 01:35:47','2018-05-18 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(10,'Dat chuan HCERES','17.jpg','2018-05-18 01:35:47','2018-05-18 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(11,'No Caption','18.jpg','2018-05-18 01:35:47','2018-05-18 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(12,'No Caption','19.jpg','2018-05-18 01:35:47','2018-05-18 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(13,'Ky niem 60 nam ','2.jpg','2018-05-17 01:35:47','2018-05-17 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(14,'7 minutes from dormitory to university','20.jpg','2018-05-17 01:35:47','2018-05-17 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(15,'Chup hinh luu niem','21.jpg','2018-05-17 01:35:47','2018-05-17 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(16,'No Caption','22.jpg','2018-05-17 01:35:47','2018-05-17 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(17,'No Caption','23.jpg','2018-05-16 01:35:47','2018-05-16 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(18,'No Caption','3.jpg','2018-05-16 01:35:47','2018-05-16 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(19,'No Caption','4.jpg','2018-05-16 01:35:47','2018-05-16 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(20,'No Caption','5.jpg','2018-05-16 01:35:47','2018-05-16 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(21,'No Caption','6.jpg','2018-05-15 01:35:47','2018-05-15 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(22,'No Caption','7.jpg','2018-05-15 01:35:47','2018-05-15 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(23,'No Caption','8.jpg','2018-05-15 01:35:47','2018-05-15 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(24,'No Caption','9.jpg','2018-05-15 01:35:47','2018-05-15 01:35:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bku.vnu'),(25,'Exactly who am i ???','50.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(26,'Nothing more in my life','51.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(27,'Close to next concert','52.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(28,'Feel bad girl','53.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(29,'No Caption','54.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(30,'Outsider- Insider??','55.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(31,'Good mood today ^^','56.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(32,'Im sexy and i know it!!','57.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(33,'Get out the world','58.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(34,'No Caption','59.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(35,'Ready for consert <3','60.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(36,'No Caption','61.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(37,'My childhood =)','62.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(38,'','63.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(39,'Welcom to Pixar Fest','64.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(40,'Thanks Every One for great support','65.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(41,'Nothing to say','66.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(42,'No Caption','67.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(43,'LOL World Championship !! Really HOT','68.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(44,'My pink hair $$','69.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(45,'Moscow','70.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(46,'Pink Hair again','71.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(47,'Next our tour around the world','72.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(48,'Ninja and Alan Walker','73.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(49,'No Caption','74.jpg','2018-05-14 01:35:48','2018-05-14 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(50,'My girlfriend','75.jpg','2018-05-14 01:35:48','2018-05-14 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(51,'No Caption','76.jpg','2018-05-14 01:35:48','2018-05-14 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(52,'No Caption','77.jpg','2018-05-14 01:35:48','2018-05-14 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(53,'No Caption','78.jpg','2018-05-13 01:35:48','2018-05-13 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(54,'No Caption','79.jpg','2018-05-13 01:35:48','2018-05-13 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chrissycostanza'),(55,'My work space','100.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(56,'No Caption','101.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(57,'So thich','102.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(58,'No Caption','103.jpg','2018-05-20 01:35:48','2018-05-20 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(59,'Violet Evergarden','104.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(60,'No Caption','105.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(61,'Razer mouse','106.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(62,'No Caption','107.jpg','2018-05-19 01:35:48','2018-05-19 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(63,'No Caption','108.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(64,'No Caption','109.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(65,'No Caption','110.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(66,'No Caption','111.jpg','2018-05-18 01:35:48','2018-05-18 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(67,'Skull Pad','112.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(68,'New Microchipset','113.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(69,'IBL Speaker','114.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(70,'No Caption','115.jpg','2018-05-17 01:35:48','2018-05-17 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(71,'No Caption','116.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(72,'No Caption','117.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(73,'Star War with AR weapons ','118.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(74,'Really cool characters','119.jpg','2018-05-16 01:35:48','2018-05-16 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(75,'Emotion done!!','120.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(76,'Dell vs Asus','121.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(77,'Which color boy?','122.jpg','2018-05-15 01:35:48','2018-05-15 01:35:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(78,'No Caption','123.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dave2dtv'),(79,'Du lich nuoc ngoai la dieu nen lam khi ban con tre, dung de hoi tiec khi qua muon','150.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(80,'Thay doi cam nhan ve the gioi quan','151.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(81,'New hair ^^','152.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(82,'I never good at chemistry ~.~ Damn it !','153.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(83,'No Caption','154.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(84,'Ao dai','155.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(85,'No Caption','156.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(86,'No Caption','157.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(87,'Fool in Pool','158.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(88,'No Caption','159.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(89,'Khoang troi uoc mo','160.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(90,'No Caption','161.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(91,'No Caption','162.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(92,'No Caption','163.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(93,'Fashion Week 2017 @@','164.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(94,'No Caption','165.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(95,'No Caption','166.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(96,'No Caption','167.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(97,'No Caption','168.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(98,'No Caption','169.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(99,'No Caption','170.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(100,'No Caption','171.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(101,'No Caption','172.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(102,'No Caption','173.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(103,'No Caption','174.jpg','2018-05-14 01:35:49','2018-05-14 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(104,'No Caption','175.jpg','2018-05-14 01:35:49','2018-05-14 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(105,'No Caption','176.jpg','2018-05-14 01:35:49','2018-05-14 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(106,'No Caption','177.jpg','2018-05-14 01:35:49','2018-05-14 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(107,'No Caption','178.jpg','2018-05-13 01:35:49','2018-05-13 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(108,'No Caption','179.jpg','2018-05-13 01:35:49','2018-05-13 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(109,'Buon ngu qua roi','180.jpg','2018-05-13 01:35:49','2018-05-13 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(110,'No Caption','181.jpg','2018-05-13 01:35:49','2018-05-13 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(111,'No Caption','182.jpg','2018-05-12 01:35:49','2018-05-12 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(112,'No Caption','183.jpg','2018-05-12 01:35:49','2018-05-12 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(113,'No Caption','184.jpg','2018-05-12 01:35:49','2018-05-12 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(114,'No Caption','185.jpg','2018-05-12 01:35:49','2018-05-12 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(115,'Moi mua xe ne','186.jpg','2018-05-11 01:35:49','2018-05-11 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(116,'No Caption','187.jpg','2018-05-11 01:35:49','2018-05-11 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(117,'No Caption','188.jpg','2018-05-11 01:35:49','2018-05-11 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(118,'No Caption','189.jpg','2018-05-11 01:35:49','2018-05-11 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(119,'No Caption','190.jpg','2018-05-10 01:35:49','2018-05-10 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(120,'No Caption','191.jpg','2018-05-10 01:35:49','2018-05-10 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(121,'No Caption','192.jpg','2018-05-10 01:35:49','2018-05-10 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(122,'No Caption','193.jpg','2018-05-10 01:35:49','2018-05-10 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(123,'Vunng Tau Beach','194.jpg','2018-05-09 01:35:49','2018-05-09 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'huyentrang'),(124,'Ban da thu skill nay','200.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(125,'Khi mat ban 20/10','201.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(126,'Nha dieu kien','202.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(127,'Asuma 3 tay','203.jpg','2018-05-20 01:35:49','2018-05-20 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(128,'Ban da tung','204.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(129,'Canh thi tai OISP','205.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(130,'No Caption','206.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(131,'No Caption','207.jpg','2018-05-19 01:35:49','2018-05-19 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(132,'Kawaii Neko','208.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(133,'Hanh phuc chi don gian la vay','209.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(134,'Dung ko vay','210.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(135,'feel bad man, ahihi stupid','211.jpg','2018-05-18 01:35:49','2018-05-18 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(136,'Qua dang cap','212.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(137,'Bon khon nan nay dau cung co','213.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(138,'Horray, Duoc nghi ba con oi','214.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(139,'No Caption','215.jpg','2018-05-17 01:35:49','2018-05-17 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(140,'No Caption','216.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(141,'No Caption','217.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(142,'No Caption','218.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(143,'No Caption','219.jpg','2018-05-16 01:35:49','2018-05-16 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(144,'Bot xao quan nha may','220.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(145,'No Caption','221.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(146,'Dieu khong the tai Bach Khoa','222.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(147,'Who care ?','223.jpg','2018-05-15 01:35:49','2018-05-15 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(148,'No Caption','224.jpg','2018-05-14 01:35:49','2018-05-14 01:35:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(149,'Co ai mong cho','225.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(150,'Promote truong nao','226.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(151,'Sang choanh qua','227.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(152,'No Caption','228.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(153,'Nho don xem LIVESTREAM','229.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'quoctebachkhoa'),(154,'No Caption','250.jpg','2018-05-20 01:35:50','2018-05-20 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(155,'No Caption','251.jpg','2018-05-20 01:35:50','2018-05-20 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(156,'No Caption','252.jpg','2018-05-20 01:35:50','2018-05-20 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(157,'No Caption','253.jpg','2018-05-20 01:35:50','2018-05-20 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(158,'No Caption','254.jpg','2018-05-19 01:35:50','2018-05-19 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(159,'No Caption','255.jpg','2018-05-19 01:35:50','2018-05-19 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(160,'No Caption','256.jpg','2018-05-19 01:35:50','2018-05-19 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(161,'No Caption','257.jpg','2018-05-19 01:35:50','2018-05-19 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(162,'No Caption','258.jpg','2018-05-18 01:35:50','2018-05-18 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(163,'No Caption','259.jpg','2018-05-18 01:35:50','2018-05-18 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(164,'No Caption','260.jpg','2018-05-18 01:35:50','2018-05-18 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(165,'No Caption','261.jpg','2018-05-18 01:35:50','2018-05-18 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(166,'No Caption','262.jpg','2018-05-17 01:35:50','2018-05-17 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(167,'No Caption','263.jpg','2018-05-17 01:35:50','2018-05-17 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(168,'No Caption','264.jpg','2018-05-17 01:35:50','2018-05-17 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(169,'No Caption','265.jpg','2018-05-17 01:35:50','2018-05-17 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(170,'No Caption','266.jpg','2018-05-16 01:35:50','2018-05-16 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(171,'No Caption','267.jpg','2018-05-16 01:35:50','2018-05-16 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(172,'No Caption','268.jpg','2018-05-16 01:35:50','2018-05-16 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(173,'No Caption','269.jpg','2018-05-16 01:35:50','2018-05-16 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(174,'No Caption','270.jpg','2018-05-15 01:35:50','2018-05-15 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(175,'No Caption','271.jpg','2018-05-15 01:35:50','2018-05-15 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(176,'No Caption','272.jpg','2018-05-15 01:35:50','2018-05-15 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(177,'No Caption','273.jpg','2018-05-15 01:35:50','2018-05-15 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(178,'No Caption','274.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(179,'No Caption','275.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(180,'No Caption','276.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(181,'No Caption','277.jpg','2018-05-14 01:35:50','2018-05-14 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(182,'No Caption','278.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(183,'No Caption','279.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(184,'No Caption','280.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(185,'No Caption','281.jpg','2018-05-13 01:35:50','2018-05-13 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(186,'No Caption','282.jpg','2018-05-12 01:35:50','2018-05-12 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(187,'No Caption','283.jpg','2018-05-12 01:35:50','2018-05-12 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(188,'No Caption','284.jpg','2018-05-12 01:35:50','2018-05-12 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(189,'No Caption','285.jpg','2018-05-12 01:35:50','2018-05-12 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(190,'No Caption','286.jpg','2018-05-11 01:35:50','2018-05-11 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(191,'No Caption','287.jpg','2018-05-11 01:35:50','2018-05-11 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(192,'No Caption','288.jpg','2018-05-11 01:35:50','2018-05-11 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(193,'No Caption','289.jpg','2018-05-11 01:35:50','2018-05-11 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(194,'No Caption','290.jpg','2018-05-10 01:35:50','2018-05-10 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(195,'No Caption','291.jpg','2018-05-10 01:35:50','2018-05-10 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(196,'No Caption','292.jpg','2018-05-10 01:35:50','2018-05-10 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(197,'No Caption','293.jpg','2018-05-10 01:35:50','2018-05-10 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(198,'No Caption','294.jpg','2018-05-09 01:35:50','2018-05-09 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(199,'No Caption','295.jpg','2018-05-09 01:35:50','2018-05-09 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(200,'No Caption','296.jpg','2018-05-09 01:35:50','2018-05-09 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung'),(201,'No Caption','297.jpg','2018-05-09 01:35:50','2018-05-09 01:35:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tiendung');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,NULL,'Cam on em',1,'bku.vnu'),(2,NULL,'Em cung nghi vay',3,'huyentrang'),(3,NULL,'Thank you, love you too',4,'chrissycostanza'),(4,NULL,'yeah! really excited',5,'chrissycostanza'),(5,NULL,'unlucky for SKT',5,'dave2dtv'),(6,NULL,'thanks',6,'chrissycostanza'),(7,NULL,'maybe 21/5',7,'chrissycostanza'),(8,NULL,'Yeah !!',8,'chrissycostanza'),(9,NULL,'Indeed',8,'dave2dtv'),(10,NULL,'but it not real',8,'huyentrang');
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
  `tag_in_photo_id` int(11) NOT NULL AUTO_INCREMENT,
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

-- Dump completed on 2018-05-21  2:48:20
