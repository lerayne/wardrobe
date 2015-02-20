CREATE DATABASE  IF NOT EXISTS `ward_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ward_test`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ward_test
-- ------------------------------------------------------
-- Server version	5.6.15-log

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
-- Table structure for table `wardrobe_agencies`
--

DROP TABLE IF EXISTS `wardrobe_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_agencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_agencies`
--

LOCK TABLES `wardrobe_agencies` WRITE;
/*!40000 ALTER TABLE `wardrobe_agencies` DISABLE KEYS */;
INSERT INTO `wardrobe_agencies` VALUES (1,'olympus','Olympus',NULL,1,1424428138239,1424428138239);
/*!40000 ALTER TABLE `wardrobe_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_users`
--

DROP TABLE IF EXISTS `wardrobe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `display_name` varchar(48) DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hash` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved` tinyint(1) unsigned DEFAULT NULL,
  `source` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'local',
  `last_read` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'offline',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usr_email` (`email`),
  KEY `usr_login` (`login`),
  KEY `usr_approved` (`approved`),
  KEY `usr_status` (`status`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_users`
--

LOCK TABLES `wardrobe_users` WRITE;
/*!40000 ALTER TABLE `wardrobe_users` DISABLE KEYS */;
INSERT INTO `wardrobe_users` VALUES (1,'lerayne',NULL,'lerayne@gmail.com','062ac7c968833af0f79b2ff4a9de644e','2010-03-12 15:48:00',1,'local','2015-02-20 15:16:30','online');
/*!40000 ALTER TABLE `wardrobe_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-20 15:17:01
