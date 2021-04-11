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
-- Table structure for table `vue_qna`
--

DROP TABLE IF EXISTS `vue_qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vue_qna` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` char(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `content` varchar(2000) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `vue_QnA_to_user_fk` (`writer`),
  CONSTRAINT `vue_QnA_to_user_fk` FOREIGN KEY (`writer`) REFERENCES `ssafy_member` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vue_qna`
--

LOCK TABLES `vue_qna` WRITE;
/*!40000 ALTER TABLE `vue_qna` DISABLE KEYS */;
INSERT INTO `vue_qna` VALUES (11,'ssafy','질문과 답변은 어떻게 사용하나요???','질문을 하시면 관리자가 답변을 해줍니다!!!','2020-11-24 18:11:01'),(12,'ssafy','쉬는 시간은 어떻게 사용하나요???','아직 답변이 작성되어 있지 않습니다!','2020-11-24 18:26:57');
/*!40000 ALTER TABLE `vue_qna` ENABLE KEYS */;
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
