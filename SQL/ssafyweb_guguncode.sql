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
-- Table structure for table `guguncode`
--

DROP TABLE IF EXISTS `guguncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guguncode` (
  `gugun_code` varchar(7) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `gugun_name` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`gugun_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guguncode`
--

LOCK TABLES `guguncode` WRITE;
/*!40000 ALTER TABLE `guguncode` DISABLE KEYS */;
INSERT INTO `guguncode` VALUES ('11110','종로구'),('11140','중구'),('11170','용산구'),('11200','성동구'),('11215','광진구'),('11230','동대문구'),('11260','중랑구'),('11290','성북구'),('11305','강북구'),('11320','도봉구'),('11350','노원구'),('11380','은평구'),('11410','서대문구'),('11440','마포구'),('11470','양천구'),('11500','강서구'),('11530','구로구'),('11545','금천구'),('11560','영등포구'),('11590','동작구'),('11620','관악구'),('11650','서초구'),('11680','강남구'),('11710','송파구'),('11740','강동구');
/*!40000 ALTER TABLE `guguncode` ENABLE KEYS */;
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
