-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2024 at 09:30 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `com_repair`
--

-- --------------------------------------------------------

--
-- Table structure for table `com_repair`
--

CREATE TABLE `com_repair` (
  `COMR_ID` int(10) NOT NULL,
  `COMR_TOKEN` varchar(100) NOT NULL COMMENT 'รห้สแจ้งซ่อม',
  `COM_TOKEN` varchar(100) NOT NULL COMMENT 'รหัสอุปกรณ์',
  `DETAILS_1` varchar(250) NOT NULL,
  `DETAILS_2` varchar(250) NOT NULL,
  `DETAILS_3` varchar(250) NOT NULL,
  `DATE_DETAILS_1` datetime NOT NULL,
  `DATE_DETAILS_2` datetime NOT NULL,
  `DATE_DETAILS_3` datetime NOT NULL,
  `STATUS_COMR` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `com_repair`
--

INSERT INTO `com_repair` (`COMR_ID`, `COMR_TOKEN`, `COM_TOKEN`, `DETAILS_1`, `DETAILS_2`, `DETAILS_3`, `DATE_DETAILS_1`, `DATE_DETAILS_2`, `DATE_DETAILS_3`, `STATUS_COMR`) VALUES
(47, 'CR91217080', 'ODR238224617', 'ไม่มีเน็ต', '-', '-', '2022-12-14 05:12:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(48, 'CR1343793113', 'ODR238224617', 'ปริ๊นไม่ออก', '', '', '2022-12-14 05:13:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(49, 'CR1907554289', 'ODR446902776', 'เปิดไม่ติด', 'กำลังตรวจซ่อมเบื้องต้นแล้ว', 'เปลี่ยน power supply ใหม่', '2022-12-14 05:33:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
(50, 'CR1877652624', 'ODR446902776', 'เครื่องค้าง', '', '', '2022-12-14 05:35:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(51, 'CR1796290914', 'ODR238224617', 'เปิดไม่ติด ไฟไม่เข้า', '', '', '2022-12-14 05:37:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `DEVICE_ID` int(10) NOT NULL COMMENT 'ลำดับ',
  `DEVICE_CODE` int(10) NOT NULL COMMENT 'รห้สอุปกรณ์',
  `DEVICE_NAME` varchar(150) NOT NULL COMMENT 'ชื่ออุปกรณ์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`DEVICE_ID`, `DEVICE_CODE`, `DEVICE_NAME`) VALUES
(1, 1, 'คอมพิวเตอร์ตั้งโต๊ะ (PC)  '),
(7, 2, 'คอมพิวเตอร์ (Note Book)'),
(8, 3, 'คอมพิวเตอร์ (Mac Book)'),
(9, 4, 'ปริ๊นเตอร์ (Printer)');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DIVISION_ID` int(10) NOT NULL COMMENT 'ลำดับ',
  `DIVISION_CODE` int(10) NOT NULL COMMENT 'รหัสแผนก',
  `DIVISION_NAME` varchar(100) NOT NULL COMMENT 'แผนก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DIVISION_ID`, `DIVISION_CODE`, `DIVISION_NAME`) VALUES
(1, 1, 'IT Support'),
(2, 2, 'HR Officer'),
(3, 3, 'การเงิน และบัญชี');

-- --------------------------------------------------------

--
-- Table structure for table `order_device`
--

CREATE TABLE `order_device` (
  `COM_ID` int(10) NOT NULL,
  `COM_TOKEN` varchar(100) NOT NULL,
  `DEVICE_CODE` int(10) NOT NULL,
  `OS_CODE` int(10) NOT NULL,
  `IP_ADDRESS` varchar(100) NOT NULL,
  `IP_GROUP` varchar(100) NOT NULL,
  `COM_NAME` varchar(100) NOT NULL,
  `DIVISION_CODE` int(10) NOT NULL,
  `SECTION_CODE` int(10) NOT NULL,
  `STATUS` int(10) NOT NULL,
  `COM_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_device`
--

INSERT INTO `order_device` (`COM_ID`, `COM_TOKEN`, `DEVICE_CODE`, `OS_CODE`, `IP_ADDRESS`, `IP_GROUP`, `COM_NAME`, `DIVISION_CODE`, `SECTION_CODE`, `STATUS`, `COM_DATE`) VALUES
(12, 'ODR446902776', 1, 5, '192.168.0.110', '192.168.10.1', 'h', 1, 1, 2, '2022-12-08 15:08:30'),
(17, 'ODR238224617', 4, 2, '-', '-', 'TEST_1', 3, 6, 4, '2022-12-08 15:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `os`
--

CREATE TABLE `os` (
  `OS_ID` int(10) NOT NULL,
  `OS_CODE` int(10) NOT NULL,
  `OS_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os`
--

INSERT INTO `os` (`OS_ID`, `OS_CODE`, `OS_NAME`) VALUES
(1, 1, 'กรูณาเลือกระบบปฎิบัติการ OS'),
(2, 2, 'ไม่มี'),
(3, 3, 'Windows xp'),
(4, 3, 'Windows 7'),
(5, 4, 'Windows 10'),
(7, 5, 'Windows 11'),
(8, 6, 'MAX OS'),
(9, 7, 'LINUX');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `POSITION_ID` int(100) NOT NULL COMMENT 'รหัสตำแหน่ง',
  `POSITION_CODE` int(10) NOT NULL,
  `POSITION_NAME` varchar(200) NOT NULL COMMENT 'ชื่อตำแหน่ง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`POSITION_ID`, `POSITION_CODE`, `POSITION_NAME`) VALUES
(1, 1, 'เจ้าหน้าที่'),(2, 2, 'ผู้ใช้งานทั่วไป');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `REGISTER_ID` int(100) NOT NULL COMMENT 'รหัส ID',
  `USERNAME` varchar(100) NOT NULL COMMENT 'user',
  `PASSWORD` varchar(100) NOT NULL COMMENT 'pass',
  `FULLNAME` varchar(100) NOT NULL COMMENT 'ชื่อ-สกุล',
  `POSITION` int(50) NOT NULL COMMENT 'ตำแหน่ง',
  `PHONE` int(10) NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `EMAIL` varchar(150) NOT NULL COMMENT 'อีเมล',
  `D_CODE` varchar(50) NOT NULL COMMENT 'แผนก 2',
  `S_CODE` varchar(50) NOT NULL COMMENT 'แผนก 3',
  `STATUS_REG` varchar(10) NOT NULL COMMENT 'สถานะสมาชิก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`REGISTER_ID`, `USERNAME`, `PASSWORD`, `FULLNAME`, `POSITION`, `PHONE`, `EMAIL`, `D_CODE`, `S_CODE`, `STATUS_REG`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'ADMIN', 1, 1, '12345@gmail.com', '1', '1', '1'),
(2, 'test', '827ccb0eea8a706c4c34a16891f84e7b', 'FULLNAME', 1, 1010, '1231014@gmail.com', '2', '3', '5');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `SECTION_ID` int(10) NOT NULL COMMENT 'รหัสส่วน',
  `SECTION_NUM` int(10) NOT NULL COMMENT 'ลำดับ',
  `SECTION_NAME` varchar(100) NOT NULL COMMENT 'ส่วน',
  `DIVISION_CODE` int(10) NOT NULL COMMENT 'รหัสแผนก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SECTION_ID`, `SECTION_NUM`, `SECTION_NAME`, `DIVISION_CODE`) VALUES
(1, 1, 'IT Support', 1),
(2, 2, 'DEV/Programmer', 1),
(3, 1, 'งานวางแผนกำลังคน ', 2),
(4, 2, 'งานพัฒนาบุคลากร ', 2),
(5, 1, 'การเงิน', 3),
(6, 2, 'บัญชี', 3);

-- --------------------------------------------------------

--
-- Table structure for table `status_com`
--

CREATE TABLE `status_com` (
  `STATUSCOM_ID` int(10) NOT NULL,
  `STATUSCOM_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_com`
--

INSERT INTO `status_com` (`STATUSCOM_ID`, `STATUSCOM_NAME`) VALUES
(1, 'กรุณาเลือกสถานะ'),
(2, 'ใช้งานได้'),
(3, 'ใช้งานไม่ได้'),
(4, 'ยกเลิก');

-- --------------------------------------------------------

--
-- Table structure for table `status_comr`
--

CREATE TABLE `status_comr` (
  `STATUSCOM_ID` int(10) NOT NULL,
  `STATUSCOM_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_comr`
--

INSERT INTO `status_comr` (`STATUSCOM_ID`, `STATUSCOM_NAME`) VALUES
(1, 'แจ้งซ่อม'),
(2, 'รับเรื่อง'),
(3, 'เสร็จสิ้น');

-- --------------------------------------------------------

--
-- Table structure for table `status_reg`
--

CREATE TABLE `status_reg` (
  `MEMBER_ID` int(10) NOT NULL,
  `MEMBER_NAME` varchar(100) NOT NULL COMMENT 'รดับสมาชิก'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_reg`
--

INSERT INTO `status_reg` (`MEMBER_ID`, `MEMBER_NAME`) VALUES
(1, 'กรุณาเลือกสถานะ'),
(2, 'ผู้ดูแลระบบ'),
(3, 'ผู้ดูแล'),
(4, 'ผู้ใช้งานทั่วไป'),
(5, 'รอการอนุมัติ'),
(6, 'ยกเลิกการใช้งาน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `com_repair`
--
ALTER TABLE `com_repair`
  ADD PRIMARY KEY (`COMR_ID`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`DEVICE_ID`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DIVISION_ID`);

--
-- Indexes for table `order_device`
--
ALTER TABLE `order_device`
  ADD PRIMARY KEY (`COM_ID`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`OS_ID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`POSITION_ID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`REGISTER_ID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`SECTION_ID`);

--
-- Indexes for table `status_com`
--
ALTER TABLE `status_com`
  ADD PRIMARY KEY (`STATUSCOM_ID`);

--
-- Indexes for table `status_reg`
--
ALTER TABLE `status_reg`
  ADD PRIMARY KEY (`MEMBER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `com_repair`
--
ALTER TABLE `com_repair`
  MODIFY `COMR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `DEVICE_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `division`
--
ALTER TABLE `division`
  MODIFY `DIVISION_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับ', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_device`
--
ALTER TABLE `order_device`
  MODIFY `COM_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `OS_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `POSITION_ID` int(100) NOT NULL AUTO_INCREMENT COMMENT 'รหัสตำแหน่ง', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `REGISTER_ID` int(100) NOT NULL AUTO_INCREMENT COMMENT 'รหัส ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `SECTION_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'รหัสส่วน', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_com`
--
ALTER TABLE `status_com`
  MODIFY `STATUSCOM_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_reg`
--
ALTER TABLE `status_reg`
  MODIFY `MEMBER_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
