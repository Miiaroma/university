CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `idadministrator` int NOT NULL,
  `category` char(2) DEFAULT NULL,
  PRIMARY KEY (`idadministrator`),
  CONSTRAINT `user_administrator` FOREIGN KEY (`idadministrator`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (24,'b2'),(25,'a2'),(26,'c1');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `idcourse` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `greditpoints` smallint DEFAULT NULL,
  PRIMARY KEY (`idcourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (11,'Java 8',4),(12,'C#',4),(13,'C++',5),(14,'History of Fnland',10);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `iddepartment` smallint NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (101,'ICT'),(201,'History'),(301,'Biology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `idgrade` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `idstudent` int NOT NULL,
  `idteacher` int NOT NULL,
  `idcourse` int NOT NULL,
  `grade` smallint DEFAULT NULL,
  PRIMARY KEY (`idgrade`),
  KEY `teacher_grade_idx` (`idteacher`),
  KEY `student_grade_idx` (`idstudent`),
  KEY `cource_grade_idx` (`idcourse`),
  CONSTRAINT `cource_grade` FOREIGN KEY (`idcourse`) REFERENCES `course` (`idcourse`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `student_grade` FOREIGN KEY (`idstudent`) REFERENCES `student` (`idstudent`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `teacher_grade` FOREIGN KEY (`idteacher`) REFERENCES `teacher` (`idteacher`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (13,'2022-09-20',18,21,11,5),(14,'2022-09-20',18,22,12,3),(15,'2021-07-20',18,23,13,4),(16,'2020-07-20',19,21,12,5),(17,'2020-04-20',19,22,13,3),(18,'2020-04-20',19,23,14,4);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `graduate_date` date DEFAULT NULL,
  PRIMARY KEY (`idstudent`),
  CONSTRAINT `user_student` FOREIGN KEY (`idstudent`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (18,'2021-01-05','2022-01-01'),(19,'2021-11-05','2024-01-01'),(20,'2019-11-05','2021-01-01');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `idteacher` int NOT NULL,
  `iddepartment` smallint DEFAULT NULL,
  PRIMARY KEY (`idteacher`),
  KEY `department_teacher_idx` (`iddepartment`),
  CONSTRAINT `department_teacher` FOREIGN KEY (`iddepartment`) REFERENCES `department` (`iddepartment`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `user_teacher` FOREIGN KEY (`idteacher`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (21,101),(22,201),(23,301);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `identity` int DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (18,'student01','$2a$11$xpmF95Rlr8Ygln2ZrdbGXO1/H.MEejJZlTfYTOmPfcn4aa03VtcEK',1,'Bob','Student'),(19,'student02','$2a$11$xu2y8H9.uauvoETWLg1uguL9KT1zmHGbqiuEYMgkX5o1phev9c18u',1,'Lisa','Student'),(20,'student03','$2a$11$KPdflAL7Q7nai8Oy5q3qEOsiUoq90lyndD5ijFru6B1J6FP14BN9C',1,'Ann','Student'),(21,'teacher01','$2a$11$AFywRFShYP/q6cuwFfjk1u7H8yWtOwqv9wXGSFsTu14F04SEnFhfe',3,'Matt','Teacher'),(22,'teacher02','$2a$11$Att3qdrnIFplw9w5GhThhe3mm92z4HwNqtBjjmjUdIITcivsgYf2W',3,'Bill','Teacher'),(23,'teacher03','$2a$11$LbRUs0KpnAeSvnLVA5jFA.0ZabkDVW7bjocaZs9dij5RCETH5cmq2',3,'Jill','Teacher'),(24,'admin01','$2a$11$JgqgpuaDhGonotmyO2mvnuPgHCZSJHG86uU/q9ZsNBYc6gZ3hQyhq',2,'Hank','Admin'),(25,'admin02','$2a$11$pXa6B5S40AD2h9GzjM/Oc.eWwDOeAUDoR3b7UWu/t/p4lwHX1n9gu',2,'Bill','Admin'),(26,'admin03','$2a$11$TuQxgtAIo6E42dS4YLzaxeC5Z7palaYcf3JYfdLVnivFDVVzv.up2',2,'Marianne','Admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 15:49:46
