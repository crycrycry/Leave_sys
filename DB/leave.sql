-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: leave_system
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_admin`
--

DROP TABLE IF EXISTS `sys_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_admin` (
  `admin_id` varchar(30) NOT NULL,
  `admin_password` varchar(50) DEFAULT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `admin_telephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES ('admin','123456','刘牌','13657746155');
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_classes`
--

DROP TABLE IF EXISTS `sys_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_classes` (
  `class_id` varchar(30) NOT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `dep_id` varchar(30) DEFAULT NULL,
  `class_major` varchar(11) DEFAULT NULL,
  `class_grade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_classes`
--

LOCK TABLES `sys_classes` WRITE;
/*!40000 ALTER TABLE `sys_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_course`
--

DROP TABLE IF EXISTS `sys_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_course` (
  `course_id` varchar(30) NOT NULL,
  `class_id` varchar(30) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `course_year` varchar(3) DEFAULT NULL COMMENT '学年',
  `course_term` varchar(150) DEFAULT NULL COMMENT '学期',
  `course_hour` int(11) DEFAULT NULL COMMENT '学时',
  PRIMARY KEY (`course_id`),
  KEY `sys_course_sys_classes_class_id_fk` (`class_id`),
  CONSTRAINT `sys_course_sys_classes_class_id_fk` FOREIGN KEY (`class_id`) REFERENCES `sys_classes` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_course`
--

LOCK TABLES `sys_course` WRITE;
/*!40000 ALTER TABLE `sys_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_department`
--

DROP TABLE IF EXISTS `sys_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_department` (
  `dep_id` varchar(30) NOT NULL,
  `dep_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_department`
--

LOCK TABLES `sys_department` WRITE;
/*!40000 ALTER TABLE `sys_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instructor`
--

DROP TABLE IF EXISTS `sys_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_instructor` (
  `inst_id` varchar(30) NOT NULL,
  `inst_name` varchar(50) DEFAULT NULL,
  `dep_id` varchar(30) DEFAULT NULL,
  `inst_telephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instructor`
--

LOCK TABLES `sys_instructor` WRITE;
/*!40000 ALTER TABLE `sys_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_leave`
--

DROP TABLE IF EXISTS `sys_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_leave` (
  `leave_id` varchar(30) NOT NULL,
  `course_id` varchar(30) NOT NULL,
  `leave_reason` varchar(150) DEFAULT NULL COMMENT '请假事由',
  `leave_dayNum` int(11) DEFAULT NULL COMMENT '请假天数',
  `stu_id` varchar(30) DEFAULT NULL,
  `leave_applyTime` datetime DEFAULT NULL COMMENT '请假时间',
  `leave_status` varchar(3) DEFAULT NULL COMMENT '请假状态，0未审核，1同意，2，不同意',
  `leave_auditTime` datetime DEFAULT NULL COMMENT '审核时间',
  `leave_opinion` varchar(150) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`leave_id`),
  KEY `sys_leave_sys_course_course_id_fk` (`course_id`),
  CONSTRAINT `sys_leave_sys_course_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `sys_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_leave`
--

LOCK TABLES `sys_leave` WRITE;
/*!40000 ALTER TABLE `sys_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_student`
--

DROP TABLE IF EXISTS `sys_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_student` (
  `stu_id` varchar(30) NOT NULL,
  `class_id` varchar(30) NOT NULL,
  `stu_name` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(3) DEFAULT NULL,
  `stu_address` varchar(150) DEFAULT NULL,
  `stu_telephone` varchar(11) DEFAULT NULL,
  `stu_contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `stu_contactTel` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`stu_id`),
  KEY `sys_student_sys_classes_class_id_fk` (`class_id`),
  CONSTRAINT `sys_student_sys_classes_class_id_fk` FOREIGN KEY (`class_id`) REFERENCES `sys_classes` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 22:35:15
