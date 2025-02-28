-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: employeeattendance
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `ReportID` int NOT NULL AUTO_INCREMENT,
  `CustomersServed` int DEFAULT NULL,
  `DailyReport` text,
  `AttendanceReport` text,
  `SalaryID` int DEFAULT NULL,
  `EmployeeID` int NOT NULL,
  `LeaveRequestID` int DEFAULT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `SalaryID_idx` (`SalaryID`),
  KEY `Report_EmployeeID_idx` (`EmployeeID`),
  KEY `LeaveRequestID_idx` (`LeaveRequestID`),
  KEY `ShiftID_idx` (`ShiftID`),
  CONSTRAINT `LeaveRequestID` FOREIGN KEY (`LeaveRequestID`) REFERENCES `leaverequest` (`LeaveRequestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Report_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Report_SalaryID` FOREIGN KEY (`SalaryID`) REFERENCES `salary` (`SalaryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Report_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  0:56:26
