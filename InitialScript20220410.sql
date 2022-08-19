DROP DATABASE IF EXISTS anodiam;
CREATE DATABASE anodiam;
create user 'anodiam_user'@'%' identified by 'Anodiam@123';
GRANT ALL PRIVILEGES ON anodiam.* TO 'anodiam_user'@'%';
USE anodiamstudent;
CREATE TABLE `mst_board` (
  `board_id` bigint NOT NULL AUTO_INCREMENT,
  `board_code` varchar(255) NOT NULL,
  `board_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `uk_board_code` (`board_code`),
  UNIQUE KEY `uk_board_name` (`board_name`),
  KEY `idx_board_code` (`board_code`),
  KEY `idx_board_name` (`board_name`)
);
LOCK TABLES `mst_board` WRITE;
INSERT INTO `mst_board` VALUES (1,'ICSE','Indian Certificate of Secondary Education'),(2,'CBSE','Central Board of Secondary Education'),(3,'ISC','Indian School Certificate'),(4,'OTH','Other');
UNLOCK TABLES;
CREATE TABLE `mst_level` (
  `level_id` bigint NOT NULL AUTO_INCREMENT,
  `level_code` varchar(255) NOT NULL,
  `level_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `uk_level_code` (`level_code`),
  UNIQUE KEY `uk_level_name` (`level_name`),
  KEY `idx_level_code` (`level_code`),
  KEY `idx_level_name` (`level_name`)
);
LOCK TABLES `mst_level` WRITE;
INSERT INTO `mst_level` VALUES (1,'KG','Kinder Garten'),(2,'I','1'),(3,'II','2'),(4,'III','3'),(5,'IV','4'),(6,'V','5'),(7,'VI','6'),(8,'VII','7'),(9,'VIII','8'),(10,'IX','9'),(11,'X','10'),(12,'XI','11'),(13,'XII','12'),(14,'OTH','Other');
UNLOCK TABLES;
CREATE TABLE `mst_subject` (
  `subject_id` bigint NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(255) NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `uk_subject_code` (`subject_code`),
  UNIQUE KEY `uk_subject_name` (`subject_name`),
  KEY `idx_subject_code` (`subject_code`),
  KEY `idx_subject_name` (`subject_name`)
);
LOCK TABLES `mst_subject` WRITE;
INSERT INTO `mst_subject` VALUES (1,'ENG','English'),(2,'MATH','Mathematics'),(3,'PHY','Physics'),(4,'CHEM','Chemistry'),(5,'BIO','Biology'),(6,'COMP','Computers'),(7,'OTH','Others');
UNLOCK TABLES;
CREATE TABLE `mst_permission` (
  `permission_id` bigint NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `uk_permission_name` (`permission_name`),
  KEY `idx_permission_name` (`permission_name`)
);
LOCK TABLES `mst_permission` WRITE;
INSERT INTO `mst_permission` VALUES (1,'STUDENT_ACCESS');
UNLOCK TABLES;
CREATE TABLE `mst_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_name` (`role_name`),
  KEY `idx_role_name` (`role_name`)
);
LOCK TABLES `mst_role` WRITE;
INSERT INTO `mst_role` VALUES (1,'USER');
UNLOCK TABLES;
CREATE TABLE `mst_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `active` int NOT NULL,
  `date_created` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_username` (`username`)
);
LOCK TABLES `mst_user` WRITE;
insert into `mst_user` values (1, 1, now(), '$2a$14$eOb6p8z00qRqAlJ7bpPT..6roaA9XBBpd/NdtnEAuJYTjTsA4WWFm', 'pinaki.sen@gmail.com');
insert into `mst_user` values (2, 1, now(), '$2a$14$eOb6p8z00qRqAlJ7bpPT..6roaA9XBBpd/NdtnEAuJYTjTsA4WWFm', 'anindita@gmail.com');
insert into `mst_user` values (3, 1, now(), '$2a$14$eOb6p8z00qRqAlJ7bpPT..6roaA9XBBpd/NdtnEAuJYTjTsA4WWFm', 'mala.das@gmail.com');
UNLOCK TABLES;
CREATE TABLE `user_permission` (
  `user_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `FK_permission_id` (`permission_id`),
  KEY `FK_user_id` (`user_id`),
  CONSTRAINT `FK_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `mst_permission` (`permission_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
);
LOCK TABLES `user_permission` WRITE;
insert into `user_permission` values (1, 1);
insert into `user_permission` values (2, 1);
insert into `user_permission` values (3, 1);
UNLOCK TABLES;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_role_id` (`role_id`),
  KEY `FK_user_id_02` (`user_id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `mst_role` (`role_id`),
  CONSTRAINT `FK_user_id_02` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
);
LOCK TABLES `user_role` WRITE;
insert into `user_role` values (1, 1);
insert into `user_role` values (2, 1);
insert into `user_role` values (3, 1);
UNLOCK TABLES;
CREATE TABLE `student_profile` (
  `student_profile_id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `board_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`student_profile_id`),
  KEY `idx_full_name` (`full_name`),
  KEY `FK_board_id` (`board_id`),
  KEY `FK_level_id` (`level_id`),
  KEY `FK_user_id_idx` (`user_id`),
  CONSTRAINT `FK_board_id` FOREIGN KEY (`board_id`) REFERENCES `mst_board` (`board_id`),
  CONSTRAINT `FK_level_id` FOREIGN KEY (`level_id`) REFERENCES `mst_level` (`level_id`),
  CONSTRAINT `FK_student_user_id` FOREIGN KEY (`user_id`) REFERENCES `mst_user` (`user_id`)
);
LOCK TABLES `student_profile` WRITE;
insert into `student_profile` values (1, 'Pinaki Sen', 2, 11, 1), (2, 'Anindita Roy', 1, 12, 2);
UNLOCK TABLES;
commit;