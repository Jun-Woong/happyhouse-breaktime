-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ssafyweb
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
-- Table structure for table `ssafy_member`
--

DROP TABLE IF EXISTS `ssafy_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssafy_member` (
  `userid` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `userpwd` varchar(16) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `email` varchar(20) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `address` varchar(2000) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssafy_member`
--

LOCK TABLES `ssafy_member` WRITE;
/*!40000 ALTER TABLE `ssafy_member` DISABLE KEYS */;
INSERT INTO `ssafy_member` VALUES ('admin','관리자','admin','admin@ssafy.com','광주시 송정동','2020-12-07 00:13:06'),('ssafy','김싸피','ssafy','ssafy@ssafy.com','서울시 역삼동','2020-12-07 00:13:06');
/*!40000 ALTER TABLE `ssafy_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18 12:10:08
