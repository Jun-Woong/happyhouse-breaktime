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
-- Table structure for table `safety_degree`
--

DROP TABLE IF EXISTS `safety_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `safety_degree` (
  `gu` varchar(20) NOT NULL,
  `score` int DEFAULT NULL,
  `degree` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`gu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `safety_degree`
--

LOCK TABLES `safety_degree` WRITE;
/*!40000 ALTER TABLE `safety_degree` DISABLE KEYS */;
INSERT INTO `safety_degree` VALUES ('강남구',6076,'A+'),('강동구',2949,'A-'),('강북구',1813,'B+'),('강서구',1740,'B+'),('관악구',5236,'A'),('광진구',1853,'B+'),('구로구',4456,'A'),('금천구',2368,'B+'),('노원구',3029,'A-'),('도봉구',1627,'B+'),('동대문구',4069,'A'),('동작구',3351,'A-'),('마포구',2478,'A-'),('서대문구',3315,'A-'),('서초구',4041,'A'),('성동구',6186,'A+'),('성북구',9394,'A+'),('송파구',2143,'B+'),('양천구',5439,'A+'),('영등포구',2572,'A-'),('용산구',3176,'A-'),('은평구',5955,'A+'),('종로구',3481,'A'),('중구',2641,'A-'),('중랑구',1601,'B+');
/*!40000 ALTER TABLE `safety_degree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18 12:10:07
