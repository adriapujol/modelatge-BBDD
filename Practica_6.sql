-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id_brand` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `providers_id` int NOT NULL,
  PRIMARY KEY (`id_brand`),
  UNIQUE KEY `id_brand_UNIQUE` (`id_brand`),
  KEY `fk_Brands_Providers1_idx` (`providers_id`),
  CONSTRAINT `fk_Brands_Providers1` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id_provider`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Bollé',2),(2,'Oakley',1),(3,'RayBand',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `postal_code` int DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `referal_id` int DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Clients_Clients_idx` (`referal_id`),
  CONSTRAINT `fk_Clients_Clients` FOREIGN KEY (`referal_id`) REFERENCES `clients` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Manel',8001,55550003,'manel@gmail.com','2020-04-29 11:59:18',NULL),(2,'Cristina',8002,55550004,'cristina@gmail.com','2020-04-29 11:59:47',NULL),(3,'Carles',8003,55550005,'carles@gmail.com','2020-04-29 12:00:28',1),(4,'Laura',8004,55550006,'laura@gmail.com','2020-04-29 12:00:56',2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_employee`),
  UNIQUE KEY `id_employee_UNIQUE` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Carme'),(2,'Joan'),(3,'Maria');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `id_glasses` int NOT NULL AUTO_INCREMENT,
  `graduation_left` decimal(5,3) NOT NULL,
  `graduation_right` decimal(5,3) NOT NULL,
  `frame` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `glass_color` varchar(45) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `brand_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id_glasses`),
  UNIQUE KEY `id_glasses_UNIQUE` (`id_glasses`),
  KEY `fk_Glasses_Brands1_idx` (`brand_id`),
  KEY `fk_Glasses_Employees1_idx` (`employee_id`),
  KEY `fk_Glasses_Clients1_idx` (`client_id`),
  CONSTRAINT `fk_Glasses_Brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id_brand`),
  CONSTRAINT `fk_Glasses_Clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_Glasses_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,3.750,3.250,'flotant','black','transparent',199.99,1,2,2),(2,6.250,7.180,'pasta','red','green',399.59,2,2,3),(3,2.230,1.110,'metàl·liques','grey','transparent',99.29,3,3,1),(4,0.250,3.180,'metàl·liques','green','green',299.59,2,3,4),(5,4.250,2.180,'pasta','black','transparent',179.65,1,3,4);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id_provider` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `phone` int NOT NULL,
  `fax` int DEFAULT NULL,
  `nif` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `street_num` int NOT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` int NOT NULL,
  `country` varchar(60) NOT NULL,
  PRIMARY KEY (`id_provider`),
  UNIQUE KEY `id_provider_UNIQUE` (`id_provider`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Glasses S.A.',55550001,11111,'1','1st Avenue',1,NULL,NULL,'New York',50001,'USA'),(2,'Ulleres S.A.',55550002,22222,'2','Rambla',2,NULL,NULL,'Barcelona',8002,'Spain');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29 12:29:16
