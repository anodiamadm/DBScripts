-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: anodiam_student_db
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
-- Table structure for table `mst_suburb`
--

DROP TABLE IF EXISTS `mst_suburb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_suburb` (
  `suburb_id` bigint NOT NULL AUTO_INCREMENT,
  `suburb_name` varchar(255) NOT NULL,
  `zip_code` varchar(15) NOT NULL,
  `town_id` bigint NOT NULL,
  PRIMARY KEY (`suburb_id`),
  UNIQUE KEY `uk_zip_code` (`zip_code`),
  KEY `FK_suburb_town_id` (`town_id`),
  KEY `idx_suburb_name` (`suburb_name`),
  KEY `idx_zip_code` (`zip_code`),
  CONSTRAINT `FK_suburb_town_id` FOREIGN KEY (`town_id`) REFERENCES `mst_town` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_suburb`
--

LOCK TABLES `mst_suburb` WRITE;
/*!40000 ALTER TABLE `mst_suburb` DISABLE KEYS */;
INSERT INTO `mst_suburb` VALUES (1,'Sydney CBD','2000',1),(2,'Bexley','2207',4),(3,'Garia','700084',8),(4,'GPO','700001',8),(5,'Ballygunge','700019',8),(6,'Lake Gardens','700045',8),(7,'Birivali','400091',8),(8,'Malad','400064',8),(9,'Central','400020',8),(10,'Juhu','400049',8);
/*!40000 ALTER TABLE `mst_suburb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02  8:47:36
