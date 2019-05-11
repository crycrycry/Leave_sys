-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: leave_sys
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `admin_full_name` varchar(50) DEFAULT NULL,
  `admin_telephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` (`admin_id`, `user_id`, `admin_full_name`, `admin_telephone`) VALUES (1,3,'admin','110');
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
INSERT INTO `sys_classes` (`class_id`, `class_name`, `dep_id`, `class_major`, `class_grade`) VALUES ('class001','班级一','G1','软件工程','大二');
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
  `course_major` varchar(30) DEFAULT NULL COMMENT '所属专业',
  `course_grade` varchar(30) DEFAULT NULL COMMENT '所在年级',
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
INSERT INTO `sys_course` (`course_id`, `class_id`, `course_name`, `course_year`, `course_term`, `course_hour`, `course_major`, `course_grade`) VALUES ('course001','class001','课程1','1','1',1,'软件工程','大二');
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
INSERT INTO `sys_department` (`dep_id`, `dep_name`) VALUES ('G1','大数据与软件工程学院');
/*!40000 ALTER TABLE `sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_instructor`
--

DROP TABLE IF EXISTS `sys_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_instructor` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `inst_name` varchar(50) DEFAULT NULL,
  `dep_id` varchar(30) DEFAULT NULL,
  `inst_telephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`inst_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_instructor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_instructor`
--

LOCK TABLES `sys_instructor` WRITE;
/*!40000 ALTER TABLE `sys_instructor` DISABLE KEYS */;
INSERT INTO `sys_instructor` (`inst_id`, `user_id`, `inst_name`, `dep_id`, `inst_telephone`) VALUES (9,29,'蔡敏仪','G1','18276254855');
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
  `leave_applyTime` date DEFAULT NULL COMMENT '请假时间',
  `leave_status` varchar(3) DEFAULT '0' COMMENT '请假状态，0未审核，1同意，2，不同意',
  `leave_auditTime` date DEFAULT NULL COMMENT '审核时间',
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
INSERT INTO `sys_leave` (`leave_id`, `course_id`, `leave_reason`, `leave_dayNum`, `stu_id`, `leave_applyTime`, `leave_status`, `leave_auditTime`, `leave_opinion`) VALUES ('201905101554059441','course001','Test 01',111111,'student','2019-05-10','1','2019-05-10','批准'),('20190511081701742','course001','Test Date',6,'student','2019-05-11','1','2019-05-11','pass');
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
  `user_id` int(11) DEFAULT NULL,
  `class_id` varchar(30) NOT NULL,
  `stu_name` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(3) DEFAULT NULL,
  `stu_address` varchar(150) DEFAULT NULL,
  `stu_telephone` varchar(11) DEFAULT NULL,
  `stu_contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `stu_contactTel` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  PRIMARY KEY (`stu_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
INSERT INTO `sys_student` (`stu_id`, `user_id`, `class_id`, `stu_name`, `stu_sex`, `stu_address`, `stu_telephone`, `stu_contact`, `stu_contactTel`) VALUES ('student',30,'class001','麦奇','0','广西柳州','18276297824','mikey','18276297824');
/*!40000 ALTER TABLE `sys_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(11) NOT NULL COMMENT '登入账号',
  `user_password` varchar(20) DEFAULT '123456' COMMENT '登入密码',
  `user_type` int(2) NOT NULL COMMENT '用户角色 1:学生 2：老师 3：管理员',
  `user_available` int(2) NOT NULL DEFAULT '1' COMMENT '1:可用 2：封号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `user_name`, `user_password`, `user_type`, `user_available`) VALUES (3,'admin','admin',3,1),(29,'T001','123456',2,1),(30,'student','123456',1,1);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-11  9:00:15
