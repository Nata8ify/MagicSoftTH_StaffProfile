-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2017 at 04:15 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mgsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protraitPath` text COLLATE utf8_unicode_ci,
  `hostManagerId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffId`, `gender`, `name`, `email`, `tel`, `division`, `position`, `protraitPath`, `hostManagerId`, `staffType`) VALUES
('M60001', 'm', 'วิศเวศน์ ประเกตุดุจ', 'M60001@staff.mgs.com', '+66845709999', 'ฝ่ายพัฒนา', 'โปรแกรมเมอร์', NULL, 'M60021', 'a'),
('M60002', 'm', 'วิชวัฒน์ เมธากสิกิตต์', 'M60002@staff.mgs.com', '+66630144741', 'หัวหน้าแผนกบริหารและการจัดการ', 'หัวหน้าแผนกบริหารและการจัดการ', NULL, '', 's'),
('M60003', 'm', 'ผไท ผดุงผล', 'M60003@staff.mgs.com', '+66845708982', 'ฝ่ายพัฒนา', 'โปรแกรมเมอร์', NULL, 'M60021', 's'),
('M60007', 'm', 'วรานนท์ ชลสิทธิ์', 'M60007@stfff.mgs.com', '+66321677883', 'การตลาด', 'โปรแกรมเมอร์', NULL, 'M60021', 's'),
('M60008', 'm', 'ประดิษฐ์ วาทะ', 'M60008@staff.mgs.com', '+66845708986', 'ฝ่ายพัฒนา', 'โปรแกรมเมอร์', NULL, 'M60021', 'a'),
('M60009', 'm', 'ประกอบ นาระวาง', 'M60009@staff.mgs.com', '+66845708987', 'ฝ่ายพัฒนา', 'โปรแกรมเมอร์', NULL, 'M60021', 's'),
('M60011', 'm', 'มยุรา ภิรมย์', 'M60011@staff.mgs.com', '+6684570899', 'ฝ่ายบริหาร', 'เจ้าหน้าที่ธุรการ', NULL, NULL, 's'),
('M60014', 'm', 'วชิรวัฒน์ ปิ่นปัฐเจก', 'M60014@staff.mgs.com', '+66845708990', 'ฝ่ายพัฒนา', 'Tester', NULL, 'M60021', 's'),
('M60015', 'f', 'สาวิตี จาเราะห์', 'M60015@staff.mgs.com', '+66845708902', 'ฝ่ายพัฒนา', 'Tester', NULL, 'M60021', 's'),
('M60016', 'm', 'สุโชค ใหญ่ไล้บาง', 'M60016@staff.mgs.com', '+66845708903', 'ฝ่ายบริหาร', 'เจ้าหน้าที่ธุรการ', NULL, NULL, 's'),
('M60017', 'f', 'ดรุณา สิรินธร', 'M60017@staff.mgs.com', '+66845708903', 'ฝ่ายประกันคุณภาพ', 'หัวหน้าแผนกฝ่ายประกันคุณภาพ', NULL, NULL, 'm'),
('M60018', 'f', 'ชลธีร์ ภาคชัย', 'M60018@staff.mgs.com', '+66845708904', 'ฝ่ายประกันคุณภาพ', 'จัดการทั่วไป', NULL, 'M60017', 's'),
('M60019', 'm', 'Yang Sí Kuun', 'M60019@staff.mgs.com', '+66845708904', 'ฝ่ายการตลาด', 'หัวหน้าแผนกฝ่ายการตลาด', NULL, NULL, 'm'),
('M60020', 'f', 'มุทิตา อาติลักษณ์ขณา', 'M60020@staff.mgs.com', '+66845708905', 'ฝ่ายการตลาด', 'พนักงานจัดซื้อทั่วไป', NULL, 'M60019', 's'),
('M60021', 'm', 'ธีรเทพ อาณพ', 'M60021@staff.mgs.com', '+66845708906', 'ฝ่ายการพัฒนา', 'หัวหน้าฝ่ายการพัฒนา', NULL, NULL, 'm'),
('M60022', 'f', 'ปันฑิดา นาแซะ', 'M60022@staff.mgs.com', '+66845708907', 'ฝ่ายพัฒนา', 'ดีไซน์เนอร์', NULL, 'M60021', 's'),
('M60023', 'm', 'ดิรก เมธาโชติ', 'M60023@staff.mgs.com', '+66845708908', 'ฝ่ายพัฒนา', 'โปรแกรมเมอร์', NULL, 'M60021', 's'),
('M60024', 'f', 'มุกดา จรัญตติญะ', 'M60024@staff.mgs.com', '+66845708908', 'ฝ่ายการตลาด', 'เจ้าหน้าที่วางแผนการตลาด', NULL, 'M60019', 's'),
('M60025', 'f', 'เพ็ญพร นาเจริญ', 'M60025@staff.mgs.com', '+66845708909', 'ฝ่ายการตลาด', 'เจ้าหน้าที่วางแผนการตลาด', NULL, 'M60019', 's'),
('M60026', 'f', 'ทัศนีย์ เหมลัดดา', 'M60027@staff.mgs.com', '+66845708910', 'ฝ่ายประชาสัมพันธ์', 'หัวหน้าฝ่ายประชาสัมพันธ์', NULL, NULL, 'm'),
('M60027', 'm', 'บารมี จามิกรณ์', 'm60026@staff.mgs.com', '+66845708911', 'การตลาด', 'เจ้าหน้าที่กลยุทธ์​', NULL, 'M60019', 's'),
('M60028', 'm', 'ยศวัฒน์ พิมานวันดี', 'M60028@staff.mgs.com', '+66845708912', 'ฝ่ายประชาสัมพันธ์', 'เจ้าหน้าที่ออกแบบสื่อ', NULL, 'M60026', 's'),
('M60029', 'm', 'วุฒิศักดิ์ วินญูชน', 'M60029@staff.mgs.com', '+66845708913', 'ฝ่ายบริหารและการจัดการ', 'เจ้าหน้าที่ธุรการ', NULL, NULL, 's'),
('M60030', 'f', 'สกุณา สุวานิโช', 'M60030@staff.mgs.com', '+66845708920', 'ฝ่ายประกันคุณภาพ', 'เจ้าหน้าที่ตรวจสอบคุณภาพ', NULL, 'M60017', 's'),
('M60031', 'f', 'วราศิริ อาศัยพาณิชย์', 'M60031@staff.mgs.com', '+66845708921', 'ฝ่ายประกันคุณภาพ', 'เจ้าหน้าที่ตรวจสอบคุณภาพ', NULL, 'M60017', 's'),
('M60032', 'f', 'ดาวิกา ลิขิตเตมีย์', 'M60032@staff.mgs.com', '+66845708916', 'ฝ่ายพัฒนา', 'Full Stack Developer', NULL, 'M60021', 's'),
('M60033', 'f', 'ปารีณา เกตุชัย', 'M600033@staff.mgs.com', '+66845708917', 'ฝ่ายการตลาด', 'เจ้าหน้าที่วางแผนการตลาด', NULL, NULL, 's'),
('M60034', 'f', 'บุผชาติ งามหฤทัย', 'M60034@staff.mgs.com', '+66845708917', 'ฝ่ายการตลาด', 'เจ้าหน้าที่วิเคราะห์ผู้บริโภค', NULL, NULL, 's');

-- --------------------------------------------------------

--
-- Table structure for table `StaffAccess`
--

CREATE TABLE `StaffAccess` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StaffAccess`
--

INSERT INTO `StaffAccess` (`staffId`, `password`) VALUES
('M60001', '1f7c381e83c87b875265b52adc64617a'),
('M60002', '1f7c381e83c87b875265b52adc64617a'),
('M60003', '1f7c381e83c87b875265b52adc64617a'),
('M60007', '1f7c381e83c87b875265b52adc64617a'),
('M60008', '1f7c381e83c87b875265b52adc64617a'),
('M60009', '1f7c381e83c87b875265b52adc64617a'),
('M60011', '1f7c381e83c87b875265b52adc64617a'),
('M60014', '1f7c381e83c87b875265b52adc64617a'),
('M60015', '1f7c381e83c87b875265b52adc64617a'),
('M60016', '1f7c381e83c87b875265b52adc64617a'),
('M60017', '1f7c381e83c87b875265b52adc64617a'),
('M60018', '1f7c381e83c87b875265b52adc64617a'),
('M60019', '1f7c381e83c87b875265b52adc64617a'),
('M60020', '1f7c381e83c87b875265b52adc64617a'),
('M60021', '1f7c381e83c87b875265b52adc64617a'),
('M60022', '1f7c381e83c87b875265b52adc64617a'),
('M60023', '1f7c381e83c87b875265b52adc64617a'),
('M60024', '1f7c381e83c87b875265b52adc64617a'),
('M60025', '1f7c381e83c87b875265b52adc64617a'),
('M60026', '1f7c381e83c87b875265b52adc64617a'),
('M60027', '1f7c381e83c87b875265b52adc64617a'),
('M60028', '1f7c381e83c87b875265b52adc64617a'),
('M60029', '1f7c381e83c87b875265b52adc64617a'),
('M60030', 'c6903bfad07dee3d10f6e7ced271492c'),
('M60031', '92c17b350d8f837a9fd2c6da3f2fc018'),
('M60032', '1f7c381e83c87b875265b52adc64617a'),
('M60033', 'c6903bfad07dee3d10f6e7ced271492c'),
('M60034', 'c6903bfad07dee3d10f6e7ced271492c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`staffId`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD UNIQUE KEY `staffId` (`staffId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD CONSTRAINT `StaffAccess_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `Staff` (`staffId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
