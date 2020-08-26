-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT 'default',
  `manufacturer` varchar(45) DEFAULT 'default',
  `owner` varchar(45) DEFAULT 'SAHİPSİZ',
  `created_by` varchar(45) DEFAULT 'admin',
  `updated_by` varchar(45) DEFAULT 'admin',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `old_product_name` varchar(45) DEFAULT 'default',
  `model` varchar(45) DEFAULT 'default',
  `serial_no` varchar(45) DEFAULT 'default',
  `memory_GB` int DEFAULT NULL,
  `operating_system` varchar(45) DEFAULT 'Windows',
  `domain_name` varchar(45) DEFAULT 'sni.local',
  `setup_date` datetime DEFAULT NULL,
  `lan_address` varchar(45) DEFAULT NULL,
  `wlan_address` varchar(45) DEFAULT NULL,
  `antivirus` varchar(45) DEFAULT 'yok',
  `license_number` varchar(45) DEFAULT NULL,
  `office_app` varchar(45) DEFAULT 'yok',
  `purchase_date` datetime DEFAULT NULL,
  `seller` varchar(45) DEFAULT NULL,
  `product_number` int DEFAULT NULL,
  `setup_date_for_windows` datetime DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (99,'Philips Screen 23inch','Philips','Mert Yilmaz','yilmazmertm@gmail.com','deneme@gmail.com',NULL,NULL,54,'Philips Screen','Philips 45-x','12321-231-231-23',240,NULL,'sni.local',NULL,'192.168.1.1','192.168.1.1','var','192-91491-491','var','2020-08-18 23:00:00','Hepsiburada',1,'2020-09-18 23:00:00','no note for this product'),(124,'yeni asdasd','','asd asd','yilmazmertm@gmail.com','yilmazmertm@gmail.com',NULL,NULL,117,'','','',0,NULL,'',NULL,'','','','','',NULL,'',0,NULL,'');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26  9:21:31
