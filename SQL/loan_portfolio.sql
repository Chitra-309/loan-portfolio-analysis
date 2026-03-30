CREATE DATABASE  IF NOT EXISTS `loan_portfolio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `loan_portfolio`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: loan_portfolio
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '87efd446-e0a8-11f0-bc6b-e4a8dfe5049f:1-60';

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `credit_score` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,25,'Male','Mumbai','MH',720),(2,32,'Female','Pune','MH',650),(3,45,'Male','Delhi','DL',580),(4,29,'Female','Bangalore','KA',690),(5,40,'Male','Hyderabad','TS',610),(6,36,'Female','Mumbai','MH',740),(7,50,'Male','Pune','MH',560),(8,27,'Female','Delhi','DL',710),(9,34,'Male','Bangalore','KA',680),(10,48,'Female','Hyderabad','TS',590);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaults`
--

DROP TABLE IF EXISTS `defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defaults` (
  `loan_id` int DEFAULT NULL,
  `default_date` date DEFAULT NULL,
  `default_amount` decimal(12,2) DEFAULT NULL,
  `recovery_amount` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaults`
--

LOCK TABLES `defaults` WRITE;
/*!40000 ALTER TABLE `defaults` DISABLE KEYS */;
INSERT INTO `defaults` VALUES (103,'2023-10-01',120000.00,40000.00),(107,'2023-11-15',200000.00,60000.00),(110,'2024-02-10',180000.00,70000.00);
/*!40000 ALTER TABLE `defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `loan_type` text,
  `disbursed_amount` int DEFAULT NULL,
  `interest_rate` double DEFAULT NULL,
  `tenure_months` int DEFAULT NULL,
  `disbursed_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (101,1,'Personal',200000,14.5,36,'2023-01-31'),(102,2,'Home',1500000,8.2,240,'2023-02-28'),(103,3,'Auto',500000,9.1,60,'2023-03-31'),(104,4,'Education',300000,10.5,48,'2023-04-30'),(105,5,'Personal',200000,14.5,36,'2023-05-31'),(106,6,'Home',1500000,8.2,240,'2023-06-30'),(107,7,'Auto',500000,9.1,60,'2023-07-31'),(108,8,'Education',300000,10.5,48,'2023-08-31'),(109,9,'Personal',200000,14.5,36,'2023-09-30'),(110,10,'Home',1500000,8.2,240,'2023-10-31'),(111,11,'Auto',500000,9.1,60,'2023-11-30'),(112,12,'Education',300000,10.5,48,'2023-12-31'),(113,13,'Personal',200000,14.5,36,'2024-01-31'),(114,14,'Home',1500000,8.2,240,'2024-02-29'),(115,15,'Auto',500000,9.1,60,'2024-03-31'),(116,16,'Education',300000,10.5,48,'2024-04-30'),(117,17,'Personal',200000,14.5,36,'2024-05-31'),(118,18,'Home',1500000,8.2,240,'2024-06-30'),(119,19,'Auto',500000,9.1,60,'2024-07-31'),(120,20,'Education',300000,10.5,48,'2024-08-31');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `loan_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1001,101,'2023-02-28',15000.00,'Paid'),(1002,102,'2023-03-31',12000.00,'Paid'),(1003,103,'2023-04-30',9000.00,'Delayed'),(1004,104,'2023-05-31',8000.00,'Paid'),(1005,105,'2023-06-30',14000.00,'Paid'),(1006,106,'2023-07-31',20000.00,'Paid'),(1007,107,'2023-08-31',8500.00,'Delayed'),(1008,108,'2023-09-30',7800.00,'Paid'),(1009,109,'2023-10-31',14500.00,'Paid'),(1010,110,'2023-11-30',19500.00,'Paid'),(1011,101,'2023-12-31',15000.00,'Paid'),(1012,102,'2024-01-31',12000.00,'Paid'),(1013,103,'2024-02-29',9000.00,'Delayed'),(1014,104,'2024-03-31',8000.00,'Paid'),(1015,105,'2024-04-30',14000.00,'Paid'),(1016,106,'2024-05-31',20000.00,'Paid'),(1017,107,'2024-06-30',8500.00,'Delayed'),(1018,108,'2024-07-31',7800.00,'Paid'),(1019,109,'2024-08-31',14500.00,'Paid'),(1020,110,'2024-09-30',19500.00,'Paid');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-26  1:30:20
