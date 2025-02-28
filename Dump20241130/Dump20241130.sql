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
-- Table structure for table `attendancereportdetails`
--

DROP TABLE IF EXISTS `attendancereportdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendancereportdetails` (
  `HoursWorked` int NOT NULL,
  `DayWork` tinyint NOT NULL,
  `BreakTime` time DEFAULT NULL,
  `EmployeeID` int NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`ShiftID`,`EmployeeID`),
  KEY `AttendanceReportDetails_EmployeeID_idx` (`EmployeeID`),
  KEY `AttendanceReportDetails_ShiftID_idx` (`ShiftID`),
  CONSTRAINT `AttendanceReportDetails_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AttendanceReportDetails_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier` (
  `CashierID` int NOT NULL AUTO_INCREMENT,
  `Payment` enum('Cash','Card') NOT NULL,
  `CustomerServiceRequest` text,
  `EmployeeID` int NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`CashierID`),
  KEY `Cashier_EmployeeID_idx` (`EmployeeID`),
  KEY `Cashier_ShiftID_idx` (`ShiftID`),
  CONSTRAINT `Cashier_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Cashier_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dailyreportdetails`
--

DROP TABLE IF EXISTS `dailyreportdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailyreportdetails` (
  `ServiceProvided` text NOT NULL,
  `OpenHours` time NOT NULL,
  `ReportID` int NOT NULL,
  `ShiftID` int NOT NULL,
  `ServiceID` int NOT NULL,
  PRIMARY KEY (`ReportID`,`ShiftID`,`ServiceID`),
  KEY `ReportID_idx` (`ReportID`),
  KEY `DailyReportDetails_ShiftID_idx` (`ShiftID`),
  KEY `DailyReportDetails_ServiceID_idx` (`ServiceID`),
  CONSTRAINT `DailyReportDetails_ReportID` FOREIGN KEY (`ReportID`) REFERENCES `report` (`ReportID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DailyReportDetails_ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DailyReportDetails_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_shift`
--

DROP TABLE IF EXISTS `employee_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_shift` (
  `EmployeeID` int NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`EmployeeID`,`ShiftID`),
  KEY `EmployeeID_idx` (`EmployeeID`) /*!80000 INVISIBLE */,
  KEY `ShiftID_idx` (`ShiftID`),
  CONSTRAINT `employee_shift_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_shift_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeebiometrics`
--

DROP TABLE IF EXISTS `employeebiometrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeebiometrics` (
  `FingerprintID` int NOT NULL AUTO_INCREMENT,
  `CheckIn` time NOT NULL,
  `CheckOut` time DEFAULT NULL,
  `EmployeeID` int NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`FingerprintID`),
  KEY `ShiftID_idx` (`ShiftID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `employeebiometrics_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Position` varchar(100) NOT NULL,
  `DateOfHire` date NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leaverequest`
--

DROP TABLE IF EXISTS `leaverequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaverequest` (
  `LeaveRequestID` int NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL,
  `LeaveType` varchar(50) NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`LeaveRequestID`),
  KEY `LeaveRequest_EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `LeaveRequest_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `SalaryID` int NOT NULL AUTO_INCREMENT,
  `EmployeeAttendance` varchar(255) DEFAULT NULL,
  `HoursWorked` float DEFAULT NULL,
  `TotalPayable` decimal(10,2) DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  PRIMARY KEY (`SalaryID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `Cost` decimal(10,2) NOT NULL,
  `Duration` text NOT NULL,
  `Description` text,
  `CashierID` int NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `CashierID_idx` (`CashierID`),
  CONSTRAINT `CashierID` FOREIGN KEY (`CashierID`) REFERENCES `cashier` (`CashierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `ShiftID` int NOT NULL AUTO_INCREMENT,
  `ShiftStart` time DEFAULT NULL,
  `ShiftEnd` time DEFAULT NULL,
  `SalaryID` int DEFAULT NULL,
  PRIMARY KEY (`ShiftID`),
  KEY `SalaryID_idx` (`SalaryID`),
  CONSTRAINT `SalaryID` FOREIGN KEY (`SalaryID`) REFERENCES `salary` (`SalaryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shiftswap`
--

DROP TABLE IF EXISTS `shiftswap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiftswap` (
  `SwapID` int NOT NULL AUTO_INCREMENT,
  `RequestedShift` time NOT NULL,
  `RequestStatus` enum('Pending','Approved','Rejected') NOT NULL,
  `ShiftApproved` enum('TRUE','FALSE') NOT NULL,
  `ShiftID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`SwapID`),
  KEY `ShiftSwap_ShiftID_idx` (`ShiftID`),
  KEY `ShiftSwap_EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `ShiftSwap_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ShiftSwap_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentType` enum('Cash','Card') NOT NULL,
  `CashierID` int NOT NULL,
  `ShiftID` int NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `Transaction_Cashier_idx` (`CashierID`),
  KEY `Transaction_ShiftID_idx` (`ShiftID`),
  CONSTRAINT `Transaction_Cashier` FOREIGN KEY (`CashierID`) REFERENCES `cashier` (`CashierID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Transaction_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_service`
--

DROP TABLE IF EXISTS `transaction_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_service` (
  `Quantity` int NOT NULL,
  `ServiceID` int NOT NULL,
  `TransactionID` int NOT NULL,
  PRIMARY KEY (`TransactionID`,`ServiceID`),
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TransactionID` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30  1:01:20
