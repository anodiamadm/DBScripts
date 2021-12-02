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
-- Table structure for table `mst_town`
--

DROP TABLE IF EXISTS `mst_town`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_town` (
  `town_id` bigint NOT NULL AUTO_INCREMENT,
  `town_name` varchar(255) NOT NULL,
  `state_id` bigint NOT NULL,
  PRIMARY KEY (`town_id`),
  KEY `FK_town_state_id` (`state_id`),
  KEY `idx_town_name` (`town_name`),
  CONSTRAINT `FK_town_state_id` FOREIGN KEY (`state_id`) REFERENCES `mst_state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_town`
--

LOCK TABLES `mst_town` WRITE;
/*!40000 ALTER TABLE `mst_town` DISABLE KEYS */;
INSERT INTO `mst_town` VALUES (1,'Sydney',1),(2,'Woollongong',1),(3,'New Castle',1),(4,'Bexley',1),(5,'St Kilda',2),(6,'Melbourne',2),(7,'Geelong',2),(8,'Kolkata',5),(9,'Silliguri',5),(10,'Darjeeling',5),(11,'Purulia',5),(12,'Malda',5),(13,'Mumbai',6),(14,'Pune',6),(15,'NaviMumbai',6),(16,'Chennai',9),(17,'Coembatore',9);
/*!40000 ALTER TABLE `mst_town` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02  9:53:22
