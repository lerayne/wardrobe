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
INSERT INTO `wardrobe_agencies` VALUES (1,'olympus','Olympus',NULL,1,1424428138,1424957128,'new item (candies) created',1),(2,'dollhouse','Dollhouse',NULL,1,1424771470,1424784377,'new shelf (imprint) created',1),(6,'disney','Disney',NULL,1,1424774337,1424774764,'new shelf (hair) created',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_item_instances`
--

LOCK TABLES `wardrobe_item_instances` WRITE;
/*!40000 ALTER TABLE `wardrobe_item_instances` DISABLE KEYS */;
INSERT INTO `wardrobe_item_instances` VALUES (1,1,'assets/agencies/olympus/aphrodite/normal-body.1','','Default'),(2,2,'assets/agencies/olympus/aphrodite/high-boots.2','','Default'),(3,3,'assets/agencies/olympus/aphrodite/alien-body.3','','Default'),(4,4,'assets/agencies/olympus/aphrodite/standard.4','','Default'),(5,1,'assets/agencies/olympus/aphrodite/normal-body.5','','Light skin'),(6,1,'assets/agencies/olympus/aphrodite/normal-body.6','','Swarthy'),(7,4,'assets/agencies/olympus/aphrodite/standard.7','','Black'),(8,4,'assets/agencies/olympus/aphrodite/standard.8','','White'),(11,2,'assets/agencies/olympus/aphrodite/high-boots.b','','White'),(12,2,'assets/agencies/olympus/aphrodite/high-boots.c','','Light-blue'),(13,5,'assets/agencies/olympus/aphrodite/american-belly.d','','Default'),(14,5,'assets/agencies/olympus/aphrodite/american-belly.e','','White'),(15,5,'assets/agencies/olympus/aphrodite/american-belly.f','','Light-blue'),(16,6,'assets/agencies/olympus/aphrodite/skewed-mini.10','','Default'),(17,7,'assets/agencies/olympus/aphrodite/black.11','','Default'),(18,7,'assets/agencies/olympus/aphrodite/black.12','','50 den'),(19,7,'assets/agencies/olympus/aphrodite/black.13','','90 den'),(20,7,'assets/agencies/olympus/aphrodite/black.14','','30 den'),(21,8,'assets/agencies/olympus/aphrodite/white.15','','Default'),(22,8,'assets/agencies/olympus/aphrodite/white.16','','35 den'),(23,8,'assets/agencies/olympus/aphrodite/white.17','','75 den'),(24,9,'assets/agencies/olympus/aphrodite/brown.18','','Default'),(25,10,'assets/agencies/olympus/aphrodite/candies.19','','Default'),(26,10,'assets/agencies/olympus/aphrodite/candies.1a','','Green'),(27,10,'assets/agencies/olympus/aphrodite/candies.1b','','Teal'),(28,10,'assets/agencies/olympus/aphrodite/candies.1c','','Red'),(29,10,'assets/agencies/olympus/aphrodite/candies.1d','','Blue'),(30,10,'assets/agencies/olympus/aphrodite/candies.1e','','Violet');
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
  `default` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `model` (`model_id`),
  KEY `shelf` (`shelf_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`),
  KEY `default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_items`
--

LOCK TABLES `wardrobe_items` WRITE;
/*!40000 ALTER TABLE `wardrobe_items` DISABLE KEYS */;
INSERT INTO `wardrobe_items` VALUES (1,'normal-body','Normal body',1,1,1,1424895459,1424895459,0,'assets/agencies/olympus/aphrodite/normal-body.1.1.png','this item created',1,1),(2,'high-boots','High boots',1,11,1,1424895582,1424895582,500,'assets/agencies/olympus/aphrodite/high-boots.2.2.png','this item created',1,1),(3,'alien-body','Alien body',1,1,1,1424900896,1424900896,0,'assets/agencies/olympus/aphrodite/alien-body.3.3.png','this item created',1,0),(4,'standard','Standard',1,12,1,1424901521,1424901521,800,'assets/agencies/olympus/aphrodite/standard.4.4.png','this item created',1,1),(5,'american-belly','American belly',1,13,1,1424954437,1424954437,250,'assets/agencies/olympus/aphrodite/american-belly.d.5.png','this item created',1,1),(6,'skewed-mini','Skewed mini',1,6,1,1424954636,1424954636,200,'assets/agencies/olympus/aphrodite/skewed-mini.10.6.png','this item created',1,1),(7,'black','Black',1,14,1,1424956800,1424956800,100,'assets/agencies/olympus/aphrodite/black.11.7.png','this item created',1,1),(8,'white','White',1,14,1,1424956973,1424956973,100,'assets/agencies/olympus/aphrodite/white.15.8.png','this item created',1,0),(9,'brown','Brown',1,14,1,1424957090,1424957090,100,'assets/agencies/olympus/aphrodite/brown.18.9.png','this item created',1,0),(10,'candies','Candies',1,14,1,1424957128,1424957128,100,'assets/agencies/olympus/aphrodite/candies.19.a.png','this item created',1,0);
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
  `x_offset` int(4) NOT NULL,
  `y_offset` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_layers`
--

LOCK TABLES `wardrobe_layers` WRITE;
/*!40000 ALTER TABLE `wardrobe_layers` DISABLE KEYS */;
INSERT INTO `wardrobe_layers` VALUES (1,1,0,295,44),(2,2,500,279,710),(3,3,0,295,44),(4,4,800,446,34),(5,5,250,452,171),(6,6,200,420,376),(7,7,100,295,381),(8,8,100,295,381),(9,9,100,295,381),(10,10,100,295,381);
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
  `size` int(4) unsigned NOT NULL,
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
INSERT INTO `wardrobe_models` VALUES (1,'aphrodite','Aphrodite',1,1,NULL,1424457875,1424957128,'new item (candies) created',1,1000),(2,'athena','Athena',1,1,NULL,1424772801,1424772801,NULL,0,800),(3,'echo','Echo',2,1,NULL,1424773364,1424784377,'new shelf (imprint) created',1,1000),(4,'sierra','Sierra',2,1,NULL,1424773370,1424773370,NULL,0,1000),(5,'cinderella','Cinderella',6,1,NULL,1424774359,1424774359,'this item created',1,1000),(6,'pocahontas','Pocahontas',6,1,NULL,1424774461,1424774764,'new shelf (hair) created',1,1000);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_shelves`
--

LOCK TABLES `wardrobe_shelves` WRITE;
/*!40000 ALTER TABLE `wardrobe_shelves` DISABLE KEYS */;
INSERT INTO `wardrobe_shelves` VALUES (1,'body','Body',1,1,NULL,0,1424466514,1424900896,'new item (alien-body) created',1),(2,'underware','Underware',1,1,NULL,10,1424466921,1424466921,NULL,0),(6,'skirts','Skirts',1,1,NULL,200,1424467949,1424954636,'new item (skewed-mini) created',1),(7,'pants','Pants',1,1,NULL,150,1424471086,1424471086,NULL,0),(8,'tattoo','Tattoo',6,1,NULL,100,1424774531,1424774531,'this item created',1),(9,'hair','Hair',6,1,NULL,150,1424774764,1424774764,'this item created',1),(10,'imprint','Imprint',3,1,NULL,0,1424784377,1424784377,'this item created',1),(11,'shoes','Shoes',1,1,NULL,500,1424870690,1424895582,'new item (high-boots) created',1),(12,'hair','Hair',1,1,NULL,800,1424901497,1424901521,'new item (standard) created',1),(13,'top','Top',1,1,NULL,250,1424954408,1424954437,'new item (american-belly) created',1),(14,'tights','Tights',1,1,NULL,100,1424955677,1424957128,'new item (candies) created',1);
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
INSERT INTO `wardrobe_users` VALUES (1,'lerayne',NULL,'lerayne@gmail.com','062ac7c968833af0f79b2ff4a9de644e','2010-03-12 15:48:00',1,'local','2015-02-26 15:34:58','online');
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

-- Dump completed on 2015-02-26 15:35:14
