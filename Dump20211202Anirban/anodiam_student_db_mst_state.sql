-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: anodiam_student_db
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `mst_state`
--

DROP TABLE IF EXISTS `mst_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_state` (
  `state_id` bigint NOT NULL AUTO_INCREMENT,
  `state_code` varchar(15) DEFAULT NULL,
  `state_name` varchar(255) NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FK_state_country_id` (`country_id`),
  KEY `idx_state_code` (`state_code`),
  KEY `idx_state_name` (`state_name`),
  CONSTRAINT `FK_state_country_id` FOREIGN KEY (`country_id`) REFERENCES `mst_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_state`
--

LOCK TABLES `mst_state` WRITE;
/*!40000 ALTER TABLE `mst_state` DISABLE KEYS */;
INSERT INTO `mst_state` VALUES (1,'NSW','New South Wales',1),(2,'VIC','Victoria',1),(3,'WA','Western Australia',1),(4,'QLD','Queensland',1),(5,'WB','West Bengal',2),(6,'MH','Maharashtra',2),(7,'PB','Punjab',2),(8,'KA','Karnataka',2),(9,'TN','Tamil Nadu',2);
/*!40000 ALTER TABLE `mst_state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02  9:53:19
