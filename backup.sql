-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ward_test
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
  `update_cause` varchar(255) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  `active` int(1) unsigned NOT NULL DEFAULT '1',
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
INSERT INTO `wardrobe_agencies` VALUES (1,'olympus','Olympus',NULL,1,1424428138,1425647705,'default item changed to High boots',1,1),(2,'dollhouse','Dollhouse',NULL,1,1424771470,1424784377,'new shelf (imprint) created',1,0),(6,'disney','Disney',NULL,1,1424774337,1424774764,'new shelf (hair) created',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_item_instances`
--

LOCK TABLES `wardrobe_item_instances` WRITE;
/*!40000 ALTER TABLE `wardrobe_item_instances` DISABLE KEYS */;
INSERT INTO `wardrobe_item_instances` VALUES (1,1,'assets/agencies/olympus/aphrodite/normal-body.1','','Default'),(2,2,'assets/agencies/olympus/aphrodite/high-boots.2','','Default'),(3,3,'assets/agencies/olympus/aphrodite/alien-body.3','','Default'),(5,1,'assets/agencies/olympus/aphrodite/normal-body.5','','Light skin'),(6,1,'assets/agencies/olympus/aphrodite/normal-body.6','','Swarthy'),(11,2,'assets/agencies/olympus/aphrodite/high-boots.b','','White'),(12,2,'assets/agencies/olympus/aphrodite/high-boots.c','','Light-blue'),(13,5,'assets/agencies/olympus/aphrodite/american-belly.d','','Default'),(14,5,'assets/agencies/olympus/aphrodite/american-belly.e','','White'),(15,5,'assets/agencies/olympus/aphrodite/american-belly.f','','Light-blue'),(16,6,'assets/agencies/olympus/aphrodite/skewed-mini.10','','Default'),(17,7,'assets/agencies/olympus/aphrodite/black.11','','Default'),(18,7,'assets/agencies/olympus/aphrodite/black.12','','50 den'),(19,7,'assets/agencies/olympus/aphrodite/black.13','','90 den'),(20,7,'assets/agencies/olympus/aphrodite/black.14','','30 den'),(21,8,'assets/agencies/olympus/aphrodite/white.15','','Default'),(22,8,'assets/agencies/olympus/aphrodite/white.16','','35 den'),(23,8,'assets/agencies/olympus/aphrodite/white.17','','75 den'),(24,9,'assets/agencies/olympus/aphrodite/brown.18','','Default'),(25,10,'assets/agencies/olympus/aphrodite/candies.19','','Default'),(26,10,'assets/agencies/olympus/aphrodite/candies.1a','','Green'),(27,10,'assets/agencies/olympus/aphrodite/candies.1b','','Teal'),(28,10,'assets/agencies/olympus/aphrodite/candies.1c','','Red'),(29,10,'assets/agencies/olympus/aphrodite/candies.1d','','Blue'),(30,10,'assets/agencies/olympus/aphrodite/candies.1e','','Violet'),(31,6,'assets/agencies/olympus/aphrodite/skewed-mini.1f','','White'),(32,12,'assets/agencies/olympus/aphrodite/pumps.20','','Default'),(33,12,'assets/agencies/olympus/aphrodite/pumps.21','','White'),(34,13,'assets/agencies/olympus/aphrodite/midi.22','','Default'),(35,3,'assets/agencies/olympus/aphrodite/alien-body.23','','Teal'),(36,3,'assets/agencies/olympus/aphrodite/alien-body.24','','Mint'),(37,3,'assets/agencies/olympus/aphrodite/alien-body.25','','Salad'),(38,3,'assets/agencies/olympus/aphrodite/alien-body.26','','Fuchsia'),(39,3,'assets/agencies/olympus/aphrodite/alien-body.27','','Red'),(40,1,'assets/agencies/olympus/aphrodite/normal-body.28','','Mulate'),(41,1,'assets/agencies/olympus/aphrodite/normal-body.29','','African'),(42,1,'assets/agencies/olympus/aphrodite/normal-body.2a','','Light tan'),(43,1,'assets/agencies/olympus/aphrodite/normal-body.2b','','Heavy tan'),(44,14,'assets/agencies/olympus/aphrodite/leg-1.2c','','Black'),(45,15,'assets/agencies/olympus/aphrodite/maxi.2d','','Black'),(48,18,'assets/agencies/olympus/aphrodite/classic.30','','Black'),(49,19,'assets/agencies/olympus/aphrodite/sport.31','','Black'),(50,20,'assets/agencies/olympus/aphrodite/velotrack.32','','Black'),(51,20,'assets/agencies/olympus/aphrodite/velotrack.33','','White'),(52,21,'assets/agencies/olympus/aphrodite/sandals.34','','Black'),(53,21,'assets/agencies/olympus/aphrodite/sandals.35','','White'),(54,21,'assets/agencies/olympus/aphrodite/sandals.36','','Gold'),(55,21,'assets/agencies/olympus/aphrodite/sandals.37','','Silver'),(62,28,'assets/agencies/olympus/aphrodite/kare.3e','','Black'),(67,28,'assets/agencies/olympus/aphrodite/kare.43','','White'),(70,15,'assets/agencies/olympus/aphrodite/maxi.46','','White'),(71,33,'assets/agencies/olympus/aphrodite/transclucent.47','','Black'),(72,33,'assets/agencies/olympus/aphrodite/transclucent.48','','White'),(73,34,'assets/agencies/olympus/aphrodite/messy.49','','Black'),(74,2,'assets/agencies/olympus/aphrodite/high-boots.4a','','Brown'),(75,2,'assets/agencies/olympus/aphrodite/high-boots.4b','','Grey'),(76,28,'assets/agencies/olympus/aphrodite/kare.4c','','Ginger');
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
  `update_cause` varchar(255) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  `default` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `model` (`model_id`),
  KEY `shelf` (`shelf_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`),
  KEY `default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_items`
--

LOCK TABLES `wardrobe_items` WRITE;
/*!40000 ALTER TABLE `wardrobe_items` DISABLE KEYS */;
INSERT INTO `wardrobe_items` VALUES (1,'normal-body','Normal body',1,1,1,1424895459,1425646299,0,'assets/agencies/olympus/aphrodite/normal-body.1.1.png','default item changed to Normal body',1,1),(2,'high-boots','High boots',1,11,1,1424895582,1425647705,500,'assets/agencies/olympus/aphrodite/high-boots.2.2.png','default item changed to High boots',1,1),(3,'alien-body','Alien body',1,1,1,1424900896,1425646299,0,'assets/agencies/olympus/aphrodite/alien-body.23.3.png','default item changed to Alien body',1,0),(5,'american-belly','American belly',1,13,1,1424954437,1424954437,250,'assets/agencies/olympus/aphrodite/american-belly.d.5.png','this item created',1,1),(6,'skewed-mini','Skewed mini',1,6,1,1424954636,1424954636,200,'assets/agencies/olympus/aphrodite/skewed-mini.10.6.png','this item created',1,1),(7,'black','Black',1,14,1,1424956800,1425646322,100,'assets/agencies/olympus/aphrodite/black.11.7.png','this item created',1,0),(8,'white','White',1,14,1,1424956973,1424956973,100,'assets/agencies/olympus/aphrodite/white.15.8.png','this item created',1,0),(9,'brown','Brown',1,14,1,1424957090,1424957090,100,'assets/agencies/olympus/aphrodite/brown.18.9.png','this item created',1,0),(10,'candies','Candies',1,14,1,1424957128,1424957128,100,'assets/agencies/olympus/aphrodite/candies.19.a.png','this item created',1,0),(12,'pumps','Pumps',1,11,1,1425077805,1425645031,500,'assets/agencies/olympus/aphrodite/pumps.20.b.png','this item created',1,0),(13,'midi','Midi',1,6,1,1425078401,1425078401,200,'assets/agencies/olympus/aphrodite/midi.22.c.png','this item created',1,0),(14,'leg-1','Leg 1',1,16,1,1425086549,1425086549,5,'assets/agencies/olympus/aphrodite/leg-1.2c.d.png','this item created',1,0),(15,'maxi','Maxi',1,6,1,1425087033,1425558603,200,'assets/agencies/olympus/aphrodite/maxi.2d.e.png','new instance (\"White\") of item \"Maxi\" created',1,0),(18,'classic','Classic',1,15,1,1425250087,1425250087,50,'assets/agencies/olympus/aphrodite/classic.30.11.png','this item created',1,0),(19,'sport','Sport',1,15,1,1425250293,1425250293,50,'assets/agencies/olympus/aphrodite/sport.31.12.png','this item created',1,1),(20,'velotrack','Velotrack',1,7,1,1425251056,1425251120,150,'assets/agencies/olympus/aphrodite/velotrack.32.13.png','new instance (\"White\") of item \"Velotrack\" created',1,0),(21,'sandals','Sandals',1,11,1,1425251194,1425647705,500,'assets/agencies/olympus/aphrodite/sandals.34.14.png','default item changed to Sandals',1,0),(28,'kare','Kare',1,12,1,1425545120,1425646373,800,'assets/agencies/olympus/aphrodite/kare.3e.28.png','default item changed to Kare',1,1),(33,'transclucent','Transclucent',1,13,1,1425559329,1425559362,250,'assets/agencies/olympus/aphrodite/transclucent.47.30.png','new instance (\"White\") of item \"Transclucent\" created',1,0),(34,'messy','Messy',1,12,1,1425559772,1425646373,800,'assets/agencies/olympus/aphrodite/messy.49.31.png','default item changed to Messy',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_layers`
--

LOCK TABLES `wardrobe_layers` WRITE;
/*!40000 ALTER TABLE `wardrobe_layers` DISABLE KEYS */;
INSERT INTO `wardrobe_layers` VALUES (1,1,0,295,44),(2,2,180,289,714),(3,3,0,295,44),(5,5,250,452,171),(6,6,200,420,376),(7,7,100,295,383),(8,8,100,295,383),(9,9,100,295,383),(10,10,100,295,383),(11,12,180,281,862),(12,13,200,393,376),(13,14,5,557,421),(14,15,200,414,376),(17,18,50,449,251),(18,19,50,440,251),(19,20,150,412,377),(20,21,108,291,855),(22,15,-200,414,492),(39,21,-500,524,909),(40,28,800,448,35),(45,28,-800,471,123),(48,33,250,450,187),(49,34,800,441,27);
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
  `update_cause` varchar(255) DEFAULT NULL,
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
INSERT INTO `wardrobe_models` VALUES (1,'aphrodite','Aphrodite',1,1,NULL,1424457875,1425647705,'default item changed to High boots',1,1000),(2,'athena','Athena',1,1,NULL,1424772801,1424772801,NULL,0,800),(3,'echo','Echo',2,1,NULL,1424773364,1424784377,'new shelf (imprint) created',1,1000),(4,'sierra','Sierra',2,1,NULL,1424773370,1424773370,NULL,0,1000),(5,'cinderella','Cinderella',6,1,NULL,1424774359,1424774359,'this item created',1,1000),(6,'pocahontas','Pocahontas',6,1,NULL,1424774461,1424774764,'new shelf (hair) created',1,1000);
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
  `update_cause` varchar(255) DEFAULT NULL,
  `updater` int(10) unsigned NOT NULL,
  `required` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `model` (`model_id`),
  KEY `author` (`author_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardrobe_shelves`
--

LOCK TABLES `wardrobe_shelves` WRITE;
/*!40000 ALTER TABLE `wardrobe_shelves` DISABLE KEYS */;
INSERT INTO `wardrobe_shelves` VALUES (1,'body','Body',1,1,NULL,0,1424466514,1425646299,'default item changed to Normal body',1,1),(6,'skirts','Skirts',1,1,NULL,200,1424467949,1425644843,'item test 2 deleted',1,0),(7,'pants','Pants',1,1,NULL,150,1424471086,1425251120,'new instance (\"White\") of item \"Velotrack\" created',1,0),(8,'tattoo','Tattoo',6,1,NULL,100,1424774531,1424774531,'this item created',1,0),(9,'hair','Hair',6,1,NULL,150,1424774764,1424774764,'this item created',1,1),(10,'imprint','Imprint',3,1,NULL,0,1424784377,1424784377,'this item created',1,0),(11,'shoes','Shoes',1,1,NULL,500,1424870690,1425647705,'default item changed to High boots',1,0),(12,'hair','Hair',1,1,NULL,800,1424901497,1425646373,'default item changed to Kare',1,1),(13,'top','Top',1,1,NULL,250,1424954408,1425559362,'new instance (\"White\") of item \"Transclucent\" created',1,0),(14,'tights','Tights',1,1,NULL,100,1424955677,1424957128,'new item (candies) created',1,0),(15,'underware','Underware',1,1,NULL,50,1425075972,1425250293,'new item (Sport) created',1,1),(16,'tattoo','Tattoo',1,1,NULL,5,1425086527,1425086549,'new item (Leg 1) created',1,0);
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
INSERT INTO `wardrobe_users` VALUES (1,'lerayne',NULL,'lerayne@gmail.com','062ac7c968833af0f79b2ff4a9de644e','2010-03-12 15:48:00',1,'local','2015-03-07 00:54:22','online');
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

-- Dump completed on 2015-03-07  0:54:59
