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
  `datetime_update` datetime DEFAULT NULL,
  `datetime_create` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('a','a','a@gmail.com',1,'2018-04-30 05:05:05','2018-04-30 05:05:05','Lê a'),('b','b','b@gmail.com',1,'2018-04-30 05:05:05','2018-04-30 05:05:05','Lê a');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_avatar_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
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
  PRIMARY KEY (`username1`,`username2`),
  KEY `fk_block_username2_idx` (`username2`),
  CONSTRAINT `fk_block_username1` FOREIGN KEY (`username1`) REFERENCES `account` (`username`),
  CONSTRAINT `fk_block_username2` FOREIGN KEY (`username2`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `fk_comment_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  CONSTRAINT `fk_comment_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_feedback_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `username1` varchar(50) NOT NULL,
  `username2` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`username1`,`username2`),
  KEY `fk_follow_username_idx` (`username2`),
  CONSTRAINT `fk_follow_username1` FOREIGN KEY (`username1`) REFERENCES `account` (`username`),
  CONSTRAINT `fk_follow_username2` FOREIGN KEY (`username2`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`username`,`photo_id`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_like_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  CONSTRAINT `fk_like_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `message` int(11) NOT NULL,
  `username1` varchar(50) DEFAULT NULL,
  `username2` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `attachment_file` varchar(50) DEFAULT NULL,
  `datetime_create` datetime DEFAULT NULL,
  `datetime_delete` datetime DEFAULT NULL,
  PRIMARY KEY (`message`),
  KEY `fk_username_idx` (`username1`),
  KEY `fk_message_username2_idx` (`username2`),
  CONSTRAINT `fk_message_username1` FOREIGN KEY (`username1`) REFERENCES `account` (`username`),
  CONSTRAINT `fk_message_username2` FOREIGN KEY (`username2`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `read` tinyint(1) DEFAULT NULL,
  `noti_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti`
--

LOCK TABLES `noti` WRITE;
/*!40000 ALTER TABLE `noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_comment`
--

DROP TABLE IF EXISTS `noti_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_comment` (
  `noti_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `fk_comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_noti_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `fk_noti_comment_noti_id` FOREIGN KEY (`noti_id`) REFERENCES `noti` (`noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_comment`
--

LOCK TABLES `noti_comment` WRITE;
/*!40000 ALTER TABLE `noti_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_follow`
--

DROP TABLE IF EXISTS `noti_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_follow` (
  `noti_id` int(11) NOT NULL,
  `username1` varchar(50) DEFAULT NULL,
  `username2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `fk_username_idx` (`username1`,`username2`),
  CONSTRAINT `fk_noti_follow_noti_id` FOREIGN KEY (`noti_id`) REFERENCES `noti` (`noti_id`),
  CONSTRAINT `fk_noti_follow_username` FOREIGN KEY (`username1`, `username2`) REFERENCES `follow` (`username1`, `username2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_follow`
--

LOCK TABLES `noti_follow` WRITE;
/*!40000 ALTER TABLE `noti_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_like`
--

DROP TABLE IF EXISTS `noti_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_like` (
  `noti_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_like`
--

LOCK TABLES `noti_like` WRITE;
/*!40000 ALTER TABLE `noti_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_message`
--

DROP TABLE IF EXISTS `noti_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_message` (
  `noti_id` int(11) NOT NULL,
  PRIMARY KEY (`noti_id`),
  CONSTRAINT `fk_noti_message_noti_id` FOREIGN KEY (`noti_id`) REFERENCES `noti` (`noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_message`
--

LOCK TABLES `noti_message` WRITE;
/*!40000 ALTER TABLE `noti_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_reply`
--

DROP TABLE IF EXISTS `noti_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_reply` (
  `noti_id` int(11) NOT NULL,
  `reply_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `fk_noti_reply_reply_id_idx` (`reply_id`),
  CONSTRAINT `fk_noti_reply_noti_id` FOREIGN KEY (`noti_id`) REFERENCES `noti` (`noti_id`),
  CONSTRAINT `fk_noti_reply_reply_id` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_reply`
--

LOCK TABLES `noti_reply` WRITE;
/*!40000 ALTER TABLE `noti_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noti_tag`
--

DROP TABLE IF EXISTS `noti_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `noti_tag` (
  `noti_id` int(11) NOT NULL,
  PRIMARY KEY (`noti_id`),
  CONSTRAINT `fk_noti_tag_noti_id` FOREIGN KEY (`noti_id`) REFERENCES `noti` (`noti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noti_tag`
--

LOCK TABLES `noti_tag` WRITE;
/*!40000 ALTER TABLE `noti_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `noti_tag` ENABLE KEYS */;
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
  CONSTRAINT `fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
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
  CONSTRAINT `fk_profile_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `reply_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `username_idx` (`username`),
  KEY `comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_reply_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `fk_reply_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_comment`
--

DROP TABLE IF EXISTS `reply_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reply_comment` (
  `reply_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `username_idx` (`username`),
  KEY `comment_id_idx` (`comment_id`),
  CONSTRAINT `fk_reply_comment_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `fk_reply_comment_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_comment`
--

LOCK TABLES `reply_comment` WRITE;
/*!40000 ALTER TABLE `reply_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply_comment` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_report_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  CONSTRAINT `fk_report_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `fk_save_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  CONSTRAINT `fk_save_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `fk_setting_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `fk_story_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `x_axis` int(11) DEFAULT NULL,
  `y_axis` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `fk_username_idx` (`username`),
  KEY `fk_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_tag_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  CONSTRAINT `fk_tag_username` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-05  1:46:02
