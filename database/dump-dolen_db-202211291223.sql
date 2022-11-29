-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: dolen_db
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `balance` int NOT NULL,
  `isInvestment` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` varchar(100) NOT NULL,
  `upadtedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`accountId`),
  KEY `account_FK` (`userId`),
  CONSTRAINT `account_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `budgetId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `categoryId` varchar(100) NOT NULL,
  `value` int NOT NULL,
  `periodId` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`budgetId`),
  KEY `budget_FK` (`userId`),
  KEY `budget_FK_1` (`categoryId`),
  KEY `budget_FK_2` (`periodId`),
  CONSTRAINT `budget_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `budget_FK_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`),
  CONSTRAINT `budget_FK_2` FOREIGN KEY (`periodId`) REFERENCES `period` (`periodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `categoryTypeId` varchar(100) NOT NULL,
  `isHidden` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `category_FK` (`userId`),
  KEY `category_FK_1` (`categoryTypeId`),
  CONSTRAINT `category_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `category_FK_1` FOREIGN KEY (`categoryTypeId`) REFERENCES `category_type` (`categoryTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type`
--

DROP TABLE IF EXISTS `category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_type` (
  `categoryTypeId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt`
--

DROP TABLE IF EXISTS `debt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt` (
  `debtId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`debtId`),
  KEY `debt_FK` (`userId`),
  CONSTRAINT `debt_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt`
--

LOCK TABLES `debt` WRITE;
/*!40000 ALTER TABLE `debt` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debt_transaction`
--

DROP TABLE IF EXISTS `debt_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debt_transaction` (
  `debtId` varchar(100) NOT NULL,
  `transactionId` varchar(100) NOT NULL,
  PRIMARY KEY (`debtId`,`transactionId`),
  KEY `debt_transaction_FK` (`transactionId`),
  CONSTRAINT `debt_transaction_FK` FOREIGN KEY (`transactionId`) REFERENCES `transaction` (`transactionId`),
  CONSTRAINT `debt_transaction_FK_1` FOREIGN KEY (`debtId`) REFERENCES `debt` (`debtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debt_transaction`
--

LOCK TABLES `debt_transaction` WRITE;
/*!40000 ALTER TABLE `debt_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `debt_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loanId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`loanId`),
  KEY `loan_FK` (`userId`),
  CONSTRAINT `loan_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_transaction`
--

DROP TABLE IF EXISTS `loan_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_transaction` (
  `loanId` varchar(100) NOT NULL,
  `transactionId` varchar(100) NOT NULL,
  PRIMARY KEY (`loanId`,`transactionId`),
  KEY `loanTransaction_FK_1` (`transactionId`),
  CONSTRAINT `loanTransaction_FK` FOREIGN KEY (`loanId`) REFERENCES `loan` (`loanId`),
  CONSTRAINT `loanTransaction_FK_1` FOREIGN KEY (`transactionId`) REFERENCES `transaction` (`transactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_transaction`
--

LOCK TABLES `loan_transaction` WRITE;
/*!40000 ALTER TABLE `loan_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period` (
  `periodId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`periodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period`
--

LOCK TABLES `period` WRITE;
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
/*!40000 ALTER TABLE `period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `accountId` varchar(100) NOT NULL,
  `categoryId` varchar(100) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `transactionDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `transaction_FK` (`userId`),
  KEY `transaction_FK_1` (`accountId`),
  KEY `transaction_FK_2` (`categoryId`),
  CONSTRAINT `transaction_FK` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `transaction_FK_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `transaction_FK_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `upadtedAt` datetime NOT NULL,
  `updatedBy` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `user_FK` (`roleId`),
  CONSTRAINT `user_FK` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dolen_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-29 12:23:58
