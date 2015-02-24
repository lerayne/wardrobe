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
-- Table structure for table `wardrobe_item_instances`
--

DROP TABLE IF EXISTS `wardrobe_item_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardrobe_item_instances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) unsigned NOT NULL,
  `layer_id` bigint(20) unsigned NOT NULL,
  `file` varchar(45) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `layer` (`layer_id`),
  KEY `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `x_offset` decimal(5,3) NOT NULL,
  `y_offset` decimal(5,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-24 12:45:01
