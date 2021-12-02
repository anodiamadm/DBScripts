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
-- Table structure for table `mst_message`
--

DROP TABLE IF EXISTS `mst_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `message_code` varchar(512) NOT NULL,
  `message_desc` varchar(2096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FK_message_language_id_idx` (`language_id`),
  CONSTRAINT `FK_message_language_id` FOREIGN KEY (`language_id`) REFERENCES `mst_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_message`
--

LOCK TABLES `mst_message` WRITE;
/*!40000 ALTER TABLE `mst_message` DISABLE KEYS */;
INSERT INTO `mst_message` VALUES 
(1,1,'STUDENT_SAVE_SUCCESS','Student registration successful!'),
(2,1,'STUDENT_USERNAME_MIN_LENGTH','Student registration failure! Username should be 8 or more characters long.'),
(3,1,'STUDENT_DUPLICATE_USERNAME','Student registration failure! This username is already taken by another user. Please try some other username.'),
(4,1,'STUDENT_PASSWORD_MIN_LENGTH','Student registration failure! Invalid password. Password should be 8 to 20 characters long.'),
(5,1,'STUDENT_PASSWORD_MAX_LENGTH','Student registration failure! Invalid password. Password should be 8 to 20 characters long.'),
(6,1,'STUDENT_PASSWORD_CONTAIN_USERNAME','Student registration failure! Invalid password. Password should not contain your username.'),
(7,1,'STUDENT_INVALID_PASSWORD','Student registration failure! Invalid password. Password must contain at least one small alphabet (a-z), at least one capital alphabet (A-Z),at least one numeric (0-9) and at least one special character among (@,#,$,%,^,&,+,=)'),
(8,1,'STUDENT_INVALID_EMAIL_ADDRESS','Student registration failure! Invalid email address.'),
(9,1,'STUDENT_DUPLICATE_EMAIL_ADDRESS','Student registration failure! An user with the same email address is already registered.'),
(10,1,'STUDENT_USERNAME_BLANK','Student registration failure! User name cannot be blank.');
/*!40000 ALTER TABLE `mst_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 17:54:46
