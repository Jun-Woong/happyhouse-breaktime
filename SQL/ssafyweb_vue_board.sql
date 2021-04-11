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
-- Table structure for table `vue_board`
--

DROP TABLE IF EXISTS `vue_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vue_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `vue_board_to_user_fk` (`writer`),
  CONSTRAINT `vue_board_to_user_fk` FOREIGN KEY (`writer`) REFERENCES `ssafy_member` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vue_board`
--

LOCK TABLES `vue_board` WRITE;
/*!40000 ALTER TABLE `vue_board` DISABLE KEYS */;
INSERT INTO `vue_board` VALUES (1,'admin','쉬는 시간 운영 회칙','쉬는 시간은 당신만의 쉬는 공간을 찾는 목적으로 2020년 11월 18일 생성되었습니다.\n본 사이트는 어떠한 권위를 갖지도 않고 유저들의 대표를 자처하지 아니하며, 관리자와 이하 스탭들 또한 회원들 사이에서 권력 남용을 하지 않습니다.\n이 사이트는 유저들 사이에 화합과 정보 공유를 할 수 있는 공간으로 운영 될 것입니다.\n이를 위하여 운영 회칙을 설정하고 이를 기반으로 운영하고자 합니다.','2020-11-18 00:46:37'),(7,'admin','11월 24일(월) 02~09시 사이트 점검 안내','11월 24일(화요일) 새벽 2시부터 아침 9시 까지 (총 7시간)\n\n사이트 서비스 점검이 진행됩니다. \n​\n전체 사이트 서비스 점검이 진행되는 새벽 2시부터 아침 9시 까지는\n\n사이트 게시글/댓글 쓰기, 수정하기, 삭제 등의 작업이 제한되며,\n\n사이트 검색 미노출, 조회수 정보 미반영 등의 영향이 있을 수 있습니다.  ','2020-11-24 08:11:59');
/*!40000 ALTER TABLE `vue_board` ENABLE KEYS */;
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
