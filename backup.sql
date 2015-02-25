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
  `update_cause` varchar(45) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_agencies`
--

LOCK TABLES `wardrobe_agencies` WRITE;
/*!40000 ALTER TABLE `wardrobe_agencies` DISABLE KEYS */;
INSERT INTO `wardrobe_agencies` VALUES (1,'olympus','Olympus',NULL,1,1424428138,1424870715,'new item (boots) created',1),(2,'dollhouse','Dollhouse',NULL,1,1424771470,1424784377,'new shelf (imprint) created',1),(6,'disney','Disney',NULL,1,1424774337,1424774764,'new shelf (hair) created',1);
/*!40000 ALTER TABLE `wardrobe_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_item_instances`
--

DROP TABLE IF EXISTS `wardrobe_item_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_item_instances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `file` varchar(512) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_item_instances`
--

LOCK TABLES `wardrobe_item_instances` WRITE;
/*!40000 ALTER TABLE `wardrobe_item_instances` DISABLE KEYS */;
INSERT INTO `wardrobe_item_instances` VALUES (1,1,'assets/agencies/olympus/aphrodite/1.1','',NULL),(2,2,'assets/agencies/olympus/aphrodite/2.2','',NULL),(3,3,'assets/agencies/olympus/aphrodite/3.3','',NULL),(4,5,'assets/agencies/olympus/aphrodite/5.4','','Default'),(5,6,'assets/agencies/olympus/aphrodite/boots.5','','Default');
/*!40000 ALTER TABLE `wardrobe_item_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_items`
--

DROP TABLE IF EXISTS `wardrobe_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `shelf_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `z_index` smallint(6) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `update_cause` varchar(45) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model_id`),
  KEY `shelf` (`shelf_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_items`
--

LOCK TABLES `wardrobe_items` WRITE;
/*!40000 ALTER TABLE `wardrobe_items` DISABLE KEYS */;
INSERT INTO `wardrobe_items` VALUES (1,'1','1',1,1,1,1424863506,1424863506,0,NULL,'this item created',1),(2,'2','2',1,1,1,1424863610,1424863610,0,NULL,'this item created',1),(3,'3','3',1,1,1,1424863642,1424863642,0,NULL,'this item created',1),(4,'4','4',1,1,1,1424869425,1424869425,0,NULL,'this item created',1),(5,'5','5',1,1,1,1424869488,1424869488,0,NULL,'this item created',1),(6,'boots','Boots',1,11,1,1424870715,1424870715,0,NULL,'this item created',1);
/*!40000 ALTER TABLE `wardrobe_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_layers`
--

DROP TABLE IF EXISTS `wardrobe_layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_layers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `z_index` smallint(6) NOT NULL,
  `x_offset` decimal(7,2) NOT NULL,
  `y_offset` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_layers`
--

LOCK TABLES `wardrobe_layers` WRITE;
/*!40000 ALTER TABLE `wardrobe_layers` DISABLE KEYS */;
INSERT INTO `wardrobe_layers` VALUES (1,1,0,0.00,0.00),(2,2,0,0.00,0.00),(3,3,0,0.00,0.00),(4,4,0,0.00,0.00),(5,5,0,0.00,0.00),(6,6,0,-16.00,667.00);
/*!40000 ALTER TABLE `wardrobe_layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_models`
--

DROP TABLE IF EXISTS `wardrobe_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `agency_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `update_cause` varchar(45) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agency` (`agency_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_models`
--

LOCK TABLES `wardrobe_models` WRITE;
/*!40000 ALTER TABLE `wardrobe_models` DISABLE KEYS */;
INSERT INTO `wardrobe_models` VALUES (1,'aphrodite','Aphrodite',1,1,NULL,1424457875,1424870715,'new item (boots) created',1),(2,'athena','Athena',1,1,NULL,1424772801,1424772801,NULL,0),(3,'echo','Echo',2,1,NULL,1424773364,1424784377,'new shelf (imprint) created',1),(4,'sierra','Sierra',2,1,NULL,1424773370,1424773370,NULL,0),(5,'cinderella','Cinderella',6,1,NULL,1424774359,1424774359,'this item created',1),(6,'pocahontas','Pocahontas',6,1,NULL,1424774461,1424774764,'new shelf (hair) created',1);
/*!40000 ALTER TABLE `wardrobe_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardrobe_shelves`
--

DROP TABLE IF EXISTS `wardrobe_shelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_shelves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `z_index` smallint(6) NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `updated` bigint(20) unsigned NOT NULL,
  `update_cause` varchar(45) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model` (`model_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_shelves`
--

LOCK TABLES `wardrobe_shelves` WRITE;
/*!40000 ALTER TABLE `wardrobe_shelves` DISABLE KEYS */;
INSERT INTO `wardrobe_shelves` VALUES (1,'body','Body',1,1,NULL,0,1424466514,1424869488,'new item (5) created',1),(2,'underware','Underware',1,1,NULL,10,1424466921,1424466921,NULL,0),(3,'eyes','Eyes',1,1,NULL,5,1424467445,1424467445,NULL,0),(4,'eyebrows','Eyebrows',1,1,NULL,6,1424467535,1424467535,NULL,0),(5,'nose-and-lips','Nose and lips',1,1,NULL,7,1424467827,1424467827,NULL,0),(6,'skirts','Skirts',1,1,NULL,200,1424467949,1424467949,NULL,0),(7,'pants','Pants',1,1,NULL,150,1424471086,1424471086,NULL,0),(8,'tattoo','Tattoo',6,1,NULL,100,1424774531,1424774531,'this item created',1),(9,'hair','Hair',6,1,NULL,150,1424774764,1424774764,'this item created',1),(10,'imprint','Imprint',3,1,NULL,0,1424784377,1424784377,'this item created',1),(11,'shoes','Shoes',1,1,NULL,500,1424870690,1424870715,'new item (boots) created',1);
/*!40000 ALTER TABLE `wardrobe_shelves` ENABLE KEYS */;
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
INSERT INTO `wardrobe_users` VALUES (1,'lerayne',NULL,'lerayne@gmail.com','062ac7c968833af0f79b2ff4a9de644e','2010-03-12 15:48:00',1,'local','2015-02-25 15:40:23','online');
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

-- Dump completed on 2015-02-25 15:40:23
