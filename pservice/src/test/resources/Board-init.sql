-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: ctTest
-- ------------------------------------------------------
-- Server version	8.0.12

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

use ctTest;

--
-- Table structure for table `user`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `user`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(256) DEFAULT '',
  `head_url` varchar(256) DEFAULT '',
  `status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','23432','234312333',NULL,"http://images.nowcoder.com/head/1t.png",0),(2,'testt','23432','234312333',NULL,NULL,0),(3,'1','6D7B0A46CD373300C5579B9E5B607E49','86525',NULL,NULL,0),(4,'2','FD16BF448DFE4169870EDCBABAF97EAD','e1921',NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `board`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `board`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `own_user_id` int(10) unsigned NOT NULL,
  `board_name` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `authorization` int(10) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`),
  KEY `fk_own_user_id` (`own_user_id`),
  CONSTRAINT `fk_own_user_id` FOREIGN KEY (`own_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lane`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `lane`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `lane` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_id` int(10) unsigned NOT NULL,
  `lane_name` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`),
  KEY `fk_board_id` (`board_id`),
  CONSTRAINT `fk_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`)ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lane`
--

LOCK TABLES `lane` WRITE;
/*!40000 ALTER TABLE `lane` DISABLE KEYS */;
/*!40000 ALTER TABLE `lane` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `panel`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `panel`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lane_id` int(10) unsigned NOT NULL,
  `panel_name` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`),
  KEY `panel_fk_lane_id` (`lane_id`),
  CONSTRAINT `panel_fk_lane_id` FOREIGN KEY (`lane_id`) REFERENCES `lane` (`id`)ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `card`
--
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `card`;
SET FOREIGN_KEY_CHECKS = 1;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `panel_id` int(10) unsigned NOT NULL,
  `card_name` varchar(45) NOT NULL,
  `card_content` text NOT NULL,
  `last_changer` int(10)unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`),
  KEY `fk_panel_id` (`panel_id`),
  CONSTRAINT `fk_panel_id` FOREIGN KEY (`panel_id`) REFERENCES `panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  KEY `fk_user_id` (`last_changer`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`last_changer`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;



SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `board_user_relation`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `board_user_relation`(
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_role` int(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`),
  KEY `fk_board_user_relation_id` (`board_id`),
  CONSTRAINT `fk_board_user_relation_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`)ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;





--
-- Dumping data for table `user`
--



/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27 15:48:03

