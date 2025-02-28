-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_attendance
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
-- Table structure for table `attendace`
--

DROP TABLE IF EXISTS `attendace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendace` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `ScheduleID` int NOT NULL,
  `CheckIn` time DEFAULT NULL,
  `AttendanceDate` date DEFAULT NULL,
  `CheckOut` time DEFAULT NULL,
  `AttendanceStatus` enum('Present','Absent','Late') NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `Attendance_EmployeeID_idx` (`EmployeeID`),
  KEY `Attendance_ScheduleID_idx` (`ScheduleID`),
  CONSTRAINT `Attendance_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Attendance_ScheduleID` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendace`
--

LOCK TABLES `attendace` WRITE;
/*!40000 ALTER TABLE `attendace` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barber`
--

DROP TABLE IF EXISTS `barber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barber` (
  `BarberID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `AvailabilityStatus` enum('Available','Unavailable','On Leave') NOT NULL,
  PRIMARY KEY (`BarberID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barber`
--

LOCK TABLES `barber` WRITE;
/*!40000 ALTER TABLE `barber` DISABLE KEYS */;
/*!40000 ALTER TABLE `barber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biometrics`
--

DROP TABLE IF EXISTS `biometrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biometrics` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `RegistrationDate` datetime NOT NULL,
  `Fingerprint` blob NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `Biometrics_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biometrics`
--

LOCK TABLES `biometrics` WRITE;
/*!40000 ALTER TABLE `biometrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `biometrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier` (
  `CashierID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `PaymentID` int NOT NULL,
  `ServiceID` int NOT NULL,
  PRIMARY KEY (`CashierID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  KEY `ServiceID_idx` (`ServiceID`),
  KEY `_idx` (`PaymentID`),
  CONSTRAINT `cashier_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `cashier_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `cashier_ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashier`
--

LOCK TABLES `cashier` WRITE;
/*!40000 ALTER TABLE `cashier` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `DateOfHire` date NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaverequest`
--

DROP TABLE IF EXISTS `leaverequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaverequest` (
  `LeaveRequestID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `ScheduleID` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `LeaveType` varchar(50) NOT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL,
  PRIMARY KEY (`LeaveRequestID`),
  KEY `LeaveRequest_EmployeeID_idx` (`EmployeeID`),
  KEY `LeaveRequest_ScheduleID_idx` (`ScheduleID`),
  CONSTRAINT `LeaveRequest_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `LeaveRequest_ScheduleID` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaverequest`
--

LOCK TABLES `leaverequest` WRITE;
/*!40000 ALTER TABLE `leaverequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaverequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `ServiceID` int NOT NULL,
  `AmountPaid` decimal(10,2) NOT NULL,
  `PaymentDate` datetime NOT NULL,
  `PaymentType` enum('Online Payment','Credit Card','Cash') NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `ServiceID_idx` (`ServiceID`),
  CONSTRAINT `ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentservice`
--

DROP TABLE IF EXISTS `paymentservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentservice` (
  `PaymentServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceID` int NOT NULL,
  `PaymentID` int NOT NULL,
  PRIMARY KEY (`PaymentServiceID`),
  KEY `PaymentService_ServiceID_idx` (`ServiceID`),
  KEY `PaymentService_PaymentID_idx` (`PaymentID`),
  CONSTRAINT `PaymentService_PaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PaymentService_ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentservice`
--

LOCK TABLES `paymentservice` WRITE;
/*!40000 ALTER TABLE `paymentservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymentservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `SalaryID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `AttendanceID` int NOT NULL,
  `HoursWorked` int NOT NULL,
  `TotalPayable` decimal(10,2) NOT NULL,
  `CustomersServed` int DEFAULT '0',
  `Incentives` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`SalaryID`),
  KEY `Salary_EmployeeID_idx` (`EmployeeID`),
  KEY `Salary_AttendanceID_idx` (`AttendanceID`),
  CONSTRAINT `Salary_AttendanceID` FOREIGN KEY (`AttendanceID`) REFERENCES `attendace` (`AttendanceID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Salary_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `BarberID` int NOT NULL,
  `ShiftStartTime` time NOT NULL,
  `ShiftEndTime` time NOT NULL,
  `ShiftDate` date NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `Schedule_BarberID_idx` (`BarberID`),
  CONSTRAINT `Schedule_BarberID` FOREIGN KEY (`BarberID`) REFERENCES `barber` (`BarberID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `BarberID` int NOT NULL,
  `ServiceCategory` enum('Half Body Massage','Haircut','Hair Color','Shaving','Hair Shampoo') NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `ServiceDate` datetime NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `BarberID_idx` (`BarberID`),
  CONSTRAINT `BarberID` FOREIGN KEY (`BarberID`) REFERENCES `barber` (`BarberID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shiftswap`
--

DROP TABLE IF EXISTS `shiftswap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shiftswap` (
  `SwapID` int NOT NULL AUTO_INCREMENT,
  `SwapDate` date NOT NULL,
  `SwapReason` varchar(255) DEFAULT NULL,
  `ScheduleID` int NOT NULL,
  `BarberID` int NOT NULL,
  `BarberID_Frrom` int NOT NULL,
  `BarberID_To` int NOT NULL,
  `SwapStatus` enum('Completed','Cancelled','Pending') NOT NULL,
  PRIMARY KEY (`SwapID`),
  KEY `ShiftSwap_ScheduleID_idx` (`ScheduleID`),
  KEY `ShiftSwap_BarberID_idx` (`BarberID`),
  KEY `ShiftSwap_BarberID_From_idx` (`BarberID_Frrom`),
  KEY `ShiftSwap_BarberID_To_idx` (`BarberID_To`),
  CONSTRAINT `ShiftSwap_BarberID` FOREIGN KEY (`BarberID`) REFERENCES `barber` (`BarberID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ShiftSwap_BarberID_From` FOREIGN KEY (`BarberID_Frrom`) REFERENCES `barber` (`BarberID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ShiftSwap_BarberID_To` FOREIGN KEY (`BarberID_To`) REFERENCES `barber` (`BarberID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ShiftSwap_ScheduleID` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiftswap`
--

LOCK TABLES `shiftswap` WRITE;
/*!40000 ALTER TABLE `shiftswap` DISABLE KEYS */;
/*!40000 ALTER TABLE `shiftswap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 21:06:24
