CREATE DATABASE  IF NOT EXISTS `anodiam_student_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `anodiam_student_db`;
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
-- Table structure for table `mst_board`
--

DROP TABLE IF EXISTS `mst_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_board` (
  `board_id` bigint NOT NULL AUTO_INCREMENT,
  `board_short_name` varchar(15) NOT NULL,
  `board_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `uk_board_short_name` (`board_short_name`),
  UNIQUE KEY `uk_board_name` (`board_name`),
  KEY `idx_board_short_name` (`board_short_name`),
  KEY `idx_board_name` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_board`
--

LOCK TABLES `mst_board` WRITE;
/*!40000 ALTER TABLE `mst_board` DISABLE KEYS */;
INSERT INTO `mst_board` VALUES (1,'ICSE','Indian Certificate of Secondary Education'),(2,'CBSE','Central Board of Secondary Education'),(3,'ISC','Indian School Certificate'),(4,'OTH','Other');
/*!40000 ALTER TABLE `mst_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_language`
--

DROP TABLE IF EXISTS `mst_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_code` varchar(5) NOT NULL,
  `language_desc` varchar(25) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_language`
--

LOCK TABLES `mst_language` WRITE;
/*!40000 ALTER TABLE `mst_language` DISABLE KEYS */;
INSERT INTO `mst_language` VALUES (1,'en','English'),(2,'bng','Bengali'),(3,'hd','Hindi');
/*!40000 ALTER TABLE `mst_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_level`
--

DROP TABLE IF EXISTS `mst_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_level` (
  `level_id` bigint NOT NULL AUTO_INCREMENT,
  `level_code` varchar(15) NOT NULL,
  `level_name` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `uk_level_code` (`level_code`),
  KEY `idx_level_code` (`level_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_level`
--

LOCK TABLES `mst_level` WRITE;
/*!40000 ALTER TABLE `mst_level` DISABLE KEYS */;
INSERT INTO `mst_level` VALUES (1,'KG','Kinder Garten'),(2,'I','1'),(3,'II','2'),(4,'III','3'),(5,'IV','4'),(6,'V','5'),(7,'VI','6'),(8,'VII','7'),(9,'VIII','8'),(10,'IX','9'),(11,'X','10'),(12,'XI','11'),(13,'XII','12'),(14,'OTH','Other');
/*!40000 ALTER TABLE `mst_level` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_message`
--

LOCK TABLES `mst_message` WRITE;
/*!40000 ALTER TABLE `mst_message` DISABLE KEYS */;
INSERT INTO `mst_message` VALUES (1,1,'STUDENT_SAVE_SUCCESS','Student registration successful!'),(2,1,'STUDENT_USERNAME_MIN_LENGTH','Student registration failure! Username should be 8 + chars long!'),(3,1,'STUDENT_DUPLICATE_USERNAME','This username is already taken by another user. Please try some other username.'),(4,1,'STUDENT_PASSWORD_MIN_LENGTH','Student registration failure! Invalid password. Password should be 8 to 20 characters long.'),(5,1,'STUDENT_PASSWORD_MAX_LENGTH','Student registration failure! Invalid password. Password should be 8 to 20 characters long.'),(6,1,'STUDENT_PASSWORD_CONTAIN_USERNAME','Student registration failure! Invalid password. Password should not contain your username.'),(7,1,'STUDENT_INVALID_PASSWORD','Student registration failure! Invalid password.Must contain at least one small alphabet (a-z), at least one capital alphabet (A-Z),at least one numeric (0-9) and at least one special character among (@,#,$,%,^,&,+,=)'),(8,1,'STUDENT_INVALID_EMAIL_ADDRESS','Student registration failure! Invalid email address.'),(9,1,'STUDENT_DUPLICATE_EMAIL_ADDRESS','Student registration failure! An user with the same email address is already registered.'),(10,1,'STUDENT_USERNAME_BLANK','Student registration failure! User name cannot be blank.'),(11,1,'STUDENT_PROFILE_SAVE_SUCCESS','Student profile saved successful!'),(12,1,'STUDENT_PROFILE_ID_BLANK','Student Id should be zero in add mode'),(13,1,'STUDENT_PROFILE_INVALID_EMAIL_ADDRESS','Invalid student email address.'),(14,1,'STUDENT_PROFILE_DUPLICATE_EMAIL_ADDRESS','A student with the same email address is already registered.'),(15,1,'GUARDIAN_INVALID_EMAIL_ADDRESS','Invalid gurdian email address.'),(16,1,'STUDENT_USER_ID_BLANK','Student user cannot be blank'),(17,1,'STUDENT_LANGUAGE_ID_BLANK','Student language cannot be blank'),(18,1,'STUDENT_PROFILE_ID_INVALID','Invalid Student Profile Id'),(19,1,'STUDENT_USER_ID_PRESENT','New student cannot be added as already record present with same User '),(20,1,'STUDENT_USER_ID_NOT_PRESENT','Existing student cannot be modified as user is not present'),(21,1,'STUDENT_PROFILE_MODIFY_SUCCESS','Student profile modified successfully'),(22,1,'STUDENT_PROFILE_MODIFY_FAILURE','Student profile failed to modify'),(23,1,'STUDENT_PROFILE_DELETE_SUCCESS','Student profile deleted successfully'),(24,1,'STUDENT_PROFILE_DELETE_FAILURE','Failed to delete Student Profile');
/*!40000 ALTER TABLE `mst_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_permission`
--

DROP TABLE IF EXISTS `mst_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_permission` (
  `permission_id` bigint NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `uk_permission_name` (`permission_name`),
  KEY `idx_permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_permission`
--

LOCK TABLES `mst_permission` WRITE;
/*!40000 ALTER TABLE `mst_permission` DISABLE KEYS */;
INSERT INTO `mst_permission` VALUES (1,'ACCESS_TEST1'),(2,'ACCESS_TEST2');
/*!40000 ALTER TABLE `mst_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_role`
--

DROP TABLE IF EXISTS `mst_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_name` (`role_name`),
  KEY `idx_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_role`
--

LOCK TABLES `mst_role` WRITE;
/*!40000 ALTER TABLE `mst_role` DISABLE KEYS */;
INSERT INTO `mst_role` VALUES (2,'ADMIN'),(3,'MANAGER'),(1,'USER');
/*!40000 ALTER TABLE `mst_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_user`
--

DROP TABLE IF EXISTS `mst_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mst_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `active` int NOT NULL,
  `date_created` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_user`
--

LOCK TABLES `mst_user` WRITE;
/*!40000 ALTER TABLE `mst_user` DISABLE KEYS */;
INSERT INTO `mst_user` VALUES (30,1,'2021-12-06 18:11:02','$2a$14$qUEha8IlzRzCqu0M6XNmsOylkovrCm8jjpPYezz0JQAUwzSgglEs.','awBRPiCneAcZ708Rg0HK4A==','snkFiLEBYEAGxgNAy+EsPIklKlCX19Qm'),(31,1,'2021-12-06 21:31:41','$2a$14$E16Hc0v6miF2wtZ22IXSUOGgb47C2pNBnPnsgQYLprIcxqqljku8y','PnbeSneVCw+SrV1B0HygXw==','8EAfMpVTjxUcu/yzq/5DNA=='),(32,1,'2021-12-07 12:25:27','$2a$14$gh4hfltUGwB315NieowSduxHcMPxx2Kx9asF0TmCq5Is.XGSPV/jy','en/5eJnWDR7SBXO/TxXPxw==','CM7AdZmInIadoYepjmWyHQ=='),(33,1,'2021-12-07 13:43:15','$2a$14$VkFfuxZTTJzKc2B31PjHZekhXkvgW2BlEweEJ5nKrcvgBBgKBmL/6','RSArEi5JtS2JJSpQl9fUJg==','RO650zTobSRwOxaeBS3uwQ=='),(34,1,'2021-12-07 13:47:04','$2a$14$qUEha8IlzRzCqu0M6XNmsOylkovrCm8jjpPYezz0JQAUwzSgglEs.','mtucl5nOeJR7qjLBNBWeZQ==','7nladjfpBLIZW5HP1CJNcA=='),(35,1,'2022-01-10 12:41:38','$2a$14$x3FvRJhq5/DPDvIKXoEdCui.ageGUFfAbPhXk6/OQ6sUYhJ3hCAnC','DOlNBpI4OS+DHVOv7cD8PA==','vK0Bt+/lNM0O2oTX/gkp6VbeSMmd4vu0'),(36,1,'2022-01-10 12:41:41','$2a$14$sdsBQbjpRC6GT1QBrrSp9eMEkOIKlG2IZ42UfUX7JBE6JSpEEjMCa','QfraC/9/c2aLW4vZV98Cvg==','Ue59WIHgpL8O2oTX/gkp6VbeSMmd4vu0'),(37,1,'2022-01-10 12:41:43','$2a$14$r/sVPnYUZFG7upwaKsc.buGvfYTOdSsyOsGP8ZhjJi2EXxfRHossm','3Dtl9TPyIu206Z1h0mz/Pg==','TurE3P8RAKoGxgNAy+EsPIklKlCX19Qm');
/*!40000 ALTER TABLE `mst_user` ENABLE KEYS */;
UNLOCK TABLES;

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
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `guardians_name` varchar(255) DEFAULT NULL,
  `guardians_email` varchar(255) DEFAULT NULL,
  `guardians_phone_number` varchar(255) DEFAULT NULL,
  `board_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
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
  KEY `FK_language_id_idx` (`language_id`),
  KEY `FK_user_id_idx` (`user_id`),
  CONSTRAINT `FK_board_id` FOREIGN KEY (`board_id`) REFERENCES `mst_board` (`board_id`),
  CONSTRAINT `FK_language_id` FOREIGN KEY (`language_id`) REFERENCES `mst_language` (`language_id`),
  CONSTRAINT `FK_level_id` FOREIGN KEY (`level_id`) REFERENCES `mst_level` (`level_id`),
  CONSTRAINT `FK_student_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_profile`
--

LOCK TABLES `student_profile` WRITE;
/*!40000 ALTER TABLE `student_profile` DISABLE KEYS */;
INSERT INTO `student_profile` VALUES (45,'uS903VADh0FWESswArfWKQ==','As6HCgBP0yg4ey3Bk+LmlQ==','Y9iBnpWVQKYpTITYMgWsNA==','rDRAGAaHdCA=','g8jnkt0oArE=','ZKwDeBPx9xjuDDHex+uGJQ==','GM11ES9mGYuHZab5w5cUrA==','gCM0n4kw2IqP9UI3fHwmtw==',3,5,NULL,30,1),(46,'kJIpR6fowTLXpd8DEa3k8Q==','uEzO9lYUY1C9Bs282eXWsw==','yY9/jkTzySO1SEHszQibY4TI34rNOFde8ttydyCnmww=','NUV9OdLyCujg+Hn0GJaQpA==','oVH679u0dXl/aSLrZVuyTtcfvL3Kt79c','0vDL0OvohcJbpY8tsOmb/w==','efDascMXVkVigZFP99uavw==','IUsfOHMbNFHOOBdicxnBfQ==',1,14,NULL,31,1);
/*!40000 ALTER TABLE `student_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permission` (
  `user_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `FK_permission_id` (`permission_id`),
  KEY `FK_user_id` (`user_id`),
  CONSTRAINT `FK_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `mst_permission` (`permission_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_role_id` (`role_id`),
  KEY `FK_user_id_02` (`user_id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `mst_role` (`role_id`),
  CONSTRAINT `FK_user_id_02` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-10 12:46:37
