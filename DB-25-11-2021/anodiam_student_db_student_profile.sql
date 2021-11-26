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
-- Table structure for table `student_profile`
--

DROP TABLE IF EXISTS `student_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_profile` (
  `student_profile_id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(31) DEFAULT NULL,
  `address` varchar(4096) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `guardians_name` varchar(255) DEFAULT NULL,
  `guardians_email` varchar(255) DEFAULT NULL,
  `guardians_phone_number` varchar(255) DEFAULT NULL,
  `board_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
  `suburb_id` bigint DEFAULT NULL,
  `profile_image_link` varchar(1023) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`student_profile_id`),
  KEY `idx_full_name` (`full_name`),
  KEY `idx_phone_number` (`phone_number`),
  KEY `idx_guardians_name` (`guardians_name`),
  KEY `idx_guardians_email` (`guardians_email`),
  KEY `idx_guardians_phone_number` (`guardians_phone_number`),
  KEY `FK_board_id` (`board_id`),
  KEY `FK_level_id` (`level_id`),
  KEY `FK_suburb_id` (`suburb_id`),
  KEY `FK_language_id_idx` (`language_id`),
  KEY `FK_user_id_idx` (`user_id`),
  CONSTRAINT `FK_board_id` FOREIGN KEY (`board_id`) REFERENCES `mst_board` (`board_id`),
  CONSTRAINT `FK_language_id` FOREIGN KEY (`language_id`) REFERENCES `mst_language` (`language_id`),
  CONSTRAINT `FK_level_id` FOREIGN KEY (`level_id`) REFERENCES `mst_level` (`level_id`),
  CONSTRAINT `FK_student_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`),
  CONSTRAINT `FK_suburb_id` FOREIGN KEY (`suburb_id`) REFERENCES `mst_suburb` (`suburb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_profile`
--

LOCK TABLES `student_profile` WRITE;
/*!40000 ALTER TABLE `student_profile` DISABLE KEYS */;
INSERT INTO `student_profile` VALUES (17,'Praveen Kumar Rao','67890-32416','Konark Apt,Flat No-A1,V-31,Vivekananda Sarani,Garia,Kolkata-700084',23456.78904,8790.6543,'Naven kumar','naveen@gmail.com','42671-89244',1,1,1,'abcde',24,1);
/*!40000 ALTER TABLE `student_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-26 10:58:22
