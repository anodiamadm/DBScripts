BEGIN;

DROP TABLE IF EXISTS `student_profile`;
DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `user_permission`;
DROP TABLE IF EXISTS `mst_user`;
DROP TABLE IF EXISTS `mst_permission`;
DROP TABLE IF EXISTS `mst_role`;
DROP TABLE IF EXISTS `mst_level`;
DROP TABLE IF EXISTS `mst_board`;
DROP TABLE IF EXISTS `mst_suburb`;
DROP TABLE IF EXISTS `mst_town`;
DROP TABLE IF EXISTS `mst_state`;
DROP TABLE IF EXISTS `mst_country`;

/*--- mst_country table ---*/
CREATE TABLE `mst_country` (
  `country_id` bigint NOT NULL AUTO_INCREMENT,
  `country_code` varchar(15) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `uk_country_code` (`country_code`),
  UNIQUE KEY `uk_country_name` (`country_name`),
  KEY `idx_country_code` (`country_code`),
  KEY `idx_country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_country` WRITE;
INSERT INTO `mst_country` VALUES (1,'AU','Australia'),(2,'IN','India'),(3,'US','United States'),(4,'CN','China'),
									(5,'UK','United Kingdom'),(6,'BD','Bangladesh'),(7,'NZ','New Zealand');
UNLOCK TABLES;

/*--- mst_state table ---*/
CREATE TABLE `mst_state` (
  `state_id` bigint NOT NULL AUTO_INCREMENT,
  `state_code` varchar(15) DEFAULT NULL,
  `state_name` varchar(255) NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FK_state_country_id` (`country_id`),
  CONSTRAINT `FK_state_country_id` FOREIGN KEY (`country_id`) REFERENCES `mst_country` (`country_id`),
  KEY `idx_state_code` (`state_code`),
  KEY `idx_state_name` (`state_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_state` WRITE;
INSERT INTO `mst_state` VALUES (1,'NSW','New South Wales',1),(2,'VIC','Victoria',1),(3,'WA','Western Australia',1),(4,'QLD','Queensland',1),
									(5,'WB','West Bengal', 2),(6,'MH','Maharashtra', 2),(7,'PB','Punjab', 2),(8,'KA','Karnataka', 2),(9,'TN','Tamil Nadu', 2);
UNLOCK TABLES;

/*--- mst_town table ---*/
CREATE TABLE `mst_town` (
  `town_id` bigint NOT NULL AUTO_INCREMENT,
  `town_name` varchar(255) NOT NULL,
  `state_id` bigint NOT NULL,
  PRIMARY KEY (`town_id`),
  KEY `FK_town_state_id` (`state_id`),
  CONSTRAINT `FK_town_state_id` FOREIGN KEY (`state_id`) REFERENCES `mst_state` (`state_id`),
  KEY `idx_town_name` (`town_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_town` WRITE;
INSERT INTO `mst_town` VALUES (1,'Sydney',1),(2,'Woollongong',1),(3,'New Castle',1),(4,'Bexley',1),
									(5,'St Kilda', 2),(6,'Melbourne', 2),(7,'Geelong', 2),
									(8,'Kolkata', 5),(9,'Silliguri', 5),(10,'Darjeeling', 5),(11,'Purulia', 5),(12,'Malda', 5),
									(13,'Mumbai', 6),(14,'Pune', 6),(15,'NaviMumbai', 6),
									(16,'Chennai', 9),(17,'Coembatore', 9);
UNLOCK TABLES;

/*--- mst_suburb table ---*/
CREATE TABLE `mst_suburb` (
  `suburb_id` bigint NOT NULL AUTO_INCREMENT,
  `suburb_name` varchar(255) NOT NULL,
  `zip_code` varchar(15) NOT NULL,
  `town_id` bigint NOT NULL,
  PRIMARY KEY (`suburb_id`),
  KEY `FK_suburb_town_id` (`town_id`),
  CONSTRAINT `FK_suburb_town_id` FOREIGN KEY (`town_id`) REFERENCES `mst_town` (`town_id`),
  UNIQUE KEY `uk_zip_code` (`zip_code`),
  KEY `idx_suburb_name` (`suburb_name`),
  KEY `idx_zip_code` (`zip_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_suburb` WRITE;
INSERT INTO `mst_suburb` VALUES (1,'Sydney CBD','2000',1),(2,'Bexley','2207',4),
									(3,'Garia','700084',8),(4,'GPO','700001',8),(5,'Ballygunge','700019',8),(6,'Lake Gardens','700045',8),
									(7,'Birivali','400091',13),(8,'Malad','400064',13),(9,'Central','400020',13),(10,'Juhu','400049',13);
UNLOCK TABLES;

/*--- mst_board table ---*/
CREATE TABLE `mst_board` (
  `board_id` bigint NOT NULL AUTO_INCREMENT,
  `board_short_name` varchar(15) NOT NULL,
  `board_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `uk_board_short_name` (`board_short_name`),
  KEY `idx_board_short_name` (`board_short_name`),
  UNIQUE KEY `uk_board_name` (`board_name`),
  KEY `idx_board_name` (`board_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_board` WRITE;
INSERT INTO `mst_board` VALUES (1,'ICSE','Indian Certificate of Secondary Education'),(2,'CBSE','Central Board of Secondary Education'),
								(3,'ISC','Indian School Certificate'),(4,'OTH','Other');
UNLOCK TABLES;

/*--- mst_level table ---*/
CREATE TABLE `mst_level` (
  `level_id` bigint NOT NULL AUTO_INCREMENT,
  `level_code` varchar(15) NOT NULL,
  `level_name` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `uk_level_code` (`level_code`),
  KEY `idx_level_code` (`level_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_level` WRITE;
INSERT INTO `mst_level` VALUES (1,'KG','Kinder Garten'),(2,'I','1'),(3,'II','2'),(4,'III','3'),(5,'IV','4'),(6,'V','5'),(7,'VI','6'),
								(8,'VII','7'),(9,'VIII','8'),(10,'IX','9'),(11,'X','10'),(12,'XI','11'),(13,'XII','12'),(14,'OTH','Other');
UNLOCK TABLES;

/*--- mst_role table ---*/
DROP TABLE IF EXISTS `mst_role`;
CREATE TABLE `mst_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_name` (`role_name`),
  KEY `idx_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_role` WRITE;
INSERT INTO `mst_role` VALUES (1,'USER'),(2,'ADMIN'),(3,'MANAGER');
UNLOCK TABLES;

/*--- mst_permission table ---*/
CREATE TABLE `mst_permission` (
  `permission_id` bigint NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `uk_permission_name` (`permission_name`),
  KEY `idx_permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_permission` WRITE;
INSERT INTO `mst_permission` VALUES (1,'ACCESS_TEST1'),(2,'ACCESS_TEST2');
UNLOCK TABLES;

/*--- mst_user table ---*/
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `mst_user` WRITE;
INSERT INTO `mst_user` VALUES (1,1,'2021-09-02 12:18:20','$2a$14$gh4hfltUGwB315NieowSduN/jb6DQjBhMqsRx1YSS7YDNTrr8C/bC','dan','dan@gmail.com'),
								(2,1,'2021-09-02 12:18:22','$2a$14$VkFfuxZTTJzKc2B31PjHZeNwz.znGgUqh03UWY4fVDE0Fq7ffnc42','anirban','anirban@gmail.com'),
								(3,1,'2021-09-02 12:18:24','$2a$14$qUEha8IlzRzCqu0M6XNmsOFW3O1Q2tggjg3nrvYXeiKXUMU51pTha','admin','admin@gmail.com'),
								(4,1,'2021-09-02 12:18:26','$2a$14$E16Hc0v6miF2wtZ22IXSUOHT1cSzWycCvnprgVJrPC3087XXJV7Vi','manager','manager@gmail.com'),
								(5,1,'2021-09-08 10:56:44','$2a$14$gh4hfltUGwB315NieowSduxn/JACaGJqdyclsSIjYmN95p596qgP6','Anoushka','anoushka@gmail.com');
UNLOCK TABLES;

/*--- user_permission table ---*/
CREATE TABLE `user_permission` (
  `user_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  KEY `FK_permission_id` (`permission_id`),
  KEY `FK_user_id_01` (`user_id`),
  CONSTRAINT `FK_user_id_01` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`),
  CONSTRAINT `FK_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `mst_permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (3,1),(3,2),(4,1);
UNLOCK TABLES;

/*--- user_role table ---*/
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FK_role_id` (`role_id`),
  KEY `FK_user_id_02` (`user_id`),
  CONSTRAINT `FK_user_id_02` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `mst_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES (1,1),(2,1),(3,2),(4,3);
UNLOCK TABLES;

/*--- student_profile table ---*/
CREATE TABLE `student_profile` (
  `student_profile_id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `guardians_first_name` varchar(255) DEFAULT NULL,
  `guardians_last_name` varchar(255) DEFAULT NULL,
  `guardians_email` varchar(255) DEFAULT NULL,
  `guardians_phone_number` varchar(255) DEFAULT NULL,
  `board_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
  `suburb_id` bigint DEFAULT NULL,
  `profile_image_link` varchar(1023) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`student_profile_id`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_first_name` (`first_name`),
  KEY `idx_middle_name` (`middle_name`),
  KEY `idx_last_name` (`last_name`),
  KEY `idx_email` (`email`),
  KEY `idx_phone_number` (`phone_number`),
  KEY `idx_guardians_email` (`guardians_email`),
  KEY `idx_guardians_phone_number` (`guardians_phone_number`),
  KEY `idx_board_id` (`board_id`),
  KEY `idx_level_id` (`level_id`),
  KEY `idx_suburb_id` (`suburb_id`),
  KEY `FK_board_id` (`board_id`),
  CONSTRAINT `FK_board_id` FOREIGN KEY (`board_id`) REFERENCES `mst_board` (`board_id`),
  KEY `FK_level_id` (`level_id`),
  CONSTRAINT `FK_level_id` FOREIGN KEY (`level_id`) REFERENCES `mst_level` (`level_id`),
  KEY `FK_suburb_id` (`suburb_id`),
  CONSTRAINT `FK_suburb_id` FOREIGN KEY (`suburb_id`) REFERENCES `mst_suburb` (`suburb_id`),
  KEY `FK_user_id` (`user_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `student_profile` WRITE;
INSERT INTO `student_profile` (`student_profile_id`,`first_name`,`middle_name`,`last_name`,`email`,`phone_number`,`guardians_first_name`,`guardians_last_name`,
	`guardians_email`,`guardians_phone_number`,`board_id`,`level_id`,`suburb_id`,`profile_image_link`,`user_id`) VALUES (
		1,'Dan','Kumar','Nandan','dan@anodiam.com','+919748407166','Baap','Reddy','baapdan@gmail.com','+1-5678912345',1,11,5,
		'https://www.google.com', 1),
		(2,'Anirban',NULL,'Chakrabarty','anirban@anodiam.com','+61470142229',NULL,NULL,NULL,NULL,2,10,8,
		'https://www.google.com', 2),
		(3,'Anoushka','','Rhuam','anoushkarhuam@Anodiam.com','+61405706206',NULL,NULL,'anirban@anodiam.com','+61470142229',2,10,8,
		'https://www.google.com', 5);
UNLOCK TABLES;

COMMIT;